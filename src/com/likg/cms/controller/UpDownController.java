package com.likg.cms.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.likg.cms.domain.Article;
import com.likg.cms.domain.Channel;
import com.likg.cms.domain.UpDown;
import com.likg.cms.service.ArticleService;
import com.likg.cms.service.UpDownService;
import com.likg.common.Constants;
import com.likg.common.page.Page;
import com.likg.core.controller.BaseGenericController;
import com.likg.core.dao.hibernate.query.QueryObject;
import com.likg.core.dao.hibernate.query.QueryObjectBase;
import com.likg.core.dao.hibernate.query.QueryParam;

/**
 * @springmvc.view value="showUpDownListView" url="view/cms/show/UpDown_list.jsp"
 */
@Controller
@RequestMapping("/UpDownController.do")
public class UpDownController extends BaseGenericController<UpDown>  {
	
	@Resource(name="upDownServiceImpl")
	private UpDownService upDownService;
	
	@Resource(name="articleServiceImpl")
	private ArticleService articleService;
	
	/**
	 * 跳转到稿件表单页面，若objId为null则为新增操作，否则为修改操作
	 * @param objId
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(params="method=toUpDownFormView")
	public ModelAndView toUpDownFormView(String objId, HttpServletRequest request) throws Exception {
		Map<String, Object> model = new HashMap<String, Object>();
		UpDown UpDown = null;
		
		//新增
		if(StringUtils.isBlank(objId)) {
			UpDown = new UpDown();
			//设置栏目信息
			String channelId = request.getParameter("channelId");
			Channel channel = new Channel();
			channel.setObjId(channelId);
		}
		else {
			UpDown = upDownService.get(objId);
		}
		model.put("UpDown", UpDown);
		
		return new ModelAndView("UpDownFormView", model);
	}
	
	
	/**
	 * 保存菜单信息
	 * @param UpDown 菜单对象
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(params="method=save")
	public ModelAndView save(String objId, String status, HttpServletRequest request) throws Exception {
		Map<String, Object> model = new HashMap<String, Object>();
		
		//保存稿件信息
		UpDown upDown = upDownService.saveUpDown(objId, status);
		model.put("upDown", upDown);
		model.put(Constants.SUCCESS, true);
		
		return new ModelAndView(Constants.JSON_VIEW, model);
	}
	
	/**
	 * 跳转到稿件评论列表页面
	 * @param articleId 稿件id
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(params="method=toShowUpDownListView")
	public ModelAndView toShowUpDownListView(String articleId, HttpServletRequest request) throws Exception {
		Map<String, Object> model = new HashMap<String, Object>();
		
		//获取稿件信息
		Article article = articleService.get(articleId);
		model.put("article", article);
		
		//获取该稿件的前10条评论
		QueryObject<UpDown> queryObject = new QueryObjectBase<UpDown>();
		queryObject.setEntityClass(UpDown.class);
		queryObject.setQueryParam(new QueryParam("article.objId", QueryParam.OPERATOR_EQ, article.getObjId()));
		queryObject.getQueryProjections().setOrderProperty("createTime");
		queryObject.getQueryProjections().setDescFlag(true);
		Page<UpDown> UpDownPage = upDownService.findByQuery(queryObject, true, 0, 10);
		model.put("UpDownPage", UpDownPage);
		
		return new ModelAndView("showUpDownListView", model);
	}
	
}
