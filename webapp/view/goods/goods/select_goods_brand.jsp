<%@ page contentType="text/html; charset=UTF-8" %>
<script src="${initPath}/view/resource/scripts/json_util.js"></script>
<script src="${initPath}/view/resource/plug_in/jquery/myTableList/myTableList.js"></script>
<script type="text/javascript" charset="utf-8">
var GoodsBrandList = {};
GoodsBrandList.dataTable;

//选择
GoodsBrandList.slectGoodsBrand = function(id, name){
	$('#goodsBrandId').val(id);
	$('#goodsBrandName').val(name);
	common.closeMsgbox();
}

$(document).ready(function() {
	GoodsBrandList.dataTable = $('#goodsBrandList').myDataTable({
		singleSelect: true,
		queryColumns: 'brandName,goodsClassNames,createTime',
		hiddenColumns: 'objId',
		ajaxUrl: '/GoodsBrandController.do?method=list',
		searchZone: 'GoodsBrandSearchForm',
		fnRowCallback: function(nRow, aData){
			var operStr = '<td>';
			operStr += '&nbsp;<a href="javascript:" onclick="GoodsBrandList.slectGoodsBrand(\''+aData.objId+'\',\''+aData.brandName+'\');">选择</a>';
			operStr += '</td>';
			$(nRow).append(operStr);
			return nRow;
		}
	});


	$('#queryGoodsBrandBut').click(function(){
		GoodsBrandList.dataTable.reloadData();
	});


	

});
</script>


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
