<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/view/auth/portal/taglibs.jsp" %>
<html>
<head>
<meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
<title></title>
<%@ include file="/view/auth/portal/init.jsp" %>
<link href="${initPath}/view/resource/skin/jeecms/css/admin.css" rel="stylesheet" type="text/css"/>
<link href="${initPath}/view/resource/skin/common/css/theme.css" rel="stylesheet" type="text/css"/>

<script src="${initPath}/view/resource/scripts/json_util.js" type="text/javascript"></script>
<script src="${initPath}/view/resource/plug_in/jquery/myTableList/myTableList.js" type="text/javascript"></script>
<script type="text/javascript" charset="utf-8">
var GoodsList = {};
GoodsList.dataTable;

//修改
GoodsList.updateGoods = function(objId){
	window.open('/GoodsController.do?method=toGoodsFormView&objId='+objId, 'rightFrame');
}

//删除
GoodsList.deleteGoods = function(objId){
	if(!confirm('确认删除该商品吗？')){return;}
	$.getJSON('/GoodsController.do?method=remove&objId='+objId, function(json){
		if(json.success){
			GoodsList.dataTable.reloadData();
		}
	});
}

//创建索引文件
GoodsList.createIndex = function(objId){
	if(!confirm('确认删除该商品吗？')){return;}
	$.getJSON('/GoodsController.do?method=createIndex&objIds='+objId, function(json){
		if(json.success){
			
		}
	});
}

$(document).ready(function() {
	GoodsList.dataTable = $('#goodsList').myDataTable({
		singleSelect: false,
		queryColumns: 'goodsName,goodsCode,goodsClass.goodsClassName,refPrice,createTime',
		hiddenColumns: 'objId',
		ajaxUrl: '/GoodsController.do?method=list&order=createTime&order_flag=true',
		searchZone: 'goodsSearchForm',
		fnRowCallback: function(nRow, aData){
			var operStr = '<td align="center">';
			operStr += '<a href="javascript:" onclick="GoodsList.updateGoods(\''+aData.objId+'\');">修改</a>&nbsp;';
			operStr += '<a href="javascript:" onclick="GoodsList.deleteGoods(\''+aData.objId+'\');">删除</a>&nbsp;';
			operStr += '<a href="javascript:" onclick="GoodsList.createIndex(\''+aData.objId+'\');">创建索引</a>';
			operStr += '</td>';
			$(nRow).append(operStr);
			return nRow;
		}
	});


	$('#queryGoodsBut').click(function(){
		GoodsList.dataTable.reloadData();
	});

	//新增
	$('#addGoodsBut').click(function(){
		window.open('/GoodsController.do?method=toGoodsFormView', 'rightFrame');
	});
});
</script>
</head>

<body>
<div class="box-positon">
	<div class="rpos">当前位置: 用户管理 - 列表</div>
	<div class="ropt">
		<input type="button" id="addGoodsBut" class="submit" value="新增" /> &nbsp; 
		<input type="button" id="deleteMenuBut" class="del-button" value="删除" /> &nbsp; 
	</div>
	<div class="clear"></div>
</div>

<div id="bodyBox" class="body-box">
<form id="goodsSearchForm" style="padding-top:5px;">
<div>
	用户名: <input type="text" name="goodsName" /><input type="hidden" name="goodsName_op" value="like" />
	<input type="button" id="queryGoodsBut" value="查询" class="query" />
</div>
</form>

<table id="goodsList" width="100%" cellspacing="1" cellpadding="0" border="0" style="" class="pn-ltable">
<thead class="pn-lthead">
<tr>
	<th>商品名称</th>
	<th>商品编号</th>
	<th>商品分类</th>
	<th>参考价</th>
	<th>上架时间</th>
	<th>操作</th>
</tr>
</thead>
<tbody class="pn-ltbody">
</tbody>
</table>
</div>
</body>
</html>