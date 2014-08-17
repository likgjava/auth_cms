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
<jsp:include page="${initPath}/MemberController.do?method=getMemberNavgaitorView" />
<div class="mc_right">
	<%@ include file="/view/auth/member/member_head.jsp" %>
	<div class="mr-top-position">
		<div class="mr-top-tit fl">个人资料</div>
		<div class="modify fr"><a href="${base}/member/portrait.jspx">更换头像</a>&nbsp;&nbsp;&nbsp;<a href="${base}/member/profile.jspx">修改个人资料</a></div>
	</div>
	<div class="mc_content">   
	<form id="jvForm" action="profile.jspx" method="post">
		<table width="98%" border="0" align="center" cellpadding="5" cellspacing="1" bgcolor="#C8DCF0" style="margin:5px;">
		<tr>
			<td width="150" height="25" align="right" bgcolor="#f6fbff">真实姓名：</td>
			<td bgcolor="#FFFFFF"><input type="text" name="realName" value="${user.realName}" maxlength="100"/> </td>
		</tr>
		<tr>
			<td height="25" align="right" bgcolor="#f6fbff">性别：</td>
			<td bgcolor="#FFFFFF"><input type="radio" name="sex" value="1" />先生&nbsp;<input type="radio" name="sex" value="0" />女士</td>
		</tr>
		<tr>
			<td height="25" align="right" bgcolor="#f6fbff">出生日期：</td>
			<td bgcolor="#FFFFFF"><input type="text" name="age" value="${user.age}" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" class="Wdate"/></td>
		</tr>
		<tr>
			<td height="25" align="right" bgcolor="#f6fbff">邮箱：</td>
			<td bgcolor="#FFFFFF"><input type="text" name="email" value="${user.email}" maxlength="255"/></td>
		</tr>  
		<tr>
			<td height="25" align="right" bgcolor="#f6fbff">头像：</td>
			<td bgcolor="#FFFFFF">
				<img id="preImg1" alt="预览" style="width:100px;height:70px;background-color:#ccc;border:1px solid #333" src="${user.photo}"/>
	         
				<span id="ufc1" style="position:relative">
		        <input type='text' id='uploadFileText1' size="14"/>  
				<input class="member_button" type='button' value='浏览...'/>
				<input onchange="$('#uploadFileText1').val(this.value)" size="14" type="file" id="uploadFile1" style="height:24px;opacity:0;filter:alpha(opacity=0);position:absolute;right:5px;top:-5px; *top:50px; *left:10px;"/>
				</span> 
	         
	         <input type="button" value="上传" onclick="upload(1);" class="member_button"/>
			<span style="display: none;">宽: <input type="text" id="zoomWidth1" value="" size="5"/>
				高: <input type="text" id="zoomHeight1" value="" size="5"/>
			</span> 
			<input type="button" value="剪裁" onclick="imgCut(1);" class="member_button"/> 
			 <input type="button" value="预览" onclick="previewImg(1);" class="member_button"/><br/>
			
			<input id="uploadImgPath1" name="userImg" style="width:220px" value="${user.photo}" type="hidden"/>
			</td>
		</tr>
	       
		<tr>
			<td height="25" colspan="2" align="center" bgcolor="#f6fbff">
			    <input type="hidden" name="nextUrl" value="profile.jspx"/>
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