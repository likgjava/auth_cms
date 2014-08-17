<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/view/auth/portal/taglibs.jsp" %>

<input type="hidden" id="PAGE_INDEX" value="${PAGE_INDEX }" />
<input type="hidden" id="PAGE_COUNT" value="${PAGE_COUNT }" />
<div class="pagination" id="pagination"></div>
<script>
var SearchPage={};

SearchPage.getPageHtml = function(){
	var pageIndex = Number($('#PAGE_INDEX').val());
	var pageCount = Number($('#PAGE_COUNT').val());
	var showNum = 9; //最大显示的个数
	var half = parseInt(showNum/2);
	var pageHtml = '';
	
	var first = 1; //第一个显示数字
	var last = 1; //最后一个显示数字

	
	//无数据
	if(pageCount <= 0){
		return '';
	}
	//不超过最大显示的个数
	else if(pageCount <= showNum){
		first = 1;
		last = pageCount;
	}
	//超过最大显示个数
	else{
		//当前页在前half个之内
		if(pageIndex <= half){
			first = 1;
			last = showNum;
		}
		//当前页在后half个之内
		else if(pageCount-pageIndex < half){
			first = pageCount-showNum+1;
			last = pageCount;
		}
		//当前页在中间
		else{
			first = pageIndex-half;
			last = pageIndex+half;
		}
	}
	
	//是否显示‘上一页’
	if(pageIndex > 1){
		pageHtml += '<a href="javascript:;" onclick="SearchPage.toPage('+(pageIndex-1)+');">上一页</a>&nbsp;&nbsp;&nbsp;';
	}
	
	//循环画页数
	for(var i=first; i<=last; i++){
		if(pageIndex==i){
			pageHtml += '<strong>'+i+'</strong>&nbsp;&nbsp;&nbsp;';
		}else{
			pageHtml += '<a href="javascript:;" onclick="SearchPage.toPage('+i+');">'+i+'</a>&nbsp;&nbsp;&nbsp;';
		}
	}
	
	//是否显示‘下一页’
	if(pageCount>showNum && pageCount-pageIndex>half){
		pageHtml += '<a href="javascript:;" onclick="SearchPage.toPage('+(pageIndex+1)+');">下一页</a> ';
	}

	return pageHtml;
}

SearchPage.toPage = function(pageNum){
	window.location.href = '/SearchController.do?method=toSearchView&kw='+$('#txtKey').val()+'&page='+pageNum;
}

$(document).ready(function(){
	
	$('#pagination').html(SearchPage.getPageHtml());
});

</script>