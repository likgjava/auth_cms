package com.likg.goods.goodsbrand.service;

import com.likg.core.service.BaseGenericService;
import com.likg.goods.goodsbrand.domain.GoodsBrand;

public interface GoodsBrandService extends BaseGenericService<GoodsBrand> {

	
	/**
	 * 保存用户信息
	 * @param goods 用户对象
	 * @throws Exception
	 */
	void saveGoodsBrand(GoodsBrand goodsBrand) throws Exception;

	/**
	 * 删除商品品牌
	 * @param objIds 品牌id
	 * @throws Exception
	 */
	void removeGoodsBrand(String[] objIds) throws Exception;
	
}
