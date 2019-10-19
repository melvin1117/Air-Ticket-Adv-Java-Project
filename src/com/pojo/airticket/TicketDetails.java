package com.pojo.airticket;

public class TicketDetails {
	String pnr,doj,airline_name,flight_id,status;

	public TicketDetails()
	{
		
	}
	
	

	public String getStatus() {
		return status;
	}



	public void setStatus(String status) {
		this.status = status;
	}



	public String getFlight_id() {
		return flight_id;
	}


	public void setFlight_id(String flight_id) {
		this.flight_id = flight_id;
	}


	public String getPnr() {
		return pnr;
	}

	public void setPnr(String pnr) {
		this.pnr = pnr;
	}

	public String getDoj() {
		return doj;
	}

	public void setDoj(String doj) {
		this.doj = doj;
	}


	public String getAirline_name() {
		return airline_name;
	}


	public void setAirline_name(String airline_name) {
		this.airline_name = airline_name;
	}


	
	

}
