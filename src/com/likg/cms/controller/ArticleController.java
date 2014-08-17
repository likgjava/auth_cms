package com.likg.cms.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.Calendar;
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

import com.likg.cms.domain.Article;
import com.likg.cms.domain.Channel;
import com.likg.cms.domain.Comment;
import com.likg.cms.domain.Template;
import com.likg.cms.enumeration.ArticleEnum;
import com.likg.cms.release.ReleaseArticleHelper;
import com.likg.cms.service.ArticleService;
import com.likg.cms.service.ChannelService;
import com.likg.cms.service.CommentService;
import com.likg.cms.service.TemplateService;
import com.likg.common.Constants;
import com.likg.common.page.Page;
import com.likg.core.controller.BaseGenericController;
import com.likg.core.dao.hibernate.query.QueryObject;
import com.likg.core.dao.hibernate.query.QueryObjectBase;
import com.likg.core.dao.hibernate.query.QueryParam;

import freemarker.template.Configuration;

/**
 * @springmvc.view value="articleFormView" url="view/cms/article_form.jsp"
 * @springmvc.view value="showArticleDetailView" url="view/cms/show_article_detail.jsp"
 * @springmvc.view value="newsIndexView" url="view/cms/show/news_index.jsp"
 * @springmvc.view value="newsListView" url="view/cms/show/news_list.jsp"
 * @springmvc.view value="articleRelateInfoView" url="view/cms/show/article_relate_info.jsp"
 */
@Controller
@RequestMapping("/ArticleController.do")
public class ArticleController extends BaseGenericController<Article>  {
	
	@Resource(name="articleServiceImpl")
	private ArticleService articleService;
	
	@Resource(name="channelServiceImpl")
	private ChannelService channelService;
	
	@Resource(name="templateServiceImpl")
	private TemplateService templateService;
	
	@Resource(name="commentServiceImpl")
	private CommentService commentService;
	
	/**
	 * 跳转到稿件表单页面，若objId为null则为新增操作，否则为修改操作
	 * @param objId
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(params="method=toArticleFormView")
	public ModelAndView toArticleFormView(String objId, HttpServletRequest request) throws Exception {
		Map<String, Object> model = new HashMap<String, Object>();
		Article article = null;
		
		//新增
		if(StringUtils.isBlank(objId)) {
			article = new Article();
			//设置栏目信息
			String channelId = request.getParameter("channelId");
			Channel channel = new Channel();
			channel.setObjId(channelId);
			article.setChannel(channel);
		}
		else {
			article = articleService.get(objId);
		}
		model.put("article", article);
		
		return new ModelAndView("articleFormView", model);
	}
	
	
	/**
	 * 保存菜单信息
	 * @param article 菜单对象
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(params="method=save")
	public ModelAndView save(Article article, HttpServletRequest request) throws Exception {
		Map<String, Object> model = new HashMap<String, Object>();
		
		//保存稿件信息
		articleService.saveArticle(article);
		model.put(Constants.SUCCESS, true);
		
		return new ModelAndView(Constants.JSON_VIEW, model);
	}
	
	/**
	 * 发布或撤销稿件
	 * @param objId 稿件id
	 * @param releaseStatus 发布状态
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(params="method=releaseOrRecall")
	public ModelAndView releaseOrRecall(String objId, String releaseStatus, HttpServletRequest request) throws Exception {
		Map<String, Object> model = new HashMap<String, Object>();
		
		//发布或撤销稿件
		Article article = articleService.get(objId);
		article.setReleaseStatus(releaseStatus);
		articleService.save(article);
		
		//生成静态页面
		if(ArticleEnum.RELEASED.equals(releaseStatus)) {
			//articleService.makeStaticPage(objId);
			ReleaseArticleHelper.createArticleIdFile(objId);
		}
		model.put(Constants.SUCCESS, true);
		
		return new ModelAndView(Constants.JSON_VIEW, model);
	}
	
	/**
	 * 跳转到稿件表单页面，若objId为null则为新增操作，否则为修改操作
	 * @param objId
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(params="method=toShowArticleDetailView")
	public ModelAndView toShowArticleDetailView(String objId, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> model = new HashMap<String, Object>();
		
		//获取稿件信息
		Article article = articleService.get(objId);
		model.put("article", article);
		
		//判断是否访问静态页面
		String s = request.getParameter("s");
		if("1".equals(s)) {
			//计算静态页面的存放路径
			String cmsStaticPage = messageSource.getMessage("cmsStaticPage");
			Calendar c = Calendar.getInstance();
			c.setTime(article.getCreateTime());
			String path = cmsStaticPage+File.separator + c.get(Calendar.YEAR)+"-"+(c.get(Calendar.MONTH)+1)+File.separator + c.get(Calendar.DATE) + File.separator + article.getObjId()+".html";
			request.getRequestDispatcher(path).forward(request, response);
			return null;
		}
		
		//获取稿件的栏目信息
		List<Channel> channelList = channelService.getParentList(article.getChannel().getObjId());
		model.put("channelList", channelList);
		
		//获取该稿件的评论数
		QueryObject<Comment> queryObject = new QueryObjectBase<Comment>();
		queryObject.setEntityClass(Comment.class);
		queryObject.setQueryParam(new QueryParam("article.objId", QueryParam.OPERATOR_EQ, article.getObjId()));
		queryObject.getQueryProjections().setRowCount(true);
		List<Comment> commentNumList = commentService.findListByQuery(queryObject);
		model.put("commentNum", commentNumList.get(0));
		
		return new ModelAndView("showArticleDetailView", model);
	}
	
	/**
	 * 跳转到新闻首页
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(params="method=toNewsIndexView")
	public ModelAndView toNewsIndexView(HttpServletRequest request) throws Exception {
		Map<String, Object> model = new HashMap<String, Object>();
		
		//获取最新稿件信息
		QueryObject<Article> queryObject = new QueryObjectBase<Article>();
		queryObject.setEntityClass(Article.class);
		queryObject.getQueryProjections().setOrderProperty("createTime");
		queryObject.getQueryProjections().setDescFlag(true);
		Page<Article> pageArticle = articleService.findByQuery(queryObject, true, 0, 7);
		model.put("newsestArticleList", pageArticle.getData());
		
		//获取‘国内新闻’栏目的稿件
		//QueryObject<Article> queryObject2 = new QueryObjectBase<Article>();
		//queryObject2.setEntityClass(Article.class);
		queryObject.setQueryParam(new QueryParam("channel.objId", QueryParam.OPERATOR_EQ, "C0101"));
		//queryObject2.getQueryProjections().setOrderProperty("createTime");
		//queryObject2.getQueryProjections().setDescFlag(true);
		pageArticle = articleService.findByQuery(queryObject, true, 0, 6);
		model.put("guoneiArticleList", pageArticle.getData());
		
		//获取‘国际新闻’栏目的稿件
		//QueryObject<Article> queryObject3 = new QueryObjectBase<Article>();
		//queryObject3.setEntityClass(Article.class);
		queryObject.setQueryParam(new QueryParam("channel.objId", QueryParam.OPERATOR_EQ, "C0102"));
		//queryObject3.getQueryProjections().setOrderProperty("createTime");
		//queryObject3.getQueryProjections().setDescFlag(true);
		pageArticle = articleService.findByQuery(queryObject, true, 0, 6);
		model.put("guojiArticleList", pageArticle.getData());
		
		return new ModelAndView("newsIndexView", model);
	}
	
	/**
	 * 跳转到指定栏目的稿件列表页面
	 * @param channelId 栏目id
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(params="method=toNewsListView")
	public ModelAndView toNewsListView(String channelId, HttpServletRequest request) throws Exception {
		Map<String, Object> model = new HashMap<String, Object>();
		
		//获取分页信息
		Integer pageSize = 10;
		if(StringUtils.isNumeric(request.getParameter("pageSize"))) {
			pageSize = Integer.valueOf(request.getParameter("pageSize"));
		}
		Integer pageIndex = 1;
		if(StringUtils.isNumeric(request.getParameter("pageIndex"))) {
			pageIndex = Integer.valueOf(request.getParameter("pageIndex"));
		}
		Page<Article> pageArticle = new Page<Article>(pageSize, pageIndex);
		
		//获取稿件的栏目信息
		Channel channel = channelService.getTreeObject(channelId);
		model.put("channel", channel);
		
		//获取指定栏目的稿件列表
		QueryObject<Article> queryObject = new QueryObjectBase<Article>();
		queryObject.setEntityClass(Article.class);
		queryObject.setQueryParam(new QueryParam("channel.objId", QueryParam.OPERATOR_EQ, channelId));
		queryObject.getQueryProjections().setOrderProperty("createTime");
		queryObject.getQueryProjections().setDescFlag(true);
		pageArticle = articleService.findByQuery(queryObject, true, pageArticle.getFirstResult(), pageArticle.getPageSize());
		model.put("pageArticle", pageArticle);
		
		return new ModelAndView("newsListView", model);
	}
	
	/**
	 * 加载稿件相关信息页面
	 * @param articleId 稿件id
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(params="method=loadArticleRelateInfoView")
	public ModelAndView loadArticleRelateInfoView(String articleId, HttpServletRequest request) throws Exception {
		Map<String, Object> model = new HashMap<String, Object>();
		
		//获取稿件信息
		Article article = articleService.get(articleId);
		model.put("article", article);
		
		//获取最新稿件信息
		QueryObject<Article> queryObject = new QueryObjectBase<Article>();
		queryObject.setEntityClass(Article.class);
		queryObject.getQueryProjections().setOrderProperty("createTime");
		queryObject.getQueryProjections().setDescFlag(true);
		Page<Article> pageArticle = articleService.findByQuery(queryObject, true, 0, 10);
		model.put("newsestArticleList", pageArticle.getData());
		
		return new ModelAndView("articleRelateInfoView", model);
	}
	
	
	/**
	 * 生成稿件静态页面
	 * @param objId 稿件id
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(params="method=makeStaticPage")
	public ModelAndView makeStaticPage(String objId, HttpServletRequest request) throws Exception {
		Map<String, Object> model = new HashMap<String, Object>();
		
		articleService.makeStaticPage(objId);
		
		return new ModelAndView(Constants.JSON_VIEW, model);
	}
	

}
