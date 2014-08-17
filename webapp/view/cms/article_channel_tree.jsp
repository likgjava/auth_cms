<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
<meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
<title></title>
<%@ include file="/view/auth/portal/init.jsp" %>
<%@ include file="/view/auth/sys/desktop/head.jsp" %>

<link rel="stylesheet" href="/view/resource/plug_in/dhtmlxTree/dhtmlxtree.css">
<script src="/view/resource/plug_in/dhtmlxTree/dhtmlxcommon.js"></script>
<script src="/view/resource/plug_in/dhtmlxTree/dhtmlxtree.js"></script>

<link href="${initPath}/view/resource/skin/jeecms/css/admin.css" rel="stylesheet" type="text/css"/>
<link href="${initPath}/view/resource/skin/common/css/theme.css" rel="stylesheet" type="text/css"/>


<script src="${initPath}/view/resource/plug_in/ckeditor/ckeditor.js"></script>


<script>
var ChannelTree = {};
$(document).ready(function() {

	ChannelTree = new dhtmlXTreeObject("treeboxbox_tree", "100%", "100%", 0);
	ChannelTree.setSkin('dhx_skyblue');
	ChannelTree.setImagePath("/view/resource/plug_in/dhtmlxTree/imgs/");
	ChannelTree.enableDragAndDrop(0);
	ChannelTree.setOnClickHandler(function(id){
		$('#articleListInfo').load('/view/cms/article_list.jsp', {channelId:id});
	});
	ChannelTree.setXMLAutoLoading("/ChannelController.do?method=getChildrenXmlById");
	ChannelTree.loadXML("/ChannelController.do?method=getChildrenXmlById");


	//新增稿件
	$('#addArticleBut').click(function(){
		var id = ChannelTree.getSelectedItemId();
		if(id==null || id=='' || id=='-1'){
			alert('请选择栏目节点！'); return ;
		}
		$('#articleListInfo').load('/ArticleController.do?method=toArticleFormView', {channelId: id});
	});

	//修改
	$('#updateChannelBut').click(function(){
		var id = ChannelTree.getSelectedItemId();
		if(id==null || id==''){
			alert('请选择要修改的节点！'); return ;
		}else if(id == '-1'){
			alert('该节点不能修改！'); return ;
		}
		$('#articleListInfo').load('/ChannelController.do?method=toChannelFormView', {objId:id});
	});
	
	//删除
	$('#deleteArticleBut').click(function(){
		if(confirm('确认删除所选模板吗？')){
			$.getJSON('/ArticleController.do?method=remove', {objId: objId}, function(json){
				if(json.success){
					ArticleList.dataTable.reloadData();
				}
			});
		}
	});
	
} );
</script>
</head>

<body>

<div class="box-positon">
	<div class="rpos">当前位置: 稿件管理 - 列表</div>
	<div class="ropt">
		<input type="button" id="addArticleBut" class="submit" value="新增" /> &nbsp; 
		<input type="button" id="deleteArticleBut" class="del-button" value="删除" /> &nbsp; 
	</div>
	<div class="clear"></div>
</div>

<div class="body-box" style="overflow:hidden;">
	<div style="width:20%; border: 1px solid #C8DCF0; float: left; margin-top:5px; margin-right:5px;">
		<div id="treeboxbox_tree"></div>
	</div>
	
	<div id="articleListInfo" style="float: left; width:79%; border: 1px solid #C8DCF0; margin-top:5px;"></div>
</div>
</body>
</html>