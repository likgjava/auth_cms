package com.likg.cms.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.likg.cms.domain.Channel;
import com.likg.cms.domain.Template;
import com.likg.cms.enumeration.TemplateEnum;
import com.likg.cms.service.ChannelService;
import com.likg.cms.service.TemplateService;
import com.likg.common.Constants;
import com.likg.common.util.ResponseUtils;
import com.likg.core.controller.BaseGenericController;

/**
 * @springmvc.view value="channelFormView" url="view/cms/channel_form.jsp"
 * @springmvc.view value="channelDetailView" url="view/cms/channel_detail.jsp"
 *
 */

@Controller
@RequestMapping("/ChannelController.do")
public class ChannelController extends BaseGenericController<Channel> {
	
	@Resource(name="channelServiceImpl")
	private ChannelService channelService;
	
	@Resource(name="templateServiceImpl")
	private TemplateService templateService;
	
	/**
	 * 跳转到栏目表单页面，若objId为null则为新增操作，否则为修改操作
	 * @param objId
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(params="method=toChannelFormView")
	public ModelAndView toChannelFormView(String objId, HttpServletRequest request) throws Exception {
		Map<String, Object> model = new HashMap<String, Object>();
		Channel channel = null;
		
		//获取所有的栏目模板和文章模板
		List<Template> channelTemplateList = new ArrayList<Template>();
		List<Template> articleTemplateList = new ArrayList<Template>();
		List<Template> templateList = templateService.getAll();
		for(Template t : templateList) {
			if(TemplateEnum.CHANNEL_TEMPLATE.equals(t.getTemplateType())) {
				channelTemplateList.add(t);
			} else if(TemplateEnum.ARTICLE_TEMPLATE.equals(t.getTemplateType())) {
				articleTemplateList.add(t);
			}
		}
		model.put("channelTemplateList", channelTemplateList);
		model.put("articleTemplateList", articleTemplateList);
		
		//新增
		if(StringUtils.isBlank(objId)) {
			channel = new Channel();
			//获取父节点信息，若父节点id为空则增加一级节点
			String parentId = request.getParameter("parentId");
			if(!StringUtils.isBlank(parentId)) {
				Channel parentChannel = channelService.get(parentId);
				channel.setParent(parentChannel);
			}
			
			//设置层级
			channel.setTreeLevel(Short.valueOf(request.getParameter("ChannelLevel")));
		}
		else {
			channel = channelService.get(objId);
		}
		model.put("channel", channel);
		
		return new ModelAndView("channelFormView", model);
	}
	
	/**
	 * 跳转到栏目详情页面
	 * @param objId 栏目对象id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(params="method=toChannelDetailView")
	public ModelAndView toChannelDetailView(String objId, HttpServletRequest request) throws Exception {
		Map<String, Object> model = new HashMap<String, Object>();
		
		Channel channel = channelService.get(objId);
		model.put("channel", channel);
		
		return new ModelAndView("channelDetailView", model);
	}
	
	/**
	 * 保存栏目信息
	 * @param channel 栏目对象
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(params="method=save")
	public ModelAndView save(Channel channel, HttpServletRequest request) throws Exception {
		Map<String, Object> model = new HashMap<String, Object>();
		
		//保存栏目信息
		channelService.saveChannel(channel);
		model.put(Constants.SUCCESS, true);
		
		return new ModelAndView(Constants.JSON_VIEW, model);
	}
	
	/**
	 * 删除节点及其所有子孙节点
	 * @param objId 节点id
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(params="method=removeAll")
	public ModelAndView removeAll(String objId, HttpServletRequest request) throws Exception {
		Map<String, Object> model = new HashMap<String, Object>();
		
		//删除节点及其所有子孙节点
		channelService.removeAll(objId);
		model.put(Constants.SUCCESS, true);
		
		return new ModelAndView(Constants.JSON_VIEW, model);
	}
	
	/**
	 * 根据id获取XML格式的子节点列表数据
	 * @param id 节点id
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(params="method=getChildrenXmlById")
	public void getChildrenXmlById(String id, HttpServletRequest request, HttpServletResponse response) throws Exception {
		//获取XML格式的子节点列表数据
		String xml = channelService.listChildrenXml(id);
		
		ResponseUtils.renderXml(response, xml);
	}
	
}
