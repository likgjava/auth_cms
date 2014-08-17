<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/view/auth/portal/taglibs.jsp" %>

<!--相关文章_begin-->
<div class="rb_right_top">
	<h2>&nbsp;本文相关资讯</h2>
</div>
<div class="rb_right_div">
	<!--相关资讯_begin-->
	<div class="w98"> 本文暂无TAG标签！ </div>
	<!--相关资讯_End-->
	
	<!--最新图文_Begin-->
	<h2>最新图文</h2>
	<div class="w98">
		<ul class="list right_pic">
			<li><a href="http://demo2.jeecms.com:80/system/789.jhtml" target="_blank"><img src="/r/cms/www/no_picture.gif" alt="谷歌浏览器"></a><a href="http://demo2.jeecms.com:80/system/789.jhtml" target="_blank" title="谷歌浏览器">谷歌浏览器</a> 
            </li><li><a href="http://demo2.jeecms.com:80/photo/786.jhtml" target="_blank"><img src="/u/cms/www/201208/171550063rbx.jpg" alt="马拉多纳起诉“九城”侵权案一审在京开庭"></a><a href="http://demo2.jeecms.com:80/photo/786.jhtml" target="_blank" title="马拉多纳起诉“九城”侵权案一审在京开庭">马拉多纳起诉“九城”</a> 
            </li><li><a href="http://demo2.jeecms.com:80/photo/785.jhtml" target="_blank"><img src="/u/cms/www/201208/17151908i7nu.jpg" alt="台风“启德”登陆湛江 最大风力13级"></a><a href="http://demo2.jeecms.com:80/photo/785.jhtml" target="_blank" title="台风“启德”登陆湛江 最大风力13级">台风“启德”登陆湛江</a> 
            </li><li><a href="http://demo2.jeecms.com:80/photo/784.jhtml" target="_blank"><img src="/u/cms/www/201208/17151526rpch.jpg" alt="台风“海葵”致江西婺源洪水围村"></a><a href="http://demo2.jeecms.com:80/photo/784.jhtml" target="_blank" title="台风“海葵”致江西婺源洪水围村">台风“海葵”致江西婺</a> </li>
		</ul>
	</div>
	<!--最新图文_End-->
	
	<!--本周热门资讯排行_Begin-->
	<h2>本周热门资讯排行</h2>
	<div class="w98">
        <ul class="order">
        	<c:forEach var="newsestArticle" items="${newsestArticleList}">
			<li><a href="javascript:" onclick="common.toArticleDetail('${newsestArticle.objId}')">${newsestArticle.title }</a></li>
            </c:forEach>
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
<!--相关文章_end-->
