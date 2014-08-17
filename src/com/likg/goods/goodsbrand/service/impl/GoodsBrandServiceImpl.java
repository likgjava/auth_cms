package com.likg.goods.goodsbrand.service.impl;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import com.likg.core.service.impl.BaseGenericServiceImpl;
import com.likg.goods.goodsbrand.dao.GoodsBrandDao;
import com.likg.goods.goodsbrand.domain.GoodsBrand;
import com.likg.goods.goodsbrand.service.GoodsBrandService;
import com.likg.goods.goodsclass.domain.GoodsClass;
import com.likg.security.AuthenticationHelper;

@Service
public class GoodsBrandServiceImpl extends BaseGenericServiceImpl<GoodsBrand> implements GoodsBrandService {
	
	@Resource
	private GoodsBrandDao goodsBrandDaoHibernate;

	/**
	 * 保存商品品牌信息
	 * @param goodsBrand 品牌对象
	 * @throws Exception
	 */
	public void saveGoodsBrand(GoodsBrand goodsBrand) throws Exception {
		//处理商品分类
		String goodsClassIds = goodsBrand.getGoodsClassIds();
		for(String goodsClassId : goodsClassIds.split(",")) {
			GoodsClass gc = new GoodsClass();
			gc.setObjId(goodsClassId);
			goodsBrand.getGoodsClasses().add(gc);
		}
		
		//新增
		if(StringUtils.isBlank(goodsBrand.getObjId())) {
			goodsBrand.setCreateUser(AuthenticationHelper.getCurrentUser());
			goodsBrandDaoHibernate.save(goodsBrand);
		}
		//修改
		else {
			GoodsBrand oldGoodsBrand = goodsBrandDaoHibernate.get(goodsBrand.getObjId());
			oldGoodsBrand.setBrandName(goodsBrand.getBrandName());
			oldGoodsBrand.setBrandDesc(goodsBrand.getBrandDesc());
			oldGoodsBrand.setBrandPicture(goodsBrand.getBrandPicture());
			oldGoodsBrand.setGoodsClassIds(goodsBrand.getGoodsClassIds());
			oldGoodsBrand.setGoodsClassNames(goodsBrand.getGoodsClassNames());
			oldGoodsBrand.setGoodsClasses(goodsBrand.getGoodsClasses());
			goodsBrandDaoHibernate.save(oldGoodsBrand);
		}
		
		/*GoodsBrand gb = new GoodsBrand();
		gb.setObjId("1");
		GoodsClass gc1 = new GoodsClass();
		gc1.setObjId("G0101");
		GoodsClass gc2 = new GoodsClass();
		gc2.setObjId("G0102");
		gb.getGoodsClasses().add(gc1);
		gb.getGoodsClasses().add(gc2);
		goodsBrandDaoHibernate.getHibernateTemplate().delete(gb);*/
		
	}

	/**
	 * 删除商品品牌
	 * @param objIds 品牌id
	 * @throws Exception
	 */
	public void removeGoodsBrand(String[] objIds) throws Exception {
		goodsBrandDaoHibernate.removeGoodsBrand(objIds);
	}

	

}
