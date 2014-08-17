package com.likg.cms.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.likg.cms.domain.Template;
import com.likg.cms.service.TemplateService;
import com.likg.common.Constants;
import com.likg.core.controller.BaseGenericController;

/**
 * @springmvc.view value="templateFormView" url="view/cms/template_form.jsp"
 * @springmvc.view value="templateDetailView" url="view/cms/template_detail.jsp"
 */
@Controller
@RequestMapping("/TemplateController.do")
public class TemplateController extends BaseGenericController<Template> {
	
	@Resource(name="templateServiceImpl")
	private TemplateService templateService;
	
	/**
	 * 跳转到模板表单页面，若objId为null则为新增操作，否则为修改操作
	 * @param objId 模板对象id
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(params="method=toTemplateFormView")
	public ModelAndView toTemplateFormView(String objId, HttpServletRequest request) throws Exception {
		Map<String, Object> model = new HashMap<String, Object>();
		Template template = null;
		
		//新增
		if(StringUtils.isBlank(objId)) {
			template = new Template();
		}
		else {
			template = templateService.getTemplate(objId);
		}
		model.put("template", template);
		
		return new ModelAndView("templateFormView", model);
	}
	
	/**
	 * 跳转到模板详情页面
	 * @param objId 模板对象id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(params="method=toTemplateDetailView")
	public ModelAndView toTemplateDetailView(String objId, HttpServletRequest request) throws Exception {
		Map<String, Object> model = new HashMap<String, Object>();
		
		//获取模板信息
		Template template = templateService.get(objId);
		model.put("template", template);
		
		return new ModelAndView("templateDetailView", model);
	}
	
	/**
	 * 保存模板信息
	 * @param Template 模板对象
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(params="method=save")
	public ModelAndView save(Template template, HttpServletRequest request) throws Exception {
		Map<String, Object> model = new HashMap<String, Object>();
		
		//保存模板信息
		templateService.saveTemplate(template);
		model.put(Constants.SUCCESS, true);
		
		return new ModelAndView(Constants.JSON_VIEW, model);
	}
	
	/**
	 * 获取模板文件的内容
	 * @param objId 模板id
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(params="method=getTemplateContent")
	public ModelAndView getTemplateContent(String objId, HttpServletRequest request) throws Exception {
		Map<String, Object> model = new HashMap<String, Object>();
		
		//删除节点及其所有子孙节点
		Template template = templateService.getTemplate(objId);
		model.put("templateContent", template.getTemplateContent());
		
		return new ModelAndView(Constants.JSON_VIEW, model);
	}
	
}
