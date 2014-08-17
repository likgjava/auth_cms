package com.likg.goods.goods.dao.hibernate;

import org.springframework.stereotype.Repository;

import com.likg.core.dao.hibernate.BaseGenericDaoHibernate;
import com.likg.goods.goods.dao.GoodsDao;
import com.likg.goods.goods.domain.Goods;

@Repository
public class GoodsDaoHibernate extends BaseGenericDaoHibernate<Goods> implements GoodsDao {
	
	
}
