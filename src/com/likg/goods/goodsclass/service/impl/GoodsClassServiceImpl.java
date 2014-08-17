package com.likg.goods.goodsclass.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import com.likg.core.service.impl.BaseGenericServiceImpl;
import com.likg.core.util.TreeSequenceUtil;
import com.likg.goods.goodsclass.dao.GoodsClassDao;
import com.likg.goods.goodsclass.domain.GoodsClass;
import com.likg.goods.goodsclass.service.GoodsClassService;
import com.likg.security.AuthenticationHelper;

@Service
public class GoodsClassServiceImpl extends BaseGenericServiceImpl<GoodsClass> implements GoodsClassService {
	
	@Resource(name="goodsClassDaoHibernate")
	private GoodsClassDao goodsClassDaoHibernate;
	
	@Resource
	private TreeSequenceUtil treeSequenceUtil;

	/**
	 * 保存资源信息
	 * @param GoodsClass 资源对象
	 * @throws Exception
	 */
	public void saveGoodsClass(GoodsClass goodsClass) throws Exception {
		//新增
		if(StringUtils.isBlank(goodsClass.getObjId())) {
			//修改父节点isLeaf的属性值
			String parentId = goodsClass.getParent().getObjId();
			if(!StringUtils.isBlank(parentId)) {
				GoodsClass parentGoodsClass = goodsClassDaoHibernate.get(parentId);
				if(parentGoodsClass.getIsLeaf()) {
					parentGoodsClass.setIsLeaf(false);
					goodsClassDaoHibernate.save(parentGoodsClass);
				}
			}
			
			//保存节点对象
			goodsClass.setIsLeaf(true);
			if(StringUtils.isBlank(parentId)) {
				goodsClass.setParent(null);
			}
			String prefix = (StringUtils.isBlank(parentId) ? TreeSequenceUtil.GOODS_CLASS_PREFIX : parentId);
			goodsClass.setObjId(treeSequenceUtil.getSequenceNo(GoodsClass.class, prefix));
			goodsClass.setCreateTime(new Date());
			goodsClass.setCreateUser(AuthenticationHelper.getCurrentUser());
			goodsClassDaoHibernate.save(goodsClass);
			
		}
		//修改
		else {
			GoodsClass oldGoodsClass = goodsClassDaoHibernate.get(goodsClass.getObjId());
			
			oldGoodsClass.setGoodsClassName(goodsClass.getGoodsClassName());
			oldGoodsClass.setGoodsClassDesc(goodsClass.getGoodsClassDesc());
			
			goodsClassDaoHibernate.save(oldGoodsClass);
		}
		
	}

	/**
	 * 根据节点id获取XML格式的子节点列表数据
	 * @param objId 节点id
	 * @return XML格式的子节点数据
	 * @throws Exception
	 */
	public String listChildrenXml(String objId) throws Exception {
		
		//获取资源列表数据
		List<GoodsClass> GoodsClassList = goodsClassDaoHibernate.listChildrenById("-1".equals(objId) ? null : objId);
		
		//拼装XML字符串
		StringBuilder xml = new StringBuilder();
		xml.append("<?xml version='1.0' encoding='UTF-8'?>");
		xml.append("<tree id='"+(StringUtils.isBlank(objId) ? 0 : objId)+"'>");
		if(StringUtils.isBlank(objId)) {
			xml.append("<item text='商品分类树' id='-1' open='1'>");
		}
		for(GoodsClass goodsClass : GoodsClassList) {
			xml.append("<item text='"+goodsClass.getGoodsClassName()+"' id='"+goodsClass.getObjId()+"'  child='"+(goodsClass.getIsLeaf()?0:1)+"' />");
		}
		if(StringUtils.isBlank(objId)) {
			xml.append("</item>");
		}
		xml.append("</tree>");
		
		return xml.toString();
	}

	/**
	 * 删除节点及其所有子孙节点
	 * @param objId
	 */
	public void removeAll(String objId) throws Exception {
		//删除节点及其所有子孙节点
		goodsClassDaoHibernate.removeAll(objId);
		
	}

	public List<GoodsClass> findAll() throws Exception {
		
		return null;
	}


}
