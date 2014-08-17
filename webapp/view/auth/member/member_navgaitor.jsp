<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/view/auth/portal/taglibs.jsp" %>

<div class="mc_left">
	<div class="mc_left_top">
		<div class="mc-photo">
			<img src="${initPath}/view/resource/skin/img/member/member-phtot.gif"/>
		</div> 
		<p>${user.userName}</p>
	</div>
	<!-- 
	<div class="mc-left-zl">个人资料</div>
	<ul class="nan_mu_bottom">
		<li><a href="${base}/member/index.jspx">用户信息</a></li>
		<li><a href="pwd.jspx">修改密码</a></li>
		<li><h3 class="tg">投稿管理</h3></li>
		<li><a href="contribute_list.jspx">稿件列表</a></li>
              <li><a href="contribute_add.jspx">发布稿件</a></li>
              <li><h3 class="pl">评论管理</h3></li>
               <li><a href="mycomments.jspx">我的评论</a></li>
              <li><a href="news_comments.jspx">评论管理</a></li>
              <li><h3 class="ly">留言管理</h3></li>
               <li><a href="myguestbook.jspx">我的留言</a></li>
                <li><h3 class="scgl">收藏管理</h3></li>
               <li><a href="collection_list.jspx">我的收藏</a></li>
               <li><h3 class="znxx">站内信息</h3></li>
               <li><a href="message_mng.jspx">站内信息</a></li>
               <li><h3 class="fwzx">服务中心</h3></li>
               <li><a href="${base}/logout.jspx?returnUrl=/">退出登录</a></li>
	</ul>
	 -->
	
	<ul class="nan_mu_bottom">
		<c:forEach var="menu" items="${menuList}">
		<li><h3 class="${menu.menuCss}">${menu.menuName}</h3></li>
			<c:forEach var="menu2" items="${menu.children}">
			<li><a href="/${menu2.resource.resUrl }">${menu2.menuName}</a></li>
			</c:forEach>
		</c:forEach>
	</ul>
	
</div>

