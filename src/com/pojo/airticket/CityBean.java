package com.pojo.airticket;

public class CityBean {
	private String city_name,city_code;
	private int city_id;

	public CityBean(){}

	public CityBean(String city_name, String city_code, int city_id) {
		super();
		this.city_name = city_name;
		this.city_code = city_code;
		this.city_id = city_id;
	}

	public int getCity_id() {
		return city_id;
	}

	public void setCity_id(int city_id) {
		this.city_id = city_id;
	}

	public String getCity_name() {
		return city_name;
	}

	public void setCity_name(String city_name) {
		this.city_name = city_name;
	}

	public String getCity_code() {
		return city_code;
	}

	public void setCity_code(String city_code) {
		this.city_code = city_code;
	}
	

	
}
