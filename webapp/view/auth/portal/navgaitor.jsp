<%@ page contentType="text/html; charset=UTF-8" %>

<div id="header" class="box">
	<div id="logo" class="page box">
		<div class="logo fl" onclick="window.location.href='/'"></div>
	
		<div id="search fr" class="page3 box fr" style="padding-top:20px;">
			<div class="searchform fr">
			<form action="${initPath }/SearchController.do" >
				<input type="hidden" name="method" value="toSearchView" />
				<input name="kw" value="请输入关键词" type="text" id="txtKey" onfocus="if(this.value=='请输入关键词')this.value=''" onblur="if(this.value=='')this.value='请输入关键词'" maxlength="50" style="width:381px !important; width:375px;">
				<span id="fid_box">
					<select name="searchType">
						<option value="news">新闻</option>
						<option value="">所有信息</option>
						<option value="42">图库</option>
						<option value="46">视频</option>
						<option value="48">产品</option>
						<option value="60">联系我们</option>
					</select>
				</span>
				<input type="submit" id="btnSearch" value="" style="background:url(/view/resource/skin/img/button_search.jpg); width:65px; height:25px;" />
			</form>
			</div>
		</div>
	</div>
  
	<div class="box"></div>
  
<div id="nav">
	<div id="menu" class="page box relative">
		<dl id="topmenu">  
			<dt class="menu_first"><a href="/" target="_self" class="selected"><span>首 页</span></a></dt>
			<dt><a href="/ArticleController.do?method=toNewsIndexView"><span>新闻</span></a></dt>
			<dt><a href="/picture/index.jhtml" target="_self" ><span>图库</span></a></dt>
			<dt><a href="/veido/index.jhtml" target="_self" ><span>视频</span></a></dt>
			<dt><a href="/GoodsController.do?method=toShowGoodsIndexView" target="_self" ><span>产品</span></a></dt>
			<dt><a href="/guestbook.jspx" target="blank">留言版</a></dt>
			<dt><a href="http://bbs.jeecms.com" target="blank">论坛</a></dt>
		</dl>
	</div>
</div>
</div>

<script>
$(document).ready(function() {
});
</script>




