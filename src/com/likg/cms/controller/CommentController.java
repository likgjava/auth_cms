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
import com.likg.cms.domain.Comment;
import com.likg.cms.service.ArticleService;
import com.likg.cms.service.CommentService;
import com.likg.common.Constants;
import com.likg.common.page.Page;
import com.likg.core.controller.BaseGenericController;
import com.likg.core.dao.hibernate.query.QueryObject;
import com.likg.core.dao.hibernate.query.QueryObjectBase;
import com.likg.core.dao.hibernate.query.QueryParam;
import com.octo.captcha.service.image.ImageCaptchaService;

/**
 * @springmvc.view value="showCommentListView" url="view/cms/show/comment_list.jsp"
 */
@Controller
@RequestMapping("/CommentController.do")
public class CommentController extends BaseGenericController<Comment>  {
	
	@Resource(name="commentServiceImpl")
	private CommentService commentService;
	
	@Resource(name="articleServiceImpl")
	private ArticleService articleService;
	
	@Resource
	private ImageCaptchaService imageCaptchaService;
	
	/**
	 * 跳转到稿件表单页面，若objId为null则为新增操作，否则为修改操作
	 * @param objId
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(params="method=toCommentFormView")
	public ModelAndView toCommentFormView(String objId, HttpServletRequest request) throws Exception {
		Map<String, Object> model = new HashMap<String, Object>();
		Comment comment = null;
		
		//新增
		if(StringUtils.isBlank(objId)) {
			comment = new Comment();
			//设置栏目信息
			String channelId = request.getParameter("channelId");
			Channel channel = new Channel();
			channel.setObjId(channelId);
		}
		else {
			comment = commentService.get(objId);
		}
		model.put("Comment", comment);
		
		return new ModelAndView("CommentFormView", model);
	}
	
	
	/**
	 * 保存菜单信息
	 * @param Comment 菜单对象
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(params="method=save")
	public ModelAndView save(Comment comment, String captcha, HttpServletRequest request) throws Exception {
		Map<String, Object> model = new HashMap<String, Object>();
		
		//判断验证码是否正确
		if (!imageCaptchaService.validateResponseForID(request.getSession().getId(), captcha)) {
			model.put(Constants.RESULT, "验证码不正确");
			model.put(Constants.SUCCESS, false);
		} else {
			//保存稿件信息
			commentService.saveComment(comment);
			model.put("comment", comment);
			model.put(Constants.SUCCESS, true);
		}
		
		return new ModelAndView(Constants.JSON_VIEW, model);
	}
	
	/**
	 * 跳转到稿件评论列表页面
	 * @param articleId 稿件id
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(params="method=toShowCommentListView")
	public ModelAndView toShowCommentListView(String articleId, HttpServletRequest request) throws Exception {
		Map<String, Object> model = new HashMap<String, Object>();
		
		//获取稿件信息
		Article article = articleService.get(articleId);
		model.put("article", article);
		
		//获取该稿件的前10条评论
		QueryObject<Comment> queryObject = new QueryObjectBase<Comment>();
		queryObject.setEntityClass(Comment.class);
		queryObject.setQueryParam(new QueryParam("article.objId", QueryParam.OPERATOR_EQ, article.getObjId()));
		queryObject.getQueryProjections().setOrderProperty("createTime");
		queryObject.getQueryProjections().setDescFlag(true);
		Page<Comment> commentPage = commentService.findByQuery(queryObject, true, 0, 10);
		model.put("commentPage", commentPage);
		
		return new ModelAndView("showCommentListView", model);
	}
	
}
