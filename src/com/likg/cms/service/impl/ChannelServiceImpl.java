package com.likg.cms.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import com.likg.cms.dao.ChannelDao;
import com.likg.cms.domain.Channel;
import com.likg.cms.service.ChannelService;
import com.likg.core.service.impl.BaseTreeServiceImpl;
import com.likg.core.util.TreeSequenceUtil;

@Service
public class ChannelServiceImpl extends BaseTreeServiceImpl<Channel> implements ChannelService {
	
	@Resource(name="channelDaoHibernate")
	private ChannelDao channelDaoHibernate;
	
	@Resource
	private TreeSequenceUtil treeSequenceUtil;

	/**
	 * 保存栏目信息
	 * @param channel 栏目对象
	 * @throws Exception
	 */
	public void saveChannel(Channel channel) throws Exception {
		//TODO
		//判断是否选择了栏目模板和文章模板（这种处理方式欠妥，应该在系统架构中处理，暂时未找到好的处理方式）
		if(channel.getChannelTemplate()==null || StringUtils.isBlank(channel.getChannelTemplate().getObjId())) {
			channel.setChannelTemplate(null);
		}
		if(channel.getArticleTemplate()==null || StringUtils.isBlank(channel.getArticleTemplate().getObjId())) {
			channel.setArticleTemplate(null);
		}
		
		
		//新增
		if(StringUtils.isBlank(channel.getObjId())) {
			//修改父节点isLeaf的属性值
			String parentId = channel.getParent().getObjId();
			if(!StringUtils.isBlank(parentId)) {
				Channel parentChannel = channelDaoHibernate.get(parentId);
				if(parentChannel.getIsLeaf()) {
					parentChannel.setIsLeaf(false);
					channelDaoHibernate.save(parentChannel);
				}
			}
			
			//保存节点对象
			channel.setIsLeaf(true);
			if(StringUtils.isBlank(parentId)) {
				channel.setParent(null);
			}
			String prefix = (StringUtils.isBlank(parentId) ? TreeSequenceUtil.CHANNEL_PREFIX : parentId);
			channel.setObjId(treeSequenceUtil.getSequenceNo(Channel.class, prefix));
			channelDaoHibernate.save(channel);
			
		}
		//修改
		else {
			Channel oldChannel = channelDaoHibernate.get(channel.getObjId());
			oldChannel.setChannelName(channel.getChannelName());
			oldChannel.setChannelDesc(channel.getChannelDesc());
			oldChannel.setChannelTemplate(channel.getChannelTemplate());
			oldChannel.setArticleTemplate(channel.getArticleTemplate());
			channelDaoHibernate.save(oldChannel);
		}
	}

	/**
	 * 根据节点id获取XML格式的子节点列表数据
	 * @param objId 节点id
	 * @return XML格式的子节点数据
	 * @throws Exception
	 */
	public String listChildrenXml(String objId) throws Exception {
		//获取栏目列表数据
		List<Channel> channelList = channelDaoHibernate.listChildrenById("-1".equals(objId) ? null : objId);
		
		//拼装XML字符串
		StringBuilder xml = new StringBuilder();
		xml.append("<?xml version='1.0' encoding='UTF-8'?>");
		xml.append("<tree id='"+(StringUtils.isBlank(objId) ? 0 : objId)+"'>");
		if(StringUtils.isBlank(objId)) {
			xml.append("<item text='栏目树' id='-1' open='1'>");
		}
		for(Channel channel : channelList) {
			xml.append("<item text='"+channel.getChannelName()+"' id='"+channel.getObjId()+"'  child='"+(channel.getIsLeaf()?0:1)+"' />");
		}
		if(StringUtils.isBlank(objId)) {
			xml.append("</item>");
		}
		xml.append("</tree>");
		
		return xml.toString();
	}

}
