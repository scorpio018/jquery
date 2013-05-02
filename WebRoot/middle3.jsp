<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'middel.jsp' starting page</title>
<!-- <script type="text/javascript" src="js/prototype.js"></script> -->
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script src="js/jquery-1.4.1.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="styles/middle.css">
<script type="text/javascript">
    $().ready(function(){
   		var $inputname = "";
   		var $hidsid = "";
   		$("#ajaxwait").ajaxStart(function(){
   			$(this).show();
   		});
   		$("#ajaxwait").ajaxStop(function(){
   			$(this).hide();
   		});
   		//添加新商品
   		$(".add_link").mouseover(function(){
   			$(this).css("background-color","#fff");
   		}).bind("mouseout",function(){
   			$(this).css("background-color","#DDEEF2");
   		});
   		//列表中内容
   		$("#goods_tab span").live("mouseover", function(){
   			$(this).css("background-color","#27828C");
   		}).live("mouseout", function(){
   			$(this).css("background-color","#fff");
   		});
   		//转入修改
   		$("#goods_tab span").live("click", function(){
   			$(this).css("display", "none");
   			$(this).after("<input type='text' maxlength='50' class='hidvalue' value='"+ $(this).html() +"'/>");
   			$(this).next("input").focus();
   			$inputname = $(this).attr("class");
   			$hidsid = $(this).parent("td").siblings("td").children(".sid").val();
   			//$hidsid = $(this).parent("td").sibling("td").hasClass(".sid");
   			//alert($hidsid);
		});
   		//列表内容修改完毕
   		$("#goods_tab .hidvalue").live('blur keydown',function(e){
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
   						"sid" : $hidsid
   					}
   				});
   				$(this).prev("span").html($(this).val());
   				$(this).prev("span").css("display","");
   				$(this).remove();
    		}
		});
		//列表中对错的修改
		$("#goods_tab td img").live("click", function(){
			var $src = $(this).attr("src");
			var $img = "images/yes.gif";
			$inputname = $(this).attr("class");
			$hidsid = $(this).parent("td").siblings("td").children(".sid").val();
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
		$("#goods_tab .goods_tab_first_tr font").live("mouseover", function(){
			$(this).css({"color":"#9D7250","cursor":"pointer"});
			$(this).attr("title", "点击对列表进行排序");
		});
		$("#goods_tab .goods_tab_first_tr font").live("mouseout", function(){
			$(this).css({"color":"#000","cursor":"default"});
		});
    	$("#goods_bottom .showcount").bind("keydown",function(e){
   			if(e.keyCode == 13 || e.keyCode == 0){
   				var reg = /^\d+$/;
   				if(!reg.test($(this).val())){
   					alert("请输入正确的数字格式");
					$(this).val("<s:property value="#request.pageginate.currentPage"/>").focus();
					return false;
   				}
   				$(this).blur();
   				//window.location.href = "jquerylist.action?current=<s:property value="#request.pageginate.currentPage"/>&showcount="+$(this).val();
   				$.ajax({
   					url : "jquerylist.action",
   					data : {
   						"current" : <s:property value="#request.pageginate.currentPage"/>,
   						"showcount" : $(this).val()
   						},
   					dataType : "json",
   					complete : function(data){
   						var jsonRaw = data.responseText;
   						var jsonContent = eval("(" + jsonRaw + ")");
   						var inputcolumn = ["sname","sno","sprice","isupsale","isessence","isnew","ishotsale","sort","stock"];
   						jsonob(jsonContent, inputcolumn, <s:property value="#request.pageginate.currentPage"/>);
   					}
   				});
   			}
   		});
   		$("#goods_bottom .current").bind("keydown", function(e){
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
   				var $current = $(this).val();
   				var $showcount = $("#goods_bottom .bottom1 .showcount").val();
   				//window.location.href = "jquerylist.action?current="+$(this).val()+"&showcount=<s:property value="#request.pageginate.showCount"/>";
   				$.ajax({
   					url : "jquerylist.action",
   					data : {
   						"current" : $(this).val(),
   						"showcount" : $showcount
   						},
   					dataType : "json",
   					complete : function(data){
   						var jsonRaw = data.responseText;
   						var jsonContent = eval("(" + jsonRaw + ")");
   						var inputcolumn = ["sname","sno","sprice","isupsale","isessence","isnew","ishotsale","sort","stock"];
   						jsonob(jsonContent, inputcolumn, $current);
   					}
   				});
   			}
   		});
   		$("goods_tab font").toggle(function(){
   				
   		},function(){
   				
		});
   		$("#goods_bottom td span").hover(function(){
   			$(this).css({"color":"#9D7250","cursor":"pointer"});
   		},function(){
   			$(this).css({"color":"#000","cursor":"default"});
   		});
   		$("#goods_bottom td span").click(function(){
   			var $current = $(this).attr("class");
   			var $showcount = $("#goods_bottom .bottom1 .showcount").val();
   			$.ajax({
   				url : "jquerylistajax.action",
   				data : {
   					"current" : $current,
   					"showcount" : $showcount
   				},
   				dataType : "json",
   				complete : function(data){
   					var jsonRaw = data.responseText;
   					var jsonContent = eval("(" + jsonRaw + ")");
   					var inputcolumn = ["sname","sno","sprice","isupsale","isessence","isnew","ishotsale","sort","stock"];
   					jsonob(jsonContent, inputcolumn, $current);
   				}
   			});
   		});
   		function jsonob(jsonContent, inputcolumn, $current){
	   		var $length = $("#goods_tab tr").length - 2;
			for(var i = 0; i < jsonContent.goods.length; i++){
				if($length < i){
					var str = "<tr><td class=\"goods_tab_content\"><input type=\"checkbox\" name=\"sid\" class=\"sid\" value=\""+ jsonContent.goods[i].sid +"\"/>"+ jsonContent.goods[i].sid +"</td>";
					for(var j = 1; j <= inputcolumn.length; j ++ ){
						if(j <= 3 || j >= 8){
							str += "<td class=\"goods_tab_content\"><span class=\""+ inputcolumn[j - 1] +"\">"+ jsonContent.goods[i][inputcolumn[j - 1]] +"</span></td>";
						}else{
							if(jsonContent.goods[i][inputcolumn[j - 1]] == 1){
								str += "<td class=\"goods_tab_content\"><img class=\""+ inputcolumn[j - 1] +"\" src=\"images/yes.gif\"/></td>";
							}else{
								str += "<td class=\"goods_tab_content\"><img class=\""+ inputcolumn[j - 1] +"\" src=\"images/no.gif\"/></td>";
							};
						};
					}
					str += "<td class=\"goods_tab_content\"><span class=\"goods_info\">待定</span></td></tr>";
					$("#goods_tab").append(str);
				}else{
					$("#goods_tab tr:eq("+ (i + 1) +") td:eq(0)").html("<input type=\"checkbox\" name=\"sid\" class=\"sid\" value=\""+ jsonContent.goods[i].sid +"\"/>"+ jsonContent.goods[i].sid);
					$("#goods_tab tr:eq("+ (i + 1) +")").css("display","");
					for(var j = 1; j <= inputcolumn.length; j ++ ){
						if(j <= 3 || j >= 8){
							$("#goods_tab tr:eq("+ (i + 1) +") td:eq("+ j +") span").html(jsonContent.goods[i][inputcolumn[j-1]]);
						}else{
							if(jsonContent.goods[i][inputcolumn[j - 1]] == 1){
								$("#goods_tab tr:eq("+ (i + 1) +") td:eq("+ j +") img").attr("src", "images/yes.gif");
							}else{
								$("#goods_tab tr:eq("+ (i + 1) +") td:eq("+ j +") img").attr("src", "images/no.gif");
							};
						};
					};
				};
			}
			if(jsonContent.goods.length < ($length + 1)){
				for(var i = jsonContent.goods.length + 1; i <= ($length + 1); i ++){
					$("#goods_tab tr:eq("+ i +")").css("display","none");
				}
			}
			if($current > <s:property value="#request.pageginate.pageCount"/>){
				$("#goods_bottom td .current_font").html(<s:property value="#request.pageginate.pageCount"/>);
			}else if($current < 1){
				$("#goods_bottom td .current_font").html("1");
			}else{
				$("#goods_bottom td .current_font").html($current);
				$("#goods_bottom .bottom2 span:eq(1)").attr("class", ($current - 1));
				$("#goods_bottom .bottom2 span:eq(2)").attr("class", ($current + 1));
			}
		};
   	});
    </script>
</head>

<body>
	<span id="title">天翼物联平台管理中心<span id="list_name">-商品列表</span><a
		href="jqueryadd.action" class="add_link"
		style="background-image: url('images/icon_add.gif');">添加新商品</a>
	</span>
	<form action="jquerysearch.action" method="post" name="form1">
		<div id="search_content">
			<span class="search_span"><img src="images/icon_search.gif" /><select
				name="classify" id="classify">
					<option value="">所有分类</option>
			</select>
			</span> <span class="search_span"><select name="brand" id="brand">
					<option value="">所有品牌</option>
			</select>
			</span> <span class="search_span"><select name="factor" id="factor">
					<option value="0">全部</option>
					<option value="1">精品</option>
					<option value="2">新品</option>
					<option value="3">热销</option>
					<option value="4">特价</option>
					<option value="5">全部推荐</option>
			</select>
			</span> <span class="search_span"><select name="supplier"
				id="supplier">
					<option value="">全部</option>
			</select>
			</span> <span class="search_span"><select name="isgrounding"
				id="isgrounding">
					<option value="">全部</option>
			</select>
			</span> <span class="search_span"><font color="#808080">关键字</font><input
				type="text" name="search" id="search"><input type="submit"
				name="search_sub" id="search_sub" value="搜索">
			</span>
		</div>
	</form>
	<table id="goods_tab">
		<tr style="background-color: #BBDDE5" class="goods_tab_first_tr">
			<td width="5%"><input type="checkbox" id="sidcheck"
				name="sidcheck" /><font class="goods_tab_first">编号</font>
			</td>
			<td width="15%"><font class="goods_tab_first">商品名称</font>
			</td>
			<td width="15%"><font class="goods_tab_first">货号</font>
			</td>
			<td width="15%"><font class="goods_tab_first">价格</font>
			</td>
			<td width="5%"><font class="goods_tab_first">上架</font>
			</td>
			<td width="5%"><font class="goods_tab_first">精品</font>
			</td>
			<td width="5%"><font class="goods_tab_first">新品</font>
			</td>
			<td width="5%"><font class="goods_tab_first">热销</font>
			</td>
			<td width="10%"><font class="goods_tab_first">排序</font>
			</td>
			<td width="10%"><font class="goods_tab_first">库存</font>
			</td>
			<td width="10%">操作</td>
		</tr>
		<s:iterator value="#request.goods">
			<tr>
				<td class="goods_tab_content"><input type="checkbox" name="sid"
					class="sid" value="<s:property value="sid"/>" />
				<s:property value="sid" />
				</td>
				<td class="goods_tab_content"><span class="sname"><s:property
							value="sname" />
				</span>
				</td>
				<td class="goods_tab_content"><span class="sno"><s:property
							value="sno" />
				</span>
				</td>
				<td class="goods_tab_content"><span class="sprice"><s:property
							value="sprice" />
				</span>
				</td>
				<td class="goods_tab_content"><s:if test="isupsale == 0">
						<img class="isupsale" src="images/no.gif" />
					</s:if> <s:else>
						<img class="isupsale" src="images/yes.gif" />
					</s:else></td>
				<td class="goods_tab_content"><s:if test="isessence == 0">
						<img class="isessence" src="images/no.gif" />
					</s:if> <s:else>
						<img class="isessence" src="images/yes.gif" />
					</s:else></td>
				<td class="goods_tab_content"><s:if test="isnew == 0">
						<img class="isnew" src="images/no.gif" />
					</s:if> <s:else>
						<img class="isnew" src="images/yes.gif" />
					</s:else></td>
				<td class="goods_tab_content"><s:if test="ishotsale == 0">
						<img class="ishotsale" src="images/no.gif" />
					</s:if> <s:else>
						<img class="ishotsale" src="images/yes.gif" />
					</s:else></td>
				<td class="goods_tab_content"><span class="sort"><s:property
							value="sort" />
				</span>
				</td>
				<td class="goods_tab_content"><span class="stock"><s:property
							value="stock" />
				</span>
				</td>
				<td class="goods_tab_content"><span class="goods_info">待定</span>
				</td>
			</tr>
		</s:iterator>
	</table>
	<table id="goods_bottom" width="100%" style="font-size: 12px;">
		<tr style="background-color: #BBDDE5">
			<td width="60%" align="right" class="bottom1">总计<font
				color="#FF0000"><s:property
						value="#request.pageginate.resultCount" />
			</font>个记录| 共<font color="#FF0000"><s:property
						value="#request.pageginate.pageCount" />
			</font>页| 当前第<font color="#FF0000" class="current_font"><s:property
						value="#request.pageginate.currentPage" />
			</font>页| 每页<input type="text" name="showcount" class="showcount"
				style="width:20px;"
				value="<s:property value="#request.pageginate.showCount"/>" />条</td>
			<td width="20%" align="center" class="bottom2"><span class="1">第一页</span>
				<span
				class="<s:property value="#request.pageginate.currentPage-1"/>">上一页</span>
				<span
				class="<s:property value="#request.pageginate.currentPage+1"/>">下一页</span>
				<span class="<s:property value="#request.pageginate.pageCount"/>">最末页</span>
			</td>
			<td width="20%">跳转到:<input type="text" name="current"
				class="current" style="width:20px;"
				value="<s:property value="#request.pageginate.currentPage"/>" />页</td>
		</tr>
	</table>
	<div id="ajaxwait">加载中，请稍后</div>
</body>
</html>