<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/view/auth/portal/taglibs.jsp" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>会员中心</title>
<%@ include file="/view/auth/portal/init.jsp" %>
<link rel="stylesheet" href="${initPath}/view/resource/skin/css/front.css" />
<link rel="stylesheet" href="${initPath}/view/resource/skin/css/member.css" />
<script src="${initPath}/view/resource/skin/js/front.js"></script>

<link rel="stylesheet" href="/view/resource/plug_in/dhtmlxTree/dhtmlxtree.css" />
<script src="/view/resource/plug_in/dhtmlxTree/dhtmlxcommon.js"></script>
<script src="/view/resource/plug_in/dhtmlxTree/dhtmlxtree.js"></script>



<script src="/view/resource/plug_in/ckeditor/ckeditor.js"></script>

<script>
$(function() {
	//验证表单
	$("#goodsForm").validate();

	CKEDITOR.replace( 'goodsDesc' );

	//选择商品分类
	$('#goodsClassName').click(function(){
		new $.msgbox({
			title: '选择商品分类',
			width: 300,
			height: 400,
			type: 'ajax',
			content: '/view/auth/common/tree/DHtmlTree.jsp?className=GoodsClass&IDS=goodsClassId&NAMES=goodsClassName',
			onAjaxed: function(){
				
			}
		}).show();
	});

	//提交表单
	$('#goodsForm').submit(function(){
		if(!$('#goodsForm').valid()){return;}
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
		<div class="mr-top-tit fl">商品信息</div>
		<div class="modify fr"><a href="${base}/member/portrait.jspx">更换头像</a>&nbsp;&nbsp;&nbsp;<a href="${base}/member/profile.jspx">修改个人资料</a></div>
	</div>
	<div class="mc_content">   
		<form method="post" action="${initPath}/GoodsController.do?method=save" id="goodsForm" enctype="multipart/form-data">
		<input type="hidden" name="objId" value="${goods.objId }" />
		<table bgcolor="#C8DCF0" align="center" width="98%" cellspacing="1" cellpadding="5" style="margin:5px;">
			<tbody>
			<tr>
				<td bgcolor="#f6fbff" align="right" width="86" height="25">商品名称：</td>
				<td bgcolor="#FFFFFF" width="626"><input type="text" class="required" maxlength="150" name="goodsName" value="${goods.goodsName }" /> <span class="STYLE1">*</span></td>
				<td bgcolor="#FFFFFF" width="140" rowspan="5"><img width="140" height="140" src="${goods.mainPicture }" /></td>
			</tr>
			<tr>
				<td bgcolor="#f6fbff" align="right">商品型号：</td>
				<td bgcolor="#FFFFFF"><input type="text" class="required" maxlength="150" name="goodsCode" value="${goods.goodsCode }" /> <span class="STYLE1">*</span></td>
			</tr>
			<tr>
				<td bgcolor="#f6fbff" align="right">商品分类：</td>
				<td bgcolor="#FFFFFF">
					<input type="hidden" id="goodsClassId" name="goodsClass.objId" value="${goods.goodsClass.objId }" />
					<input type="text" id="goodsClassName" class="required" value="${goods.goodsClass.goodsClassName }" />
					<span class="STYLE1">*</span>
				</td>
			</tr>
			<tr>
				<td bgcolor="#f6fbff" align="right">参考价：</td>
				<td bgcolor="#FFFFFF"><input type="text" class="required money" maxlength="15" name="refPrice" value="${goods.refPrice }" /> <span class="STYLE1">*</span></td>
			</tr>
			<tr>
				<td bgcolor="#f6fbff" align="right">图片：</td>
				<td bgcolor="#FFFFFF">
					<input type="file" name="pictureFile" />
					<input type="hidden" name="mainPicture" value="${goods.mainPicture }" />
				</td>
			</tr>
			<tr>
				<td bgcolor="#f6fbff" align="right">商品描述：</td>
				<td bgcolor="#FFFFFF" colspan="2"><textarea id="goodsDesc" cols="70" rows="3" name="goodsDesc">${goods.goodsDesc }</textarea></td>
			</tr> 
			<tr>
				<td bgcolor="#FFFFFF" align="center" colspan="3">
					<input type="submit" class="member_button" value="提交" /> <input type="reset" class="member_button" value="重置" />
				</td>
			</tr>
			</tbody>
		</table>
		</form>
	</div>
</div>
<div style="clear:both"></div>
</div>
</body>
</html>