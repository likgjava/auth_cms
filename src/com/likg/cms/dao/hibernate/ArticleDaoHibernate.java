package com.likg.cms.dao.hibernate;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.stereotype.Repository;

import com.likg.cms.dao.ArticleDao;
import com.likg.cms.domain.Article;
import com.likg.common.page.Page;
import com.likg.core.dao.hibernate.BaseGenericDaoHibernate;

@Repository
public class ArticleDaoHibernate extends BaseGenericDaoHibernate<Article> implements ArticleDao {
	
	/** 
	 * 根据用户名获取用户对象
	 * @param   ArticleName 用户名
	 * @return  如果存在则返回用户对象，否则返回null
	 * @Exception   
	 */
	@SuppressWarnings("unchecked")
	public Article getArticleByArticleName(String ArticleName) throws Exception {
		Article Article = null;
		//String hql = "select u from Article u join Role r on u.objId in elements(r.Articles) join Resource s on r.objId in elements(s.roles) where u.ArticleName=?";
		//String hql = "select u from Article u join fetch u.roles, Role r join fetch r.resources, Resource s  where u.objId in elements(r.Articles) and r.objId in elements(s.roles) and u.ArticleName=?";
		String hql = "select u from Article u join fetch u.roles r join fetch r.resources where  u.ArticleName=?";
		List<Article> ArticleList = this.getHibernateTemplate().find(hql, ArticleName);
		if(ArticleList!=null && !ArticleList.isEmpty()) {
			Article = ArticleList.get(0);
		}
		
		return Article;
	}

	/** 
	 * 根据邮箱获取用户对象
	 * @param   email 邮件地址
	 * @return  如果存在则返回用户对象，否则返回null
	 * @Exception   
	 */
	@SuppressWarnings("unchecked")
	public Article getArticleByEmail(String email) throws Exception {
		Article Article = null;
		
		List<Article> ArticleList = this.getHibernateTemplate().find("from Article u where u.email=?", email);
		if(ArticleList!=null && !ArticleList.isEmpty()) {
			Article = ArticleList.get(0);
		}
		
		return Article;
	}

	/**
	 * 获取用户分页列表数据
	 * @param page 分页信息
	 * @return 带有分页信息的列表数据
	 * @throws Exception
	 */
	public Page<Article> list(final Page<Article> page) throws Exception {
		return this.getHibernateTemplate().execute(new HibernateCallback<Page<Article>>(){
			@SuppressWarnings("unchecked")
			public Page<Article> doInHibernate(Session session) throws HibernateException, SQLException {
				
				String hql = "from Article u ";
				Query query = session.createQuery(hql);
				query.setFirstResult(page.getFirstResult());
				query.setMaxResults(page.getPageSize());
				
				List<Article> ArticleList = query.list();
				
				query = session.createQuery("select count(*) from Article u " );
				Long totalRecord = (Long) query.uniqueResult();
				
				Page<Article> pageData = new Page<Article>(ArticleList, totalRecord, page.getPageSize(), page.getPageIndex());
				
				//for(Article u : pageData.getData()) {
					//u.setRoles(null);186 3820 9662
				//}
				return pageData;
			}
			
		});
		
		
		//return null;
	}
	
}
