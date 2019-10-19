package com.pojo.airticket;

public class AvailFlightBean {
	private String flight_code,airline_name,from_location,to_location,dept_time,arrival_time,price,frequency,flight_id;
	
	public AvailFlightBean(){}
	
	public AvailFlightBean(String flight_code, String airline_name, String from_location, String to_location,
			String dept_time, String arrival_time, String price, String frequency,String flight_id) {
		super();
		this.flight_code = flight_code;
		this.airline_name = airline_name;
		this.from_location = from_location;
		this.to_location = to_location;
		this.dept_time = dept_time;
		this.arrival_time = arrival_time;
		this.price = price;
		this.frequency = frequency;
		this.flight_id=flight_id;
	}

	
	public String getFlight_id() {
		return flight_id;
	}

	public void setFlight_id(String flight_id) {
		this.flight_id = flight_id;
	}

	public String getFlight_code() {
		return flight_code;
	}

	public void setFlight_code(String flight_code) {
		this.flight_code = flight_code;
	}

	public String getAirline_name() {
		return airline_name;
	}

	public void setAirline_name(String airline_name) {
		this.airline_name = airline_name;
	}

	public String getFrom_location() {
		return from_location;
	}

	public void setFrom_location(String from_location) {
		this.from_location = from_location;
	}

	public String getTo_location() {
		return to_location;
	}

	public void setTo_location(String to_location) {
		this.to_location = to_location;
	}

	public String getDept_time() {
		return dept_time;
	}

	public void setDept_time(String dept_time) {
		this.dept_time = dept_time;
	}

	public String getArrival_time() {
		return arrival_time;
	}

	public void setArrival_time(String arrival_time) {
		this.arrival_time = arrival_time;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getFrequency() {
		return frequency;
	}

	public void setFrequency(String frequency) {
		this.frequency = frequency;
	}
	

}
