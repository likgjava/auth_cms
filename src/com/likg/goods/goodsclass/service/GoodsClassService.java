package com.likg.goods.goodsclass.service;

import java.util.List;

import com.likg.core.service.BaseGenericService;
import com.likg.goods.goodsclass.domain.GoodsClass;

public interface GoodsClassService extends BaseGenericService<GoodsClass> {
	
	/**
	 * 保存资源对象
	 * @param GoodsClass 资源对象
	 * @throws Exception
	 */
	void saveGoodsClass(GoodsClass goodsClass) throws Exception;
	
	/**
	 * 根据父节点id获取xml格式的子节点列表数据
	 * @param parentId 父id
	 * @return XML格式的子节点数据
	 * @throws Exception
	 */
	String listChildrenXml(String parentId) throws Exception;

	/**
	 * 删除节点及其所有子孙节点
	 * @param objId
	 */
	void removeAll(String objId) throws Exception;

	List<GoodsClass> findAll() throws Exception;


}
