<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/view/auth/portal/taglibs.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>稿件评论列表</title>
<%@ include file="/view/auth/portal/init.jsp" %>
<link href="${initPath}/view/resource/skin/css/layout.css" rel="stylesheet" type="text/css"/>
<script>
var CommentList={};
CommentList.loading = false; //标记加载状态

//加载评论
CommentList.loadComment = function(){
	CommentList.loading = true;
	
	var param = {
			'article.objId': $('#articleId').val(),
			queryColumns: 'commentUserName,content,createTime',
			order: 'createTime',
			order_flag: true,
			pageIndex: Number($('#pageIndex').val())+1,
			pageSize: 10
	};
	$.getJSON('CommentController.do?method=list', param, function(json){
		var html = '';
		$(json.pageData).each(function(i,n){
			html += '<dt><span>'+(n.commentUserName=='' ? '匿名用户' : n.commentUserName)+'</span> 于 '+n.createTime+' 评论道:</dt>';
			html += '<dd>'+n.content+'</dd>';
			html += '<dd class="line"></dd>';
		});
		$('#pageIndex').val(json.pageIndex);
		$('#pageCount').val(json.pageCount);
		$('#commentListContainer').append(html);
		CommentList.loading = false;
	});
}

$(function(){
	$("#commentForm").validate();

	//加载稿件相关信息
	$('#relateInfoContainer').load('ArticleController.do?method=loadArticleRelateInfoView', {articleId: $('#articleId').val()});
	
	//监听滚动条，自动加载稿件评论
	$(window).scroll( function() {
		if(Number($('#pageIndex').val()) >= Number($('#pageCount').val())){
			return ;
		}
		//获取浏览器显示区域的高度
		var wh = $(window).height();
		//获取滚动条到顶部的垂直高度
		var st = $(document).scrollTop();
		//获取自动加载区域的底部到页面顶部的距离
		var t = $('#commentListContainerBottom').offset().top;
		
		//如果已经显示到区域底部，并且上次加载已完成，则加载数据
		if(t-st-wh < 0 && !CommentList.loading){
			CommentList.loadComment();
		}
	});
	

	//提交表单
	$('#commentForm').submit(function(){
		if(!$('#commentForm').valid()){return;}
		$(this).ajaxSubmit({
			dataType: 'json',
			success: function(json){
				if(json.success){
					var html = '';
					html += '<dt><span>'+(json.comment.commentUserName==null ? '匿名用户' : json.comment.commentUserName)+'</span> 于 '+date2str(json.comment.createTime)+' 评论道:</dt>';
					html += '<dd>'+json.comment.content+'</dd>';
					html += '<dd class="line"></dd>';
					$('#commentListContainer').prepend(html);
					
					$('#jcaptchaImg').click(); //刷新验证码
					$('#captcha').val('');
					$('textarea[name=content]').val('');
				}else{
					$('#jcaptchaImg').click(); //刷新验证码
					$('#captcha').val('');
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
});
</script>
</head>
<body>
<%@ include file="/view/auth/portal/top.jsp" %>
<%@ include file="/view/auth/portal/navgaitor.jsp" %>

<div id="main">
<div class="page2 position"> 您现在正在浏览： <a href="/">首页</a> &raquo; 文章评论详细列表：</div>
<div class="page2 box">
	<div class="w720 fl">
		<div class="rb_top"></div>
		<div class="rb_mid box">
			<div class="w96">
				<h1>评论主题：<a href="javascript:" onclick="common.toArticleDetail('${article.objId}')">${article.title }</a></h1>
				<div class="msgbar">
					发布时间：  ${article.releaseDate } &nbsp; 
					作者：${article.author } &nbsp; 
					来源：${article.source } &nbsp;  
					浏览次数：<span id="views"></span>
				</div>
			</div>
			<div class="w98">
				<input type="hidden" id="pageIndex" value="${commentPage.pageIndex }" />
				<input type="hidden" id="pageCount" value="${commentPage.pageCount }" />
				<dl class="rmpl" id="commentListContainer">
					<c:forEach var="comment" items="${commentPage.data}">
					<dt><span>${comment.commentUserName==null ? '匿名用户' : comment.commentUserName}</span> 于 ${comment.createTime } 评论道:</dt>
					<dd>${comment.content }</dd>
					<dd class="line"></dd>
					</c:forEach>
				</dl>
				<div id="commentListContainerBottom"></div>
			</div>
			<div class="w98" style="margin-top:5px;">
				<div class="comment">
					<h2>发布评论</h2>
					<div class="w98" style="margin-top:5px;"> 
					<form method="post" action="/CommentController.do?method=save" id="commentForm">
						<input type="hidden" id="articleId" name="article.objId" value="${article.objId }" />
						<table width="100%" border="0" cellpadding="5" cellspacing="1" bgcolor="#EAEAEA">
							<tr>
								<td width="19%" height="80" bgcolor="#FaFaFa" align="right"><strong>评论内容：</strong></td>
								<td width="81%" bgcolor="#FFFFFF"><textarea rows="5" cols="60" class="cinput required" name="content"></textarea></td>
							</tr>
							<tr>
								<td bgcolor="#FaFaFa" align="right"><strong>验证码：</strong></td>
								<td bgcolor="#FFFFFF">
									<input type="text" class="input required" id="captcha" name="captcha" />
									<img width="50" height="30" id="jcaptchaImg" src="${initPath}/jcaptcha" onclick="this.src='${initPath}/jcaptcha?d='+new Date()*1" />
								</td>
							</tr>
							<tr>
								<td height="30" bgcolor="#FFFFFF" align="center" colspan="2"><input type="hidden" value="295" name="contentId">
									<input type="submit" value="马上发表 " name="Submit">
									【网友评论仅供其表达个人看法，并不表明本站同意其观点或证实其描述。】 
								</td>
							</tr>
						</table>
					</form>
					</div>
				</div>
			</div>
		</div>
		<div class="rb_low"></div>
	</div>
	
	<!-- 稿件相关信息区域 -->
	<div class="w250 fr" id="relateInfoContainer"></div>
</div>
</div>
<!--body_end-->
<%@ include file="/view/auth/portal/hotlink.jsp" %>
<%@ include file="/view/auth/portal/foot.jsp" %>
</body>
</html>
