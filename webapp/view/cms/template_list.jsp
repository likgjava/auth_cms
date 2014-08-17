<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
<meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
<title></title>
<%@ include file="/view/auth/portal/init.jsp" %>
<link href="${initPath}/view/resource/skin/jeecms/css/admin.css" rel="stylesheet" type="text/css"/>
<link href="${initPath}/view/resource/skin/common/css/theme.css" rel="stylesheet" type="text/css"/>

<script src="${initPath}/view/resource/scripts/json_util.js" type="text/javascript"></script>
<script src="${initPath}/view/resource/plug_in/jquery/myTableList/myTableList.js"></script>
<script>
var TemplateList = {};
TemplateList.dataTable;


//修改
TemplateList.updateTemplate = function(objId){
	$('#bodyBox').load('/TemplateController.do?method=toTemplateFormView', {objId: objId});
}

//删除
TemplateList.deleteTemplate = function(objId){
	if(confirm('确认删除所选模板吗？')){
		$.getJSON('/TemplateController.do?method=remove', {objId: objId}, function(json){
			if(json.success){
				TemplateList.dataTable.reloadData();
			}
		});
	}
}

$(document).ready(function() {
	TemplateList.dataTable = $('#templateList').myDataTable({
		singleSelect: false,
		queryColumns: 'objId,templateName,createUser.userName,createTime',
		ajaxUrl: '/TemplateController.do?method=list',
		searchZone: 'templateSearchForm',
		fnRowCallback: function(nRow, aData){
			var operStr = '<td><a href="javascript:" onclick="TemplateList.updateTemplate(\''+aData.objId+'\')">修改</a>';
			operStr += ' <a href="javascript:" onclick="TemplateList.deleteTemplate(\''+aData.objId+'\')">删除</a>';
			$(nRow).append(operStr);
			return nRow;
		}
	});


	$('#queryTemplateBut').click(function(){
		//alert(myTable.dtSelects());
		TemplateList.dataTable.reloadData();
	});


	
	//新增
	$('#addTemplateBut').click(function(){
		$('#bodyBox').load('/TemplateController.do?method=toTemplateFormView');
	});

});
</script>
</head>

<body style="min-height:500px">
<div class="box-positon">
	<div class="rpos">当前位置: 模板管理 - 列表</div>
	<div class="ropt">
		<input type="button" id="addTemplateBut" class="submit" value="新增" /> &nbsp; 
		<input type="button" id="deleteTemplateBut" class="del-button" value="删除" /> &nbsp; 
	</div>
	<div class="clear"></div>
</div>

<div id="bodyBox" class="body-box">
<form id="templateSearchForm" style="padding-top:5px;">
<div>
	模板名称: <input type="text" name="templateName" /><input type="hidden" name="templateName_op" value="like" />&nbsp;&nbsp;
	<input type="button" id="queryTemplateBut" value="查询" class="query" />
</div>
</form>

<table id="templateList" width="100%" cellspacing="1" cellpadding="0" border="0" style="" class="pn-ltable">
<thead class="pn-lthead">
<tr>
	<th>ID</th>
	<th>模板名称</th>
	<th>创建人</th>
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