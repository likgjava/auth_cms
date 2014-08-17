package com.likg.goods.goodsbrand.dao.hibernate;

import java.sql.SQLException;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.stereotype.Repository;

import com.likg.core.dao.hibernate.BaseGenericDaoHibernate;
import com.likg.goods.goodsbrand.dao.GoodsBrandDao;
import com.likg.goods.goodsbrand.domain.GoodsBrand;

@Repository
public class GoodsBrandDaoHibernate extends BaseGenericDaoHibernate<GoodsBrand> implements GoodsBrandDao {

	/**
	 * 删除商品品牌
	 * @param objIds 品牌id
	 * @throws Exception
	 */
	public void removeGoodsBrand(final String[] objIds) throws Exception {
		this.getHibernateTemplate().execute(new HibernateCallback<Object>(){
			public Object doInHibernate(Session session) throws HibernateException, SQLException {
				//删除商品品牌分类中间表的数据
				String sql = "delete from GOODS_BRAND_TO_CLASS where GOODS_BRAND_ID in(:objIds)";
				Query query = session.createSQLQuery(sql);
				query.setParameterList("objIds", objIds);
				query.executeUpdate();
				
				//删除商品品牌表的数据
				sql = "delete from GOODS_BRAND where GOODS_BRAND_ID in(:objIds)";
				query = session.createSQLQuery(sql);
				query.setParameterList("objIds", objIds);
				query.executeUpdate();
				
				return null;
			}
		});
	}
	
	
}
