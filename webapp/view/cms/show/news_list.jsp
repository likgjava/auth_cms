<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/view/auth/portal/taglibs.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>国内新闻 - JEECMS主站 - Powered by JEECMS</title>
<%@ include file="/view/auth/portal/init.jsp" %>

<link rel="stylesheet" href="${initPath}/view/resource/skin/css/front.css" />
<link rel="stylesheet" href="${initPath}/view/resource/skin/css/layout.css" />

<script type="text/javascript">
var NewsList = {};
//跳转到指定页面
NewsList.toPage = function(pageIndex){
	window.location.href = '/ArticleController.do?method=toNewsListView&channelId='+$('#channelId').val()+'&pageSize='+$('#pageSize').val()+'&pageIndex='+pageIndex;
}

$(function() {
	//初始化下拉列表
	var pageCount = Number($('#pageCount').val());
	var pageIndex = Number($('#pageIndex').val());
	var optionStr = '';
	for(var i=1; i<=pageCount; i++){
		optionStr += '<option value="'+i+'" '+ (pageIndex==i ? 'selected="selected"' : '') +'>'+i+'</option>';
	}
	$('#pageSelect').html(optionStr);
});
</script>
</head>

<body>
<%@ include file="/view/auth/portal/top.jsp" %>
<%@ include file="/view/auth/portal/navgaitor.jsp" %>



<div id="main">
<div class="page2 position1">
	您现在正在浏览： 
	<a href="/">首页</a> &raquo; 
	<a href="http://demo.jeecms.com:80/news/index.jhtml" target="_blank">新闻</a> &raquo; 
	<a href="http://demo.jeecms.com:80/gnxw/index.jhtml" target="_blank">国内新闻</a>
</div>

<!--cjbd_begin-->
<div class="page2 box">
<div class="w720 fl">
	<div class="left_top1 box">
      <h2 class="fl">国内新闻</h2>
	</div>
    <div class="box"></div>
	<div class="left_div1 box">
		<div class="w96" style="min-height:800px;">
			<div class="c1-body">
				<c:forEach var="article" items="${pageArticle.data}">
				<div class="c1-bline" style="padding:10px 0;">
					<div class="f-left">
						<img src="/r/cms/head-mark4.gif" align="middle" class="img-vm" border="0"/> 
						<a href="http://demo.jeecms.com:80/gnxw/index.jhtml" class="red" target="_blank">[国内新闻]</a>
						<a href="javascript:" onclick="common.toArticleDetail('${article.objId}')"><span style="">${article.title}</span></a></div>
					<div class="gray f-right">2011-12-19</div>
					<div class="clear"></div>
				</div>
				</c:forEach>
			</div>

			<div class="pagination">
				<input type="hidden" id="channelId" value="${channel.objId}" />
				<input type="hidden" id="pageCount" value="${pageArticle.pageCount}" />
				<input type="hidden" id="pageSize" value="${pageArticle.pageSize}" />
				<input type="hidden" id="pageIndex" value="${pageArticle.pageIndex}" />
				共${pageArticle.totalRecord}条记录 ${pageArticle.pageIndex}/${pageArticle.pageCount}页&nbsp;
				<c:if test="${pageArticle.pageIndex != 1}">
				<a href="javascript:" onclick="NewsList.toPage(1);">首页</a>
				<a href="javascript:" onclick="NewsList.toPage(${pageArticle.pageIndex-1});">上一页</a>&nbsp;
				</c:if>
				<c:if test="${pageArticle.pageIndex != pageArticle.pageCount}">
				<a href="javascript:" onclick="NewsList.toPage(${pageArticle.pageIndex+1});">下一页</a>
				<a href="javascript:" onclick="NewsList.toPage(${pageArticle.pageCount});">尾页</a>&nbsp;
				</c:if>
				第<select id="pageSelect" onchange="NewsList.toPage(this.value);"></select>页
			</div>
		</div>



    </div>
    <div class="left_low"></div>	
  </div>  
  
  <div class="w250 fr">
    <div class="rb_right_top">
      <h2>&nbsp;&nbsp;最新图文资讯</h2>
    </div>
    <div class="rb_right_div">
      <!--最新图文资讯_Begin-->
      <div class="w98"> 
        <ul class="list right_pic">
          <li><a href="http://demo2.jeecms.com:80/system/789.jhtml" target="_blank"><img src="/r/cms/www/no_picture.gif" alt="谷歌浏览器" /></a><a href="http://demo2.jeecms.com:80/system/789.jhtml" title="谷歌浏览器" target="_blank">谷歌浏览器</a></li>
          <li><a href="http://demo2.jeecms.com:80/photo/786.jhtml" target="_blank"><img src="/u/cms/www/201208/171550063rbx.jpg" alt="马拉多纳起诉“九城”侵权案一审在京开庭" /></a><a href="http://demo2.jeecms.com:80/photo/786.jhtml" title="马拉多纳起诉“九城”侵权案一审在京开庭" target="_blank">马拉多纳起诉“九城”</a></li>
          <li><a href="http://demo2.jeecms.com:80/photo/785.jhtml" target="_blank"><img src="/u/cms/www/201208/17151908i7nu.jpg" alt="台风“启德”登陆湛江 最大风力13级" /></a><a href="http://demo2.jeecms.com:80/photo/785.jhtml" title="台风“启德”登陆湛江 最大风力13级" target="_blank">台风“启德”登陆湛江</a></li>
          <li><a href="http://demo2.jeecms.com:80/photo/784.jhtml" target="_blank"><img src="/u/cms/www/201208/17151526rpch.jpg" alt="台风“海葵”致江西婺源洪水围村" /></a><a href="http://demo2.jeecms.com:80/photo/784.jhtml" title="台风“海葵”致江西婺源洪水围村" target="_blank">台风“海葵”致江西婺</a></li>
        </ul>
         </div>
      <!--最新图文资讯_End-->
      <!--本周热门资讯排行_Begin-->
      <h2>本周热门资讯排行</h2>
      <div class="w98">
        <ul class="order">
          <li><a href="http://demo.jeecms.com:80/hhqw/311.jhtml" title="求职者告白聚美陈欧 直言刘惠璞尖酸刻薄" target="_blank">求职者告白聚美陈欧 直言刘惠璞</a></li>
          <li><a href="http://demo.jeecms.com:80/shehui/250.jhtml" title="河南一红会医院疑篡改病历掩盖患者死亡真相" target="_blank">河南一红会医院疑篡改病历掩盖患</a></li>
          <li><a href="http://demo2.jeecms.com:80/system/789.jhtml" title="谷歌浏览器" target="_blank">谷歌浏览器</a></li>
          <li><a href="http://demo.jeecms.com:80/hhqw/210.jhtml" title="jeecms视频教程" target="_blank">jeecms视频教程</a></li>
          <li><a href="http://demo.jeecms.com:80/cjbd/259.jhtml" title="小米手机今日开放购买：3小时10万库存售罄" target="_blank">小米手机今日开放购买：3小时10</a></li>
          <li><a href="http://demo.jeecms.com:80/gnxw/39.jhtml" title="婚姻登记信息5年内全国联网 北京等3地今年试点" target="_blank">婚姻登记信息5年内全国联网 北京</a></li>
          <li><a href="http://demo.jeecms.com:80/wyty/339.jhtml" title="周渝民小小彬温情携手《新天生一对》" target="_blank">周渝民小小彬温情携手《新天生一</a></li>
          <li><a href="http://demo.jeecms.com:80/dong/327.jhtml" title="足球宝贝徐冬冬海边写真 湿身展无限魅力" target="_blank">足球宝贝徐冬冬海边写真 湿身展</a></li>
          <li><a href="http://demo.jeecms.com:80/syzs/336.jhtml" title="迅雷7" target="_blank">迅雷7</a></li>
          <li><a href="http://demo.jeecms.com:80/phone/295.jhtml" title="LG P970（Optimus Black）" target="_blank">LG P970（Optimus Black）</a></li>
        </ul>
      </div>
      <!--本周热门资讯排行_End-->
      <h2>精彩专题</h2>
      <div class="w98"> 
        <dl class="list line box">
            <dt><a href="/topic/2.jspx" target="_blank">上海世博会专题</a></dt>
          <dd class="pic"><a href="/topic/2.jspx"><img src="http://xwcb.eastday.com/c/20061116/images/00033531.jpg"/></a></dd>
          <dd class="text">人类文明的盛会，我们大家的世博，精彩开篇，“满月”有余。随...</dd>
        </dl>
        <dl class="list mt5 box">
            <dt><a href="/topic/1.jspx" target="_blank">2010年南非世界杯</a></dt>
          <dd class="pic"><a href="/topic/1.jspx"><img src="http://a2.att.hudong.com/08/61/01300000406647124377613651616.jpg"/></a></dd>
          <dd class="text">2010年世界杯将在南非约翰内斯堡拉开帷幕，32路豪强将在一个月...</dd>
        </dl>
         </div>
    </div>
    <div class="rb_right_low"></div>
    <!--相关文章_End-->
  </div>
</div>
<!--cjbd_end-->
</div>
<div id="wrapper">
<dl class="hotlink">
  <dt>友情链接:</dt>
    <dd><a href="http://www.jeecms.com" onclick="$.get('/friendlink_view.jspx?id=1')" target="_blank">JEECMS官网</a></dd>
  <dd><a href="http://bbs.jeecms.com" onclick="$.get('/friendlink_view.jspx?id=2')" target="_blank">JEEBBS论坛</a></dd>
  <dd><a href="http://www.360buy.com/" onclick="$.get('/friendlink_view.jspx?id=3')" target="_blank">京东商城</a></dd>
  <dd><a href="http://www.dangdang.com/" onclick="$.get('/friendlink_view.jspx?id=4')" target="_blank">当当网</a></dd>
  <dd><a href="http://www.amazon.cn/" onclick="$.get('/friendlink_view.jspx?id=5')" target="_blank">亚马逊</a></dd>
  <dd><a href="http://www.ihush.com/" onclick="$.get('/friendlink_view.jspx?id=6')" target="_blank">ihush</a></dd>
  <dd><a href="http://temai.dazhe.cn" onclick="$.get('/friendlink_view.jspx?id=7')" target="_blank">名品打折</a></dd>
  <dd><a href="http://temai.dazhe.cn" onclick="$.get('/friendlink_view.jspx?id=8')" target="_blank">优品</a></dd>
</dl>
<%@ include file="/view/auth/portal/foot.jsp" %>

</div>
</body>
</html>