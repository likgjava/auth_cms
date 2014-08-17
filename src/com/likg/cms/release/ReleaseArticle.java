package com.likg.cms.release;

import java.util.Timer;

import org.apache.log4j.Logger;

import com.likg.cms.service.ArticleService;
import com.likg.core.context.FrameBeanFactory;


public class ReleaseArticle {
	
	private static Logger log = Logger.getLogger(ReleaseArticle.class);
	
	public void start() {
		log.info("启动发布程序...");
		
		ArticleService articleService = (ArticleService) FrameBeanFactory.getBean("articleServiceImpl");
		
		Thread t = new ReleaseArticleThread(articleService);
		t.start();
		
		Timer timer = new Timer();
		timer.scheduleAtFixedRate(new ReadArticleIdTask(), 10000, 60000);
	}
}
