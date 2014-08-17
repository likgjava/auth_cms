package com.likg.goods.goodsbrand.dao;

import com.likg.core.dao.BaseGenericDao;
import com.likg.goods.goodsbrand.domain.GoodsBrand;

public interface GoodsBrandDao extends BaseGenericDao<GoodsBrand> {

	/**
	 * 删除商品品牌
	 * @param objIds 品牌id
	 * @throws Exception
	 */
	void removeGoodsBrand(String[] objIds) throws Exception;

}
