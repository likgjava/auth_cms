package com.likg.cms.dao.hibernate;

import org.springframework.stereotype.Repository;

import com.likg.cms.dao.CommentDao;
import com.likg.cms.domain.Comment;
import com.likg.core.dao.hibernate.BaseGenericDaoHibernate;

@Repository
public class CommentDaoHibernate extends BaseGenericDaoHibernate<Comment> implements CommentDao {
	
}
