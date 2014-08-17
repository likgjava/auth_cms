<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/view/auth/portal/taglibs.jsp" %>

 <script> 
	$(function() {
		//countUnreadMsg();
	});
	function countUnreadMsg(){
		 $.post("message_countUnreadMsg.jspx", {
			}, function(data) {
				if(data.result){
					 $("#countDiv").html(""+data.count+"");
				}else{
					alert("请先登录");
				}
			}, "json");
		 setTimeout( "countUnreadMsg() ",1000*60*10);    
	}
	setTimeout( "countUnreadMsg() ",1000*60*10); 
</script>
<div class="location_cs">您现在的位置：&nbsp;<a href="#" class="LinkPath">网站首页</a>&nbsp;»&nbsp;会员中心</div>
<div class="mr-top">
	欢迎您：${user.userName}&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#319102;">user.group.name</span>&nbsp;&nbsp;&nbsp;&nbsp;
	[<a href="${base}/logout.jspx?returnUrl=/" target="_blank">退出登录</a>]&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="${base}/member/message_mng.jspx?box=0">您有 <strong style="color:#fe6c00;"><span id="countDiv"></span></strong> 条未读信息</a>
</div>
 