package com.likg.auth.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.likg.auth.domain.Role;
import com.likg.auth.domain.User;
import com.likg.auth.service.UserService;
import com.likg.core.controller.BaseGenericController;
import com.likg.core.domain.BaseObject;
import com.likg.goods.goods.domain.Goods;
import com.likg.goods.goods.service.GoodsService;
import com.likg.security.AuthenticationHelper;

/**
 * @springmvc.view value="indexView" url="view/auth/portal/index.jsp"
 * @springmvc.view value="topView" url="view/auth/portal/top.jsp"
 */
@Controller
@RequestMapping("/IndexViewController.do")
public class IndexViewController extends BaseGenericController<BaseObject> {
	
	private static Logger log = Logger.getLogger(IndexViewController.class);
	
	@Resource
	private GoodsService goodsService;
	
	@Resource(name="userServiceImpl")
	private UserService userService;
	
	/**
	 * 跳转到首页
	 * @param request
	 * @param session
	 * @return
	 */
	@RequestMapping(params="method=toIndexView")
	public ModelAndView toIndexView(HttpServletRequest request, HttpSession session) {
		Map<String, Object> model = new HashMap<String, Object>();
		
		session.setAttribute("initPath", request.getContextPath());

		
		User user = AuthenticationHelper.getCurrentUser();
		model.put("user", user);
		
		User u1 = userService.get("user01");
		System.out.println("goodsName1===="+u1.getUserName());
		for(Role r : u1.getRoles()) {
			System.out.println("roleName="+r.getRoleName()+"----"+r.getRoleDesc());
		}
		
		
		return new ModelAndView("indexView", model);
	}
	
	/**
	 * 加载top页面
	 * @param request
	 * @return
	 */
	@RequestMapping(params="method=loadTopView")
	public ModelAndView loadTopView(HttpServletRequest request) {
		Map<String, Object> model = new HashMap<String, Object>();
		
		//获取当前用户信息
		User user = AuthenticationHelper.getCurrentUser();
		model.put("user", user);
		
		return new ModelAndView("topView", model);
	}
	
	
	@RequestMapping(params="method=saveUser")
	public ModelAndView saveUser() {
		Map<String, Object> model = new HashMap<String, Object>();
		
		model.put("nowDate", new Date());
		model.put("name", "李凯歌");
		
		return new ModelAndView("jsonView", model);
	}
	
}
