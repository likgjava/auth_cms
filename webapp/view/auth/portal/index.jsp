<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>首页 - JEECMS开发站 - Powered by JEECMS</title>
<%@ include file="/view/auth/portal/init.jsp" %>
<link href="${initPath}/view/resource/skin/css/front.css" type="text/css" rel="stylesheet" />
<link href="${initPath}/view/resource/skin/css/layout.css" rel="stylesheet" type="text/css"/>
<script src="${initPath}/view/resource/skin/js/front.js" type="text/javascript"></script>
<script src="${initPath}/view/resource/skin/js/common.js" type="text/javascript"></script>
<script type="text/javascript">
$(function() {
	//Cms.siteFlow("", location.href, document.referrer);
});
</script>
<script type="text/javascript"> 
function g(o){	
return document.getElementById(o);
}
function HoverLi(m,n,counter){	
	for(var i=1;i<=counter;i++){		
	g('tb_'+m+i).className='normaltab';		
	g('tbc_'+m+i).className='undis';
	}
	g('tbc_'+m+n).className='dis';	
	g('tb_'+m+n).className='curr';
}
</script>
</head>

<body>
<%@ include file="/view/auth/portal/top.jsp" %>
<%@ include file="/view/auth/portal/navgaitor.jsp" %>
<!--header_begin-->

<!--header_end-->

<div id="main">
<div class="page box">

<div class="w250 fl">
<!--焦点图片_begin-->
<div style="border:1px #d8d8d8 solid; padding:2px; height:236px !important; height:232px; margin-bottom:10px;">
<div style="float:left;">
	<div class="jdt">


<script type="text/javascript">
var width=244;var focus_height=215;var text_height=20;
var swf_height=focus_height+text_height;
var pics="";var links="";var texts="";
pics+="/u/cms/www/201112/191546459xk2.jpg|";
links+="/wyty/339.jhtml|";
texts+="周渝民小小彬温情携手《新天生一对》|";
pics+="/u/cms/www/201112/19154302hxkg.jpg|";
links+="/wyty/338.jhtml|";
texts+="海豚的故事-先行版预告片|";
pics+="/u/cms/www/201112/191047224mmx.jpg|";
links+="/hhqw/304.jhtml|";
texts+="刘子璇写真|";
pics+="/u/cms/www/201112/171415447op5.jpg|";
links+="/wyty/225.jhtml|";
texts+="演史上最长贺岁大片|";
pics+="/u/cms/www/201112/17141320s4xy.jpg|";
links+="/wyty/190.jhtml|";
texts+="2011岁末催泪大戏《倾城之泪》|";
pics=pics.substring(0,pics.length-1);
links=links.substring(0,links.length-1);
texts=texts.substring(0,texts.length-1);
document.write('<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" width="'+width+'" height="'+swf_height+'">');
document.write('<param name="movie" value="/r/cms/focus1.swf"/>');
document.write('<param name="quality" value="high"/><param name="bgcolor" value="#F0F0F0"/>');
document.write('<param name="menu" value="false"/><param name="wmode" value="opaque"/>');
document.write('<param name="FlashVars" value="pics='+pics+'&links='+links+'&texts='+texts+'&borderwidth='+width+'&borderheight='+focus_height+'&textheight='+text_height+'"/>');
document.write('<embed src="/r/cms/focus1.swf" width="'+width+'" height="'+swf_height+'" FlashVars="pics='+pics+'&links='+links+'&texts='+texts+'&borderwidth='+width+'&borderheight='+focus_height+'&textheight='+text_height+'" menu="false" wmode="opaque" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash"></embed>');
document.write('</object>');
</script>

	</div>
</div>	
</div>
<!--焦点图片_end-->
<!--精彩专题_begin-->
<div class="left_top2"><h2><a href="/topic.jspx" target="_blank">精彩专题</a></h2></div>
	<div class="rb_right_div">
		<dl class="list line box">
			<dt><a href="/topic/2.jspx" target="_blank">上海世博会专题</a></dt>
			<dd class="pic"><a href="/topic/2.jspx"><img src="http://xwcb.eastday.com/c/20061116/images/00033531.jpg"/></a></dd>
			<dd class="text">人类文明的盛会，我们大家的世博，精彩开篇，“满月”有余。随着上海世博...</dd>
		</dl>
		<dl class="list mt5 box">
			<dt><a href="/topic/1.jspx" target="_blank">2010年南非世界杯</a></dt>
			<dd class="pic"><a href="/topic/1.jspx"><img src="http://a2.att.hudong.com/08/61/01300000406647124377613651616.jpg"/></a></dd>
			<dd class="text">2010年世界杯将在南非约翰内斯堡拉开帷幕，32路豪强将在一个月的时间里，...</dd>
		</dl>
</div>
<!--精彩专题_end-->
</div>

<div class="w720 fr box">
<!--news_begin-->
<div class="fl">
<div style="background:url(/r/cms/www/red/img/lefttitle1_bg4.jpg); width:460px; height:33px;">
<span style="color:#2b4099; font-size:14px; font-weight:bold; line-height:33px; padding-left:25px;">新闻资讯</span>
</div>
<div class="fl" style="padding:5px; width:454px; border:1px #d8d8d8 solid; padding:2px;">
     <ul class="topnews w450 line">
		<li class="toptext">
		  <a href="/gnxw/39.jhtml" title="婚姻登记信息5年内全国联网 北京等3地今年试点" target="_blank"><h3>婚姻登记信息5年内全国联网 北京等3地今年试点</h3></a>
		  <p style="white-space:normal;">民政部日前召开婚姻登记规范化视频会议。会上透露，截至目前，全国多个省市婚登机关已实现婚姻登记网上预约、在线查询、婚姻档...</p>
		</li>
		
	  </ul>  
      <ul class="topnews">
		<li><span><a href="/shehui/index.jhtml" target="_blank">[社会热点]</a></span> <a href="/shehui/250.jhtml" title="河南一红会医院疑篡改病历掩盖患者死亡真相" target="_blank">河南一红会医院疑篡改病历掩盖患者死亡真相</a><em>12-19</em></li>
		<li><span><a href="/shehui/index.jhtml" target="_blank">[社会热点]</a></span> <a href="/shehui/248.jhtml" title="海南万宁大桥坍塌事件3责任人涉嫌渎职被公诉" target="_blank">海南万宁大桥坍塌事件3责任人涉嫌渎职被公诉</a><em>12-19</em></li>
		<li><span><a href="/shehui/index.jhtml" target="_blank">[社会热点]</a></span> <a href="/shehui/247.jhtml" title="新生代农民工：文化市场与公共服务的夹心层" target="_blank">新生代农民工：文化市场与公共服务的夹心层</a><em>12-19</em></li>
		<li><span><a href="/shehui/index.jhtml" target="_blank">[社会热点]</a></span> <a href="/shehui/246.jhtml" title="兰州金河煤矿发生冒顶事故 4人获救2人死亡" target="_blank">兰州金河煤矿发生冒顶事故 4人获救2人死亡</a><em>12-19</em></li>
		<li><span><a href="/shehui/index.jhtml" target="_blank">[社会热点]</a></span> <a href="/shehui/188.jhtml" title="世界各地迎接2011新年" target="_blank">世界各地迎接2011新年</a><em>01-04</em></li>
		<li><span><a href="/shehui/index.jhtml" target="_blank">[社会热点]</a></span> <a href="/shehui/62.jhtml" title="深圳保障房跨年丑闻，谁该脸红" target="_blank">深圳保障房跨年丑闻，谁该脸红</a><em>01-04</em></li>
	  </ul >
	</div>
</div>

<!--news_end-->

<!--资讯排行榜_begin-->
<div class="w250 fr">
 	<div class="rb_right_top"><h2><a href="#">资讯排行榜</a></h2></div>
	<div class="rb_right_div" style="height:247px;">
		<ul class="order">
		  <li><a href="/lqty/343.jhtml" title="篮球体育2" target="_blank">篮球体育2</a></li>
		  <li><a href="/lqty/342.jhtml" title="篮球体育1" target="_blank">篮球体育1</a></li>
		  <li><a href="/tyzx/349.jhtml" title="体育资讯3" target="_blank">体育资讯3</a></li>
		  <li><a href="/tyzx/348.jhtml" title="体育资讯2" target="_blank">体育资讯2</a></li>
		  <li><a href="/tyzx/347.jhtml" title="体育资讯1" target="_blank">体育资讯1</a></li>
		  <li><a href="/zqty/346.jhtml" title="足球体育3" target="_blank">足球体育3</a></li>
		  <li><a href="/zqty/345.jhtml" title="足球体育2" target="_blank">足球体育2</a></li>
		  <li><a href="/zqty/344.jhtml" title="足球体育1" target="_blank">足球体育1</a></li>
		  <li><a href="/sports/341.jhtml" title="体育新闻1" target="_blank">体育新闻1</a></li>
		  <li><a href="/wyty/339.jhtml" title="周渝民小小彬温情携手《新天生一对》" target="_blank">周渝民小小彬温情携手《新天生一</a></li>
		</ul>
	</div>
</div>
<!--资讯排行榜_end-->
</div>

<!--精彩图文_begin-->
<div class="w720 fr box">
<div style="background:url(/r/cms/www/red/img/lefttitle1_bg3.jpg); width:720px; height:33px; margin-top:10px;">
<span style="color:#2b4099; font-size:14px; font-weight:bold; line-height:33px; padding-left:25px;">精彩图文</span>
</div>
<div style="height:151px;">
  <ul class="jctw">	
        <li><a href="/whxy/303.jhtml" title="黄金之国加纳的酋长们" target="_blank"><img src="/u/cms/www/201112/191036587tik.jpg" alt="黄金之国加纳的酋长们" /></a><span><a href="/whxy/303.jhtml" title="黄金之国加纳的酋长们" target="_blank">黄金之国加纳的酋长们</a></span></li>
        <li><a href="/whxy/302.jhtml" title="不一样的美国生活方式" target="_blank"><img src="/u/cms/www/201112/19103403xlfg.jpg" alt="不一样的美国生活方式" /></a><span><a href="/whxy/302.jhtml" title="不一样的美国生活方式" target="_blank">不一样的美国生活方式</a></span></li>
        <li><a href="/whxy/301.jhtml" title="阜阳“天上人间”的有偿陪侍小姐" target="_blank"><img src="/u/cms/www/201112/19103035b3ll.jpg" alt="阜阳“天上人间”的有偿陪侍小姐" /></a><span><a href="/whxy/301.jhtml" title="阜阳“天上人间”的有偿陪侍小姐" target="_blank">阜阳“天上人间”的有</a></span></li>
        <li><a href="/whxy/300.jhtml" title="世界最疯狂的紧身胸衣" target="_blank"><img src="/u/cms/www/201112/19102719hx2v.jpg" alt="世界最疯狂的紧身胸衣" /></a><span><a href="/whxy/300.jhtml" title="世界最疯狂的紧身胸衣" target="_blank">世界最疯狂的紧身胸衣</a></span></li>
  </ul>
</div>
</div>
<!--精彩图文_end-->
<img src="/r/cms/www/red/img/banner2.jpg" style="margin:10px 0px 10px 0px;"/>
<!--下载_begin-->
<div class="w720 fl box">

<div class="w355 fr" style="margin-bottom:5px;">
	<div class="left_top box">
      <h2><a href="/download/index.jhtml" target="_blank">下载</a></h2>
    </div>
    
	  <div class="left_div box">
      <div class="mt5">
        <ul class="list w355">
          <li class="toptext">
		  <a href="/syzs/337.jhtml" title="多玩YY" target="_blank"><h3>多玩YY</h3></a>
		  <p>YY4.0是多玩YY语音的全新版本，活动中心盛大起航，汇集YY上最好最优质的频道和活动，提供YY上最有价值的...</p>
		  </li>
          <li><span><a href="/syzs/index.jhtml" target="_blank">[实用助手]</a></span> <a href="/syzs/336.jhtml" title="迅雷7" target="_blank">迅雷7</a></li>
          <li><span><a href="/syzs/index.jhtml" target="_blank">[实用助手]</a></span> <a href="/syzs/335.jhtml" title="有道词典" target="_blank">有道词典</a></li>
          <li><span><a href="/syzs/index.jhtml" target="_blank">[实用助手]</a></span> <a href="/syzs/334.jhtml" title="搜狗拼音输入" target="_blank">搜狗拼音输入</a></li>
          <li><span><a href="/system/index.jhtml" target="_blank">[系统软件]</a></span> <a href="/system/333.jhtml" title="酷狗音乐" target="_blank">酷狗音乐</a></li>
          <li><span><a href="/media/index.jhtml" target="_blank">[媒体工具]</a></span> <a href="/media/332.jhtml" title="风行网络电影" target="_blank">风行网络电影</a></li>
          <li><span><a href="/media/index.jhtml" target="_blank">[媒体工具]</a></span> <a href="/media/331.jhtml" title="腾讯QQ " target="_blank">腾讯QQ </a></li>
        </ul>
      </div>	
    </div>
    <div class="left_low"></div>
</div>

<div class="w355 fl" style="margin-right:8px; margin-bottom:5px;">
    <div class="left_top box">
      <h2><a href="/cjbd/index.jhtml" target="_blank">财经报道</a></h2>
	</div> 
	
<div class="left_div box">
      <div class="pr10 mt5">
        <ul class="list w355">
          <li class="toptext">
		  <a href="/cjbd/259.jhtml" title="小米手机今日开放购买：3小时10万库存售罄" target="_blank"><h3>小米手机今日开放购买：3小时10万库存售罄</h3></a>
		  <p>12月18日消息，小米手机今日正式开放销售，不过，在宣布开放销售仅仅3个小时后，小米官方腾讯微博发布公...</p>
		  </li>
          <li><span><a href="/cjbd/index.jhtml" target="_blank">[财经报道]</a></span> <a href="/cjbd/258.jhtml" title="跨国车企巨头揽本土高管 撤回“外脑”" target="_blank">跨国车企巨头揽本土高管 撤回“外脑”</a></li>
          <li><span><a href="/cjbd/index.jhtml" target="_blank">[财经报道]</a></span> <a href="/cjbd/257.jhtml" title="康菲石油食言 称无证据显示渤海溢油致环境污染" target="_blank">康菲石油食言 称无证据显示渤海溢油致环...</a></li>
          <li><span><a href="/cjbd/index.jhtml" target="_blank">[财经报道]</a></span> <a href="/cjbd/256.jhtml" title="年底最保值手机搜罗 1.5GHz双核2000元" target="_blank">年底最保值手机搜罗 1.5GHz双核2000元</a></li>
          <li><span><a href="/cjbd/index.jhtml" target="_blank">[财经报道]</a></span> <a href="/cjbd/255.jhtml" title="圣诞节新品笔记本导购 联想Y470p领衔" target="_blank">圣诞节新品笔记本导购 联想Y470p领衔</a></li>
          <li><span><a href="/cjbd/index.jhtml" target="_blank">[财经报道]</a></span> <a href="/cjbd/254.jhtml" title="中华首款SUV中华V5到店实拍" target="_blank">中华首款SUV中华V5到店实拍</a></li>
          <li><span><a href="/cjbd/index.jhtml" target="_blank">[财经报道]</a></span> <a href="/cjbd/253.jhtml" title="星河湾上海两项目降价 称拿6亿为老业主补差" target="_blank">星河湾上海两项目降价 称拿6亿为老业主补差</a></li>
        </ul>
      </div>
	  </div>
	  <div class="left_low"></div>
</div>

</div>	
<div class="w250 fr">
 	<div class="blue_right_top"><h2><a href="#">网友投票</a></h2></div>
	<div class="blue_right_div" style="height:249px !important;height:245px;">
	<div class="rmpl">
<form name="votes" action="/vote.jspx" method="post" target="_blank">
  <table width="100%" border="0" cellspacing="5" cellpadding="0">
    <tr>
      <td height="30" colspan="2" align="left">您为什么选择jsp cms,java cms? 
        <input type="hidden" name="voteId" value="1"/></td>
    </tr>
    <tr>
      <td width="9%" height="20" align="center"><input type="checkbox" name="itemIds" value="1" onClick="check_votes(3)" id="1"/></td>
      <td width="91%" align="left">基于java技术，安全稳定，易扩展</td>
    </tr>
    <tr>
      <td width="9%" height="20" align="center"><input type="checkbox" name="itemIds" value="4" onClick="check_votes(3)" id="4"/></td>
      <td width="91%" align="left">jsp是未来发展的趋势</td>
    </tr>
    <tr>
      <td width="9%" height="20" align="center"><input type="checkbox" name="itemIds" value="5" onClick="check_votes(3)" id="5"/></td>
      <td width="91%" align="left">java执行速度快，性能优良</td>
    </tr>
    <tr>
      <td width="9%" height="20" align="center"><input type="checkbox" name="itemIds" value="6" onClick="check_votes(3)" id="6"/></td>
      <td width="91%" align="left">跨平台，支持windows、linux、unix</td>
    </tr>
    <tr>
      <td width="9%" height="20" align="center"><input type="checkbox" name="itemIds" value="7" onClick="check_votes(3)" id="7"/></td>
      <td width="91%" align="left">学习研究</td>
    </tr>
    <tr>
      <td width="9%" height="20" align="center"><input type="checkbox" name="itemIds" value="8" onClick="check_votes(3)" id="8"/></td>
      <td width="91%" align="left">其它</td>
    </tr>
    <tr>
      <td height="35" colspan="2" align="center"><input type="submit" value="投 票" onClick="return check_votes(3)"/>
      &nbsp; <a href="/vote_result.jspx?voteId=1" target="_blank">查看投票结果</a> </td>
    </tr>
  </table>
</form>
	</div>
	</div>
	<div class="pink_right_low"></div>
	
</div>
<!--下载_end-->
<img src="/r/cms/www/red/img/banner2.jpg"/>
<div class="w720 fl box mt10">
<!--cjbd_begin-->
<div class="w355 fl" style="margin-right:8px; margin-bottom:5px;">
    <div class="left_top box">
      <h2><a href="/works/index.jhtml" target="_blank">作品</a></h2>
	</div> 
	
<div class="left_div box">
      <div class="pr10 mt5">
        <ul class="list w355">
          <li class="toptext">
		  <a href="/dong/327.jhtml" title="足球宝贝徐冬冬海边写真 湿身展无限魅力" target="_blank"><h3>足球宝贝徐冬冬海边写真 湿身展无限魅力</h3></a>
		  <p>足球宝贝徐冬冬海边写真 湿身展无限魅力足球宝贝徐冬冬海边写真 湿身展无限魅力足球宝贝徐冬冬海边写真 ...</p>
		  </li>
          <li><span><a href="/tiankong/index.jhtml" target="_blank">[蓝天白云绿地]</a></span> <a href="/tiankong/325.jhtml" title="AC米兰球星出席圣诞晚会，帅哥美女云集" target="_blank">AC米兰球星出席圣诞晚会，帅哥美女云集</a></li>
          <li><span><a href="/tiankong/index.jhtml" target="_blank">[蓝天白云绿地]</a></span> <a href="/tiankong/324.jhtml" title="爨底下村私家写真" target="_blank">爨底下村私家写真</a></li>
          <li><span><a href="/tiankong/index.jhtml" target="_blank">[蓝天白云绿地]</a></span> <a href="/tiankong/323.jhtml" title="柳岩红黑诱惑大片写真" target="_blank">柳岩红黑诱惑大片写真</a></li>
          <li><span><a href="/tiankong/index.jhtml" target="_blank">[蓝天白云绿地]</a></span> <a href="/tiankong/322.jhtml" title="美国旧金山圣诞老人大聚会" target="_blank">美国旧金山圣诞老人大聚会</a></li>
        </ul>
      </div>
	  </div>
	  <div class="left_low"></div>
</div>		  
	
<div class="w355 fr" style="margin-bottom:5px;">
	<div class="left_top box">
      <h2><a href="/product/index.jhtml" target="_blank">产品</a></h2>
    </div>
    
	  <div class="left_div box">
      <div class="mt5">
        <ul class="list w355">
          <li class="toptext">
		  <a href="/phone/295.jhtml" title="LG P970（Optimus Black）" target="_blank"><h3>LG P970（Optimus Black）</h3></a>
		  <p> LG P970也拥有着直板触控造型设计，简洁的外形方面有着不错的时尚感表现。在其正面为一块4.0英寸大小的N...</p>
		  </li>
          <li><span><a href="/phone/index.jhtml" target="_blank">[手机]</a></span> <a href="/phone/292.jhtml" title="小米M1（MIUI） " target="_blank">小米M1（MIUI） </a></li>
          <li><span><a href="/phone/index.jhtml" target="_blank">[手机]</a></span> <a href="/phone/291.jhtml" title="魅族MX（16GB)" target="_blank">魅族MX（16GB)</a></li>
          <li><span><a href="/phone/index.jhtml" target="_blank">[手机]</a></span> <a href="/phone/290.jhtml" title="魅族M9（8GB)" target="_blank">魅族M9（8GB)</a></li>
          <li><span><a href="/phone/index.jhtml" target="_blank">[手机]</a></span> <a href="/phone/289.jhtml" title="天语阿里云" target="_blank">天语阿里云</a></li>
        </ul>
      </div>	
    </div>
    <div class="left_low"></div>
</div>

<div class="w355 fl" style="margin-right:8px;margin-bottom:5px;">
    <div class="left_top box">
      <h2><a href="/shehui/index.jhtml" target="_blank">社会热点</a></h2>
	</div> 
	
	<div class="left_div box">
      <div class="pr10 mt5">
        <ul class="list w355">
          <li class="toptext">
		  <a href="/shehui/250.jhtml" title="河南一红会医院疑篡改病历掩盖患者死亡真相" target="_blank"><h3>河南一红会医院疑篡改病历掩盖患者死亡真相</h3></a>
		  <p>新郑市新村镇村民邓永杰2009年3月20日患“溃疡性结肠炎”入住新郑红十字会肛肠医院治疗，后病情发展，转...</p>
		  </li>
          <li><span><a href="/shehui/index.jhtml" target="_blank">[社会热点]</a></span> <a href="/shehui/248.jhtml" title="海南万宁大桥坍塌事件3责任人涉嫌渎职被公诉" target="_blank">海南万宁大桥坍塌事件3责任人涉嫌渎职被公诉</a></li>
          <li><span><a href="/shehui/index.jhtml" target="_blank">[社会热点]</a></span> <a href="/shehui/247.jhtml" title="新生代农民工：文化市场与公共服务的夹心层" target="_blank">新生代农民工：文化市场与公共服务的夹心层</a></li>
          <li><span><a href="/shehui/index.jhtml" target="_blank">[社会热点]</a></span> <a href="/shehui/246.jhtml" title="兰州金河煤矿发生冒顶事故 4人获救2人死亡" target="_blank">兰州金河煤矿发生冒顶事故 4人获救2人死亡</a></li>
          <li><span><a href="/shehui/index.jhtml" target="_blank">[社会热点]</a></span> <a href="/shehui/188.jhtml" title="世界各地迎接2011新年" target="_blank">世界各地迎接2011新年</a></li>
        </ul>
      </div>
	  </div>
	  <div class="left_low"></div>
</div>

<div class="w355 fr" style="margin-bottom:5px;">
	<div class="left_top box">
      <h2><a href="/star/index.jhtml" target="_blank">明星糗镜头</a></h2>
    </div>
    
	  <div class="left_div box">
      <div class="mt5">
        <ul class="list w355">
          <li class="toptext">
		  <a href="/star/314.jhtml" title="实拍一男子自断手指 满地鲜血" target="_blank"><h3>实拍一男子自断手指 满地鲜血</h3></a>
		  <p>实拍一男子自断手指 满地鲜血实拍一男子自断手指 满地鲜血实拍一男子自断手指 满地鲜血实拍一男子自断手...</p>
		  </li>
          <li><span><a href="/star/index.jhtml" target="_blank">[明星糗镜头]</a></span> <a href="/star/313.jhtml" title="贵州学生食堂使用地沟油 学生愤怒砸食堂" target="_blank">贵州学生食堂使用地沟油 学生愤怒砸食堂</a></li>
          <li><span><a href="/star/index.jhtml" target="_blank">[明星糗镜头]</a></span> <a href="/star/312.jhtml" title="“梅花奶奶”舍身救男童" target="_blank">“梅花奶奶”舍身救男童</a></li>
          <li><span><a href="/star/index.jhtml" target="_blank">[明星糗镜头]</a></span> <a href="/star/220.jhtml" title="jeecms2012来啦" target="_blank">jeecms2012来啦</a></li>
          <li><span><a href="/star/index.jhtml" target="_blank">[明星糗镜头]</a></span> <a href="/star/209.jhtml" title="好搞笑的视频" target="_blank">好搞笑的视频</a></li>
        </ul>
      </div>	
    </div>
    <div class="left_low"></div>
</div>

<div class="w355 fl" style="margin-right:8px;margin-bottom:5px;">
    <div class="left_top box">
      <h2><a href="/hhqw/index.jhtml" target="_blank">哈哈趣闻</a></h2>
	</div> 
	
	<div class="left_div box">
      <div class="pr10 mt5">
        <ul class="list w355">
          <li class="toptext">
		  <a href="/hhqw/311.jhtml" title="求职者告白聚美陈欧 直言刘惠璞尖酸刻薄" target="_blank"><h3>求职者告白聚美陈欧 直言刘惠璞尖酸刻薄</h3></a>
		  <p>求职者告白聚美陈欧 直言刘惠璞尖酸刻薄求职者告白聚美陈欧 直言刘惠璞尖酸刻薄求职者告白聚美陈欧 直言...</p>
		  </li>
          <li><span><a href="/hhqw/index.jhtml" target="_blank">[哈哈趣闻]</a></span> <a href="/hhqw/310.jhtml" title="大胸妹勾男术：只有想不到没有做不到！" target="_blank">大胸妹勾男术：只有想不到没有做不到！</a></li>
          <li><span><a href="/hhqw/index.jhtml" target="_blank">[哈哈趣闻]</a></span> <a href="/hhqw/309.jhtml" title="《梦宅诡影》终极预告片 007转型玩惊悚" target="_blank">《梦宅诡影》终极预告片 007转型玩惊悚</a></li>
          <li><span><a href="/hhqw/index.jhtml" target="_blank">[哈哈趣闻]</a></span> <a href="/hhqw/308.jhtml" title="十二星座2012年爱情运势大解读" target="_blank">十二星座2012年爱情运势大解读</a></li>
          <li><span><a href="/hhqw/index.jhtml" target="_blank">[哈哈趣闻]</a></span> <a href="/hhqw/307.jhtml" title="十大给力最浪漫求婚把两人故事拍成短片" target="_blank">十大给力最浪漫求婚把两人故事拍成短片</a></li>
        </ul>
      </div>
	  </div>
	  <div class="left_low"></div>
</div>

<div class="w355 fr" style="margin-bottom:5px;">
	<div class="left_top box">
      <h2><a href="/mrzx/index.jhtml" target="_blank">美容资讯</a></h2>
    </div>
    
	  <div class="left_div box">
      <div class="mt5">
        <ul class="list w355">
          <li class="toptext">
		  <a href="/mrzx/296.jhtml" title="比基尼？看腻了" target="_blank"><h3>比基尼？看腻了</h3></a>
		  <p>体育画报御用嫩模教你玩转沙滩复古风体育画报御用嫩模教你玩转沙滩复古风体育画报御用嫩模教你玩转沙滩复...</p>
		  </li>
          <li><span><a href="/mrzx/index.jhtml" target="_blank">[美容资讯]</a></span> <a href="/mrzx/294.jhtml" title="当金发妞恋上中国风" target="_blank">当金发妞恋上中国风</a></li>
          <li><span><a href="/mrzx/index.jhtml" target="_blank">[美容资讯]</a></span> <a href="/mrzx/293.jhtml" title="星座女星的制服诱惑" target="_blank">星座女星的制服诱惑</a></li>
          <li><span><a href="/mrzx/index.jhtml" target="_blank">[美容资讯]</a></span> <a href="/mrzx/280.jhtml" title="最私密的12星座内衣全分析" target="_blank">最私密的12星座内衣全分析</a></li>
          <li><span><a href="/mrzx/index.jhtml" target="_blank">[美容资讯]</a></span> <a href="/mrzx/224.jhtml" title="冬日写真" target="_blank">冬日写真</a></li>
        </ul>
      </div>	
    </div>
    <div class="left_low"></div>
</div>
<!--cjbd_end-->	
</div>

<!--mright_begin-->		
<div class="w250 fr">
 	<div class="blue_right_top mt10"><h2><a href="#" target="_blank">热门评论</a></h2></div>
	<div class="blue_right_div" style="height:360px !important;height:358px;">
		<dl class="rmpl">
			<dt><span>admin</span> 对 <a href="/jjsd/226.jhtml" target="_blank">市场短期反弹需求强烈 可稳健加仓六只基金</a> 评论道:</dt>
			<dd>真的吗？
<br/></dd>
			<dd class="line"></dd>
			<dt><span>admin</span> 对 <a href="/shehui/250.jhtml" target="_blank">河南一红会医院疑篡改病历掩盖患者死亡真相</a> 评论道:</dt>
			<dd>哇，好可怜。。。</dd>
			<dd class="line"></dd>
			<dt><span>admin</span> 对 <a href="/gnxw/49.jhtml" target="_blank">江苏建湖连续发生31起地震 部分居民夜里跑出门</a> 评论道:</dt>
			<dd>观察了一会，见没什么动静才回家，但直到零点以后才睡着，“总是担心床会摇晃！”</dd>
			<dd class="line"></dd>
			<dt><span>admin</span> 对 <a href="/world/240.jhtml" target="_blank">以色列释放550名巴在押人员 落实换人协议</a> 评论道:</dt>
			<dd>以当局共释放1027名在押巴勒斯坦人员，以换取被哈马斯俘获的以军士兵沙利特。</dd>
			<dd class="line"></dd>
		</dl>

	</div>
	<div class="blue_right_top mt10"><h2><a href="/guestbook.jspx" target="_blank">网友留言</a></h2></div>
	<div class="blue_right_div" style="height:292px !important;height:280px;">
		<div class="w96">
			<dl class="gb">
				<dt><span>[普通]</span>足球宝贝徐冬冬</dt>
				<dd>足球宝贝徐冬冬海边写真&nbsp;湿身展无限魅力足球宝贝徐冬冬海边写真&nbsp;湿身展无限魅</dd>
		   </dl>
			<dl class="gb">
				<dt><span>[普通]</span>多重压力将影响整体衣柜发展</dt>
				<dd>据悉，2010年下半年以来，衣柜企业整体销售形势不容乐观。不少企业下滑幅度高达60%，在一些主流卖场里，即使排名前十名的企业也未必能盈利。在这种情况下，企业纷纷打出了涨价牌，实属无奈之举。</dd>
		   </dl>
			<dl class="gb">
				<dt><span>[普通]</span>JEECMS&nbsp;v3.0.2正式版发布</dt>
				<dd>终于发布了</dd>
		   </dl>
	    </div>		
	</div>
	</div>
<!--mright_end-->
</div>
</div>


<div id="wrapper">
<%@ include file="/view/auth/portal/hotlink.jsp" %>
<%@ include file="/view/auth/portal/foot.jsp" %>
</div>
</body>
</html>