<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>JEECMS Administrator's Control Panel</title>
<%@ include file="/view/auth/portal/init.jsp" %>
<link href="${initPath}/view/resource/skin/common/css/theme.css" rel="stylesheet" type="text/css"/>

<script src="${initPath}/view/resource/skin/common/js/pony.js" type="text/javascript"></script>
<script type="text/javascript">
if(top!=this) {
	top.location=this.location;
}
$(document).ready(function(){
	$("#username").focus();
	$("#loginForm").validate();

	//提交表单
	$('#loginForm').submit(function(){
		if(!$('#loginForm').valid()){return;}
		$(this).ajaxSubmit({
			dataType: 'json',
			success: function(json){
				if(json.success){
					//alert('登录成功！');
					window.location.href = $('#initPath').val()+'/view/auth/sys/desktop/index.jsp'; //跳转到管理员首页
				}else{
					$('#jcaptchaImg').click(); //刷新验证码
					$('#captcha').val('');
					$('#message').html(json.result);
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
<style type="text/css">
body{margin:0;padding:0;font-size:12px;background:url(${initPath}/view/resource/skin/jeecms/img/login/bg.jpg) top repeat-x;}
.input{width:150px;height:17px;border-top:1px solid #404040;border-left:1px solid #404040;border-right:1px solid #D4D0C8;border-bottom:1px solid #D4D0C8;}
</style>
</head>
<body>
<!-- LoginController.do?method=loginAdmin -->
<form id="loginForm" action="j_spring_security_check" method="post">
<input type="hidden" name="returnUrl" value="${returnUrl}"/>
<input type="hidden" name="processUrl" value="${processUrl}"/>
<input type="hidden" id="initPath" value="${initPath}" />
<table width="800" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
		<td height="200">&nbsp;</td>
	</tr>
	<tr>
		<td>
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="423" height="280" valign="top">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
                				<td><img src="${initPath}/view/resource/skin/jeecms/img/login/ltop.jpg" /></td>
              				</tr>
							<tr>
								<td><img src="${initPath}/view/resource/skin/jeecms/img/login/llogo.jpg" /></td>
							</tr>
						</table>
					</td>
					<td width="40" align="center" valign="bottom"><img src="${initPath}/view/resource/skin/jeecms/img/login/line.jpg" width="23" height="232" /></td>
					<td valign="top">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td height="90" align="center" valign="bottom"><img src="${initPath}/view/resource/skin/jeecms/img/login/ltitle.jpg" /></td>
							</tr>
							<tr>
								<td>
									<div style="color:red; margin-left:80px; font-weight:bold;" id="message"></div>
									<table width="100%" border="0" align="center" cellpadding="0" cellspacing="5">
										<tr>
											<td width="91" height="40" align="right"><strong>用户名：</strong></td>
											<td width="211"><input id="userName" name="userName" maxlength="100" class="input {required:true}" value="admin"/></td>
										</tr>
										<tr>
											<td height="40" align="right"><strong>密码：</strong></td>
											<td><input name="password" type="password" id="password" maxlength="32" class="input {required:true}" value="1"/></td>
										</tr>
										<tr>
											<td colspan="2" align="center"><img id="jcaptchaImg" src="${initPath}/jcaptcha" onclick="this.src='${initPath}/jcaptcha?d='+new Date()*1" width="70" height="30"/></td>
										</tr>
										<tr>
											<td height="40" align="right"><strong>验证码：</strong></td>
											<td><input name="captcha" type="text" id="captcha" class="input {required:true}"/></td>
										</tr>
										<tr>
											<td height="40" colspan="2" align="center">
												<input type="image" src="${initPath}/view/resource/skin/jeecms/img/login/login.jpg" name="submit" />&nbsp;&nbsp;
												<img name="reg" style="cursor: pointer" src="${initPath}/view/resource/skin/jeecms/img/login/reset.jpg" onclick="document.forms[0].reset()" />
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</form>
</body>
</html>