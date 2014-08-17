<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/view/auth/portal/taglibs.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>产品 - JEECMS开发站 - Powered by JEECMS</title>
<%@ include file="/view/auth/portal/init.jsp" %>
<link href="${initPath}/view/resource/skin/css/layout.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<%@ include file="/view/auth/portal/top.jsp" %>
<%@ include file="/view/auth/portal/navgaitor.jsp" %>

<p></p>
<div id="main">
<div class="page4 position">您现在正在浏览： <a href="/">首页</a> » <a href="/demo/product/" target="_blank">产品</a> » <a href="/demo/phone/" target="_blank">手机</a> » 正文</div>
<div class="page4 box">
	<div class="w720 fl">
		<div class="rb_top">&nbsp;</div>
		<div class="rb_mid box">
			<div class="w96">
				<h1>${goods.goodsName }</h1>
				<div class="msgbar">
					发布时间： 2011-12-19 10:13:08 &nbsp; 
					作者：本站编辑 &nbsp; 
					来源： <a href="" target="_blank">本站原创</a> &nbsp; 
					浏览次数： &nbsp; 我要评论()&nbsp;&nbsp;  
				</div>
				<div class="summary"><strong>摘要：</strong>${goods.goodsName }...</div>
				<div class="content">${goods.goodsDesc }</div>
				<div class="pagebar"></div>
				<div class="tags"><strong>Tags：</strong>  本文暂无Tags！ </div>
				<div class="other box">
					<div onclick="Cms.up('',295,0);" class="ding fl">
						<p>顶</p>
					</div>
					<div onclick="Cms.down('',295,1);" class="cai fl">
						<p>踩</p>
					</div>
					<ul>
						<li><strong>上一篇：</strong>没有了</li>
						<li><strong>下一篇：</strong><a href="http://demo.jeecms.com:80/phone/292.jhtml">小米M1（MIUI） </a></li>
					</ul>
				</div>
			</div>
			<div id="commentListContainer">
				<dl class="rmpl"></dl>
			</div>
<script type="text/javascript">
$(function(){
	//Cms.commentList("","commentListContainer",{contentId:295,orderBy:0,count:5,checked:1});
});
</script> <div class="comment">
  <h2>网友评论 已有 <em>0</em> 条评论，<a target="_blank" href="/comment.jspx?contentId=295">查看更多评论»</a></h2>
  <div style="margin-top:5px;" class="w98"> 
  <form method="post" action="/comment.jspx" id="commentForm">
  <table width="100%" cellspacing="1" cellpadding="5" border="0" bgcolor="#EAEAEA">
    <tbody><tr>
      <td width="19%" height="80" bgcolor="#FaFaFa" align="right"><strong>评论内容：</strong></td>
      <td width="81%" bgcolor="#FFFFFF"><textarea rows="5" cols="60" class="cinput" name="text"></textarea></td>
    </tr>
    <tr>
      <td width="19%" bgcolor="#FaFaFa" align="right"><strong>验证码：</strong></td>
      <td width="81%" bgcolor="#FFFFFF">
	  <input type="text" class="input" vld="{required:true}" id="captcha" name="captcha">
	  <img onclick="this.src='/captcha.svl?d='+new Date()" src="/captcha.svl">
	  </td>
    </tr>
    <tr>
      <td height="30" bgcolor="#FFFFFF" align="center" colspan="2"><input type="hidden" value="295" name="contentId">
        <input type="submit" value=" 马上发表 " name="Submit">
        【网友评论仅供其表达个人看法，并不表明本站同意其观点或证实其描述。】 </td>
    </tr>
  </tbody></table>
</form>
<script type="text/javascript">
$(function() {
/*
	$("#commentForm").validate( {
		submitHandler : function(form) {
			$(form).ajaxSubmit( {
				"success" : function(data) {
					if(data.success) {
						alert("评论成功");
						location.href=location.href;
					} else {
						alert("评论失败");
					}
				},
				"dataType" : "json"
			});
		}
	});

	Cms.comment(function(data) {
		if(data.status==0) {
			alert("评论成功");
			location.href=location.href;
		} else if(data.status==1) {	
			alert("验证码错误");
			$("#commentCaptcha").click();
		} else if(data.status==2) {	
			alert("内容不存在");
			$("#commentCaptcha").click();
		} else if(data.status==3) {	
			alert("评论关闭");
			$("#commentCaptcha").click();
		} else if(data.status==4) {	
			alert("需要登录评论");
			$("#commentCaptcha").click();
		} else if(data.status==100) {	
			alert("内容不存在");
			$("#commentCaptcha").click();
		} else if(data.status==101) {	
			alert("评论不能为空");
			$("#commentCaptcha").click();
		} else {
			alert("评论失败");
			$("#commentCaptcha").click();
		}
	});*/
});
</script>
  </div>
</div>



  <!--网友评论_End--></div>
        <div class="rb_low">&nbsp;</div>
        </div>
        <div class="w250 fr mt5"><!--相关文章_Begin-->
        <div class="rb_right_top">
        <h2><a href="#" target="_blank">本文相关资讯</a></h2>
        </div>
        <div class="rb_right_div"><!--相关资讯_Begin-->
        <div class="w98"> 本文暂无TAG标签！ </div>
        <!--相关资讯_End--><!--最新图文_Begin-->
        <h2>最新图文</h2>
        <div class="w98">
        <ul class="list right_pic">
            <li><a href="http://demo2.jeecms.com:80/system/789.jhtml" target="_blank"><img src="/r/cms/www/no_picture.gif" alt="谷歌浏览器"></a><a href="http://demo2.jeecms.com:80/system/789.jhtml" target="_blank" title="谷歌浏览器">谷歌浏览器</a> 
            </li><li><a href="http://demo2.jeecms.com:80/photo/786.jhtml" target="_blank"><img src="/u/cms/www/201208/171550063rbx.jpg" alt="马拉多纳起诉“九城”侵权案一审在京开庭"></a><a href="http://demo2.jeecms.com:80/photo/786.jhtml" target="_blank" title="马拉多纳起诉“九城”侵权案一审在京开庭">马拉多纳起诉“九城”</a> 
            </li><li><a href="http://demo2.jeecms.com:80/photo/785.jhtml" target="_blank"><img src="/u/cms/www/201208/17151908i7nu.jpg" alt="台风“启德”登陆湛江 最大风力13级"></a><a href="http://demo2.jeecms.com:80/photo/785.jhtml" target="_blank" title="台风“启德”登陆湛江 最大风力13级">台风“启德”登陆湛江</a> 
            </li><li><a href="http://demo2.jeecms.com:80/photo/784.jhtml" target="_blank"><img src="/u/cms/www/201208/17151526rpch.jpg" alt="台风“海葵”致江西婺源洪水围村"></a><a href="http://demo2.jeecms.com:80/photo/784.jhtml" target="_blank" title="台风“海葵”致江西婺源洪水围村">台风“海葵”致江西婺</a> </li>
        </ul>
        </div>
        <!--最新图文_End--><!--本周热门资讯排行_Begin-->
        <h2>本周热门资讯排行</h2>
        <div class="w98">
        <ul class="order"> 
            <li><a href="http://demo.jeecms.com:80/shehui/250.jhtml" target="_blank" title="河南一红会医院疑篡改病历掩盖患者死亡真相">河南一红会医院疑篡改病历掩盖患</a> 
            </li><li><a href="http://demo.jeecms.com:80/gnxw/249.jhtml" target="_blank" title="南京排水管理处原副处长受贿130万获刑逾十年">南京排水管理处原副处长受贿130</a> 
            </li><li><a href="http://demo.jeecms.com:80/wyty/339.jhtml" target="_blank" title="周渝民小小彬温情携手《新天生一对》">周渝民小小彬温情携手《新天生一</a> 
            </li><li><a href="http://demo2.jeecms.com:80/system/789.jhtml" target="_blank" title="谷歌浏览器">谷歌浏览器</a> 
            </li><li><a href="http://demo.jeecms.com:80/wyty/267.jhtml" target="_blank" title="鬼魅写真">鬼魅写真</a> 
            </li><li><a href="http://demo.jeecms.com:80/hhqw/210.jhtml" target="_blank" title="jeecms视频教程">jeecms视频教程</a> 
            </li><li><a href="http://demo.jeecms.com:80/gnxw/39.jhtml" target="_blank" title="婚姻登记信息5年内全国联网 北京等3地今年试点">婚姻登记信息5年内全国联网 北京</a> 
            </li><li><a href="http://demo.jeecms.com:80/gnxw/34.jhtml" target="_blank" title="我国有望后年发射火星探测器">我国有望后年发射火星探测器</a> 
            </li><li><a href="http://demo2.jeecms.com:80/shehui/475.jhtml" target="_blank" title="安徽九华山建成高99米地藏菩萨露天大铜像      ">安徽九华山建成高99米地藏菩萨露</a> 
            </li><li><a href="http://demo.jeecms.com:80/network/330.jhtml" target="_blank" title="永恒之塔">永恒之塔</a>  </li>
        </ul>
        </div>
        <!--本周热门资讯排行_End-->
        <h2>精彩专题</h2>
        <div class="w98"> 
        <dl class="list line box">
            <dt><a href="/topic/2.jspx" target="_blank">上海世博会专题</a> </dt>
            <dd class="pic"><a href="/topic/2.jspx"><img src="http://xwcb.eastday.com/c/20061116/images/00033531.jpg" alt=""></a> </dd>
            <dd class="text">人类文明的盛会，我们大家的世博，精彩开篇，“满月”有余。随... </dd>
        </dl>
        
        <dl class="list mt5 box">
            <dt><a href="/topic/1.jspx" target="_blank">2010年南非世界杯</a> </dt>
            <dd class="pic"><a href="/topic/1.jspx"><img src="http://a2.att.hudong.com/08/61/01300000406647124377613651616.jpg" alt=""></a> </dd>
            <dd class="text">2010年世界杯将在南非约翰内斯堡拉开帷幕，32路豪强将在一个月... </dd>
        </dl>
         </div>
        </div>
        <div class="rb_right_low">&nbsp;</div>
        <!--相关文章_End--></div>
        </div>
        </div>
        <p></p><dl class="hotlink">
  <dt>友情链接:</dt>
    <dd><a target="_blank" onclick="$.get('/friendlink_view.jspx?id=1')" href="http://www.jeecms.com">JEECMS官网</a></dd>
  <dd><a target="_blank" onclick="$.get('/friendlink_view.jspx?id=2')" href="http://bbs.jeecms.com">JEEBBS论坛</a></dd>
  <dd><a target="_blank" onclick="$.get('/friendlink_view.jspx?id=3')" href="http://www.360buy.com/">京东商城</a></dd>
  <dd><a target="_blank" onclick="$.get('/friendlink_view.jspx?id=4')" href="http://www.dangdang.com/">当当网</a></dd>
  <dd><a target="_blank" onclick="$.get('/friendlink_view.jspx?id=5')" href="http://www.amazon.cn/">亚马逊</a></dd>
  <dd><a target="_blank" onclick="$.get('/friendlink_view.jspx?id=6')" href="http://www.ihush.com/">ihush</a></dd>
  <dd><a target="_blank" onclick="$.get('/friendlink_view.jspx?id=7')" href="http://temai.dazhe.cn">名品打折</a></dd>
  <dd><a target="_blank" onclick="$.get('/friendlink_view.jspx?id=8')" href="http://temai.dazhe.cn">优品</a></dd>
</dl>
 <div class="footer11">
<a href="about.jhtml" target="_blank">关于我们</a> - 
<a href="http://www.jeecms.com/yjdt/826.htm" target="_blank">联系我们</a> - 
<a href="http://www.jeecms.com" target="_blank">诚聘英才</a> -
<a href="http://www.jeecms.com" target="_blank">友情链接</a> - 
<a href="http://www.jeecms.com/download/index.htm" target="_blank">程序下载</a> - 
<a href="http://www.jeecms.com" target="_blank">合作服务</a> - 
<a href="http://www.jeecms.com/yjdt/825.htm" target="_blank">许可协议</a> - 
<a href="javascript:void(0);" onclick="this.style.behavior='url(#default#homepage)';this.setHomePage(location.href)">设为首页</a> - 
<a href="javascript:void(0);" onclick="window.external.addFavorite('http://www.jeecms.com','jeecms-国内专业、开源、免费的JAVA (JSP)版网站管理系统')">加入收藏</a> - 
<a href="/jeeadmin/jeecms/index.do" target="_blank">管理登录</a><br>
电话：0791-6538070、13576281815&#12288;传真：0791-6538070  Processed in 0.044 second(s)<br>
Powered by <a href="http://www.jeecms.com" target="_blank">JEECMS</a> Copyright &copy; 2007-2011 www.jeecms.com, All Rights Reserved 
</div><p></p>
    
</body></html>