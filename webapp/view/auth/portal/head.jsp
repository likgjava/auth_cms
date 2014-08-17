<%@ page contentType="text/html; charset=UTF-8"%>
<div class="toolbar box" style="margin-bottom: 0px">
<div class="toolbar-inner">
	<div class="fl" id="logincontent">[#if user??]欢迎您: ${user.username} &nbsp; ${user.group.name} &nbsp; <a href="logout.jspx?returnUrl=/">退出登录</a>[#else] 游客您好，您还没有登录哦！ <a href="${base}/register.jspx">免费注册</a>|<a href="${base}/login.jspx?returnUrl=${location}">登录</a>|<a href="#">找回密码</a>[/#if]</div>
	<div class="fr"><a target="_blank" href="${base}/tag.jspx">Tags</a>|<a target="_blank" href="${base}/search.jspx">高级搜索</a>|<a target="_blank" href="${base}/rss.jspx">RSS订阅</a>|<a onClick="this.style.behavior='url(#default#homepage)';this.setHomePage('http://www.jeecms.com');" href="#">设为主页</a>| <a class="login_user" onclick="javascript:window.external.AddFavorite('index.html', '${site.name}');" href="javascript:void(0)">加入收藏</a></div>
</div>
</div>