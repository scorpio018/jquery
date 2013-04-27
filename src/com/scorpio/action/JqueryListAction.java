package com.scorpio.action;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.SortedMap;
import java.util.TreeMap;
import java.util.Vector;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.opensymphony.xwork2.ModelDriven;
import com.scorpio.bean.Address;
import com.scorpio.bean.Goods;
import com.scorpio.service.ITfkjService;
import com.scorpio.util.Fenye;
import com.scorpio.util.HistoryBack;
import com.scorpio.util.JSonUtil;
import com.scorpio.util.Pageginate;
@SuppressWarnings({ "unchecked", "serial" })
public class JqueryListAction extends BaseAction implements ModelDriven<Goods>{

	private ITfkjService tfkjService;
	private Goods goods;
	private Pageginate pageginate;
	private int current;
	private int maxcount;
	private int showcount;
	public ITfkjService getTfkjService() {
		return tfkjService;
	}
	public void setTfkjService(ITfkjService tfkjService) {
		this.tfkjService = tfkjService;
	}
	public Goods getGoods() {
		return goods;
	}
	public void setGoods(Goods goods) {
		this.goods = goods;
	}
	public Pageginate getPageginate() {
		return pageginate;
	}
	public void setPageginate(Pageginate pageginate) {
		this.pageginate = pageginate;
	}
	public int getCurrent() {
		return current;
	}
	public void setCurrent(int current) {
		this.current = current;
	}
	public int getMaxcount() {
		return maxcount;
	}
	public void setMaxcount(int maxcount) {
		this.maxcount = maxcount;
	}
	public int getShowcount() {
		return showcount;
	}
	public void setShowcount(int showcount) {
		this.showcount = showcount;
	}
	@Override
	public Goods getModel() {
		// TODO Auto-generated method stub
		return goods;
	}
	
	public String list(){
		List<Goods> gs = Fenye.idsearch(current, showcount==0 ? 15 : showcount, "getGoodsList", null, tfkjService, pageginate, request);
		request.setAttribute("goods", gs);
		return SUCCESS;
	}
	public String listagain(){
		List<Goods> gs = Fenye.idsearch(current, showcount==0 ? 15 : showcount, "getGoodsList", null, tfkjService, pageginate, request);
		request.setAttribute("goods", gs);
		return "again";
	}
	public String listajax() throws IOException{
		List<Goods> gs = Fenye.idsearch(current, showcount==0 ? 15 : showcount, "getGoodsList", null, tfkjService, pageginate, request);
		Vector<String> key = new Vector<String>();
		key.add("sid");
		key.add("sname");
		key.add("sno");
		key.add("sprice");
		key.add("isupsale");
		key.add("isessence");
		key.add("isnew");
		key.add("ishotsale");
		key.add("sort");
		key.add("stock");
		Vector<Vector<String>> vss = new Vector<Vector<String>>();
		for (Goods g : gs) {
			Vector<String> v = new Vector<String>();
			v.add(g.getSid()+"");
			v.add(g.getSname());
			v.add(g.getSno());
			v.add(g.getSprice()+"");
			v.add(g.isIsupsale() == true ? "1" : "0");
			v.add(g.isIsessence() == true ? "1" : "0");
			v.add(g.isIsnew() == true ? "1" : "0");
			v.add(g.isIshotsale() == true ? "1" : "0");
			v.add(g.getSort()+ "");
			v.add(g.getStock() + "");
			vss.add(v);
		}
		JSonUtil.jsonAjax(vss, key, response);
		return null;
	}
	
	public String inputajax() throws IOException{
		goods.setSname(null == goods.getSname() ? null : URLDecoder.decode(goods.getSname(), "UTF-8"));
		tfkjService.updateObject("setGoodsById", goods);
		return null;
	}
	//排序规则:0为倒序，1为正序
	public String sortajax(){
		
		return null;
	}
	public String add(){
		return "add";
	}
	public String save(){
		goods.setState(true);
		tfkjService.insertObject("addGoods", goods);
		return "saveok";
	}
	
	@SuppressWarnings("rawtypes")
	public String json(){
		// Create addressbook data structure
		SortedMap addressBook = new TreeMap();

		// Create new address entries and place in Map 
		// (See download for Address POJO structure)
		Address maryLebow = new Address("5 Main Street","San Diego, CA",91912,"619-332-3452","664-223-4667"); 
		addressBook.put("Mary Lebow",maryLebow);

		Address amySmith = new Address("25 H Street","Los Angeles, CA",95212,"660-332-3452","541-223-4667"); 
		addressBook.put("Sally May",amySmith);

		Address johnKim = new Address("2343 Sugarland Drive","Houston, TX",55212,"554-332-3412","461-223-4667"); 
		addressBook.put("John Kim",johnKim);

		Address richardThorn = new Address("14 68th Street","New York, NY",12452,"212-132-6182","161-923-4001"); 
		addressBook.put("Richard Thorn",richardThorn);
		
		
		
		//---------------------------------------------------------------------------------//
		// Define placeholder for JSON response
		String result = new String();

		// Get parameter (if any) passed into application 
		String from = request.getParameter("from");
		String to = request.getParameter("to");

		try { 
		    // Check for parameters, if passed filter address book 
		    if(from != null && to != null) { 
		      // Filter address book by initial 
		      addressBook = addressBook.subMap(from,to);
		    } 

		   // Prepare the convert addressBook Map to JSON array 
		   // Array used to place numerous address entries 
		   JSONArray jsonAddressBook = new JSONArray();
		 
		   // Iterate over filtered addressBook entries 
		   for (Iterator iter = addressBook.entrySet().iterator(); iter.hasNext();)  { 

		     // Get entry for current iteration        
		     Map.Entry entry = (Map.Entry)iter.next();
		     String key = (String)entry.getKey();
		     Address addressValue = (Address)entry.getValue();

		     // Place entry with key value assigned to "name" 
		     JSONObject jsonResult = new JSONObject();
		     jsonResult.put("name",key);

		     // Get and create address structure corresponding to each key 
		     // appending address entry in JSON format to result 
		     String streetText = addressValue.getStreet();
		     String cityText = addressValue.getCity();
		     int zipText = addressValue.getZip();
		     JSONObject jsonAddress = new JSONObject();
		     jsonAddress.accumulate("street",streetText);
		     jsonAddress.accumulate("city",cityText);
		     jsonAddress.accumulate("zip",zipText);
		     jsonResult.put("address",jsonAddress);

		     // Get and create telephone structure corresponding to each key 
		     // appending telephone entries in JSON format to result 
		     String telText = addressValue.getPhoneNumbers().getPhone().get(0);
		     String telTwoText = addressValue.getPhoneNumbers().getPhone().get(1);
		     JSONArray jsonTelephones = new JSONArray();
		     jsonTelephones.add(telText);
		     jsonTelephones.add(telTwoText);
		     jsonResult.put("phoneNumbers",jsonTelephones);


		     // Place JSON address entry in global jsonAddressBook 
		     jsonAddressBook.add(jsonResult);
		   } // end loop over address book 

		     // Assign JSON address book to result String  
		     JSONObject jo = new JSONObject();
		     jo.put("addressbook",jsonAddressBook);
		     HistoryBack.ajax(response, jo);

		  } catch (Exception e) { 
		     e.printStackTrace();      
		  }
		return null;
	}
}
