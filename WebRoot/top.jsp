<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <script src="js/jquery-1.3.2.js"></script>
	<script type="text/javascript">
		$().ready(function(){
			$(".top1").mouseover(function(){
				$(this).css("background-color","#80BDCB");
				$(this).css("cursor", "pointer");
				$(this).css("color","#000");
			});
			$(".top1").mouseout(function(){
				$(this).css("background-color","#BBDDE5");
				$(this).css("cursor", "default");
				$(this).css("color", "#278296");
			});
		});
	</script>
    <title>My JSP 'top.jsp' starting page</title>
   	<style type="text/css">
   	</style>
    <link rel="stylesheet" type="text/css" href="styles/top.css">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  
  <body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
  <!-- <div id="top_menu">
   <div class="top1">会员管理</div>
   <div class="top1">会员管理</div>
   <div class="top1">会员管理</div>
   <div class="top1">会员管理</div>
   <div class="top1">会员管理</div>
   <div class="top1">会员管理</div>
   <div class="top1">会员管理</div>
   <div class="top1">会员管理</div>
   </div> -->
  <div id="top">
  	<div id="top_logo"></div>
  	<div id="top_link">
  		<ul>
  			<li><a href="#">corejava</a></li>
  			<li><a href="#">html/css/js</a></li>
  			<li><a href="#">ajax</a></li>
  			<li><a href="#">jquery</a></li>
  			<li><a href="#">json</a></li>
  			<li><a href="#">mysql</a></li>
  			<li><a href="#">spring</a></li>
  			<li><a href="#">php</a></li>
  		</ul>
  	</div>
  </div>
  <!-- <div id="top_menu">
  	<ul>
  		<li><a href="#" class="top1">会员管理</a></li>
  		<li><a href="#" class="top1">会员管理</a></li>
  		<li><a href="#" class="top1">会员管理</a></li>
  		<li><a href="#" class="top1">会员管理</a></li>
  		<li><a href="#" class="top1">会员管理</a></li>
  		<li><a href="#" class="top1">会员管理</a></li>
  		<li><a href="#" class="top1">会员管理</a></li>
  		<li><a href="#" class="top1">会员管理</a></li>
  		<li><a href="#" class="top1">会员管理</a></li>
  	</ul>
  </div> -->
  <div id="top_menu">
   <div class="top1">会员管理</div>
   <div class="top1">会员管理</div>
   <div class="top1">会员管理</div>
   <div class="top1">会员管理</div>
   <div class="top1">会员管理</div>
   <div class="top1">会员管理</div>
   <div class="top1">会员管理</div>
   <div class="top1">会员管理</div>
   <div style="border-right: 1px #000 solid; float: left; height: 25px;"></div>
   </div>
  </body>
</html>
