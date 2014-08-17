<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
<meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
<title></title>
<%@ include file="/view/auth/portal/init.jsp" %>
<link href="${initPath}/view/resource/skin/jeecms/css/admin.css" rel="stylesheet" />
<link href="${initPath}/view/resource/skin/common/css/theme.css" rel="stylesheet" />

<script src="${initPath}/view/resource/scripts/json_util.js"></script>
<script src="${initPath}/view/resource/plug_in/jquery/myTableList/myTableList.js"></script>
<script type="text/javascript" charset="utf-8">
var GoodsBrandList = {};
GoodsBrandList.dataTable;

//查看
GoodsBrandList.viewGoodsBrand = function(objId){
	window.open('/GoodsBrandController.do?method=toGoodsBrandDetailView&objId='+objId, 'rightFrame');
}

//修改
GoodsBrandList.updateGoodsBrand = function(objId){
	window.open('/GoodsBrandController.do?method=toGoodsBrandFormView&objId='+objId, 'rightFrame');
}

//删除
GoodsBrandList.deleteGoodsBrand = function(objId){
	if(!confirm('确认删除该品牌吗？')){return;}
	$.getJSON('/GoodsBrandController.do?method=removeGoodsBrand&objIds='+objId, function(json){
		if(json.success){
			GoodsBrandList.dataTable.reloadData();
		}
	});
}

$(document).ready(function() {
	GoodsBrandList.dataTable = $('#goodsBrandList').myDataTable({
		singleSelect: false,
		queryColumns: 'brandName,goodsClassNames,createTime',
		hiddenColumns: 'objId',
		ajaxUrl: '/GoodsBrandController.do?method=list',
		searchZone: 'GoodsBrandSearchForm',
		fnRowCallback: function(nRow, aData){
			var operStr = '<td>';
			operStr += '&nbsp;<a href="javascript:" onclick="GoodsBrandList.viewGoodsBrand(\''+aData.objId+'\');">查看</a>';
			operStr += '&nbsp;<a href="javascript:" onclick="GoodsBrandList.updateGoodsBrand(\''+aData.objId+'\');">修改</a>';
			operStr += '&nbsp;<a href="javascript:" onclick="GoodsBrandList.deleteGoodsBrand(\''+aData.objId+'\');">删除</a></td>';
			$(nRow).append(operStr);
			return nRow;
		}
	});


	$('#queryGoodsBrandBut').click(function(){
		//alert(myTable.dtSelects());
		GoodsBrandList.dataTable.reloadData();
	});


	
	//新增
	$('#addGoodsBrandBut').click(function(){
		window.open('/GoodsBrandController.do?method=toGoodsBrandFormView', 'rightFrame');
	});

});
</script>
</head>

<body>
<div class="box-positon">
	<div class="rpos">当前位置: 品牌管理 - 列表</div>
	<div class="ropt">
		<input type="button" id="addGoodsBrandBut" class="submit" value="新增" /> &nbsp; 
		<input type="button" id="deleteMenuBut" class="del-button" value="删除" /> &nbsp; 
	</div>
	<div class="clear"></div>
</div>

<div id="bodyBox" class="body-box">
<form id="GoodsBrandSearchForm" style="padding-top:5px;">
<div>
	名称: <input type="text" name="brandName" /><input type="hidden" name="brandName_op" value="like" />
	<input type="button" id="queryGoodsBrandBut" value="查询" class="query" />
</div>
</form>

<table id="goodsBrandList" width="100%" cellspacing="1" cellpadding="0" border="0" style="" class="pn-ltable">
<thead class="pn-lthead">
<tr>
	<th>品牌名称</th>
	<th>商品分类</th>
	<th>创建时间</th>
	<th>操作</th>
</tr>
</thead>
<tbody class="pn-ltbody">
</tbody>
</table>
</div>
</body>
</html>