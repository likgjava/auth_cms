<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/view/auth/portal/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="x-ua-compatible" content="ie=7" /> 
<title>新闻 - JEECMS主站 - Powered by JEECMS</title>
<%@ include file="/view/auth/portal/init.jsp" %>

<link rel="stylesheet" href="${initPath}/view/resource/skin/css/front.css" />
<link rel="stylesheet" href="${initPath}/view/resource/skin/css/layout.css" />
<link rel="stylesheet" href="${initPath}/view/resource/skin/css/style.css" />

<script src="/view/resource/plug_in/jquery/imgplayer/imgplayer-1.3.js"></script>

<script>
$(document).ready(function() {
	//初始化跑马灯
	$("#imgplayer").player({
		width: '367px',
		height: '263px'
	}).play();
});
</script>
</head>

<body>
<%@ include file="/view/auth/portal/top.jsp" %>
<%@ include file="/view/auth/portal/navgaitor.jsp" %>

<div id="wrapper">
<!-- 跑马灯 start -->
<div class="news-focus fl mr10">
	<div id="imgplayer" style="margin-left:auto;margin-right:auto;display:none;">
		<a href="http://blog.csdn.net/xxd851116" target="_blank" title="许晴留恋伦敦街头"><img src="/data/temp/1.jpg" /></a>
		<a href="http://blog.csdn.net/xxd851116" target="_blank" title="体验伦敦人的生活方式"><img src="/data/temp/2.jpg" /></a>
		<a href="http://blog.csdn.net/xxd851116" target="_blank" title="田园午后许晴性感妖娆"><img src="/data/temp/3.jpg" /></a>
	</div>
</div>
<!-- 跑马灯 end -->
<!-- 最新新闻 start -->
<div class="new-news fl">
	<div class="new-newscon"> 
		<div class="topnews">
			<c:forEach var="newsestArticle" items="${newsestArticleList}" end="0">
			<h3><a href="javascript:" onclick="common.toArticleDetail('${newsestArticle.objId}')">${newsestArticle.title }</a></h3>
			<p><c:choose><c:when test="${fn:length(newsestArticle.abstracts) > 50}">${fn:substring(newsestArticle.abstracts,0,49)}...</c:when><c:otherwise>${newsestArticle.abstracts }</c:otherwise></c:choose><a href="javascript:" onclick="common.toArticleDetail('${newsestArticle.objId}')">[详细]</a></p>
			</c:forEach>
		</div>
		<ul class="top-ul">
			<c:forEach var="newsestArticle" items="${newsestArticleList}" begin="1">
			<li><a href="javascript:" onclick="common.toArticleDetail('${newsestArticle.objId}')">${newsestArticle.title }</a></li>
			</c:forEach>
		</ul>
	</div>
</div>
<!-- 最新新闻 end -->
     <div class="news-rgslide fr">
     	  <div class="news-t"><h1>资讯排行榜</h1></div>
          <ul class="news-ph">
                  <li><a href="http://demo.jeecms.com:80/shehui/250.jhtml" title="河南一红会医院疑篡改病历掩盖患者死亡真相" target="_blank">河南一红会医院疑篡改病历掩盖患</a></li>
                  <li><a href="http://demo.jeecms.com:80/gnxw/39.jhtml" title="婚姻登记信息5年内全国联网 北京等3地今年试点" target="_blank">婚姻登记信息5年内全国联网 北京</a></li>
                  <li><a href="http://demo.jeecms.com:80/gnxw/249.jhtml" title="南京排水管理处原副处长受贿130万获刑逾十年" target="_blank">南京排水管理处原副处长受贿130</a></li>
                  <li><a href="http://demo.jeecms.com:80/cjbd/259.jhtml" title="小米手机今日开放购买：3小时10万库存售罄" target="_blank">小米手机今日开放购买：3小时10</a></li>
                  <li><a href="http://demo.jeecms.com:80/gnxw/34.jhtml" title="我国有望后年发射火星探测器" target="_blank">我国有望后年发射火星探测器</a></li>
                  <li><a href="http://demo.jeecms.com:80/shehui/248.jhtml" title="海南万宁大桥坍塌事件3责任人涉嫌渎职被公诉" target="_blank">海南万宁大桥坍塌事件3责任人涉</a></li>
                  <li><a href="http://demo.jeecms.com:80/world/237.jhtml" title="数万名巴基斯坦人举行大规模反北约美国集会" target="_blank">数万名巴基斯坦人举行大规模反北</a></li>
                  <li><a href="http://demo.jeecms.com:80/shehui/188.jhtml" title="世界各地迎接2011新年" target="_blank">世界各地迎接2011新年</a></li>
                  <li><a href="http://demo.jeecms.com:80/shehui/247.jhtml" title="新生代农民工：文化市场与公共服务的夹心层" target="_blank">新生代农民工：文化市场与公共服</a></li>
           </ul>
     </div> 
     <div class="clear"></div>
</div>
<div id="wrapper">
<!-- 国内新闻 start -->
<div class="w367 fl h259 mr5">
	<div class="news-t">
		<h1><a href="/ArticleController.do?method=toNewsListView&channelId=C0101" target="_blank">国内新闻</a></h1>
	</div>
	<div class="news-mkcon">
		<dl>
			<c:forEach var="newsestArticle" items="${guoneiArticleList}" end="0">
			<dt><a href="javascript:" onclick="common.toArticleDetail('${newsestArticle.objId}')">${newsestArticle.title }</a></dt>
			<dd class="news-pic"><a href="javascript:" onclick="common.toArticleDetail('${newsestArticle.objId}')"><img src="/u/cms/www/201112/19090143y6m0.jpg" /></a></dd>
			<dd class="news-txt"><c:choose><c:when test="${fn:length(newsestArticle.abstracts) > 30}">${fn:substring(newsestArticle.abstracts,0,29)}...</c:when><c:otherwise>${newsestArticle.abstracts }</c:otherwise></c:choose></dd>
			</c:forEach>
		</dl>
		<ul class="news-ul">
			<c:forEach var="newsestArticle" items="${guoneiArticleList}" begin="1">
			<li><a href="javascript:" onclick="common.toArticleDetail('${newsestArticle.objId}')">${newsestArticle.title }</a></li>
			</c:forEach>
		</ul>
	</div>
</div>
<!-- 国内新闻 end -->
<!-- 国际新闻 start -->
<div class="w364 fl h259">
	<div class="news-t">
		<h1><a href="http://demo.jeecms.com:80/gnxw/index.jhtml" target="_blank" >国际新闻</a></h1>
	</div>
	<div class="news-mkcon">
		<dl>
			<c:forEach var="newsestArticle" items="${guojiArticleList}" end="0">
			<dt><a href="javascript:" onclick="common.toArticleDetail('${newsestArticle.objId}')">${newsestArticle.title }</a></dt>
			<dd class="news-pic"><a href="javascript:" onclick="common.toArticleDetail('${newsestArticle.objId}')"><img src="/u/cms/www/201112/19090143y6m0.jpg" /></a></dd>
			<dd class="news-txt"><c:choose><c:when test="${fn:length(newsestArticle.abstracts) > 30}">${fn:substring(newsestArticle.abstracts,0,29)}...</c:when><c:otherwise>${newsestArticle.abstracts }</c:otherwise></c:choose></dd>
			</c:forEach>
		</dl>
		<ul class="news-ul">
			<c:forEach var="newsestArticle" items="${guojiArticleList}" begin="1">
			<li><a href="javascript:" onclick="common.toArticleDetail('${newsestArticle.objId}')">${newsestArticle.title }</a></li>
			</c:forEach>
		</ul>
	</div>
</div>
<!-- 国际新闻 end -->
     <div class="w228 fr h259">
     	  <div class="news-t">
              <h1>
                        <a href="http://demo.jeecms.com:80/jjsd/index.jhtml" target="_blank" >基金视点</a>
              </h1>
          </div>
     	  <div class="jjsd-con">
          	   <div class="jjsd-img">
                  <a href="http://demo.jeecms.com:80/jjsd/228.jhtml" title="中小基金公司首批专户放行 实际运作比预期快" target="_blank"><img src="/u/cms/www/201112/190837201odl.jpg" alt="中小基金公司首批专户放行 实际运作比预期快"  width="212" height="77" /></a> 
               </div>
                <ul class="news-ul">
              	  <li><a href="http://demo.jeecms.com:80/jjsd/233.jhtml" title="2011躁动的人才流动 基金法修订能否带来曙光" target="_blank">2011躁动的人才流动 基</a></li>
              	  <li><a href="http://demo.jeecms.com:80/jjsd/232.jhtml" title="年末基金“意外”收获 新基金销售井喷" target="_blank">年末基金“意外”收获 </a></li>
              	  <li><a href="http://demo.jeecms.com:80/jjsd/231.jhtml" title="上市指基交投两极分化 入围两融标的成分水岭" target="_blank">上市指基交投两极分化 </a></li>
              	  <li><a href="http://demo.jeecms.com:80/jjsd/230.jhtml" title="指数现“十年轮回” 基民对待“抄底”仍谨慎" target="_blank">指数现“十年轮回” 基</a></li>
              	  <li><a href="http://demo.jeecms.com:80/jjsd/229.jhtml" title="RQFII启动 200亿背后存6000亿庞大“主力军”" target="_blank">RQFII启动 200亿背后存6</a></li>
              </ul>
          </div>
     </div>
     <div class="clear"></div>
</div>
<div id="wrapper">
	 <div class="news3-lf fl">
     	 <div class="newspic">
          	   <div class="news-t">
                  <h1>
                         图片新闻
                  </h1>
               </div>
               <div class="piccon">


<div id="roll-ad0c37bfd3be473d98097ec1ebd9950d" style="width:100%;overflow:hidden;white-space:nowrap;" onmouseover="clearInterval(prollad0c37bfd3be473d98097ec1ebd9950d.pevent)" onmouseout="prollad0c37bfd3be473d98097ec1ebd9950d.pevent=setInterval(function(){prollad0c37bfd3be473d98097ec1ebd9950d.roll.call(prollad0c37bfd3be473d98097ec1ebd9950d)},prollad0c37bfd3be473d98097ec1ebd9950d.speed)">
	<table width="100%" align="left" cellpadding="0" cellspacing="0" border="0"><tr>
	<td id="roll-orig-ad0c37bfd3be473d98097ec1ebd9950d">
		<table width="100%" cellpadding="0" cellspacing="0" border="0"><tr>
<td valign="middle">
<dl style="margin:0;padding:0;width:130%;height:110px;padding-right:15px;text-align:center;">
	<dd style="margin-left:0;"><a href="http://demo.jeecms.com:80/photo/187.jhtml" title="农场上的狂欢：欧洲最大的音乐节"><img src="http://img1.cache.netease.com/cnews/2010/7/1/20100701105023f6a14.jpg" alt="农场上的狂欢：欧洲最大的音乐节" border="0"/></a></dd>
	<dt style="padding:0 3px;"><a href="http://demo.jeecms.com:80/photo/187.jhtml" title="农场上的狂欢：欧洲最大的音乐节">		<span style="">欧洲最大的音乐节</span></a></dt>
</dl>
</td>
<td valign="middle">
<dl style="margin:0;padding:0;width:130%;height:110px;padding-right:15px;text-align:center;">
	<dd style="margin-left:0;"><a href="http://demo.jeecms.com:80/photo/186.jhtml" title="谎言：日本科研捕鲸"><img src="http://img1.cache.netease.com/cnews/2010/6/30/201006301150090b875.jpg" alt="谎言：日本科研捕鲸" border="0"/></a></dd>
	<dt style="padding:0 3px;"><a href="http://demo.jeecms.com:80/photo/186.jhtml" title="谎言：日本科研捕鲸">		<span style="">谎言：日本科研捕鲸</span></a></dt>
</dl>
</td>
<td valign="middle">
<dl style="margin:0;padding:0;width:130%;height:110px;padding-right:15px;text-align:center;">
	<dd style="margin-left:0;"><a href="http://demo.jeecms.com:80/photo/185.jhtml" title="首位机器宇航员将服役"><img src="http://img1.cache.netease.com/cnews/2010/8/13/2010081315365844b74.jpg" alt="首位机器宇航员将服役" border="0"/></a></dd>
	<dt style="padding:0 3px;"><a href="http://demo.jeecms.com:80/photo/185.jhtml" title="首位机器宇航员将服役">		<span style="">首位机器宇航员将服役</span></a></dt>
</dl>
</td>
<td valign="middle">
<dl style="margin:0;padding:0;width:130%;height:110px;padding-right:15px;text-align:center;">
	<dd style="margin-left:0;"><a href="http://demo.jeecms.com:80/photo/184.jhtml" title="印尼海底发现新物种"><img src="http://img2.cache.netease.com/cnews/2010/8/30/2010083015190967339.jpg" alt="印尼海底发现新物种" border="0"/></a></dd>
	<dt style="padding:0 3px;"><a href="http://demo.jeecms.com:80/photo/184.jhtml" title="印尼海底发现新物种">		<span style="">印尼海底发现新物种</span></a></dt>
</dl>
</td>
<td valign="middle">
<dl style="margin:0;padding:0;width:130%;height:110px;padding-right:15px;text-align:center;">
	<dd style="margin-left:0;"><a href="http://demo.jeecms.com:80/photo/183.jhtml" title="艺术家创石头平衡术"><img src="http://img2.cache.netease.com/cnews/2010/9/16/201009161706524bdbc.jpg" alt="艺术家创石头平衡术" border="0"/></a></dd>
	<dt style="padding:0 3px;"><a href="http://demo.jeecms.com:80/photo/183.jhtml" title="艺术家创石头平衡术">		<span style="">艺术家创石头平衡术</span></a></dt>
</dl>
</td>
		</tr></table>
	</td>
	<td id="roll-copy-ad0c37bfd3be473d98097ec1ebd9950d"></td>
	</tr></table>
</div>
<script type="text/javascript">
var prollad0c37bfd3be473d98097ec1ebd9950d=new Cms.LeftRoller("ad0c37bfd3be473d98097ec1ebd9950d",20,1);
</script>

               </div>
         </div>
         <div class="w367 fl h259 mr5">
             <div class="news-t">
                  <h1>
                            <a href="http://demo.jeecms.com:80/shehui/index.jhtml" target="_blank" >社会热点</a>
                  </h1>
              </div>
              <div class="news-mkcon">
                   <dl>
                      <dt><a href="http://demo.jeecms.com:80/shehui/250.jhtml" title="河南一红会医院疑篡改病历掩盖患者死亡真相" target="_blank">河南一红会医院疑篡...</a></dt>
                      <dd class="news-pic"><a href="http://demo.jeecms.com:80/shehui/250.jhtml" title="河南一红会医院疑篡改病历掩盖患者死亡真相" target="_blank"><img src="/u/cms/www/201112/19090946s78x.jpg" alt="河南一红会医院疑篡改病历掩盖患者死亡真相" /></a></dd>
                      <dd class="news-txt">新郑市新村镇村民邓永杰2009年3月20日患“溃疡性结肠炎”入住新郑红十字会肛肠医院...</dd>
                   </dl>
                   <ul class="news-ul">
                      <li><a href="http://demo.jeecms.com:80/shehui/248.jhtml" title="海南万宁大桥坍塌事件3责任人涉嫌渎职被公诉" target="_blank">海南万宁大桥坍塌事件3责任人涉嫌渎职被公诉</a></li>
                      <li><a href="http://demo.jeecms.com:80/shehui/247.jhtml" title="新生代农民工：文化市场与公共服务的夹心层" target="_blank">新生代农民工：文化市场与公共服务的夹心层</a></li>
                      <li><a href="http://demo.jeecms.com:80/shehui/246.jhtml" title="兰州金河煤矿发生冒顶事故 4人获救2人死亡" target="_blank">兰州金河煤矿发生冒顶事故 4人获救2人死亡</a></li>
                      <li><a href="http://demo.jeecms.com:80/shehui/62.jhtml" title="深圳保障房跨年丑闻，谁该脸红" target="_blank">深圳保障房跨年丑闻，谁该脸红</a></li>
                      <li><a href="http://demo.jeecms.com:80/shehui/61.jhtml" title="屠宰场视频曝生猪注水 被拍方称遭诬陷" target="_blank">屠宰场视频曝生猪注水 被拍方称遭诬陷</a></li>
                  </ul>
              </div>
         </div>
         <div class="w364 fl h259">
               <div class="news-t">
                  <h1>
                            <a href="http://demo.jeecms.com:80/review/index.jhtml" target="_blank" >时事评论</a>
                  </h1>
              </div>
              <div class="news-mkcon">
                   <dl>
                      <dt><a href="http://demo.jeecms.com:80/review/243.jhtml" title="中国语文教育已经到了最危险的时刻" target="_blank">中国语文教育已经到...</a></dt>
                      <dd class="news-pic"><a href="http://demo.jeecms.com:80/review/243.jhtml" title="中国语文教育已经到了最危险的时刻" target="_blank"><img src="/u/cms/www/201112/19090536qbxp.jpg" alt="中国语文教育已经到了最危险的时刻" /></a></dd>
                      <dd class="news-txt">廖增湖还有个身份——作家。在圈子里，他笔名叶开，素来以阅读面宽阔文章不落俗套著...</dd>
                   </dl>
                   <ul class="news-ul">
                      <li><a href="http://demo.jeecms.com:80/review/245.jhtml" title="足坛反赌案铁岭正式开审 张建强首个出庭受审" target="_blank">足坛反赌案铁岭正式开审 张建强首个出庭受审</a></li>
                      <li><a href="http://demo.jeecms.com:80/review/244.jhtml" title="电信联通申请中止垄断调查 “余额不退”遭疑" target="_blank">电信联通申请中止垄断调查 “余额不退”遭疑</a></li>
                      <li><a href="http://demo.jeecms.com:80/review/242.jhtml" title="媒体称珠三角部分外向型企业因成本上升关停" target="_blank">媒体称珠三角部分外向型企业因成本上升关停</a></li>
                      <li><a href="http://demo.jeecms.com:80/review/241.jhtml" title="白蚁围攻广州四座大桥 海珠桥防震枕木几被掏空" target="_blank">白蚁围攻广州四座大桥 海珠桥防震枕木几被掏空</a></li>
                      <li><a href="http://demo.jeecms.com:80/review/66.jhtml" title="叶檀：警惕以城市化名义剥夺农民土地红利 " target="_blank">叶檀：警惕以城市化名义剥夺农民土地红利 </a></li>
                  </ul>
              </div>
              </div> 
          <div class="clear"></div> 
       </div>
     <div class="news3-rg fr">
     	  <div class="news-t">
            <h1>
                            <a href="http://demo.jeecms.com:80/cjbd/index.jhtml" target="_blank" >财经报道</a>
             </h1>
          </div>
          <div class="jjsd-con">
          	    <div class="jjsd-img">
                  <a href="http://demo.jeecms.com:80/cjbd/254.jhtml" title="中华首款SUV中华V5到店实拍" target="_blank"><img src="/u/cms/www/201112/190922058498.jpg" alt="中华首款SUV中华V5到店实拍"  width="212" height="91" /></a> 
               </div>
                  <ul class="news-ul">
                          <li><a href="http://demo.jeecms.com:80/cjbd/259.jhtml" title="小米手机今日开放购买：3小时10万库存售罄" target="_blank">小米手机今日开放购买：</a></li>
                          <li><a href="http://demo.jeecms.com:80/cjbd/258.jhtml" title="跨国车企巨头揽本土高管 撤回“外脑”" target="_blank">跨国车企巨头揽本土高管</a></li>
                          <li><a href="http://demo.jeecms.com:80/cjbd/257.jhtml" title="康菲石油食言 称无证据显示渤海溢油致环境污染" target="_blank">康菲石油食言 称无证据</a></li>
                          <li><a href="http://demo.jeecms.com:80/cjbd/256.jhtml" title="年底最保值手机搜罗 1.5GHz双核2000元" target="_blank">年底最保值手机搜罗 1.5</a></li>
                          <li><a href="http://demo.jeecms.com:80/cjbd/255.jhtml" title="圣诞节新品笔记本导购 联想Y470p领衔" target="_blank">圣诞节新品笔记本导购 </a></li>
                          <li><a href="http://demo.jeecms.com:80/cjbd/253.jhtml" title="星河湾上海两项目降价 称拿6亿为老业主补差" target="_blank">星河湾上海两项目降价 </a></li>
                          <li><a href="http://demo.jeecms.com:80/cjbd/252.jhtml" title="北京：2012限购不会松绑 保障房将“以租为主”" target="_blank">北京：2012限购不会松绑</a></li>
                          <li><a href="http://demo.jeecms.com:80/cjbd/251.jhtml" title="星河湾降价6亿补偿老业主 业内称破坏市场规律" target="_blank">星河湾降价6亿补偿老业</a></li>
                          <li><a href="http://demo.jeecms.com:80/cjbd/117.jhtml" title="百姓网王建硕：分类网站关键在于规模化服务" target="_blank">百姓网王建硕：分类网站</a></li>
                          <li><a href="http://demo.jeecms.com:80/cjbd/116.jhtml" title="大佬们的新年：李开复等回老家 李瑜三亚奇遇" target="_blank">大佬们的新年：李开复等</a></li>
                          <li><a href="http://demo.jeecms.com:80/cjbd/115.jhtml" title="传Facebook获高盛5亿美元投资 估值达500亿美元" target="_blank">传Facebook获高盛5亿美</a></li>
                          <li><a href="http://demo.jeecms.com:80/cjbd/112.jhtml" title="宇通客车总裁汤玉祥：不会拓展轿车业务" target="_blank">宇通客车总裁汤玉祥：不</a></li>
                  </ul>
          </div>
     </div>
     <div class="clear"></div>
</div>
<div id="wrapper">
<%@ include file="/view/auth/portal/hotlink.jsp" %>
<%@ include file="/view/auth/portal/foot.jsp" %>
</div>
</body>
</html>
