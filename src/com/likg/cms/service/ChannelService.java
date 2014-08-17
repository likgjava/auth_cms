package com.likg.cms.service;

import com.likg.cms.domain.Channel;
import com.likg.core.service.BaseTreeService;

public interface ChannelService extends BaseTreeService<Channel> {
	
	/**
	 * 保存栏目对象
	 * @param channel 栏目对象
	 * @throws Exception
	 */
	void saveChannel(Channel channel) throws Exception;
	
	/**
	 * 根据父节点id获取xml格式的子节点列表数据
	 * @param parentId 父id
	 * @return XML格式的子节点数据
	 * @throws Exception
	 */
	String listChildrenXml(String parentId) throws Exception;

}
