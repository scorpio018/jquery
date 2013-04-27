package com.scorpio.bean;

public class Goods {
	private int sid;//编号
	private String sname;//商品名称
	private String sno;//货号
	private double sprice;//价格
	private boolean isupsale;//是否上架
	private int isupsaleSta = 0;
	private boolean isessence;//是否是精品
	private int isessenceSta = 0;
	private boolean isnew;//是否为新品
	private int isnewSta = 0;
	private boolean ishotsale;//是否畅销
	private int ishotsaleSta = 0;
	private int sort = -1;//排序
	private int stock = -1;//库存
	private boolean state;//当前状态(是否删除)
	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getSno() {
		return sno;
	}
	public void setSno(String sno) {
		this.sno = sno;
	}
	public double getSprice() {
		return sprice;
	}
	public void setSprice(double sprice) {
		this.sprice = sprice;
	}
	public boolean isIsupsale() {
		return isupsale;
	}
	public void setIsupsale(boolean isupsale) {
		this.isupsale = isupsale;
	}
	public int getIsupsaleSta() {
		return isupsaleSta;
	}
	public void setIsupsaleSta(int isupsaleSta) {
		this.isupsaleSta = isupsaleSta;
	}
	public boolean isIsessence() {
		return isessence;
	}
	public void setIsessence(boolean isessence) {
		this.isessence = isessence;
	}
	public int getIsessenceSta() {
		return isessenceSta;
	}
	public void setIsessenceSta(int isessenceSta) {
		this.isessenceSta = isessenceSta;
	}
	public boolean isIsnew() {
		return isnew;
	}
	public void setIsnew(boolean isnew) {
		this.isnew = isnew;
	}
	public int getIsnewSta() {
		return isnewSta;
	}
	public void setIsnewSta(int isnewSta) {
		this.isnewSta = isnewSta;
	}
	public boolean isIshotsale() {
		return ishotsale;
	}
	public void setIshotsale(boolean ishotsale) {
		this.ishotsale = ishotsale;
	}
	public int getIshotsaleSta() {
		return ishotsaleSta;
	}
	public void setIshotsaleSta(int ishotsaleSta) {
		this.ishotsaleSta = ishotsaleSta;
	}
	public int getSort() {
		return sort;
	}
	public void setSort(int sort) {
		this.sort = sort;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public boolean isState() {
		return state;
	}
	public void setState(boolean state) {
		this.state = state;
	}
	
	
}
