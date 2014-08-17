<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/view/auth/portal/taglibs.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>全文检索列表</title>
<%@ include file="/view/auth/portal/init.jsp" %>
<link href="${initPath}/view/resource/skin/css/front.css" rel="stylesheet" type="text/css" />
<link href="${initPath}/view/resource/skin/css/layout.css" rel="stylesheet" type="text/css"/>
<script>
$(document).ready(function(){
	$('#txtKey').val('${param.kw }');

	//加载稿件相关信息
	$('#relateInfoContainer').load('/ArticleController.do?method=loadArticleRelateInfoView', {articleId: $('#articleId').val()});
});
</script>
</head>

<body>
<%@ include file="/view/auth/portal/top.jsp" %>
<%@ include file="/view/auth/portal/navgaitor.jsp" %>

<div id="main">
<div class="page4 position1"> 您现在正在浏览： <a href="/">首页</a> &raquo; 全文检索列表</div>

<div class="page4 box mt10">
<div class="w720 fl">
	<div class="left_top1 box"><h2 class="w340 fl"> 搜索结果</h2></div>
	<div class="box"></div>
	<div class="left_div1 box">
		<div class="w96" style="min-height:500px;">
			<div class="search_msg">
				您搜索的“<span class="red">${param.kw }</span>”， 共有 <span class="red">${TOTAL_RECORD}</span> 条查询结果，耗时${takeTime }(s)
			</div>
				
			<c:if test="${searchType=='goods'}">
				<c:forEach var="goods" items="${goodsList}">
				<dl class="list3">
					<dt><span>[<a href="/phone/index.jhtml" target="_blank">手机</a>]</span>  <a href="/phone/282.jhtml" target="_blank">${goods.goodsName }</a></dt>
					<dd class="zy">${goods.goodsDesc }</dd>
					<dd>来源： <a href="" target="_blank">本站原创</a> &nbsp;&nbsp; 浏览次数：29次 &nbsp;&nbsp; 发布时间： ${goods.createTime}</dd>
				</dl>
				</c:forEach>
			</c:if>
			<c:if test="${searchType=='news'}">
				<c:forEach var="article" items="${dataList}">
				<dl class="list3">
					<dt><span>[<a href="/phone/index.jhtml" target="_blank">手机</a>]</span>  <a href="javascript:" onclick="common.toArticleDetail('${article.objId}')">${article.title }</a></dt>
					<dd class="zy">${article.abstracts }</dd>
					<dd>来源： <a href="" target="_blank">本站原创</a> &nbsp;&nbsp; 浏览次数：29次 &nbsp;&nbsp; 发布时间： ${article.createTime}</dd>
				</dl>
				</c:forEach>
			</c:if>

			<jsp:include page="/view/auth/portal/search_page.jsp" />
		</div>
	</div>
	<div class="left_low"></div>	
</div>

<!-- 稿件相关信息区域 -->
<div class="w250 fr" id="relateInfoContainer"></div>
</div>
</div>

<%@ include file="/view/auth/portal/hotlink.jsp" %>
<%@ include file="/view/auth/portal/foot.jsp" %>
</body>
</html>