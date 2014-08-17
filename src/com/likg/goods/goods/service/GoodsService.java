package com.likg.goods.goods.service;

import com.likg.core.service.BaseTreeService;
import com.likg.goods.goods.domain.Goods;

public interface GoodsService extends BaseTreeService<Goods> {

	
	/**
	 * 保存用户信息
	 * @param goods 用户对象
	 * @throws Exception
	 */
	void saveGoods(Goods goods) throws Exception;
	
}
