<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/view/auth/portal/taglibs.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>会员中心</title>
<%@ include file="/view/auth/portal/init.jsp" %>
<link type="text/css" rel="stylesheet" href="${initPath}/view/resource/skin/css/front.css" />
<link type="text/css" rel="stylesheet" href="${initPath}/view/resource/skin/css/member.css" />
<script type="text/javascript" src="${initPath}/view/resource/skin/js/front.js"></script>

<link href="${initPath}/view/resource/skin/jeecms/css/admin.css" rel="stylesheet" type="text/css"/>
<link href="${initPath}/view/resource/skin/common/css/theme.css" rel="stylesheet" type="text/css"/>


<script src="${initPath}/view/resource/scripts/json_util.js" type="text/javascript"></script>
<script src="${initPath}/view/resource/plug_in/jquery/myTableList/myTableList.js" type="text/javascript"></script>

<script type="text/javascript">
var GoodsList = {};
GoodsList.dataTable;

//删除
GoodsList.deleteGoods = function(objId){
	if(!confirm('确认删除该商品吗？')){return;}
	$.getJSON('/GoodsController.do?method=removeGoods&objId='+objId, function(json){
		if(json.success){
			GoodsList.dataTable.reloadData();
		}
	});
}

$(document).ready(function() {
	GoodsList.dataTable = $('#goodsList').myDataTable({
		singleSelect: false,
		queryColumns: 'goodsName,goodsCode,goodsClass.goodsClassName,refPrice,createTime',
		hiddenColumns: 'objId',
		ajaxUrl: '/GoodsController.do?method=list&createUser.objId='+$('#currentUserId').val(),
		searchZone: '',
		fnRowCallback: function(nRow, aData){
			var operStr = '<a href="/GoodsController.do?method=toGoodsFormView&objId='+aData.objId+'">修改</a>';
			operStr += '&nbsp;<a href="javascript:" onclick="GoodsList.deleteGoods(\''+aData.objId+'\');">删除</a></td>';
			$(nRow).append(operStr);
			return nRow;
		}
	});


	$('#queryGoodsBut').click(function(){
		//alert(myTable.dtSelects());
		GoodsList.dataTable.reloadData();
	});
	

	//新增
	$('#addGoodsBut').click(function(){
		$('#bodyBox').load('/GoodsController.do?method=toGoodsFormView');
	});

});
</script>
</head>

<body>
<%@ include file="/view/auth/member/member_top.jsp" %>

<div class="container">
<jsp:include page="/MemberController.do?method=getMemberNavgaitorView" />
<div class="mc_right">
	<%@ include file="/view/auth/member/member_head.jsp" %>
	<div class="mr-top-position">
		<div class="mr-top-tit fl">我的商品</div>
		<div class="modify fr"><a href="${initPath}/GoodsController.do?method=toGoodsFormView">新增商品</a>&nbsp;&nbsp;&nbsp;<a href="${base}/member/profile.jspx">修改个人资料</a></div>
	</div>
	<div class="mc_content">
		<input type="hidden" id="currentUserId" value="${currentUserId}" />
		<table id="goodsList" width="100%" cellspacing="1" cellpadding="0" border="0" style="" class="pn-ltable">
			<thead class="pn-lthead">
			<tr>
				<th>商品名称</th>
				<th>商品编号</th>
				<th>商品分类</th>
				<th>参考价</th>
				<th>上架时间</th>
				<th>操作</th>
			</tr>
			</thead>
			<tbody class="pn-ltbody">
			</tbody>
		</table>
	</div>
</div>
<div style="clear:both"></div>
</div>
</body>
</html>

<!--<form method="post" action="contribute_list.jspx" id="tableForm">
            <table cellspacing="1" cellpadding="0" border="0" bgcolor="#C8DCF0" class="tblist">
            <tbody><tr>
                <th>ID</th>
                <th>标题</th>
                <th>栏目</th>
                <th>状态</th>
                <th>点击</th>
                <th>发布时间</th>
                <th>操作</th>
            </tr>
            <tr>	
                <td bgcolor="#FFFFFF">494</td>
                <td bgcolor="#FFFFFF"><a href="/gnxw/494.jhtml">标题</a></td>
                <td bgcolor="#FFFFFF">国内新闻</td>
                <td bgcolor="#FFFFFF">未审核</td>
                <td bgcolor="#FFFFFF">76</td>
                <td bgcolor="#FFFFFF">2012-07-21</td>
                <td bgcolor="#FFFFFF"><a href="contribute_edit.jspx?id=494&amp;nextUrl=contribute_list.jspx">修改</a><a> | </a><a href="contribute_delete.jspx?ids=494&amp;nextUrl=contribute_list.jspx">删除</a><a></a></td>
            </tr>
            </tbody></table>
            <input type="hidden" name="pageNo">
            <table width="100%" cellspacing="0" cellpadding="0" border="0"><tbody><tr><td align="center" class="pn-sp">
                共 1 条&nbsp;
                每页 20 条&nbsp;
                <input type="button" disabled="disabled" onclick="_gotoPage('1');" value="首 页">
                <input type="button" disabled="disabled" onclick="_gotoPage('1');" value="上一页">
                <input type="button" disabled="disabled" onclick="_gotoPage('1');" value="下一页">
                <input type="button" disabled="disabled" onclick="_gotoPage('1');" value="尾 页">&nbsp;
                当前 1/1 页 &nbsp;转到第<input type="text" onkeypress="if(event.keyCode==13){$('#_goPage').click();return false;}" onfocus="this.select();" style="width:50px" id="_goPs">页
                <input type="button" disabled="disabled" onclick="_gotoPage($('#_goPs').val());" value="转" id="_goPage">
            </td>
            </tr>
            </tbody></table>
            <script type="text/javascript">
            function _gotoPage(pageNo) {
                try{
                    var tableForm = document.getElementById("tableForm");
                    $("input[name=pageNo]").val(pageNo);
                    tableForm.action="contribute_list.jspx";
                    tableForm.onsubmit=null;
                    tableForm.submit();
                } catch(e) {
                    alert('_gotoPage(pageNo)方法出错');
                }
            }
            </script>
            </form>
            
            
            -->