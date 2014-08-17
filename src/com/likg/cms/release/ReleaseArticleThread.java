package com.likg.cms.release;

import org.apache.log4j.Logger;

import com.likg.cms.service.ArticleService;

public class ReleaseArticleThread extends Thread {
	
	private static Logger log = Logger.getLogger(ReleaseArticleThread.class);
	private ArticleService articleService;
	
	public ReleaseArticleThread(ArticleService articleService) {
		this.articleService = articleService;
	}

	@Override
	public void run() {
		while(true) {
			String articleId = ReleaseArticleHelper.getArticleId();
			
			if(articleId != null) {
				try {
					articleService.makeStaticPage(articleId);
					log.info("成功发布稿件->"+articleId);
					
					ReleaseArticleHelper.deleteArticleIdFile(articleId);
				} catch (Exception e) {
					log.error("生成稿件静态页面时出现异常", e);
				}
			} else {
				try {
					log.debug("未读取到稿件id，5s再检测");
					ReleaseArticleThread.sleep(10000);
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
			}
		}
		
	}
}
