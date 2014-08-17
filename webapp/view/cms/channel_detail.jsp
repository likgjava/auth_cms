<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/view/auth/portal/taglibs.jsp" %>

<form>
	<table cellspacing="1" cellpadding="2" border="0" width="100%" class="pn-ftable" style="font-size:13px;">
	<tbody>
		<tr>
			<td width="12%" class="pn-flabel pn-flabel-h">上级栏目:</td>
			<td width="88%" class="pn-fcontent"><span>${channel.parent.channelName }</span></td>
		</tr>
		<tr>
			<td class="pn-flabel pn-flabel-h">栏目名称:</td>
			<td class="pn-fcontent"><span>${channel.channelName }</span></td>
		</tr>
		<tr>
			<td class="pn-flabel pn-flabel-h">栏目模板:</td>
			<td class="pn-fcontent"><span>${channel.channelTemplate.templateName }</span></td>
		</tr>
		<tr>
			<td class="pn-flabel pn-flabel-h">文章模板:</td>
			<td class="pn-fcontent"><span>${channel.articleTemplate.templateName }</span></td>
		</tr>
		<tr>
			<td class="pn-flabel pn-flabel-h">栏目描述:</td>
			<td class="pn-fcontent">${channel.channelDesc }</td>
		</tr>
	</tbody>
	</table>
</form>