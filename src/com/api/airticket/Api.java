package com.api.airticket;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import com.google.gson.Gson;
import com.hb.airticket.FetchCity;

import java.util.HashMap;

@Path("/rest")
public class Api {
	  @Path("/city")
	  @GET  
	 
	  public String fetch() {  
			HashMap<String,String> map = new HashMap<String,String>();
			FetchCity fc = new FetchCity();
			map = fc.getCityDetails();
			System.out.println(map);
			Gson gson = new Gson();
		    String json = gson.toJson(map);
		    return json;
	     
	  }  
	
}
