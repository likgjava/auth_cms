<%@ page contentType="text/html; charset=UTF-8" %>
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
	$("#goodsBrandForm").validate();

	//提交表单
	$('#submitGoodsBrandBut').click(function(){
		if(!$('#goodsBrandForm').valid()){return;}
		$('#goodsBrandForm').ajaxSubmit({
			dataType: 'json',
			success: function(json){
				if(json.success){
					window.open('/view/goods/goodsbrand/goods_brand_list.jsp', 'rightFrame');
				}else{
					alert(json.result);
				}
			},
			error: function(msg){
				alert(msg);
			}
		});
	});
	
	//选择商品分类
	$('#goodsClassNames').click(function(){
		new $.msgbox({
			title: '选择商品分类',
			width: 300,
			height: 400,
			type: 'ajax',
			content: '/view/auth/common/tree/DHtmlTree.jsp?childNodeOnly=true&isCheckBox=true&className=GoodsClass&IDS=goodsClassIds&NAMES=goodsClassNames',
			onAjaxed: function(){
			}
		}).show();
	});

	//返回
	$('#goodsBrandFormReturn').click(function(){
		window.open('/view/goods/goodsbrand/goods_brand_list.jsp', 'rightFrame');
	});

});
</script>
</head>

<body>
<div class="box-positon">
	<div class="rpos">当前位置: 品牌管理 - 修改品牌</div>
	<div class="ropt"></div>
	<div class="clear"></div>
</div>

<div id="bodyBox" class="body-box">
<form id="goodsBrandForm" action="/GoodsBrandController.do?method=save" method="post" enctype="multipart/form-data">
	<input type="hidden" name="objId" value="${goodsBrand.objId }" />
	<table cellspacing="1" cellpadding="2" border="0" width="100%" class="pn-ftable" style="font-size:13px;">
	<tbody>
		<tr>
			<td width="12%" class="pn-flabel pn-flabel-h"><span class="pn-frequired">*</span>品牌名称:</td>
			<td width="88%" class="pn-fcontent" colspan="3"><input type="text" name="brandName" maxlength="100" class="required" value="${goodsBrand.brandName }"></td>
		</tr>
		<tr>
			<td class="pn-flabel pn-flabel-h"><span class="pn-frequired">*</span>选择分类:</td>
			<td class="pn-fcontent" colspan="3">
				<textarea id="goodsClassNames" cols="40" rows="3" name="goodsClassNames" readonly="readonly">${goodsBrand.goodsClassNames }</textarea>
				<input type="hidden" id="goodsClassIds" name="goodsClassIds" value="${goodsBrand.goodsClassIds }" />
			</td>
		</tr>
		<tr>
			<td class="pn-flabel pn-flabel-h">品牌描述:</td>
			<td class="pn-fcontent" colspan="3"><textarea cols="40" rows="3" name="brandDesc">${goodsBrand.brandDesc }</textarea></td>
		</tr>
		<tr>
			<td class="pn-flabel pn-flabel-h">品牌图片:</td>
			<td class="pn-fcontent" colspan="3">
				<div>
					<img width="150" height="150" src="${goodsBrand.brandPicture }" />
				</div>
				<div>
					<input type="file" name="pictureFile" />
					<input type="hidden" name="brandPicture" value="${goodsBrand.brandPicture }" />
				</div>
			</td>
		</tr>
		<tr>
			<td class="pn-fbutton" colspan="4">
				<input id="submitGoodsBrandBut" type="button" class="submit" value="提交" /> &nbsp;
				<input id="goodsBrandFormReturn" type="button" class="reset" value="返回" />
			</td>
		</tr>
	</tbody>
	</table>
</form>

</div>
</body>
</html>