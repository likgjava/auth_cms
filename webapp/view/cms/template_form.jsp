<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/view/auth/portal/taglibs.jsp" %>
<form id="templateForm" action="/TemplateController.do?method=save" method="post">
	<input id="templateId" type="hidden" name="objId" value="${template.objId }" />
	<table cellspacing="1" cellpadding="2" border="0" width="100%" class="pn-ftable" style="font-size:13px;">
	<tbody>
		<tr>
			<td width="12%" class="pn-flabel pn-flabel-h"><span class="pn-frequired">*</span>模板名称:</td>
			<td width="88%" class="pn-fcontent"><input type="text" name="templateName" maxlength="100" class="{required:true}" value="${template.templateName }"></td>
		</tr>
		<tr>
			<td class="pn-flabel pn-flabel-h"><span class="pn-frequired">*</span>模板类型:</td>
			<td class="pn-fcontent">
				<select name="templateType">
					<option value="0" <c:if test="${template.templateType == 0}">selected="selected"</c:if>>栏目模板</option>
					<option value="1" <c:if test="${template.templateType == 1}">selected="selected"</c:if>>文章模板</option>
				</select>
			</td>
		</tr>
		<tr>
			<td class="pn-flabel pn-flabel-h">模板内容:</td>
			<td class="pn-fcontent"><textarea name="templateContent" rows="20" cols="120"></textarea></td>
		</tr>
		<tr>
			<td class="pn-fbutton" colspan="2"><input type="submit" class="submit" value="提交" /> &nbsp; <input type="reset" class="reset" value="重置" /></td>
		</tr>
	</tbody>
	</table>
</form>

<script type="text/javascript">
$(document).ready(function() {
	//验证表单
	$("#templateForm").validate();

	//异步获取模板的内容
	$.getJSON('/TemplateController.do?method=getTemplateContent',{objId:$('#templateId').val()},function(json){
		$('textarea[name=templateContent]').val(json.templateContent);
	});

	//提交表单
	$('#templateForm').submit(function(){
		if(!$('#templateForm').valid()){return;}
		$(this).ajaxSubmit({
			dataType: 'json',
			success: function(json){
				if(json.success){
					window.open('/view/cms/template_list.jsp', 'rightFrame');
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
