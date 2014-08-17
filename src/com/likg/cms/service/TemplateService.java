package com.likg.cms.service;

import com.likg.cms.domain.Template;
import com.likg.core.service.BaseGenericService;

public interface TemplateService extends BaseGenericService<Template> {

	/**
	 * 保存模板信息
	 * @param template 模板对象
	 * @throws Exception
	 */
	void saveTemplate(Template template) throws Exception;
	
	/**
	 * 获取模板对象，包含模板内容信息
	 * @param objId 模板对象id
	 * @return
	 * @throws Exception
	 */
	Template getTemplate(String objId) throws Exception;


}
