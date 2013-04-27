<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <link rel="stylesheet" type="text/css" href="styles/left.css">
    <base href="<%=basePath%>">
    
    <title></title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  <script src="js/jquery-1.3.2.js" type="text/javascript"></script>
  <script type="text/javascript">
  	$().ready(function(){
  		$('a').bind("click", function(event){
  			event.stopPropagation();
  		});
  		$("span").bind("click", function(){
  			if($(this).parent(".title1").children("a").is(":visible")){
  				$(this).parent(".title1").children("a").hide();
  				//$(this).parent(".title1").children("img").attr({src : "images/menu_plus.gif"});
  				$(this).parent(".title1").children(".menu_plus").empty();
  				$(this).parent(".title1").children(".menu_plus").append("<img class='images' src='images/menu_plus.gif'>");
  			}else{
	  			$(this).parent(".title1").children("a").show();
	  			$(this).parent(".title1").children(".menu_plus").empty();
  				$(this).parent(".title1").children(".menu_plus").append("<img class='images' src='images/menu_minus.gif'>");
  			}
  		});
  	});
  </script>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8"></head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
	<div id="all_menu">
		<a href="Left.jsp">菜单</a>
	</div>
	<div id="menu">
		<div class="title1">
			<span class="menu_plus"><img src="images/menu_plus.gif"></span>
			<span class="title2">会员管理</span>
			<a href="jquerylist.action" target="mainFrame" class="title_child1"><img src="images/menu_arrow.gif">会员管理</a>
			<a href="middle1.jsp" target="mainFrame" class="title_child1"><img src="images/menu_arrow.gif">json测试</a>
			<a href="jquerylistagain.action" target="mainFrame" class="title_child1"><img src="images/menu_arrow.gif">会员管理</a>
			<a href="middle4.jsp" target="mainFrame" class="title_child1"><img src="images/menu_arrow.gif">会员管理</a>
			<a href="middle5.jsp" target="mainFrame" class="title_child1"><img src="images/menu_arrow.gif">会员管理</a>
		</div>
		<div class="title1">
			<span class="menu_plus"><img src="images/menu_plus.gif"></span>
			<span class="title2">库存管理</span>
			<a href="jquerylist.action" target="mainFrame" class="title_child1"><img src="images/menu_arrow.gif">会员管理</a>
			<a href="middle2.jsp" target="mainFrame" class="title_child1"><img src="images/menu_arrow.gif">会员管理</a>
			<a href="middle3.jsp" target="mainFrame" class="title_child1"><img src="images/menu_arrow.gif">会员管理</a>
			<a href="middle4.jsp" target="mainFrame" class="title_child1"><img src="images/menu_arrow.gif">会员管理</a>
			<a href="middle5.jsp" target="mainFrame" class="title_child1"><img src="images/menu_arrow.gif">会员管理</a>
		</div>
		<div class="title1">
			<span class="menu_plus"><img src="images/menu_plus.gif"></span>
			<span class="title2">库存管理</span>
			<a href="jquerylist.action" target="mainFrame" class="title_child1"><img src="images/menu_arrow.gif">会员管理</a>
			<a href="middle2.jsp" target="mainFrame" class="title_child1"><img src="images/menu_arrow.gif">会员管理</a>
			<a href="middle3.jsp" target="mainFrame" class="title_child1"><img src="images/menu_arrow.gif">会员管理</a>
			<a href="middle4.jsp" target="mainFrame" class="title_child1"><img src="images/menu_arrow.gif">会员管理</a>
			<a href="middle5.jsp" target="mainFrame" class="title_child1"><img src="images/menu_arrow.gif">会员管理</a>
		</div>
		<div class="title1">
			<span class="menu_plus"><img src="images/menu_plus.gif"></span>
			<span class="title2">库存管理</span>
			<a href="jquerylist.action" target="mainFrame" class="title_child1"><img src="images/menu_arrow.gif">会员管理</a>
			<a href="middle2.jsp" target="mainFrame" class="title_child1"><img src="images/menu_arrow.gif">会员管理</a>
			<a href="middle3.jsp" target="mainFrame" class="title_child1"><img src="images/menu_arrow.gif">会员管理</a>
			<a href="middle4.jsp" target="mainFrame" class="title_child1"><img src="images/menu_arrow.gif">会员管理</a>
			<a href="middle5.jsp" target="mainFrame" class="title_child1"><img src="images/menu_arrow.gif">会员管理</a>
		</div>
		<div class="title1">
			<span class="menu_plus"><img src="images/menu_plus.gif"></span>
			<span class="title2">库存管理</span>
			<a href="jquerylist.action" target="mainFrame" class="title_child1"><img src="images/menu_arrow.gif">会员管理</a>
			<a href="middle2.jsp" target="mainFrame" class="title_child1"><img src="images/menu_arrow.gif">会员管理</a>
			<a href="middle3.jsp" target="mainFrame" class="title_child1"><img src="images/menu_arrow.gif">会员管理</a>
			<a href="middle4.jsp" target="mainFrame" class="title_child1"><img src="images/menu_arrow.gif">会员管理</a>
			<a href="middle5.jsp" target="mainFrame" class="title_child1"><img src="images/menu_arrow.gif">会员管理</a>
		</div>
		<div class="title1">
			<span class="menu_plus"><img src="images/menu_plus.gif"></span>
			<span class="title2">库存管理</span>
			<a href="jquerylist.action" target="mainFrame" class="title_child1"><img src="images/menu_arrow.gif">会员管理</a>
			<a href="middle2.jsp" target="mainFrame" class="title_child1"><img src="images/menu_arrow.gif">会员管理</a>
			<a href="middle3.jsp" target="mainFrame" class="title_child1"><img src="images/menu_arrow.gif">会员管理</a>
			<a href="middle4.jsp" target="mainFrame" class="title_child1"><img src="images/menu_arrow.gif">会员管理</a>
			<a href="middle5.jsp" target="mainFrame" class="title_child1"><img src="images/menu_arrow.gif">会员管理</a>
		</div>
		<div class="title1">
			<span class="menu_plus"><img src="images/menu_plus.gif"></span>
			<span class="title2">库存管理</span>
			<a href="jquerylist.action" target="mainFrame" class="title_child1"><img src="images/menu_arrow.gif">会员管理</a>
			<a href="middle2.jsp" target="mainFrame" class="title_child1"><img src="images/menu_arrow.gif">会员管理</a>
			<a href="middle3.jsp" target="mainFrame" class="title_child1"><img src="images/menu_arrow.gif">会员管理</a>
			<a href="middle4.jsp" target="mainFrame" class="title_child1"><img src="images/menu_arrow.gif">会员管理</a>
			<a href="middle5.jsp" target="mainFrame" class="title_child1"><img src="images/menu_arrow.gif">会员管理</a>
		</div>
		<div class="title1">
			<span class="menu_plus"><img src="images/menu_plus.gif"></span>
			<span class="title2">库存管理</span>
			<a href="jquerylist.action" target="mainFrame" class="title_child1"><img src="images/menu_arrow.gif">会员管理</a>
			<a href="middle2.jsp" target="mainFrame" class="title_child1"><img src="images/menu_arrow.gif">会员管理</a>
			<a href="middle3.jsp" target="mainFrame" class="title_child1"><img src="images/menu_arrow.gif">会员管理</a>
			<a href="middle4.jsp" target="mainFrame" class="title_child1"><img src="images/menu_arrow.gif">会员管理</a>
			<a href="middle5.jsp" target="mainFrame" class="title_child1"><img src="images/menu_arrow.gif">会员管理</a>
		</div>
	</div>
</body>
</html>
