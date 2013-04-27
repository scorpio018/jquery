package com.scorpio.util;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class JSonUtil {
	public static void jsonAjax(Vector<Vector<String>> vss, Vector<String> key,
			HttpServletResponse response) throws IOException {
		JSONArray jsonAddressBook = new JSONArray();
		for (Vector<String> vs : vss) {
			JSONObject jsonResult = new JSONObject();
			for (int i = 0; i < vs.size(); i++) {
				jsonResult.put(key.get(i), vs.get(i));
			}
			jsonAddressBook.add(jsonResult);
		}
		JSONObject jo = new JSONObject();
		jo.put("goods", jsonAddressBook);
		HistoryBack.ajax(response, jo);
	}
}
