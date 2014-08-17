<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/view/auth/portal/taglibs.jsp" %>
<link rel="STYLESHEET" type="text/css" href="/view/resource/plug_in/dhtmlxTree/dhtmlxtree.css" />
<script src="/view/resource/plug_in/dhtmlxTree/dhtmlxcommon.js"></script>
<script src="/view/resource/plug_in/dhtmlxTree/dhtmlxtree.js"></script>

<input type="hidden" id="roleId" value='<c:out value="${param.roleId}"/>' />
<div style="margin-bottom:10px;">
	<input type="button" class="submit" id="allotResBut" value="保存" />
	<input type="button" class="reject" onclick="common.closeMsgbox();" value="取消" />
</div>
<div style="width:100%; border: 1px solid #C8DCF0;">
	<div id="dhtmltree_box"></div>
</div>

<script>
var AllotResource = {};

$(document).ready(function() {
	//初始化资源树
	AllotResource.tree = new dhtmlXTreeObject("dhtmltree_box", "100%", "100%", 0);
	AllotResource.tree.setSkin('dhx_skyblue');
	AllotResource.tree.setImagePath("/view/resource/plug_in/dhtmlxTree/imgs/");
	AllotResource.tree.enableDragAndDrop(0);
	AllotResource.tree.loadXML("/ResourceController.do?method=getTreeXmlByRole&roleId="+$('#roleId').val());
	AllotResource.tree.enableCheckBoxes(true);

	//保存
	$('#allotResBut').click(function(){
		var resIds = AllotResource.tree.getAllChecked().split(',');
		$.getJSON('/ResourceController.do?method=allotResource',{roleId: $('#roleId').val(), resIds: resIds},function(json){
			if(json.success){
				common.closeMsgbox();

				new $.msgbox({
					autoClose: 3,
					type: 'alert',
					content: '保存成功！'
				}).show();
			}
		});
	});

} );
</script>
