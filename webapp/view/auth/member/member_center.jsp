<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
		<table width="100%" cellspacing="1" cellpadding="5" border="0" bgcolor="#C8DCF0" align="center">
		<tbody>
			<tr>
				<td width="150" height="25" bgcolor="#f6fbff" align="right">用户名： </td>
				<td bgcolor="#FFFFFF">${user.userName}</td>
			</tr>
			<tr>
                 <td height="25" bgcolor="#f6fbff" align="right">会员组：</td>
                 <td bgcolor="#FFFFFF"> 0</td>
			</tr>
			<tr>
				<td height="25" bgcolor="#f6fbff" align="right">邮箱：</td>
				<td bgcolor="#FFFFFF">${user.email}</td>
			</tr>
			<tr>
				<td height="25" bgcolor="#f6fbff" align="right">真实姓名：</td>
				<td bgcolor="#FFFFFF">${user.realName}</td>
			</tr>
			<tr>
				<td height="25" bgcolor="#f6fbff" align="right">性别：</td>
				<td bgcolor="#FFFFFF">${user.sex}</td>
			</tr>
			<tr>
				<td height="25" bgcolor="#f6fbff" align="right">年龄：</td>
				<td bgcolor="#FFFFFF">${user.age}</td>
			</tr>
			<tr>
				<td height="25" bgcolor="#FFFFFF" align="center" colspan="2">
                 <input type="button" value="修 改" onclick="window.location.href='/MemberController.do?method=toMemberUpdateView'" class="member_button" />
                </td>
			</tr>
		</tbody>
		</table>     
	</div>
</div>
<div style="clear:both"></div>
</div>
</body>
</html>