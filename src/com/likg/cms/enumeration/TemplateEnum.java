package com.likg.cms.enumeration;

import com.likg.core.context.FrameBeanFactory;
import com.likg.core.service.EnumService;
import com.likg.core.service.impl.EnumServiceImpl;

public class TemplateEnum {
	
	/**
	 * 模板类型[0:栏目模板; 1:文章模板]
	 */
	public static final String TEMPLATE_TYPE = "templateType";
	public static final String CHANNEL_TEMPLATE = "0";
	public static final String ARTICLE_TEMPLATE = "1";
	public static String getTemplateTypeCN(String key) {
		return ((EnumService)FrameBeanFactory.getBean(EnumServiceImpl.BEAN_NAME)).get(TEMPLATE_TYPE, key);
	}

}
