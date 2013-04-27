<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'middel.jsp' starting page</title>
    <!-- <script type="text/javascript" src="js/prototype.js"></script> -->
    <script src="js/jquery-1.3.2.js" type="text/javascript"></script>
    <script src="js/middle.js" type="text/javascript"></script>
    <script type="text/javascript">
    $().ready(function(){
    	$("#goods_tab .showcount").bind("blur keydown",function(e){
   			if(e.keyCode == 13 || e.keyCode == 0){
   				var reg = /^\d+$/;
   				if(!reg.test($(this).val())){
   					alert("请输入正确的数字格式");
  						$(this).val("<s:property value="#request.pageginate.currentPage"/>").focus();
  						return false;
   				}
   				window.location.href = "jquerylist.action?current=<s:property value="#request.pageginate.currentPage"/>&showcount="+$(this).val();
   			}
   		});
   		$("#goods_tab .current").bind("keydown", function(e){
   			if(e.keyCode == 13){
   				var reg = /^\d+$/;
   				if(!reg.test($(this).val())){
   					alert("请输入正确的数字格式");
   					$(this).val("<s:property value="#request.pageginate.currentPage"/>").focus();
   					return false;
   				}
   				if($(this).val() > "<s:property value="#request.pageginate.pageCount"/>"){
   					alert("跳转页数超过总页数，请重新输入");
   					$(this).val("<s:property value="#request.pageginate.currentPage"/>").focus();
   					return false;
   				}
   				window.location.href = "jquerylist.action?current="+$(this).val()+"&showcount=<s:property value="#request.pageginate.showCount"/>";
   			}
   		});
   		$("goods_tab font").toggle(function(){
   				
   		},function(){
   				
  			});
   		$("#goods_tab td div").hover(function(){
   			$(this).css("color","#9D7250");
   		},function(){
   			$(this).css("color","#000");
   		});
   		/* $("#goods_tab td div").click(function(){
   			var $current = $(this).attr("class");
   			document.form1.action = "jquerylist.action?current="+$current+"&showcount=<s:property value="#request.pageginate.showCount"/>";
   			document.form1.submit();
   		}); */
   		$("#goods_tab td div").click(function(){
   			var $current = $(this).attr("class");
   			$.ajax({
   				url : "jquerylistajax.action",
   				data : {
   					"current" : $current,
   					"showcount" : "<s:property value="#request.pageginate.showCount"/>"
   				},
   				dataType : "json",
   				complete : function(data){
   					var jsonRaw = data.responseText;
   					var jsonContent = eval("(" + jsonRaw + ")");
   					alert(jsonRaw);
   					alert(jsonContent); 
   					/* alert($("#goods_tab :nth-child(1) td:eq(2)").html());
   					$("#goods_tab .goods_tab_content").html("");
   					for(var i = 0; i < jsonContent.goods.length; i ++){
   						alert($("#goods_tab :nth-child(2) td:eq(2)").html());
   						$("goods_tab :nth-child("+ (i + 2) +") td:eq("+ i +")").html("<input type='checkbox' name='sid' class='sid' value='"+ jsonContent.goods[i].sid +"'/>"+jsonContent.goods[i].sid);
   						$("#goods_tab :nth-child("+ (i + 2) +") td:eq(0)").html("<input type='checkbox' name='sid' class='sid' value='"+ jsonContent.goods[i].sid +"'/>"+jsonContent.goods[i].sid);
   						$("#goods_tab :nth-child("+ (i + 2) +") td:eq(1)").html("<span class='sname'>"+ jsonContent.goods[i].sname +"</span><input type='text' style='display: none;' maxlength='50' class='hidvalue' value='"+ jsonContent.goods[i].sname +"'/><input type='hidden' class='hidsid' value='"+ jsonContent.goods[i].sid +"'/>");
   						$("#goods_tab :nth-child("+ (i + 2) +") td:eq(2)").html("<span class='sno'>"+ jsonContent.goods[i].sno +"</span><input type='text' style='display: none;' maxlength='50' class='hidvalue' value='"+ jsonContent.goods[i].sno +"'/><input type='hidden' class='hidsid' value='"+ jsonContent.goods[i].sno +"'/>");
   						$("#goods_tab :nth-child("+ (i + 2) +") td:eq(3)").html("<span class='sprice'>"+ jsonContent.goods[i].sprice +"</span><input type='text' style='display: none;' maxlength='50' class='hidvalue' value='"+ jsonContent.goods[i].sprice +"'/><input type='hidden' class='hidsid' value='"+ jsonContent.goods[i].sprice +"'/>");
   						$("#goods_tab :nth-child("+ (i + 2) +") td:eq(4)").html("");
   						$("#goods_tab :nth-child("+ (i + 2) +") td:eq(5)").html("");
   						$("#goods_tab :nth-child("+ (i + 2) +") td:eq(6)").html("");
   						$("#goods_tab :nth-child("+ (i + 2) +") td:eq(7)").html("");
   						$("#goods_tab :nth-child("+ (i + 2) +") td:eq(8)").html("");
   						$("#goods_tab :nth-child("+ (i + 2) +") td:eq(9)").html("");
   						alert("goods_tab :nth-child("+ (i + 2) +") td:eq("+ i +")");
   						alert($("goods_tab :nth-child("+ (i + 2) +") td:eq("+ i +")").html());
   					} */
   					
   				}
   			});
   		});
   	});
    </script>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="styles/middle.css">	
  </head>
  
  <body>
  <span id="title">天翼物联平台管理中心<span id="list_name">-商品列表</span><a href="jqueryadd.action" class="add_link" style="background-image: url('images/icon_add.gif');">添加新商品</a></span>
  <form action="jquerysearch.action" method="post" name="form1">
  <div id="search_content">
  		<span class="search_span"><img src="images/icon_search.gif"/><select name="classify" id="classify">
  			<option value="">所有分类</option>
  		</select></span>
  		<span class="search_span"><select name="brand" id="brand">
  			<option value="">所有品牌</option>
  		</select></span>
  		<span class="search_span"><select name="factor" id="factor">
  			<option value="0">全部</option>
  			<option value="1">精品</option>
  			<option value="2">新品</option>
  			<option value="3">热销</option>
  			<option value="4">特价</option>
  			<option value="5">全部推荐</option>
  		</select></span>
  		<span class="search_span"><select name="supplier" id="supplier">
  			<option value="">全部</option>
  		</select></span>
  		<span class="search_span"><select name="isgrounding" id="isgrounding">
  			<option value="">全部</option>
  		</select></span>
  		<span class="search_span"><font color="#808080">关键字</font><input type="text" name="search" id="search"><input type="submit" name="search_sub" id="search_sub" value="搜索"></span>
  </div>
  </form>
    <table id="goods_tab">
    	<tr style="background-color: #BBDDE5" class="goods_tab_first_tr">
    		<td width="5%"><input type="checkbox" id="sidcheck" name="sidcheck"/><font class="goods_tab_first">编号</font></td>
    		<td width="15%"><font class="goods_tab_first">商品名称</font></td>
    		<td width="15%"><font class="goods_tab_first">货号</font></td>
    		<td width="15%"><font class="goods_tab_first">价格</font></td>
    		<td width="5%"><font class="goods_tab_first">上架</font></td>
    		<td width="5%"><font class="goods_tab_first">精品</font></td>
    		<td width="5%"><font class="goods_tab_first">新品</font></td>
    		<td width="5%"><font class="goods_tab_first">热销</font></td>
    		<td width="10%"><font class="goods_tab_first">排序</font></td>
    		<td width="10%"><font class="goods_tab_first">库存</font></td>
    		<td width="10%">操作</td>
    	</tr>
    	<s:iterator value="#request.goods">
    		<tr>
    		<td class="goods_tab_content"><input type="checkbox" name="sid" class="sid" value="<s:property value="sid"/>"/><s:property value="sid"/></td>
    		<td class="goods_tab_content"><span class="sname"><s:property value="sname"/></span><input type="text" style="display: none;" maxlength="50" class="hidvalue" value="<s:property value="sname"/>"/><input type="hidden" class="hidsid" value="<s:property value="sid"/>"/></td>
    		<td class="goods_tab_content"><span class="sno"><s:property value="sno"/></span><input type="text" style="display: none;" maxlength="50" class="hidvalue" value="<s:property value="sno"/>"/><input type="hidden" class="hidsid" value="<s:property value="sid"/>"/></td>
    		<td class="goods_tab_content"><span class="sprice"><s:property value="sprice"/></span><input type="text" style="display: none;" maxlength="50" class="hidvalue" value="<s:property value="sprice"/>"/><input type="hidden" class="hidsid" value="<s:property value="sid"/>"/></td>
    		<td class="goods_tab_content">
    		<s:if test="isupsale == 0"><img class="isupsale" src="images/no.gif"/></s:if>
    		<s:else><img class="isupsale" src="images/yes.gif"/></s:else>
    		<input type="hidden" class="hidsid" value="<s:property value="sid"/>"/>
    		</td>
    		<td class="goods_tab_content">
    		<s:if test="isessence == 0"><img class="isessence" src="images/no.gif"/></s:if>
    		<s:else><img class="isessence" src="images/yes.gif"/></s:else>
    		<input type="hidden" class="hidsid" value="<s:property value="sid"/>"/>
    		</td>
    		<td class="goods_tab_content">
    		<s:if test="isnew == 0"><img class="isnew" src="images/no.gif"/></s:if>
    		<s:else><img class="isnew" src="images/yes.gif"/></s:else>
    		<input type="hidden" class="hidsid" value="<s:property value="sid"/>"/>
    		</td>
    		<td class="goods_tab_content">
    		<s:if test="ishotsale == 0"><img class="ishotsale" src="images/no.gif"/></s:if>
    		<s:else><img class="ishotsale" src="images/yes.gif"/></s:else>
    		<input type="hidden" class="hidsid" value="<s:property value="sid"/>"/>
    		</td>
    		<td class="goods_tab_content"><span class="sort"><s:property value="sort"/></span><input type="text" maxlength="50" style="display: none; width: 40px;" class="hidvalue" value="<s:property value="sort"/>"/><input type="hidden" class="hidsid" value="<s:property value="sid"/>"/></td>
    		<td class="goods_tab_content"><span class="stock"><s:property value="stock"/></span><input type="text" maxlength="50" style="display: none; width: 40px;" class="hidvalue" value="<s:property value="stock"/>"/><input type="hidden" class="hidsid" value="<s:property value="sid"/>"/></td>
    		<td class="goods_tab_content"><span class="goods_info">待定</span></td>
    	</tr>
    	</s:iterator>
    	<tr style="background-color: #BBDDE5">
    		<td colspan="6" align="right">总计<font color="#FF0000"><s:property value="#request.pageginate.resultCount"/></font>个记录|
    		共<font color="#FF0000"><s:property value="#request.pageginate.pageCount"/></font>页|
    		当前第<font color="#FF0000"><s:property value="#request.pageginate.currentPage"/></font>页|
    		每页<input type="text" name="showcount" class="showcount" style="width:20px;" value="<s:property value="#request.pageginate.showCount"/>"/>条</td>
    		<td colspan="3" align="center"><div class="1">第一页</div>
    		<div class="<s:property value="#request.pageginate.currentPage-1"/>">上一页</div>
    		<div class="<s:property value="#request.pageginate.currentPage+1"/>">下一页</div>
    		<div class="<s:property value="#request.pageginate.pageCount"/>">最末页</div></td>
    		<td colspan="2">
    		<%-- <a class="skip_link" style="text-decoration: none;" href="jquerylist.action?current=1">第一页</a>|
    		<a class="skip_link" style="text-decoration: none;" href="jquerylist.action?current=<s:property value="#request.pageginate.currentPage-1"/>">上一页</a>|
    		<a class="skip_link" style="text-decoration: none;" href="jquerylist.action?current=<s:property value="#request.pageginate.currentPage+1"/>">下一页</a>|
    		<a class="skip_link" style="text-decoration: none;" href="jquerylist.action?current=<s:property value="#request.pageginate.pageCount"/>">最末页</a> --%>
          	 跳转到:<input type="text" name="current" class="current" style="width:20px;" value="<s:property value="#request.pageginate.currentPage"/>"/>页
   		</tr>
    </table>
  </body>
</html>