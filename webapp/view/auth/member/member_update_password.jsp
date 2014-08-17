<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/view/auth/portal/taglibs.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>会员中心</title>
<%@ include file="/view/auth/portal/init.jsp" %>
<link type="text/css" rel="stylesheet" href="${initPath}/view/resource/skin/css/front.css" />
<link type="text/css" rel="stylesheet" href="${initPath}/view/resource/skin/css/member.css" />
<script type="text/javascript" src="${initPath}/view/resource/skin/js/front.js"></script>
<script type="text/javascript">
$(function() {
	//验证表单
	$("#updatePwdForm").validate();

	//提交表单
	$('#updatePwdForm').submit(function(){
		if(!$('#updatePwdForm').valid()){return;}
		$(this).ajaxSubmit({
			dataType: 'json',
			success: function(json){
				if(json.result){
					//$('#jcaptchaImg').click(); //刷新验证码
					//alert(json.result);
					common.alertMsgbox(json.result);
					//document.location.reload();
				}else{
					common.tipMsgbox('修改成功！');
					document.location.reload();
				}
			},
			error: function(msg){
				alert(msg);
			}
		});

		//(重要)always return false to prevent standard browser submit and page navigation 
		return false;
	});
});
</script>
</head>

<body>
<%@ include file="/view/auth/member/member_top.jsp" %>

<div class="container">
<jsp:include page="/MemberController.do?method=getMemberNavgaitorView" />
<div class="mc_right">
	<%@ include file="/view/auth/member/member_head.jsp" %>
	<div class="mr-top-position">
		<div class="mr-top-tit fl">个人资料</div>
		<div class="modify fr"><a href="${base}/member/portrait.jspx">更换头像</a>&nbsp;&nbsp;&nbsp;<a href="${base}/member/profile.jspx">修改个人资料</a></div>
	</div>
	<div class="mc_content">   
		<form id="updatePwdForm" action="${initPath}/UserController.do?method=updatePassword" method="post">
		<table width="98%" border="0" align="center" cellpadding="5" cellspacing="1" bgcolor="#C8DCF0" style="margin:5px;">
			<tr>
				<td width="150" height="25" align="right" bgcolor="#f6fbff">原密码：</td>
				<td bgcolor="#FFFFFF"><input type="password" name="oldPassword" maxlength="32" class="{required:true}"/> <span class="STYLE1">*</span></td>
			</tr>
			<tr>
				<td height="25" align="right" bgcolor="#f6fbff">新密码：</td>
				<td bgcolor="#FFFFFF"><input type="password" id="newPassword" name="newPassword" class="required" maxlength="32" /></td>
			</tr>
			<tr>
				<td height="25" align="right" bgcolor="#f6fbff">确认密码：</td>
				<td bgcolor="#FFFFFF"><input type="password" class="{required:true, equalTo:'#newPassword'}" /></td>
			</tr>
			<tr>
				<td height="25" colspan="2" align="center" bgcolor="#f6fbff">
					<input type="hidden" name="nextUrl" value="pwd.jspx"/>
					<input type="submit" value="提交" class="member_button"/> &nbsp; <input type="reset" value="重置" class="member_button"/>
				</td>
			</tr>
		</table>
		</form>
	</div>
</div>
<div style="clear:both"></div>
</div>
</body>
</html>