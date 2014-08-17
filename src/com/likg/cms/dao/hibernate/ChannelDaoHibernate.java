package com.likg.cms.dao.hibernate;

import org.springframework.stereotype.Repository;

import com.likg.cms.dao.ChannelDao;
import com.likg.cms.domain.Channel;
import com.likg.core.dao.hibernate.BaseTreeDaoHibernate;

@Repository
public class ChannelDaoHibernate extends BaseTreeDaoHibernate<Channel> implements ChannelDao {
	

}
