<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/view/auth/portal/taglibs.jsp"%>
<div id="top">
<div class="page box">
	<div class="fl " id="logincontent">
		<div id="loginCsiDiv">
			<c:if test="${user!=null}">
				欢迎您: ${user.userName} &nbsp;
				<c:set var="mcUrl" value="/MemberController.do?method=toMemberCenterView" />
				<c:if test="${user.isAdmin==1}"><c:set var="mcUrl" value="/MemberController.do?method=toManageCenterView" /></c:if> 
				<a href="${initPath}${mcUrl}">会员中心</a>|
				<a href="${initPath}/LoginController.do?method=logout">退出登录</a>
			</c:if>
			<c:if test="${user==null}">
			游客您好，您还没有登录哦！<a href="${initPath}/RegisterController.do?method=toRegisterView">免费注册</a>|<a href="${initPath}/view/auth/login/login.jsp">会员登录</a>|<a href="${base}/member/forgot_password.jspx">忘记密码</a>
			</c:if>
		</div>
	</div>
	<div class="fr">
		<a href="${base}/tag.jspx" target="_blank">Tags</a>|
		<a href="${base}/guestbook.jspx" target="_blank">留言板</a>|
		<a href="${base}/rss.jspx" target="_blank">RSS订阅</a>|
		<!-- <a href="#" onclick="this.style.behavior='url(#default#homepage)';this.setHomePage('http://www.jeecms.com');">设为主页</a>| -->
		<a onclick="addFavorite(window.location,document.title)" href="javascript:" class="login_user">加入收藏</a>
	</div>
</div>
</div>
<script>
function addFavorite(url,title){
	try {
		window.external.addFavorite(url, title);
	}catch (e){
		try{
			window.sidebar.addPanel(title, url, "");
		}catch (e){
			alert("加入收藏失败，请使用Ctrl+D进行添加！");
		}
	}
}
</script>