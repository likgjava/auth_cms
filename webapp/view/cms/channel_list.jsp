<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
<meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
<title></title>
<%@ include file="/view/auth/portal/init.jsp" %>
<%@ include file="/view/auth/sys/desktop/head.jsp" %>
<script src="${initPath}/view/resource/plug_in/jquery/myTableList/myTableList.js" type="text/javascript"></script>
<script src="${initPath}/view/resource/plug_in/jquery/myDialog/myDialog.js" type="text/javascript"></script>

<link rel="stylesheet" type="text/css" href="/view/resource/plug_in/dhtmlxTree/dhtmlxtree.css">
<script src="/view/resource/plug_in/dhtmlxTree/dhtmlxcommon.js"></script>
<script src="/view/resource/plug_in/dhtmlxTree/dhtmlxtree.js"></script>

<script>
var ChannelTree = {};
$(document).ready(function() {

	ChannelTree = new dhtmlXTreeObject("treeboxbox_tree", "100%", "100%", 0);
	ChannelTree.setSkin('dhx_skyblue');
	ChannelTree.setImagePath("/view/resource/plug_in/dhtmlxTree/imgs/");
	ChannelTree.enableDragAndDrop(0);
	ChannelTree.setOnClickHandler(function(id){
		$('#channelInfo').load('/ChannelController.do?method=toChannelDetailView', {objId:id});
	});
	ChannelTree.setXMLAutoLoading("/ChannelController.do?method=getChildrenXmlById");
	ChannelTree.loadXML("/ChannelController.do?method=getChildrenXmlById");


	//新增子节点
	$('#addChannelBut').click(function(){
		var id = ChannelTree.getSelectedItemId();
		if(id==null || id==''){
			alert('请选择要修改的节点！'); return ;
		}
		var data = {};
		if(id != '-1'){
			data.parentId = id;
		}

		//获取节点的层级数
		data.ChannelLevel = ChannelTree.getLevel(id);
		
		$('#channelInfo').load('/ChannelController.do?method=toChannelFormView', data);
	});

	//修改
	$('#updateChannelBut').click(function(){
		var id = ChannelTree.getSelectedItemId();
		if(id==null || id==''){
			alert('请选择要修改的节点！'); return ;
		}else if(id == '-1'){
			alert('该节点不能修改！'); return ;
		}
		$('#channelInfo').load('/ChannelController.do?method=toChannelFormView', {objId:id});
	});
	
	//删除
	$('#deleteChannelBut').click(function(){
		var id = ChannelTree.getSelectedItemId();
		var msg = '确认删除该节点及其子节点吗？';
		if(id == '-1'){
			msg = '确认删除所有菜单节点吗？';
		}
		if(confirm(msg)){
			$.getJSON('/ChannelController.do?method=removeAll', {objId: (id=='-1'?'':id)}, function(json){
				if(json.success){
					if(id != '-1'){
						var parentId = ChannelTree.getParentId(id);
						//选中父节点
						ChannelTree.selectItem(parentId);
						//刷新树节点
						ChannelTree.refreshItem(parentId);
						//刷新表单域
						$('#channelInfo').load('/ChannelController.do?method=toChannelDetailView', {objId: parentId});
					}else{
						//刷新树节点
						ChannelTree.refreshItem('-1');
					}
				}
			});
		}
	});
	
} );
</script>
</head>

<body>

<div class="box-positon">
	<div class="rpos">当前位置: 栏目管理 - 列表</div>
	<form class="ropt">
		<input type="button" id="addChannelBut" class="submit" value="新增" /> &nbsp; 
		<input type="button" id="updateChannelBut" class="reset" value="修改" /> &nbsp; 
		<input type="button" id="deleteChannelBut" class="del-button" value="删除" /> &nbsp; 
	</form>
	<div class="clear"></div>
</div>

<div class="body-box" style="overflow:hidden;">
	<div style="width:20%; border: 1px solid #C8DCF0; float: left; margin-top:5px; margin-right:5px;">
		<div id="treeboxbox_tree"></div>
	</div>
	
	<div id="channelInfo" style="float: left; width:79%;"></div>
</div>
</body>
</html>