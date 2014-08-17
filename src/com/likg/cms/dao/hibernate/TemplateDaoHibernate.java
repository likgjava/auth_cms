package com.likg.cms.dao.hibernate;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.stereotype.Repository;

import com.likg.auth.domain.Resource;
import com.likg.cms.dao.TemplateDao;
import com.likg.cms.domain.Template;
import com.likg.core.dao.hibernate.BaseGenericDaoHibernate;

@Repository
public class TemplateDaoHibernate extends BaseGenericDaoHibernate<Template> implements TemplateDao {
	
}
