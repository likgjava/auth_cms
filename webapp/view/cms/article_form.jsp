<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/view/auth/portal/taglibs.jsp" %>

<form id="articleForm" action="/ArticleController.do?method=save" method="post">
	<input type="hidden" name="objId" value="${article.objId }" />
	<input type="hidden" name="channel.objId" value="${article.channel.objId }" />
	<input type="hidden" id="releaseStatus" name="releaseStatus" value="${article.releaseStatus }" />
	<table cellspacing="1" cellpadding="2" border="0" width="100%" class="pn-ftable" style="font-size:13px;">
	<tbody>
		<tr>
			<td width="12%" class="pn-flabel pn-flabel-h"><span class="pn-frequired">*</span>标题:</td>
			<td width="88%" class="pn-fcontent"><input type="text" name="title" maxlength="100" class="{required:true}" value="${article.title }"></td>
		</tr>
		<tr>
			<td class="pn-flabel pn-flabel-h">作者:</td>
			<td class="pn-fcontent"><input type="text" name="author" value="${article.author }"></td>
		</tr>
		<tr>
			<td class="pn-flabel pn-flabel-h">稿件来源:</td>
			<td class="pn-fcontent"><input type="text" name="source" value="${article.source }"></td>
		</tr>
		<tr>
			<td class="pn-flabel pn-flabel-h">摘要:</td>
			<td class="pn-fcontent"><textarea name="abstracts" rows="3" cols="60">${article.abstracts }</textarea></td>
		</tr>
		<tr>
			<td class="pn-flabel pn-flabel-h">内容:</td>
			<td class="pn-fcontent"><textarea id="ckeditorArea" name="content" rows="6" cols="60">${article.content }</textarea></td>
		</tr>
		<tr>
			<td class="pn-fbutton" colspan="2">
				<c:if test="${article.releaseStatus != '01'}">
				<input id="saveArticle" type="button" class="submit" value="保存" />
				</c:if>
				<input id="releaseArticle" type="button" class="submit" value="发布" />
				<input type="reset" class="reset" value="重置" />
			</td>
		</tr>
	</tbody>
	</table>
</form>

<script>
var ArticleForm={};
//保存稿件
ArticleForm.save = function(releaseStatus){
	if(!$('#articleForm').valid()){return;}
	$('#ckeditorArea').val(CKEDITOR.instances.ckeditorArea.getData());
	$('#releaseStatus').val(releaseStatus);
	$('#articleForm').ajaxSubmit({
		dataType: 'json',
		success: function(json){
			if(json.success){
				$('#articleListInfo').load('/view/cms/article_list.jsp', {channelId: ChannelTree.getSelectedItemId()});
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
}

$(document).ready(function() {
	//验证表单
	$("#articleForm").validate();

	//初始化编辑器
	var ckeditorInstance = CKEDITOR.instances.ckeditorArea;
	if(ckeditorInstance){CKEDITOR.remove(ckeditorInstance);}
	CKEDITOR.replace('ckeditorArea');

	//提交表单
	/**$('#articleForm').submit(function(){
		if(!$('#articleForm').valid()){return;}
		$('#ckeditorArea').val(CKEDITOR.instances.ckeditorArea.getData());
		$(this).ajaxSubmit({
			dataType: 'json',
			success: function(json){
				if(json.success){
					$('#articleListInfo').load('/view/cms/article_list.jsp', {channelId: ChannelTree.getSelectedItemId()});
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
	*/
	
	//保存稿件
	$('#saveArticle').click(function(){
		ArticleForm.save('00');
	});
	//发布稿件
	$('#releaseArticle').click(function(){
		ArticleForm.save('01');
	});
} );
</script>
