<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/view/auth/portal/taglibs.jsp" %>
<html>
<head>
<meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
<title></title>
<%@ include file="/view/auth/portal/init.jsp" %>
<link href="${initPath}/view/resource/skin/jeecms/css/admin.css" rel="stylesheet" />
<link href="${initPath}/view/resource/skin/common/css/theme.css" rel="stylesheet" />

<link rel="stylesheet" href="/view/resource/plug_in/dhtmlxTree/dhtmlxtree.css" />
<script src="/view/resource/plug_in/dhtmlxTree/dhtmlxcommon.js"></script>
<script src="/view/resource/plug_in/dhtmlxTree/dhtmlxtree.js"></script>

<script src="/view/resource/plug_in/ckeditor/ckeditor.js"></script>

<script>
var GoodsBrandList = {};
GoodsBrandList.dataTable;

//修改
GoodsBrandList.updateGoodsBrand = function(objId){
	$('#bodyBox').load('/GoodsBrandController.do?method=toGoodsBrandFormView&objId='+objId);
}

//删除
GoodsBrandList.deleteGoodsBrand = function(objId){
	if(!confirm('确认删除该用户吗？')){return;}
	$.getJSON('/GoodsBrandController.do?method=remove&objId='+objId, function(json){
		if(json.success){
			GoodsBrandList.dataTable.reloadData();
		}
	});
}

$(document).ready(function() {
	//验证表单
	$("#goodsForm").validate();

	CKEDITOR.replace('goodsDesc');

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
	
	//选择商品品牌
	$('#goodsBrandName').click(function(){
		new $.msgbox({
			title: '选择商品品牌',
			width: 700,
			height: 400,
			type: 'ajax',
			content: '/view/goods/goods/select_goods_brand.jsp',
			onAjaxed: function(){}
		}).show();
	});

	//提交表单
	$('#submitGoodsBut').click(function(){
		if(!$('#goodsForm').valid()){return;}
		$('#goodsForm').ajaxSubmit({
			dataType: 'json',
			success: function(json){
				if(json.success){
					window.open('/view/goods/goods/goods_list.jsp', 'rightFrame');
				}else{
					alert(json.result);
				}
			},
			error: function(msg){
				alert(msg);
			}
		});
	});
	
	//返回
	$('#goodsFormReturn').click(function(){
		window.open('/view/goods/goods/goods_list.jsp', 'rightFrame');
	});
});
</script>
</head>

<body>
<div class="box-positon">
	<div class="rpos">当前位置: 商品管理 - 修改商品</div>
	<div class="ropt"></div>
	<div class="clear"></div>
</div>

<div id="bodyBox" class="body-box">
<form method="post" action="${initPath}/GoodsController.do?method=save" id="goodsForm" enctype="multipart/form-data">
	<input type="hidden" name="objId" value="${goods.objId }" />
	<table cellspacing="1" cellpadding="2" border="0" width="100%" class="pn-ftable" style="font-size:13px;">
	<tbody>
		<tr>
			<td width="12%" class="pn-flabel pn-flabel-h"><span class="pn-frequired">*</span>商品名称:</td>
			<td width="88%" class="pn-fcontent"><input type="text" class="required" maxlength="150" name="goodsName" value="${goods.goodsName }" /></td>
		</tr>
		<tr>
			<td class="pn-flabel pn-flabel-h">商品型号:</td>
			<td class="pn-fcontent"><input type="text" maxlength="150" name="goodsCode" value="${goods.goodsCode }" /></td>
		</tr>
		<tr>
			<td class="pn-flabel pn-flabel-h"><span class="pn-frequired">*</span>商品品牌:</td>
			<td class="pn-fcontent">
				<input type="hidden" id="goodsBrandId" name="goodsBrand.objId" value="${goods.goodsBrand.objId }" />
				<input type="text" id="goodsBrandName" class="required" value="${goods.goodsBrand.brandName }" readonly="readonly" />
			</td>
		</tr>
		<tr>
			<td class="pn-flabel pn-flabel-h"><span class="pn-frequired">*</span>商品分类:</td>
			<td class="pn-fcontent">
				<input type="hidden" id="goodsClassId" name="goodsClass.objId" value="${goods.goodsClass.objId }" />
				<input type="text" id="goodsClassName" class="required" value="${goods.goodsClass.goodsClassName }" readonly="readonly" />
			</td>
		</tr>
		<tr>
			<td class="pn-flabel pn-flabel-h"><span class="pn-frequired">*</span>参考价：</td>
			<td class="pn-fcontent"><input type="text" class="required money" maxlength="15" name="refPrice" value="${goods.refPrice }" /></td>
		</tr>
		<tr>
			<td class="pn-flabel pn-flabel-h">商品描述:</td>
			<td class="pn-fcontent"><textarea id="goodsDesc" cols="70" rows="3" name="goodsDesc">${goods.goodsDesc }</textarea></td>
		</tr>
		<tr>
			<td class="pn-flabel pn-flabel-h">图片：</td>
			<td class="pn-fcontent">
				<c:if test="${goods.mainPicture!=null && goods.mainPicture!=''}">
				<img width="140" height="140" src="${goods.mainPicture }" />
				</c:if>
				<input type="file" name="pictureFile" />
				<input type="hidden" name="mainPicture" value="${goods.mainPicture }" />
			</td>
		</tr>
		<tr>
			<td class="pn-fbutton" colspan="2">
				<input id="submitGoodsBut" type="button" class="submit" value="提交" /> &nbsp;
				<input id="goodsFormReturn" type="button" class="reset" value="返回" />
			</td>
		</tr>
	</tbody>
	</table>
</form>
<br/>
</div>
</body>
</html>