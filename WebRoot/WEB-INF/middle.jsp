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
    <script src="js/jquery-1.3.2.js" type="text/javascript"></script>
    <script type="text/javascript">
    	$().ready(function(){
    		var $inputname = "";
    		var $hidsid = "";
    		//添加新商品
    		$(".add_link").mouseover(function(){
    			$(this).css("background-color","#fff");
    		}).bind("mouseout",function(){
    			$(this).css("background-color","#DDEEF2");
    		});
    		//列表中内容
    		$("#goods_tab span").mouseover(function(){
    			$(this).css("background-color","#27828C");
    		}).mouseout(function(){
    			$(this).css("background-color","#fff");
    		});
    		//列表内容修改完毕
    		$(".hidvalue").bind("blur keydown",function(e){
    			if(e.keyCode == 13 || e.keyCode == 0){
    				if($inputname == "sprice"){
	    				var reg = /(^\d+$)|^\d+(\.\d+)?$/;
	    				if(!reg.test($(this).val())){
	    					alert("请输入正确的价格格式");
	    					$(this).val($(this).prev().text()).focus();
	    					return false;
	    				}
    				}else if($inputname == "sort" || $inputname == "stock"){
    					var reg = /^\d+$/;
    					if(!reg.test($(this).val())){
    						alert("请输入正确的数字格式");
    						$(this).val($(this).prev().text()).focus();
    						return false;
    					}
    				}
    				if($(this).val().length == 0){
	   					alert("不可以存入空值");
	   					$(this).val($(this).prev().text()).focus();
	   					return false;
 					}
	   				$.ajax({
	   					url : encodeURI(encodeURI("jqueryinputajax.action?"+$inputname+"="+$(this).val())),
	   					type : "POST",
	   					data : {
	   						"sid" : $hidsid,
	   					}
	   				});
	   				$(this).parent("td").children("span").css("display","");
	   				$(this).css("display", "none");
	  				$(this).parent("td").children("span").text($(this).val());
	    		}
   			});
   			//转入修改
    		$("#goods_tab span").bind("click", function(){
    			$(this).css("display", "none");
    			$(this).next().css("display", "").focus();
    			$inputname = $(this).attr("class");
    			$hidsid = $(this).parent("td").children(".hidsid").val();
   			});
   			//列表中对错的修改
   			$("#goods_tab td img").click(function(){
   				var $src = $(this).attr("src");
   				var $img = "images/yes.gif";
   				$inputname = $(this).attr("class");
   				$hidsid = $(this).next().val();
   				if($src == $img){
   				$.ajax({
   					url : "jqueryinputajax.action?"+$inputname+"Sta = 1&"+$inputname+"=false",
   					type : "POST",
   					data : {
   						"sid" : $hidsid
   					}
   				});
   					$(this).attr("src", "images/no.gif");
   				}else{
   					$.ajax({
   					url : "jqueryinputajax.action?"+$inputname+"Sta = 1&"+$inputname+"=true",
   					type : "POST",
   					data : {
   						"sid" : $hidsid
   					}
   				});
   					$(this).attr("src","images/yes.gif");
   				}
   			});
   			//表格表头样式
   			$("#goods_tab .goods_tab_first_tr font").hover(function(e){
   				$(this).css({"color":"#9D7250","cursor":"pointer"});
   				$(this).attr("title", "点击对列表进行排序");
   				/* var tooltip = "<div id='tooltip'>点击对列表进行排序</div>";
   				$("body").append(tooltip);
   				$("#tooltip").css({
   					"position" : "absolute",
   					"top" : (e.pageY + 10) + "px",
   					"left" : (e.pageX + 10) + "px"
   				}).show("fast"); */
   			},function(){
   				$(this).css({"color":"#000","cursor":"default"});
   				//$("#tooltip").remove();
   			});
   			$("goods_tab font").toggle(function(){
   				
   			},function(){
   				
   			});
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
    		$("#goods_tab .skip_link").hover(function(){
    			$(this).css("color","#9D7250");
    		},function(){
    			$(this).css("color","#000");
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
  <form action="jquerysearch.action" method="post">
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
    		<td><input type="checkbox" name="sid" class="sid" value="<s:property value="sid"/>"/><s:property value="sid"/></td>
    		<td><span class="sname"><s:property value="sname"/></span><input type="text" style="display: none;" maxlength="50" class="hidvalue" value="<s:property value="sname"/>"/><input type="hidden" class="hidsid" value="<s:property value="sid"/>"/></td>
    		<td><span class="sno"><s:property value="sno"/></span><input type="text" style="display: none;" maxlength="50" class="hidvalue" value="<s:property value="sno"/>"/><input type="hidden" class="hidsid" value="<s:property value="sid"/>"/></td>
    		<td><span class="sprice"><s:property value="sprice"/></span><input type="text" style="display: none;" maxlength="50" class="hidvalue" value="<s:property value="sprice"/>"/><input type="hidden" class="hidsid" value="<s:property value="sid"/>"/></td>
    		<td>
    		<s:if test="isupsale == 0"><img class="isupsale" src="images/no.gif"/></s:if>
    		<s:else><img class="isupsale" src="images/yes.gif"/></s:else>
    		<input type="hidden" class="hidsid" value="<s:property value="sid"/>"/>
    		</td>
    		<td>
    		<s:if test="isessence == 0"><img class="isessence" src="images/no.gif"/></s:if>
    		<s:else><img class="isessence" src="images/yes.gif"/></s:else>
    		<input type="hidden" class="hidsid" value="<s:property value="sid"/>"/>
    		</td>
    		<td>
    		<s:if test="isnew == 0"><img class="isnew" src="images/no.gif"/></s:if>
    		<s:else><img class="isnew" src="images/yes.gif"/></s:else>
    		<input type="hidden" class="hidsid" value="<s:property value="sid"/>"/>
    		</td>
    		<td>
    		<s:if test="ishotsale == 0"><img class="ishotsale" src="images/no.gif"/></s:if>
    		<s:else><img class="ishotsale" src="images/yes.gif"/></s:else>
    		<input type="hidden" class="hidsid" value="<s:property value="sid"/>"/>
    		</td>
    		<td><span class="sort"><s:property value="sort"/></span><input type="text" maxlength="50" style="display: none; width: 40px;" class="hidvalue" value="<s:property value="sort"/>"/><input type="hidden" class="hidsid" value="<s:property value="sid"/>"/></td>
    		<td><span class="stock"><s:property value="stock"/></span><input type="text" maxlength="50" style="display: none; width: 40px;" class="hidvalue" value="<s:property value="stock"/>"/><input type="hidden" class="hidsid" value="<s:property value="sid"/>"/></td>
    		<td class="sid_td"><span class="goods_info">待定</span></td>
    	</tr>
    	</s:iterator>
    	<tr style="background-color: #BBDDE5">
    		<td colspan="9" align="right">总计<font color="#FF0000"><s:property value="#request.pageginate.resultCount"/></font>个记录|
    		共<font color="#FF0000"><s:property value="#request.pageginate.pageCount"/></font>页|
    		当前第<font color="#FF0000"><s:property value="#request.pageginate.currentPage"/></font>页|
    		每页<input type="text" name="showcount" class="showcount" style="width:20px;" value="<s:property value="#request.pageginate.showCount"/>"/>条</td>
    		<td colspan="2"><a class="skip_link" style="text-decoration: none;" href="jquerylist.action?current=1">第一页</a>|
    		<a class="skip_link" style="text-decoration: none;" href="jquerylist.action?current=<s:property value="#request.pageginate.currentPage-1"/>">上一页</a>|
    		<a class="skip_link" style="text-decoration: none;" href="jquerylist.action?current=<s:property value="#request.pageginate.currentPage+1"/>">下一页</a>|
    		<a class="skip_link" style="text-decoration: none;" href="jquerylist.action?current=<s:property value="#request.pageginate.pageCount"/>">最末页</a>|
          	 跳转到:<input type="text" name="current" class="current" style="width:20px;" value="<s:property value="#request.pageginate.currentPage"/>"/>页
   		</tr>
    </table>
  </body>
</html>