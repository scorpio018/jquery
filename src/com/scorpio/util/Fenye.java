package com.scorpio.util;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.scorpio.service.ITfkjService;
import com.scorpio.util.Pageginate;

public class Fenye {
	//传入的参数分别代表：当前页、一页共显示多少条数据、调用ibatis中的sqlMap的id名、传入sqlMap中的对象(条件)、service接口、分页类、请求对象
	@SuppressWarnings("rawtypes")
	public static List obsearch(int current, int maxcount, String sql, Object ob, ITfkjService tfkjService, Pageginate pageginate, HttpServletRequest request){
		//计算当前页
		if(current <= 0){
			pageginate.setCurrentPage(1);
		}else{
			pageginate.setCurrentPage(current);
		}
		//一页显示多少条条记录
		pageginate.setShowCount(maxcount);
		//从数据库中查询一共有多少条数据--ob为空则表示查询所有数据，不为空则表示有条件查询
		if(ob == null){
			int pagecount = tfkjService.findObjectAll(sql).size();
			pageginate.setResultCount(pagecount);
//			request.setAttribute("pagecount", pageginate);
		}else{
			int pagecount = tfkjService.findObject(sql, ob).size();
			pageginate.setResultCount(pagecount);
//			request.setAttribute("pagecount", pageginate);
		}
		//通过判断是否有余数来确定一共有多少页
		if(pageginate.getResultCount()%pageginate.getShowCount()!=0){
			pageginate.setPageCount(pageginate.getResultCount()/pageginate.getShowCount()+1);
		}else{
			pageginate.setPageCount(pageginate.getResultCount()/pageginate.getShowCount());
		}
		//防止当前页超过最大页面数
		if(pageginate.getCurrentPage()>pageginate.getPageCount()){
			pageginate.setCurrentPage(pageginate.getPageCount());
		}
		/*//将当前页和最后页的值放入request中
		request.setAttribute("currentPage", pageginate.getCurrentPage());
		request.setAttribute("lastPage", pageginate.getPageCount());*/
		request.setAttribute("pageginate", pageginate);
		//将查询出的数据集合进行返回
		if(ob == null)
			return tfkjService.findObject(sql, (pageginate.getCurrentPage() - 1 )*pageginate.getShowCount(), pageginate.getShowCount());
		else
			return tfkjService.findObject(sql, ob, (pageginate.getCurrentPage() - 1 )*pageginate.getShowCount(), pageginate.getShowCount());
	}
	
	//传入的参数分别代表：当前页、一页共显示多少条数据、调用ibatis中的sqlMap的id名、传入sqlMap中的String类型的id(条件)、service接口、分页类、请求对象
	@SuppressWarnings("rawtypes")
	public static List idsearch(int current, int maxcount, String sql, String id, ITfkjService tfkjService, Pageginate pageginate, HttpServletRequest request){
		//计算当前页
		if(current <= 0){
			pageginate.setCurrentPage(1);
		}else{
			pageginate.setCurrentPage(current);
		}
		//一页显示多少条条记录
		pageginate.setShowCount(maxcount);
		//从数据库中查询一共有多少条数据--ob为空则表示查询所有数据，不为空则表示有条件查询
		if (id == null || "".equals(id)){
			int pagecount = tfkjService.findObjectAll(sql).size();
			pageginate.setResultCount(pagecount);
//			request.setAttribute("pagecount", pageginate);
		}else{
			int pagecount = tfkjService.findObject(sql, id).size();
			pageginate.setResultCount(pagecount);
//			request.setAttribute("pagecount", pageginate);
		}
		//通过判断是否有余数来确定一共有多少页
		if(pageginate.getResultCount()%pageginate.getShowCount()!=0){
			pageginate.setPageCount(pageginate.getResultCount()/pageginate.getShowCount()+1);
		}else{
			pageginate.setPageCount(pageginate.getResultCount()/pageginate.getShowCount());
		}
		//防止当前页超过最大页面数
		if(pageginate.getCurrentPage()>pageginate.getPageCount()){
			pageginate.setCurrentPage(pageginate.getPageCount());
		}
		/*//将当前页和最后页的值放入request中
		request.setAttribute("currentPage", pageginate.getCurrentPage());
		request.setAttribute("lastPage", pageginate.getPageCount());*/
		request.setAttribute("pageginate", pageginate);
		//将查询出的数据集合进行返回
		if(id == null || "".equals(id))
			return tfkjService.findObject(sql, (pageginate.getCurrentPage() - 1 ) * pageginate.getShowCount(), pageginate.getShowCount());
		else
			return tfkjService.findObject(sql, id, (pageginate.getCurrentPage() - 1 ) * pageginate.getShowCount(), pageginate.getShowCount());
	}
}
