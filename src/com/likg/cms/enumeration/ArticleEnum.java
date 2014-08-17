package com.likg.cms.enumeration;

import com.likg.core.context.FrameBeanFactory;
import com.likg.core.service.EnumService;
import com.likg.core.service.impl.EnumServiceImpl;

public class ArticleEnum {
	
	/**
	 * 发布状态(00:未发布；01:已发布)
	 */
	public static final String RELEASE_STATUS = "releaseStatus";
	public static final String NO_RELEASE = "00";
	public static final String RELEASED = "01";
	public static String getReleaseStatusCN(String key) {
		return ((EnumService)FrameBeanFactory.getBean(EnumServiceImpl.BEAN_NAME)).get(RELEASE_STATUS, key);
	}

}
