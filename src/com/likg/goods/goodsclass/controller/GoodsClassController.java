package com.likg.goods.goodsclass.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.likg.common.Constants;
import com.likg.common.util.ResponseUtils;
import com.likg.core.controller.BaseGenericController;
import com.likg.goods.goodsclass.domain.GoodsClass;
import com.likg.goods.goodsclass.service.GoodsClassService;

/**
 * @springmvc.view value="goodsClassFormView" url="view/goods/goodsclass/goods_class_form.jsp"
 * @springmvc.view value="goodsClassDetailView" url="view/goods/goodsclass/goods_class_detail.jsp"
 *
 */

@Controller
@RequestMapping("/GoodsClassController.do")
public class GoodsClassController extends BaseGenericController<GoodsClass> {
	
	@Resource(name="goodsClassServiceImpl")
	private GoodsClassService goodsClassService;
	
	/**
	 * 跳转到资源表单页面，若objId为null则为新增操作，否则为修改操作
	 * @param objId
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(params="method=toGoodsClassFormView")
	public ModelAndView toGoodsClassFormView(String objId, HttpServletRequest request) throws Exception {
		Map<String, Object> model = new HashMap<String, Object>();
		
		GoodsClass goodsClass = null;
		//新增
		if(StringUtils.isBlank(objId)) {
			goodsClass = new GoodsClass();
			//获取父节点信息，若父节点id为空则增加一级节点
			String parentId = request.getParameter("parentId");
			if(!StringUtils.isBlank(parentId)) {
				GoodsClass parentGoodsClass = goodsClassService.get(parentId);
				goodsClass.setParent(parentGoodsClass);
			}
			
			//设置层级
			goodsClass.setTreeLevel(Short.valueOf(request.getParameter("GoodsClassLevel")));
		}
		else {
			goodsClass = goodsClassService.get(objId);
		}
		model.put("goodsClass", goodsClass);
		
		return new ModelAndView("goodsClassFormView", model);
	}
	
	/**
	 * 跳转到资源详情页面
	 * @param objId 资源对象id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(params="method=toGoodsClassDetailView")
	public ModelAndView toGoodsClassDetailView(String objId, HttpServletRequest request) throws Exception {
		Map<String, Object> model = new HashMap<String, Object>();
		
		GoodsClass goodsClass = goodsClassService.get(objId);
		model.put("goodsClass", goodsClass);
		
		return new ModelAndView("goodsClassDetailView", model);
	}
	
	/**
	 * 保存资源信息
	 * @param GoodsClass 资源对象
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(params="method=save")
	public ModelAndView save(GoodsClass GoodsClass, HttpServletRequest request) throws Exception {
		Map<String, Object> model = new HashMap<String, Object>();
		
		//保存资源信息
		goodsClassService.saveGoodsClass(GoodsClass);
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
		goodsClassService.removeAll(objId);
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
		String xml = goodsClassService.listChildrenXml(id);
		
		ResponseUtils.renderXml(response, xml);
	}
	
	

}
