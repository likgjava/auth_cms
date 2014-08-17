package com.likg.auth.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.likg.auth.domain.User;
import com.likg.cms.domain.Article;
import com.likg.cms.service.ArticleService;
import com.likg.common.page.Page;
import com.likg.core.dao.hibernate.query.QueryObject;
import com.likg.core.dao.hibernate.query.QueryObjectBase;
import com.likg.core.dao.hibernate.query.QueryParam;
import com.likg.goods.goods.domain.Goods;
import com.likg.goods.goods.service.GoodsService;
import com.likg.lucene.LuceneUtil;
import com.likg.security.AuthenticationHelper;

/**
 * @springmvc.view value="searchView" url="view/auth/portal/search.jsp"
 *
 */
@Controller
@RequestMapping("/SearchController.do")
public class SearchController {
	
	private static Logger log = Logger.getLogger(SearchController.class);
	
	@Resource
	private GoodsService goodsService;
	
	@Resource(name="articleServiceImpl")
	private ArticleService articleService;

	@RequestMapping(params="method=toSearchView")
	public ModelAndView toSearchView(HttpServletRequest request, HttpSession session) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();
		long begin = System.currentTimeMillis();
		
		String keyWord = request.getParameter("kw");
		System.out.println(request.getCharacterEncoding());
		System.out.println("keyWord===="+keyWord);
		String searchType = request.getParameter("searchType");
		int pageIndex = 1;
		int pageSize = 10;
		if(StringUtils.isNotBlank(request.getParameter("page"))) {
			pageIndex = Integer.parseInt(request.getParameter("page"));
		}
		
		model = this.generalSearch(keyWord, searchType, pageIndex, pageSize);
		model.put("searchType", "news");
		
		
		long end = System.currentTimeMillis();
		model.put("takeTime", (end-begin)*1.0/1000);
		
		return new ModelAndView("searchView", model);
	}
	
	private Map<String, Object> generalSearch(String keyWord, String searchType, int pageIndex, int pageSize) {
		log.info("普通查询方式");
		Map<String, Object> model = new HashMap<String, Object>();
		
		QueryObject<Article> queryObject = new QueryObjectBase<Article>();
		QueryParam queryParam = new QueryParam();
		queryParam.or(new QueryParam("title", QueryParam.OPERATOR_LIKE, keyWord));
		queryParam.or(new QueryParam("abstracts", QueryParam.OPERATOR_LIKE, keyWord));
		queryParam.or(new QueryParam("content", QueryParam.OPERATOR_LIKE, keyWord));
		queryObject.setQueryParam(queryParam);
		queryObject.setEntityClass(Article.class);
		
		Page<Article> articlePage = articleService.findByQuery(queryObject, false, (pageIndex-1)*pageSize, pageSize);
		model.put("dataList", articlePage.getData());
		model.put("PAGE_INDEX", articlePage.getPageIndex());
		model.put("PAGE_COUNT", articlePage.getPageCount());
		model.put("TOTAL_RECORD", articlePage.getTotalRecord());
		
		System.out.println("getPageIndex===="+articlePage.getPageIndex());
		System.out.println("getPageCount===="+articlePage.getPageCount());
		System.out.println("getTotalRecord===="+articlePage.getTotalRecord());
		
		return model;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	private Map<String, Object> luceneSearch(String keyWord, String searchType, int pageIndex, int pageSize) {
		Map<String, Object> model = new HashMap<String, Object>();
		


		//通过索引获取所有满足条件的objId
		List<String> objIds = LuceneUtil.search(keyWord);
		
		System.out.println("=============="+objIds.size());
		
		List<String> queryObjIdList = new ArrayList<String>();
		for(int i=((pageIndex-1)*pageSize); i<(pageIndex*pageSize) && i<objIds.size(); i++) {
			queryObjIdList.add(objIds.get(i));
		}
		
		//List<String> objIds = new ArrayList<String>();
		//objIds.add("2c93a0c23946e717013947248cc50001");
		//objIds.add("2c93a0c239479d470139479ed7270001");
		QueryObject<Goods> queryObject = new QueryObjectBase<Goods>();
		QueryParam queryParam = new QueryParam("objId", QueryParam.OPERATOR_IN, queryObjIdList);
		queryObject.setQueryParam(queryParam);
		queryObject.setEntityClass(Goods.class);
		
		
		
		List<Goods> goodsList = goodsService.findListByQuery(queryObject);
		
		//session.setAttribute("initPath", request.getContextPath());
		
		//User user = AuthenticationHelper.getCurrentUser();
		model.put("goodsList", goodsList);
		model.put("PAGE_INDEX", pageIndex);
		model.put("PAGE_COUNT", (objIds.size()%pageSize==0 ? objIds.size()/pageSize : objIds.size()/pageSize+1));
		
		
		return model;
	}
	
	
}
