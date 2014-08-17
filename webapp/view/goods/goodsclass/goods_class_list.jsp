<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title></title>
<%@ include file="/view/auth/portal/init.jsp" %>
<%@ include file="/view/auth/sys/desktop/head.jsp" %>

<link rel="stylesheet" type="text/css" href="${initPath}/view/resource/plug_in/dhtmlxTree/dhtmlxtree.css">
<script src="${initPath}/view/resource/plug_in/dhtmlxTree/dhtmlxcommon.js"></script>
<script src="${initPath}/view/resource/plug_in/dhtmlxTree/dhtmlxtree.js"></script>

<script>
var GoodsClassTree = {};
$(document).ready(function() {

	GoodsClassTree = new dhtmlXTreeObject("treebox_tree", "100%", "100%", 0);
	GoodsClassTree.setSkin('dhx_skyblue');
	GoodsClassTree.setImagePath($('#initPath').val()+"/view/resource/plug_in/dhtmlxTree/imgs/");
	GoodsClassTree.enableDragAndDrop(0);
	GoodsClassTree.setOnClickHandler(function(id){
		$('#goodsClassInfo').load($('#initPath').val()+'/GoodsClassController.do?method=toGoodsClassDetailView', {objId:id});
	});
	GoodsClassTree.setXMLAutoLoading($('#initPath').val()+"/GoodsClassController.do?method=getChildrenXmlById");
	GoodsClassTree.loadXML($('#initPath').val()+"/GoodsClassController.do?method=getChildrenXmlById");


	//新增子节点
	$('#addGoodsClassBut').click(function(){
		var id = GoodsClassTree.getSelectedItemId();
		if(id==null || id==''){
			alert('请选择要修改的节点！'); return ;
		}
		var data = {};
		if(id != '-1'){
			data.parentId = id;
		}

		//获取节点的层级数
		data.GoodsClassLevel = GoodsClassTree.getLevel(id);
		
		$('#goodsClassInfo').load($('#initPath').val()+'/GoodsClassController.do?method=toGoodsClassFormView', data);
	});

	//修改
	$('#updateGoodsClassBut').click(function(){
		var id = GoodsClassTree.getSelectedItemId();
		if(id==null || id==''){
			alert('请选择要修改的节点！'); return ;
		}else if(id == '-1'){
			alert('该节点不能修改！'); return ;
		}
		$('#goodsClassInfo').load($('#initPath').val()+'/GoodsClassController.do?method=toGoodsClassFormView', {objId:id});
	});
	
	//删除
	$('#deleteGoodsClassBut').click(function(){
		var id = GoodsClassTree.getSelectedItemId();
		var msg = '确认删除该节点及其子节点吗？';
		if(id == '-1'){
			msg = '确认删除所有资源节点吗？';
		}
		if(confirm(msg)){
			$.getJSON($('#initPath').val()+'/GoodsClassController.do?method=removeAll', {objId: (id=='-1'?'':id)}, function(json){
				if(json.success){
					if(id != '-1'){
						var parentId = GoodsClassTree.getParentId(id);
						//选中父节点
						GoodsClassTree.selectItem(parentId);
						//刷新树节点
						GoodsClassTree.refreshItem(parentId);
						//刷新表单域
						$('#goodsClassInfo').load($('#initPath').val()+'/GoodsClassController.do?method=toGoodsClassDetailView', {objId: parentId});
					}else{
						//刷新树节点
						GoodsClassTree.refreshItem('-1');
					}
				}
			});
		}
	});
	
} );
</script>
</head>

<body>
<input type="hidden" id="initPath" value="${initPath}" />
<div class="box-positon">
	<div class="rpos">当前位置: 商品分类管理 - 列表</div>
	<form class="ropt">
		<input type="button" id="addGoodsClassBut" class="submit" value="新增" /> &nbsp; 
		<input type="button" id="updateGoodsClassBut" class="reset" value="修改" /> &nbsp; 
		<input type="button" id="deleteGoodsClassBut" class="del-button" value="删除" /> &nbsp; 
	</form>
	<div class="clear"></div>
</div>

 
<div class="body-box">

<div style="width:20%; border: 1px solid #C8DCF0; float: left; margin-top:5px; margin-right:5px;">

<div id="treebox_tree"></div>
</div>


<div id="goodsClassInfo" style="float: left; width:79%;">
</div>
</div>
</body>
</html>