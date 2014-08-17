<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/view/auth/portal/taglibs.jsp" %>

<form id="channelForm" action="/ChannelController.do?method=save" method="post">
	<input type="hidden" id="channelObjId" name="objId" value="${channel.objId }" />
	<input type="hidden" id="parentChannelObjId" name="parent.objId" value="${channel.parent.objId }" />
	<input type="hidden" name="treeLevel" value="${channel.treeLevel }" />
	<table cellspacing="1" cellpadding="2" border="0" width="100%" class="pn-ftable" style="font-size:13px;">
	<tbody>
		<tr>
			<td width="12%" class="pn-flabel pn-flabel-h">上级栏目:</td>
			<td width="88%" class="pn-fcontent"><span>${channel.parent.channelName }</span></td>
		</tr>
		<tr>
			<td width="12%" class="pn-flabel pn-flabel-h"><span class="pn-frequired">*</span>栏目名称:</td>
			<td width="88%" class="pn-fcontent"><input type="text" name="channelName" maxlength="100" class="required" value="${channel.channelName }"></td>
		</tr>
		<tr>
			<td class="pn-flabel pn-flabel-h">选择栏目模板:</td>
			<td class="pn-fcontent" colspan="3">
				<select name="channelTemplate.objId">
					<option value="">请选择</option>
					<c:forEach var="channelTemplate" items="${channelTemplateList}">
					<option value="${channelTemplate.objId}" <c:if test="${channel.channelTemplate.objId == channelTemplate.objId}">selected="selected"</c:if>>${channelTemplate.templateName}</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<td class="pn-flabel pn-flabel-h">选择文章模板:</td>
			<td class="pn-fcontent" colspan="3">
				<select name="articleTemplate.objId">
					<option value="">请选择</option>
					<c:forEach var="articleTemplate" items="${articleTemplateList}">
					<option value="${articleTemplate.objId}" <c:if test="${channel.articleTemplate.objId == articleTemplate.objId}">selected="selected"</c:if>>${articleTemplate.templateName}</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<td class="pn-flabel pn-flabel-h">栏目描述:</td>
			<td class="pn-fcontent"><textarea maxlength="255" name="channelDesc" rows="4" cols="60">${channel.channelDesc }</textarea></td>
		</tr>
		<tr>
			<td class="pn-fbutton" colspan="2"><input type="submit" class="submit" value="提交" /> &nbsp; <input type="reset" class="reset" value="重置" /></td>
		</tr>
	</tbody>
	</table>
</form>

<script>
$(document).ready(function() {
	//验证表单
	$("#channelForm").validate();

	//提交表单
	$('#channelForm').submit(function(){
		if(!$('#channelForm').valid()){return;}
		$(this).ajaxSubmit({
			dataType: 'json',
			success: function(json){
				if(json.success){
					var channelObjId = $('#channelObjId').val();
					//修改
					if(channelObjId){
						//更新节点名称
						ChannelTree.setItemText(channelObjId, $('input[name=channelName]', '#channelForm').val(), '');
						//刷新表单域
						$('#channelInfo').load('/ChannelController.do?method=toChannelDetailView', {objId: channelObjId});
					}
					//新增
					else{
						//刷新树节点
						ChannelTree.refreshItem(ChannelTree.getSelectedItemId());
						//刷新表单域
						$('#channelInfo').load('/ChannelController.do?method=toChannelDetailView', {objId: ChannelTree.getSelectedItemId()});
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
} );
</script>
