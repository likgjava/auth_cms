<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
<meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
<title></title>
<%@ include file="/view/auth/portal/init.jsp" %>
<link href="${initPath}/view/resource/skin/jeecms/css/admin.css" rel="stylesheet" />
<link href="${initPath}/view/resource/skin/common/css/theme.css" rel="stylesheet" />
<script>
$(document).ready(function() {
	//返回
	$('#goodsBrandDetaiReturn').click(function(){
		window.open('/view/goods/goodsbrand/goods_brand_list.jsp', 'rightFrame');
	});
});
</script>
</head>

<body>
<div class="box-positon">
	<div class="rpos">当前位置: 品牌管理 - 品牌详情</div>
	<div class="ropt"></div>
	<div class="clear"></div>
</div>

<div id="bodyBox" class="body-box">
<form id="goodsBrandForm" action="/GoodsBrandController.do?method=save" method="post" enctype="multipart/form-data">
	<input type="hidden" name="objId" value="${goodsBrand.objId }" />
	<table cellspacing="1" cellpadding="2" border="0" width="100%" class="pn-ftable" style="font-size:13px;">
	<tbody>
		<tr>
			<td width="12%" class="pn-flabel pn-flabel-h">品牌名称:</td>
			<td width="88%" class="pn-fcontent" colspan="3">${goodsBrand.brandName }</td>
		</tr>
		<tr>
			<td class="pn-flabel pn-flabel-h">商品分类:</td>
			<td class="pn-fcontent" colspan="3">${goodsBrand.goodsClassNames }</td>
		</tr>
		<tr>
			<td class="pn-flabel pn-flabel-h">品牌描述:</td>
			<td class="pn-fcontent" colspan="3">${goodsBrand.brandDesc }</td>
		</tr>
		<tr>
			<td class="pn-flabel pn-flabel-h">品牌图片:</td>
			<td class="pn-fcontent" colspan="3"><img width="150" height="150" src="${goodsBrand.brandPicture }" /></td>
		</tr>
		<tr>
			<td class="pn-fbutton" colspan="4"><input id="goodsBrandDetaiReturn" type="button" class="reset" value="返回" /></td>
		</tr>
	</tbody>
	</table>
</form>

</div>
</body>
</html>