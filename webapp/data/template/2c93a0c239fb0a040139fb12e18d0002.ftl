<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>${article.title }</title>
<!-- CSS -->
<link rel="STYLESHEET" type="text/css" href="${initPath}/view/resource/plug_in/jquery/msgbox/jquery.msgbox.css" />

<!-- JS -->
<script src="${initPath}/view/resource/plug_in/jquery/jquery.js" type="text/javascript"></script>
<script src="${initPath}/view/resource/plug_in/jquery/jquery.validate.js" type="text/javascript"></script>
<script src="${initPath}/view/resource/plug_in/jquery/jquery.metadata.js" type="text/javascript"></script>
<script src="${initPath}/view/resource/plug_in/jquery/jquery.form.js" type="text/javascript"></script>
<script type="text/javascript" src="${initPath}/view/resource/plug_in/jquery/msgbox/jquery.dragndrop.min.js"></script>
<script type="text/javascript" src="${initPath}/view/resource/plug_in/jquery/msgbox/jquery.msgbox.js"></script>
<script type="text/javascript" src="${initPath}/view/auth/common/common.js"></script>
<script type="text/javascript" src="${initPath}/view/resource/scripts/date_util.js"></script>

<link href="${initPath}/view/resource/skin/css/layout.css" rel="stylesheet" type="text/css"/>
<script>
var ShowArticleDetail={};
ShowArticleDetail.yetUpDown=false;

//�����
ShowArticleDetail.upDown = function(articleId,status){
	if(ShowArticleDetail.yetUpDown){return;}
	$.getJSON('/UpDownController.do?method=save', {objId:articleId, status:status}, function(json){
		if(json.success){
			$('#upNum').html(json.upDown.up);
			$('#downNum').html(json.upDown.down);
		}else{
			alert(json.result);
		}
	});
	ShowArticleDetail.yetUpDown = true;
}

$(function(){
	$("#commentForm").validate();
	
	//�������µ�5������
	var param = {
			'article.objId': $('#articleId').val(),
			queryColumns: 'commentUserName,content,createTime',
			order: 'createTime',
			order_flag: true,
			pageIndex: 1,
			pageSize: 5
	};
	$.getJSON('/CommentController.do?method=list', param, function(json){
		var html = '';
		$(json.pageData).each(function(i,n){
			html += '<dt><span>'+(n.commentUserName=='' ? '�����û�' : n.commentUserName)+'</span> �� '+n.createTime+' ���۵�:</dt>';
			html += '<dd>'+n.content+'</dd>';
			html += '<dd class="line"></dd>';
		});
		$('dl','#commentListContainer').append(html);
	});

	//���ظ�������Ϣ
	$('#relateInfoContainer').load('/ArticleController.do?method=loadArticleRelateInfoView', {articleId: $('#articleId').val()});
	
	//����topҳ��
	$('#topContainer').load('/IndexViewController.do?method=loadTopView');

	//�ύ��
	$('#commentForm').submit(function(){
		if(!$('#commentForm').valid()){return;}
		$(this).ajaxSubmit({
			dataType: 'json',
			success: function(json){
				if(json.success){
					var html = '';
					html += '<dt><span>'+(json.comment.commentUserName==null ? '�����û�' : json.comment.commentUserName)+'</span> �� '+date2str(json.comment.createTime)+' ���۵�:</dt>';
					html += '<dd>'+json.comment.content+'</dd>';
					html += '<dd class="line"></dd>';
					$('dl','#commentListContainer').prepend(html);
					
					$('#jcaptchaImg').click(); //ˢ����֤��
					$('#captcha').val('');
					$('textarea[name=content]').val('');
				}else{
					$('#jcaptchaImg').click(); //ˢ����֤��
					$('#captcha').val('');
					alert(json.result);
				}
			},
			error: function(msg){
				alert(msg);
			}
		});

		//(��Ҫ)always return false to prevent standard browser submit and page navigation 
		return false;
	});
});
</script>
</head>
<body>
<div id="topContainer"></div>
<#include "/data/template/portal/navgaitor.ftl" encoding="UTF-8">

<p></p>
<div id="main">
<div class="page4 position">�������������---�� 
	<a href="/">��ҳ</a>
	<#list channelList as channel>
		>> <a href="/demo/product/" target="_blank">${channel.channelName}</a>
	</#list>
</div>
<div class="page4 box">
	<div class="w720 fl">
		<div class="rb_top">&nbsp;</div>
		<div class="rb_mid box">
			<div class="w96">
				<h1>${article.title }</h1>
				<div class="msgbar">
					����ʱ�䣺 ${article.releaseDate! } &nbsp; 
					���ߣ�${article.author! } &nbsp; 
					��Դ��${article.source! } &nbsp; 
					��������� &nbsp; <a href="#commentForm">��Ҫ����</a>&nbsp;&nbsp;  
					<input id="articleId" type="hidden" value="${article.objId }" />
				</div>
				<div class="summary"><strong>ժҪ��</strong>${article.abstracts }...</div>
				<div class="content">${article.content }</div>
				<div class="pagebar"></div>
				<!-- <div class="tags"><strong>Tags��</strong>  ��������Tags�� </div> -->
				<div class="other box">
					<div onclick="ShowArticleDetail.upDown('${article.objId }','up');" class="ding fl">
						<p>��</p><p id="upNum"></p>
					</div>
					<div onclick="ShowArticleDetail.upDown('${article.objId }','down');" class="cai fl">
						<p>��</p><p id="downNum"></p>
					</div>
					<!-- 
					<ul>
						<li><strong>��һƪ��</strong>û����</li>
						<li><strong>��һƪ��</strong><a href="http://demo.jeecms.com:80/phone/292.jhtml">С��M1��MIUI�� </a></li>
					</ul>
					 -->
				</div>
			</div>
			<div id="commentListContainer">
				<dl class="rmpl"></dl>
			</div>
			<div class="comment">
				<h2>�������� <a target="_blank" href="/CommentController.do?method=toShowCommentListView&articleId=${article.objId}">�鿴��������?</a></h2>
				<div style="margin-top:5px;" class="w98"> 
				<form method="post" action="/CommentController.do?method=save" id="commentForm">
					<input type="hidden" name="article.objId" value="${article.objId }" />
					<table width="100%" cellspacing="1" cellpadding="5" border="0" bgcolor="#EAEAEA">
					<tbody>
						<tr>
							<td width="19%" height="80" bgcolor="#FaFaFa" align="right"><strong>�������ݣ�</strong></td>
							<td width="81%" bgcolor="#FFFFFF"><textarea rows="5" cols="60" class="cinput required" name="content"></textarea></td>
						</tr>
						<tr>
							<td bgcolor="#FAFAFA" align="right"><strong>��֤�룺</strong></td>
							<td bgcolor="#FFFFFF">
								<input type="text" class="input required" id="captcha" name="captcha" />
								<img width="50" height="30" id="jcaptchaImg" src="${initPath}/jcaptcha" onclick="this.src='${initPath}/jcaptcha?d='+new Date()*1" />
							</td>
						</tr>
						<tr>
							<td height="30" bgcolor="#FFFFFF" align="center" colspan="2"><input type="hidden" value="295" name="contentId">
								<input type="submit" value="���Ϸ��� " name="Submit">
								���������۽���������˿���������������վͬ����۵��֤ʵ���������� 
							</td>
						</tr>
					</tbody>
					</table>
				</form>
				</div>
			</div>
		</div>
        <div class="rb_low">&nbsp;</div>
	</div>
	
	<!-- ��������Ϣ���� -->
	<div class="w250 fr mt5" id="relateInfoContainer"></div>
</div>
</div>
<p></p>

<#include "/data/template/portal/hotlink.ftl" encoding="UTF-8">
<#include "/data/template/portal/foot.ftl" encoding="UTF-8">
</body>
</html>