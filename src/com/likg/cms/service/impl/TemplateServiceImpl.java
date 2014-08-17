package com.likg.cms.service.impl;

import java.io.File;

import javax.annotation.Resource;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import com.likg.cms.dao.TemplateDao;
import com.likg.cms.domain.Template;
import com.likg.cms.service.TemplateService;
import com.likg.common.Constants;
import com.likg.core.service.impl.BaseGenericServiceImpl;
import com.likg.security.AuthenticationHelper;

@Service
public class TemplateServiceImpl extends BaseGenericServiceImpl<Template> implements TemplateService {
	
	@Resource(name="templateDaoHibernate")
	private TemplateDao templateDaoHibernate;

	
	/**
	 * 保存模板信息
	 * @param template 模板对象
	 * @throws Exception
	 */
	public void saveTemplate(Template template) throws Exception {
		
		//获取存放模板文件的路径
		String templatePath = null;
		
		//新增
		if(StringUtils.isBlank(template.getObjId())) {
			template.setCreateUser(AuthenticationHelper.getCurrentUser());
			templateDaoHibernate.save(template);
			
			templatePath = messageSource.getMessage("cmsTemplate") + File.separator + template.getObjId() + ".ftl";
			template.setTemplatePath(templatePath);
			templateDaoHibernate.save(template);
		}
		//修改
		else {
			Template oldTemplate = templateDaoHibernate.get(template.getObjId());
			oldTemplate.setTemplateName(template.getTemplateName());
			oldTemplate.setTemplateType(template.getTemplateType());
			templateDaoHibernate.save(oldTemplate);
			templatePath = oldTemplate.getTemplatePath();
		}
		
		//把模板内容保存到文件
		File templateFile = new File(Constants.ROOTPATH + templatePath );
		FileUtils.writeStringToFile(templateFile, template.getTemplateContent());
	}

	/**
	 * 获取模板对象，包含模板内容信息
	 * @param objId 模板对象id
	 * @return
	 * @throws Exception
	 */
	public Template getTemplate(String objId) throws Exception {
		//获取模板信息
		Template template = templateDaoHibernate.get(objId);
		
		//获取模板内容
		File templateFile = new File(Constants.ROOTPATH + template.getTemplatePath());
		String content = FileUtils.readFileToString(templateFile);
		template.setTemplateContent(content);
		
		return template;
	}

}
