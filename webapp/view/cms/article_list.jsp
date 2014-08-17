<%@ page contentType="text/html; charset=UTF-8" %>
<script src="${initPath}/view/resource/scripts/json_util.js"></script>
<script src="${initPath}/view/resource/plug_in/jquery/myTableList/myTableList.js"></script>

<script>
var ArticleList = {};
ArticleList.dataTable;

//修改
ArticleList.updateArticle = function(objId){
	$('#articleListInfo').load('/ArticleController.do?method=toArticleFormView', {objId: objId});
}

//删除
ArticleList.deleteArticle = function(objId){
	if(confirm('确认删除所选模板吗？')){
		$.getJSON('/ArticleController.do?method=remove', {objId: objId}, function(json){
			if(json.success){
				ArticleList.dataTable.reloadData();
			}
		});
	}
}

//发布
ArticleList.releaseArticle = function(objId){
	$.getJSON('/ArticleController.do?method=releaseOrRecall', {objId: objId, releaseStatus: '01'}, function(json){
		if(json.success){
			ArticleList.dataTable.refreshCurrentPage();
		}
	});
}

//撤稿
ArticleList.recallArticle = function(objId){
	$.getJSON('/ArticleController.do?method=releaseOrRecall', {objId: objId, releaseStatus: '00'}, function(json){
		if(json.success){
			ArticleList.dataTable.reloadData();
		}
	});
}

$(document).ready(function() {
	ArticleList.dataTable = null;
	ArticleList.dataTable = $('#articleList').myDataTable({
		singleSelect: false,
		queryColumns: 'title,author,releaseStatus,createTime',
		hiddenColumns: 'objId',
		ajaxUrl: '/ArticleController.do?method=list',
		searchZone: 'articleSearchForm',
		fnRowCallback: function(nRow, aData){
			var operStr = '<td><a href="javascript:" onclick="ArticleList.updateArticle(\''+aData.objId+'\')">修改</a>';
			operStr += ' <a href="javascript:" onclick="ArticleList.deleteArticle(\''+aData.objId+'\')">删除</a>';
			operStr += ' <a href="javascript:common.toArticleDetail(\''+aData.objId+'\')">查看</a>';
			if(aData.releaseStatus == '00'){
				operStr += ' <a href="javascript:" onclick="ArticleList.releaseArticle(\''+aData.objId+'\', this)">发布</a>';
			}else{
				operStr += ' <a href="javascript:" onclick="ArticleList.recallArticle(\''+aData.objId+'\')">撤稿</a>';
			}
			operStr += '</td>';
			$(nRow).append(operStr);
			return nRow;
		}
	});


	$('#queryArticleBut').click(function(){
		//alert(myTable.dtSelects());
		ArticleList.dataTable.reloadData();
	});


});
</script>


<div id="bodyBox" class="body-box">
<form id="articleSearchForm" style="padding-top:5px;">
<div>
	<input type="hidden" name="channel.objId" value="${param.channelId}" />
	文章名称${param.channelId}: <input type="text" name="title" /><input type="hidden" name="title_op" value="like" />&nbsp;&nbsp;
	<input type="button" id="queryArticleBut" value="查询" class="query" />
</div>
</form>

<table id="articleList" width="100%" cellspacing="1" cellpadding="0" border="0" style="" class="pn-ltable">
<thead class="pn-lthead">
<tr>
	<th>标题</th>
	<th>作者</th>
	<th>发布状态</th>
	<th>创建时间</th>
	<th>操作</th>
</tr>
</thead>
<tbody class="pn-ltbody">
</tbody>
</table>
</div>
