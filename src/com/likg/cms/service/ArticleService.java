package com.likg.cms.service;

import com.likg.cms.domain.Article;
import com.likg.common.page.Page;
import com.likg.core.service.BaseGenericService;

public interface ArticleService extends BaseGenericService<Article> {

	/**
	 * 保存稿件信息
	 * @param article 稿件对象
	 * @throws Exception
	 */
	void saveArticle(Article article) throws Exception;
	
	/**
	 * 生成稿件静态页面
	 * @param objId 稿件id
	 * @throws Exception
	 */
	void makeStaticPage(String objId) throws Exception;
	

	
}
