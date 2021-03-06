<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/view/auth/portal/taglibs.jsp" %>

<form id="roleForm" action="/RoleController.do?method=save" method="post">
	<input type="hidden" name="objId" value="${role.objId }" />
	<table cellspacing="1" cellpadding="2" border="0" width="100%" class="pn-ftable" style="font-size:13px;">
	<tbody>
		<tr>
			<td width="12%" class="pn-flabel pn-flabel-h"><span class="pn-frequired">*</span>角色名称:</td>
			<td width="88%" class="pn-fcontent" colspan="3"><input type="text" name="roleName" maxlength="100" class="{required:true}" value="${role.roleName }"></td>
		</tr>
		<tr>
			<td width="12%" class="pn-flabel pn-flabel-h">角色中文名称:</td>
			<td width="88%" class="pn-fcontent" colspan="3"><input type="text" name="roleChName" maxlength="100" value="${role.roleChName}"></td>
		</tr>
		<tr>
			<td width="12%" class="pn-flabel pn-flabel-h">角色描述:</td>
			<td width="88%" class="pn-fcontent" colspan="3"><textarea maxlength="255" name="roleDesc" rows="4" cols="60">${role.roleDesc }</textarea></td>
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
	$("#roleForm").validate();

	//提交表单
	$('#roleForm').submit(function(){
		if(!$('#roleForm').valid()){return;}
		$(this).ajaxSubmit({
			dataType: 'json',
			success: function(json){
				if(json.success){
					window.open('/view/auth/sys/auth/role_list.jsp', 'rightFrame');
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
} );
</script>
