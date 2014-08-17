package com.likg.cms.dao.hibernate;

import org.springframework.stereotype.Repository;

import com.likg.cms.dao.UpDownDao;
import com.likg.cms.domain.UpDown;
import com.likg.core.dao.hibernate.BaseGenericDaoHibernate;

@Repository
public class UpDownDaoHibernate extends BaseGenericDaoHibernate<UpDown> implements UpDownDao {
	
}
