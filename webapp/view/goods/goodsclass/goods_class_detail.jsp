<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/view/auth/portal/taglibs.jsp" %>

<form>
	<table cellspacing="1" cellpadding="2" border="0" width="100%" class="pn-ftable" style="font-size:13px;">
	<tbody>
		<tr>
			<td width="12%" class="pn-flabel pn-flabel-h">上级分类:</td>
			<td width="88%" class="pn-fcontent" colspan="3"><span>${goodsClass.parent.goodsClassName }</span></td>
		</tr>
		<tr>
			<td width="12%" class="pn-flabel pn-flabel-h">商品分类编号:</td>
			<td width="88%" class="pn-fcontent" colspan="3"><span>${goodsClass.objId }</span></td>
		</tr>
		<tr>
			<td width="12%" class="pn-flabel pn-flabel-h">商品分类名称:</td>
			<td width="88%" class="pn-fcontent" colspan="3"><span>${goodsClass.goodsClassName }</span></td>
		</tr>
		<tr>
			<td width="12%" class="pn-flabel pn-flabel-h">商品分类描述:</td>
			<td width="88%" class="pn-fcontent" colspan="3">${goodsClass.goodsClassDesc }</td>
		</tr>
	</tbody>
	</table>
</form>