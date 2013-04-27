package com.scorpio.util;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.PageContext;

public class HistoryBack {
	
	public static void back(HttpServletResponse response, String msg) throws IOException{
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.print("<script type='text/javascript'>alert('"+msg+"');history.back();</script>");
		out.flush();
		out.close();
	}
	
	public static void gologin(HttpServletResponse response, String msg) throws IOException{
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.print("<script type='text/javascript'>alert('"+msg+"');</script>");		
		out.flush();
	}
	
	public static void TagBack(PageContext pageContext, String msg) throws IOException{
		pageContext.getOut().print("<script type='text/javascript'>alert('"+msg+"');history.back();</script>");
		pageContext.getOut().flush();
		pageContext.getOut().close();
	}
	
	public static void ajax(HttpServletResponse response, Object msg) throws IOException{
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		System.out.println(msg);
		out.print(msg);		
		out.flush();
		out.close();
	}
	
}
