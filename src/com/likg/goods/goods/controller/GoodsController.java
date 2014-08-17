package com.likg.goods.goods.controller;

import java.util.HashMap;
import java.util.List;
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
import com.likg.common.page.Page;
import com.likg.core.controller.BaseGenericController;
import com.likg.core.dao.hibernate.query.QueryObject;
import com.likg.core.dao.hibernate.query.QueryObjectBase;
import com.likg.core.dao.hibernate.query.QueryParam;
import com.likg.core.util.AttachmentUtil;
import com.likg.goods.goods.domain.Goods;
import com.likg.goods.goods.service.GoodsService;
import com.likg.goods.goodsbrand.domain.GoodsBrand;
import com.likg.goods.goodsbrand.service.GoodsBrandService;
import com.likg.goods.goodsclass.domain.GoodsClass;
import com.likg.goods.goodsclass.service.GoodsClassService;
import com.likg.lucene.LuceneUtil;
import com.likg.security.AuthenticationHelper;

/**
 * @springmvc.view value="goodsFormView" url="view/goods/goods/goods_form.jsp"
 * @springmvc.view value="myGoodsListView" url="view/goods/goods/my_goods_list.jsp"
 * @springmvc.view value="showGoodsIndexView" url="view/goods/showgoods/show_goods_index.jsp"
 * @springmvc.view value="showGoodsDetailView" url="view/goods/showgoods/show_goods_detail.jsp"
 *
 */
@Controller
@RequestMapping("/GoodsController.do")
public class GoodsController extends BaseGenericController<Goods>  {
	
	static Logger log = Logger.getLogger(GoodsController.class);
	
	@Resource(name="goodsServiceImpl")
	private GoodsService goodsService;
	
	@Resource(name="goodsClassServiceImpl")
	private GoodsClassService goodsClassService;
	
	@Resource
	private GoodsBrandService goodsBrandService;
	
	public static void main(String[] args) {
		log.info("aaaaaaaaaa");
		log.error("error");
		log.debug("debug");
	}
	
	/**
	 * 跳转到用户表单页面，若objId为null则为新增操作，否则为修改操作
	 * @param objId
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(params="method=toGoodsFormView")
	public ModelAndView toGoodsFormView(String objId, HttpServletRequest request) throws Exception {
		Map<String, Object> model = new HashMap<String, Object>();
		
		Goods goods = null;
		//新增
		if(StringUtils.isBlank(objId)) {
			goods = new Goods();
		}
		else {
			goods = goodsService.get(objId);
		}
		model.put("goods", goods);
		
		return new ModelAndView("goodsFormView", model);
	}
	
	
	/**
	 * 跳转到菜单详情页面
	 * @param objId 菜单对象id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(params="method=toGoodsDetailView")
	public ModelAndView toGoodsDetailView(String objId, HttpServletRequest request) throws Exception {
		Map<String, Object> model = new HashMap<String, Object>();
		
		//获取菜单信息
		//Menu menu = menuService.get(objId);
		//model.put("menu", menu);
		
		return new ModelAndView("goodsDetailView", model);
	}
	
	
	/**
	 * 保存菜单信息
	 * @param Goods 菜单对象
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(params="method=save")
	public ModelAndView save(Goods goods, HttpServletRequest request) throws Exception {
		Map<String, Object> model = new HashMap<String, Object>();
		
		//保存商品图片
		try {
			Attachment attachment = AttachmentUtil.uploadImage(request, "pictureFile");
			goods.setMainPicture(attachment.getPath());
		} catch (Exception e) {}
		
		//保存商品信息
		goodsService.saveGoods(goods);
		model.put(Constants.SUCCESS, true);
		
		//获取当前用户id
		model.put("currentUserId", AuthenticationHelper.getCurrentUser().getObjId());
		
		return new ModelAndView(Constants.JSON_VIEW, model);
	}
	
	/**
	 * 跳转到我的商品列表页面
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(params="method=toMyGoodsListView")
	public ModelAndView toMyGoodsListView(HttpServletRequest request) throws Exception {
		Map<String, Object> model = new HashMap<String, Object>();
		
		//获取当前用户id
		model.put("currentUserId", AuthenticationHelper.getCurrentUser().getObjId());
		
		return new ModelAndView("myGoodsListView", model);
	}
	
	
	/**
	 * 跳转到商品展示首页
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(params="method=toShowGoodsIndexView")
	public ModelAndView toShowGoodsIndexView(HttpServletRequest request) throws Exception {
		Map<String, Object> model = new HashMap<String, Object>();
		//指定商品分类
		String goodsClassId = request.getParameter("goodsClass");
		
		//获取一级商品分类
		QueryObject<GoodsClass> queryObject = new QueryObjectBase<GoodsClass>();
		QueryParam queryParam = new QueryParam("parent.objId", QueryParam.OPERATOR_IS, null);
		queryObject.setQueryParam(queryParam);
		queryObject.setEntityClass(GoodsClass.class);
		List<GoodsClass> goodsClassList = goodsClassService.findListByQuery(queryObject);
		model.put("goodsClassList", goodsClassList);
		
		//获取品牌信息
		QueryObject<GoodsBrand> queryGoodsBrand = new QueryObjectBase<GoodsBrand>();
		queryGoodsBrand.setEntityClass(GoodsBrand.class);
		Page<GoodsBrand> goodsBrandPage = goodsBrandService.findByQuery(queryGoodsBrand, true, 0, 6);
		model.put("goodsBrandList", goodsBrandPage.getData());
		
		//获取推荐商品
		QueryObject<Goods> queryRecommendGoods = new QueryObjectBase<Goods>();
		queryRecommendGoods.setEntityClass(Goods.class);
		queryRecommendGoods.getQueryProjections().setOrderProperty("createTime");
		queryRecommendGoods.getQueryProjections().setDescFlag(true);
		Page<Goods> recommendGoodsPage = goodsService.findByQuery(queryRecommendGoods, true, 0, 5);
		model.put("recommendGoodsList", recommendGoodsPage.getData());
		
		//获取商品
		Map<GoodsClass, List<Goods>> goodsListMap = new HashMap<GoodsClass, List<Goods>>();
		//获取指定分类的商品
		if(StringUtils.isNotBlank(goodsClassId)) {
			GoodsClass gc = goodsClassService.get(goodsClassId);
			
			QueryObject<Goods> queryObject2 = new QueryObjectBase<Goods>();
			QueryParam queryParam2 = new QueryParam("goodsClass.objId", QueryParam.OPERATOR_LIKE, gc.getObjId());
			queryObject2.setQueryParam(queryParam2);
			queryObject2.setEntityClass(Goods.class);
			Page<Goods> goodsPage = goodsService.findByQuery(queryObject2, true, 0, 20);
			
			goodsListMap.put(gc, goodsPage.getData());
		}
		//获取所有分类的商品
		else {
			for(GoodsClass gc : goodsClassList) {
				QueryObject<Goods> queryObject2 = new QueryObjectBase<Goods>();
				QueryParam queryParam2 = new QueryParam("goodsClass.objId", QueryParam.OPERATOR_LIKE, gc.getObjId());
				queryObject2.setQueryParam(queryParam2);
				queryObject2.setEntityClass(Goods.class);
				Page<Goods> goodsPage = goodsService.findByQuery(queryObject2, true, 0, 5);
				
				goodsListMap.put(gc, goodsPage.getData());
			}
		}
		model.put("goodsListMap", goodsListMap);
		
		return new ModelAndView("showGoodsIndexView", model);
	}
	
	/**
	 * 跳转到商品展示页面
	 * @param objId 商品id
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(params="method=toShowGoodsDetailView")
	public ModelAndView toShowGoodsDetailView(String objId, HttpServletRequest request) throws Exception {
		Map<String, Object> model = new HashMap<String, Object>();
		
		//获取商品信息
		Goods goods = goodsService.get(objId);
		model.put("goods", goods);
		
		return new ModelAndView("showGoodsDetailView", model);
	}
	
	@RequestMapping(params="method=removeGoods")
	public ModelAndView removeGoods(String objId, HttpServletRequest request) throws Exception {
		Map<String, Object> model = new HashMap<String, Object>();
		
		goodsService.remove(objId);
		
		
		LuceneUtil.deleteIndex(objId);
		
		model.put(Constants.SUCCESS, true);
		
		return new ModelAndView(Constants.JSON_VIEW, model);
	}
	
	/**
	 * 创建商品索引文件
	 * @param objIds 商品id
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(params="method=createIndex")
	public ModelAndView createIndex(String[] objIds, HttpServletRequest request) throws Exception {
		Map<String, Object> model = new HashMap<String, Object>();
		
		for(String objId : objIds) {
			Goods goods = goodsService.get(objId);
			LuceneUtil.addOrUpdateIndex(goods);
		}
		
		model.put(Constants.SUCCESS, true);
		
		return new ModelAndView(Constants.JSON_VIEW, model);
	}
	

}
