<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/view/auth/portal/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>商品库</title>
<%@ include file="/view/auth/portal/init.jsp" %>
<link rel="stylesheet" href="${initPath}/view/resource/skin/css/style.css" />
<link rel="stylesheet" href="${initPath}/view/resource/skin/css/global.css" />
<link rel="stylesheet" href="${initPath}/view/resource/skin/css/layout.css" />
</head>
<body>
<%@ include file="/view/auth/portal/top.jsp" %>
<%@ include file="/view/auth/portal/navgaitor.jsp" %>

<div id="wrapper" style="margin-bottom:10px;">
<div class="product-left fl">
	<div class="ppzq">
		<h1 class="prd-leftit">产品类别</h1>
		<div class="ppzq_con1">
			<ul>
				<c:forEach var="goodsClass" items="${goodsClassList}">
				<li><h3><div class="type-tit"><a href="/GoodsController.do?method=toShowGoodsIndexView&goodsClass=${goodsClass.objId}">${goodsClass.goodsClassName }</a></div></h3></li>
				</c:forEach>
			</ul>
		</div>
	</div>
	<div class="ppzq mt10">
		<h1 class="prd-leftit">品牌专区</h1>
		<div class="ppzq_con">
			<ul>
				<c:forEach var="goodsBrand" items="${goodsBrandList}">
				<li><a href="http://www.360buy.com/" target="_blank" onclick="$.get('/friendlink_view.jspx?id=3')"><img src="${goodsBrand.brandPicture }" alt="${goodsBrand.brandName }"/></a></li>
				</c:forEach>
				<div class="clear"></div>
			</ul>
		</div>
	</div>
	<div class="ppzq mt10">
		<h1 class="prd-leftit">推荐产品</h1>
		<div class="hotcon">
			<c:forEach var="recommendGoods" items="${recommendGoodsList}" varStatus="status">
			<dl class="rank <c:if test="${status.last}">last</c:if>">
				<dd class="ico_red"><img src="http://demo.jeecms.com/r/cms/www/red/img/product/ico_no0${status.index+1}.gif" width="17" height="14" /></dd>
				<dd class="rankPic"><a href="javascript:;" onclick="common.toGoodsDetail('${recommendGoods.objId}');"><img src="${recommendGoods.mainPicture }" width="80" height="80" /></a></dd>
				<dd class="rankPrice">￥${recommendGoods.refPrice}</dd>
				<dd class="rankTitle"><a href="javascript:;" onclick="common.toGoodsDetail('${recommendGoods.objId}');">${recommendGoods.goodsName }${status.count }</a></dd>
			</dl>
			</c:forEach>
		</div>
	</div>
</div>
<div class="product-right fr">
	<c:forEach var="goodsList" items="${goodsListMap}">
		<h1>${goodsList.key.goodsClassName}</h1>
		<ul class="citem">
			<c:forEach var="goods" items="${goodsList.value}">
			<li>
				<dl>
					<dt class="prdpic">
						<a href="javascript:;" onclick="common.toGoodsDetail('${goods.objId}');"><img src="${goods.mainPicture }" /></a>
					</dt>
					<dt class="good-name">
						<a href="javascript:;" onclick="common.toGoodsDetail('${goods.objId}');">${goods.goodsName }</a>
					</dt>
					<!-- <dd class="good-price-old">市场价：<del>￥3100</del></dd> -->
					<dd class="good-price"><strong>￥${goods.refPrice}</strong></dd>
				</dl>
			</li>
			</c:forEach>
		</ul>
		<div class="clear"></div>
		<br/>
	</c:forEach>
	<div class="clear"></div>
</div>
</div>
<div class="clear"></div>
<%@ include file="/view/auth/portal/foot.jsp" %>
</body>
</html>