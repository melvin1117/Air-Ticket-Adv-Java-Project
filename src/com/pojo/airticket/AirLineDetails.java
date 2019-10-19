package com.pojo.airticket;

public class AirLineDetails {
	
	private String airline_id;
	private String airline_name;
	public AirLineDetails()
	{
		
	}
	public AirLineDetails(String airline_id, String airline_name) {
		super();
		this.airline_id = airline_id;
		this.airline_name = airline_name;
	}
	public String getAirline_id() {
		return airline_id;
	}
	public void setAirline_id(String airline_id) {
		this.airline_id = airline_id;
	}
	public String getAirline_name() {
		return airline_name;
	}
	public void setAirline_name(String airline_name) {
		this.airline_name = airline_name;
	}
	
	
	

}
