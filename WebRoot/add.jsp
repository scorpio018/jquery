<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'enter.jsp' starting page</title>

	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <s:form action="jquerysave" method="post"><table width="80%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td align="right">商品名称:</td>
    <td><input type="text" id="sname" name="sname" value=""/></td>
  </tr>
  <tr>
    <td align="right">货号</td>
    <td><input type="text" id="sno" name="sno" value=""/></td>
  </tr>
  <tr>
    <td align="right">价格</td>
    <td><input type="text" id="sprice" name="sprice" value=""/></td>
  </tr>
  <tr>
    <td align="right">是否上架</td>
    <td><input type="checkbox" id="isupsale" name="isupsale" value="true"/>上架
    	<input type="checkbox" id="isessence" name="isessence" value="true"/>精品
    	<input type="checkbox" id="isnew" name="isnew" value="true"/>新品
    	<input type="checkbox" id="ishotsale" name="ishotsale" value="true"/>热销
    </td>
  </tr>
  <tr>
    <td align="right">排序</td>
    <td><input type="text" id="sort" name="sort" value=""/></td>
  </tr>
  <tr>
    <td align="right">库存</td>
    <td><input type="text" id="stock" name="stock" value=""/></td>
  </tr>
  <tr>
    <td align="right">&nbsp;</td>
    <td><input type="submit" id="sub" name="sub" value="添加"/></td>
  </tr>
</table>

    
    	
    	
    	
    	
    	
    	
    	
    	
    	
    </s:form>
  </body>
</html>
