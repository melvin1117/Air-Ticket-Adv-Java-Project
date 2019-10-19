package com.hb.airticket;

import java.util.HashMap;

import com.google.gson.Gson;

public class Ffff {
	
	public static void main(String[] args) {
	HashMap<String,String> map = new HashMap<String,String>();
	FetchCity fc = new FetchCity();
	map = fc.getCityDetails();
	Gson gson = new Gson();
    String json = gson.toJson(map);
    System.out.println("json = " + json);
}

}
