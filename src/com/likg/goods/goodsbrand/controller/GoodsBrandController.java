package com.likg.goods.goodsbrand.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.likg.auth.domain.Attachment;
import com.likg.common.Constants;
import com.likg.core.controller.BaseGenericController;
import com.likg.core.util.AttachmentUtil;
import com.likg.goods.goodsbrand.domain.GoodsBrand;
import com.likg.goods.goodsbrand.service.GoodsBrandService;
import com.likg.security.AuthenticationHelper;

/**
 * @springmvc.view value="goodsBrandFormView" url="view/goods/goodsbrand/goods_brand_form.jsp"
 * @springmvc.view value="goodsBrandDetailView" url="view/goods/goodsbrand/goods_brand_detail.jsp"
 */
@Controller
@RequestMapping("/GoodsBrandController.do")
public class GoodsBrandController extends BaseGenericController<GoodsBrand>  {
	
	private static Logger log = Logger.getLogger(GoodsBrandController.class);
	
	@Resource
	private GoodsBrandService goodsBrandService;
	
	/**
	 * 跳转到用户表单页面，若objId为null则为新增操作，否则为修改操作
	 * @param objId
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(params="method=toGoodsBrandFormView")
	public ModelAndView toGoodsBrandFormView(String objId, HttpServletRequest request) throws Exception {
		Map<String, Object> model = new HashMap<String, Object>();
		GoodsBrand goodsBrand = null;
		
		//新增
		if(StringUtils.isBlank(objId)) {
			goodsBrand = new GoodsBrand();
		}
		else {
			goodsBrand = goodsBrandService.get(objId);
		}
		model.put("goodsBrand", goodsBrand);
		
		return new ModelAndView("goodsBrandFormView", model);
	}
	
	
	/**
	 * 跳转到菜单详情页面
	 * @param objId 菜单对象id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(params="method=toGoodsBrandDetailView")
	public ModelAndView toGoodsBrandDetailView(String objId, HttpServletRequest request) throws Exception {
		Map<String, Object> model = new HashMap<String, Object>();
		
		//获取菜单信息
		GoodsBrand goodsBrand = goodsBrandService.get(objId);
		model.put("goodsBrand", goodsBrand);
		
		return new ModelAndView("goodsBrandDetailView", model);
	}
	
	
	/**
	 * 保存商品品牌信息
	 * @param goodsBrand 商品品牌对象
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(params="method=save")
	public ModelAndView save(GoodsBrand goodsBrand, HttpServletRequest request) throws Exception {
		Map<String, Object> model = new HashMap<String, Object>();
		
		//保存品牌图片
		try {
			Attachment attachment = AttachmentUtil.uploadFile(request, "pictureFile");
			goodsBrand.setBrandPicture(attachment.getPath());
		} catch (Exception e) {
		}
		
		//保存品牌信息
		goodsBrandService.saveGoodsBrand(goodsBrand);
		model.put(Constants.SUCCESS, true);
		
		return new ModelAndView(Constants.JSON_VIEW, model);
	}
	
	/**
	 * 删除商品品牌
	 * @param objIds 品牌id，多个以逗号分隔
	 */
	@RequestMapping(params="method=removeGoodsBrand")
	public ModelAndView removeGoodsBrand(String objIds, HttpServletRequest request) throws Exception {
		Map<String, Object> model = new HashMap<String, Object>();
		
		//删除商品品牌
		goodsBrandService.removeGoodsBrand(objIds.split(","));
		model.put(Constants.SUCCESS, true);
		
		return new ModelAndView(Constants.JSON_VIEW, model);
	}
	
	
	

}
