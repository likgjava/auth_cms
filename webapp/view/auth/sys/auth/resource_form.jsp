<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/view/auth/portal/taglibs.jsp" %>

<script src="/view/resource/plug_in/jquery/layer/layer.js"></script>
<link rel="STYLESHEET" type="text/css" href="/view/resource/plug_in/jquery/layer/skin/layer.css">

<form id="resourceForm" action="/ResourceController.do?method=save" method="post">
	<input type="hidden" id="resourceObjId" name="objId" value="${resource.objId }" />
	<input type="hidden" id="parentResourceObjId" name="parent.objId" value="${resource.parent.objId }" />
	<input type="hidden" name="treeLevel" value="${resource.treeLevel }" />
	<table cellspacing="1" cellpadding="2" border="0" width="100%" class="pn-ftable" style="font-size:13px;">
	<tbody>
		<tr>
			<td width="12%" class="pn-flabel pn-flabel-h">上级资源:</td>
			<td width="88%" class="pn-fcontent" colspan="3"><span>${resource.parent.resName }</span></td>
		</tr>
		<tr>
			<td width="12%" class="pn-flabel pn-flabel-h"><span class="pn-frequired">*</span>资源名称:</td>
			<td width="88%" class="pn-fcontent" colspan="3"><input type="text" name="resName" maxlength="100" class="required" value="${resource.resName }"></td>
		</tr>
		<tr>
			<td width="12%" class="pn-flabel pn-flabel-h"><span class="pn-frequired">*</span>资源路径:</td>
			<td width="88%" class="pn-fcontent" colspan="3"><input type="text" id="resUrl" name="resUrl" maxlength="100" class="required" value="${resource.resUrl }"></td>
		</tr>
		<tr>
			<td width="12%" class="pn-flabel pn-flabel-h">资源描述:</td>
			<td width="88%" class="pn-fcontent" colspan="3"><textarea maxlength="255" name="resDesc" rows="4" cols="60">${resource.resDesc }</textarea></td>
		</tr>
		<tr>
			<td class="pn-fbutton" colspan="4"><input type="submit" class="submit" value="提交" /> &nbsp; <input type="reset" class="reset" value="重置" /></td>
		</tr>
	</tbody>
	</table>
</form>

<script type="text/javascript">
$(document).ready(function() {
	//验证表单
	$("#resourceForm").validate();

	//提交表单
	$('#resourceForm').submit(function(){
		if(!$('#resourceForm').valid()){return;}
		$(this).ajaxSubmit({
			dataType: 'json',
			success: function(json){
				if(json.success){
					var resourceObjId = $('#resourceObjId').val();
					//修改
					if(resourceObjId){
						//更新节点名称
						ResourceTree.setItemText(resourceObjId, $('input[name=resName]', '#resourceForm').val(), '');
						//刷新表单域
						$('#resourceInfo').load('/ResourceController.do?method=toResourceDetailView', {objId: resourceObjId});
					}
					//新增
					else{
						//刷新树节点
						ResourceTree.refreshItem(ResourceTree.getSelectedItemId());
						//刷新表单域
						$('#resourceInfo').load('/ResourceController.do?method=toResourceDetailView', {objId: ResourceTree.getSelectedItemId()});
					}
				}else{
					alert(json.result);
				}
			},
			error: function(msg){
				alert(msg);
			}
		});

		//(重要)always return false to prevent standard browser submit and page navigation 
		return false;
	});

	//
	$('#resUrl').click(function(){



		$.layer({
		   v_btns : 2,
		   v_msg : '确定要删除吗？',
		   v_msgtype : 4,
		   yes : function(){
		      //code	
		   }
		});
				
	});



	
} );
</script>
