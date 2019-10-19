package com.dao.airticketbooking;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import com.pojo.airticket.*;

public class DaoClass {
	
	static Connection conn;
	static Statement st=null;
	static ResultSet rs;
	
	public DaoClass(){
		conn=(Connection)MySqlConnect.ConnectDB();
	}
	
	public boolean login(String username, String password) throws SQLException
	{
	Boolean valid=false;
	
	String sql_check="SELECT count(*) as tot from user_table where username=\""+username+"\" and password=\""+password+"\" and status=1";
		st=(Statement)conn.createStatement();
		 rs=st.executeQuery(sql_check);
		rs.next();
		int count=rs.getInt("tot");
		if(count!=0)
		{
			valid=true;
			return valid;
		}
		
		conn.close();
	return valid;
	}
	
	public String getRole(String username) throws SQLException {
		String role = null;
		String sql="select role from user_table where username = '"+username+"';";
		st=conn.createStatement();
		ResultSet rs = st.executeQuery(sql);
	    while(rs.next()){
	    	
			role = rs.getString(1);
		}
		return role;
	}
	
	public boolean signup(String username,String password,String name,String mobile,String email,String city, String gender) throws SQLException
	{
		String sql_user="INSERT INTO `user_table` (`name`, `username`, `password`, `email`, `mobile`, `city`, `role`, `gender`) VALUES ('"+name+"', '"+username+"', '"+password+"', '"+email+"', '"+mobile+"', '"+city+"', 'user', '"+gender+"')";
		
	
		st=(Statement) conn.createStatement();
		int i=st.executeUpdate(sql_user);
		if(i>0)
		{
			return true;
		}
		return false;
		
	}
	
	public boolean addFlight(String flight_code,String airline_id,String from_location,String to_location,String dept_time,String arrival_time, String duration, String total_seat, String price, String [] frequency) throws SQLException
	{
		String freq = frequency[0];
		for(int i =1;i<frequency.length;i++)
			freq+="-"+frequency[i];
		String sql_add_flight="INSERT INTO `flight_table` (`flight_code`, `airline_id`, `from_location`, `to_location`, `dept_time`, `arrival_time`, `duration`, `total_seat`, `frequency`, `price`) VALUES ('"+flight_code+"', '"+airline_id+"', '"+from_location+"', '"+to_location+"', '"+dept_time+"', '"+arrival_time+"', '"+duration+"', '"+total_seat+"', '"+freq+"', '"+price+"');";
		st=(Statement) conn.createStatement();
		int i=st.executeUpdate(sql_add_flight);
		if(i>0)
		{
			return true;
		}
		return false;
		
	}
	public boolean bookFlight(String p_name[],String p_age[],String p_gender[],String flight_id,String doj,String pnr, int noOfSeat,String username) throws SQLException
	{
		String sql_check="Select count(*) from flight_info_table where dept_date='"+doj+"' and flight_id='"+flight_id+"'";
		//System.out.println(sql_check);
		st=(Statement) conn.createStatement();
		ResultSet rs=st.executeQuery(sql_check);
		rs.next();
		int count = rs.getInt(1);
		if(count==0)
		{
			String getAvailSeat = "Select total_seat from flight_table where flight_id='"+flight_id+"'";
			//System.out.println(getAvailSeat);
			st=(Statement) conn.createStatement();
			rs=st.executeQuery(getAvailSeat);
			rs.next();
			int availSeat = rs.getInt(1)-1;
			String insert_flight_info = "INSERT INTO `flight_info_table`( `flight_id`, `dept_date`, `available_seat`) VALUES ('"+flight_id+"','"+doj+"','"+availSeat+"')";
			//System.out.println(insert_flight_info);
			st=(Statement) conn.createStatement();
			int t =st.executeUpdate(insert_flight_info);
			if(t<0)
			{
				return false;
			}

		}
		else
		{
			String update_flight_info = "UPDATE `flight_info_table` SET `available_seat`=available_seat-1 WHERE flight_id='"+flight_id+"' and dept_date='"+doj+"'";
			//System.out.println(update_flight_info);
			st=(Statement) conn.createStatement();
			st.executeUpdate(update_flight_info);
		}
		for(int i = 0; i<noOfSeat;i++)
		{
			
			String insert_ticket_info = "INSERT INTO `ticket_detail_table`(`pnr`, `username`, `name`, `age`, `gender`, `flight_id`, `dept_date`) VALUES ('"+pnr+"','"+username+"','"+p_name[i]+"','"+p_age[i]+"','"+p_gender[i]+"','"+flight_id+"','"+doj+"')";
			//System.out.println(insert_ticket_info);
			st=(Statement) conn.createStatement();
			int t =st.executeUpdate(insert_ticket_info);
		}
		
		return true;
		
	}
	
	public List getAirLines() {
	    List<AirLineDetails>airlines = new ArrayList();
	    try {
	    	String sql = "SELECT * from airline_table";
	        st=conn.createStatement();
	        ResultSet rs = st.executeQuery(sql);
	        
	        while (rs.next()) {
	            AirLineDetails ald = new AirLineDetails();
	            ald.setAirline_id(rs.getString(1));
	            ald.setAirline_name(rs.getString(2));
	            airlines.add(ald);
	        }
	        
	       
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return airlines;
	}
	
	public List getTicketDetails(String username) {
	    List<TicketDetails>ticket = new ArrayList();
	    try {
	    	String sql = "SELECT distinct(t.pnr),t.flight_id,t.dept_date,a.airline_name from ticket_detail_table t inner join flight_table f inner join airline_table a  where t.flight_id=f.flight_id and a.airline_id=f.airline_id and t.username='"+username+"' and t.status=1";
	        st=conn.createStatement();
	        ResultSet rs = st.executeQuery(sql);
	        
	        while (rs.next()) {
	            TicketDetails td = new TicketDetails();
	            td.setPnr(rs.getString(1));
	            td.setFlight_id(rs.getString(2));
	            td.setDoj(rs.getString(3));
	            td.setAirline_name(rs.getString(4));
	            ticket.add(td);
	        }
	        
	       
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return ticket;
	}
	
	public List getAllTicketDetails(String username) {
	    List<TicketDetails>ticket = new ArrayList();
	    try {
	    	String sql = "SELECT distinct(t.pnr),t.flight_id,t.dept_date,a.airline_name,t.status from ticket_detail_table t inner join flight_table f inner join airline_table a  where t.flight_id=f.flight_id and a.airline_id=f.airline_id and t.username='"+username+"'";
	        st=conn.createStatement();
	        ResultSet rs = st.executeQuery(sql);
	        
	        while (rs.next()) {
	            TicketDetails td = new TicketDetails();
	            td.setPnr(rs.getString(1));
	            td.setFlight_id(rs.getString(2));
	            td.setDoj(rs.getString(3));
	            td.setAirline_name(rs.getString(4));
	            td.setStatus(rs.getString(5));
	            ticket.add(td);
	        }
	        
	       
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return ticket;
	}
	
	public List getFlightDetail() {
	    List<FlightDetailBean>flight = new ArrayList();
	    try {
	    	String sql = "SELECT ft.`flight_id`, ft.`flight_code`, ft.`from_location`, ft.`to_location`, ft.`dept_time`, ft.`arrival_time`, ft.`duration`, ft.`total_seat`, ft.`frequency`, ft.`price`, ft.`status`, at.`airline_name` FROM `flight_table` ft inner join airline_table at WHERE ft.airline_id = at.airline_id and ft.status=1";
	        st=conn.createStatement();
	        ResultSet rs = st.executeQuery(sql);
	        
	        while (rs.next()) {
	            FlightDetailBean fdb = new FlightDetailBean();
	            fdb.setFlight_id(rs.getString(1));
	            fdb.setFlight_code(rs.getString(2));
	            fdb.setFrom_location(rs.getString(3));
	            fdb.setTo_location(rs.getString(4));
	            fdb.setDept_time(rs.getString(5));
	            fdb.setArrival_time(rs.getString(6));
	            fdb.setDuration(rs.getString(7));
	            fdb.setTotal_seat(rs.getString(8));
	            fdb.setFrequency(rs.getString(9));
	            fdb.setPrice(rs.getString(10));
	            fdb.setStatus(rs.getString(11));
	            fdb.setAirline_name(rs.getString(12));
	            flight.add(fdb);
	        }
	        
	       
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return flight;
	}
	
	public List getFlightAllDetail() {
	    List<FlightDetailBean>flight = new ArrayList();
	    try {
	    	String sql = "SELECT ft.`flight_id`, ft.`flight_code`, ft.`from_location`, ft.`to_location`, ft.`dept_time`, ft.`arrival_time`, ft.`duration`, ft.`total_seat`, ft.`frequency`, ft.`price`, ft.`status`, at.`airline_name` FROM `flight_table` ft inner join airline_table at WHERE ft.airline_id = at.airline_id";
	        st=conn.createStatement();
	        ResultSet rs = st.executeQuery(sql);
	        
	        while (rs.next()) {
	            FlightDetailBean fdb = new FlightDetailBean();
	            fdb.setFlight_id(rs.getString(1));
	            fdb.setFlight_code(rs.getString(2));
	            fdb.setFrom_location(rs.getString(3));
	            fdb.setTo_location(rs.getString(4));
	            fdb.setDept_time(rs.getString(5));
	            fdb.setArrival_time(rs.getString(6));
	            fdb.setDuration(rs.getString(7));
	            fdb.setTotal_seat(rs.getString(8));
	            fdb.setFrequency(rs.getString(9));
	            fdb.setPrice(rs.getString(10));
	            fdb.setStatus(rs.getString(11));
	            fdb.setAirline_name(rs.getString(12));
	            flight.add(fdb);
	        }
	        
	       
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return flight;
	}
	
	public List getUserDetail() {
	    List<UserDetailBean>user = new ArrayList();
	    try {
	    	String sql = "Select `name`, `username`, `email`, `mobile`, `city`, `gender` from user_table where role='user' and status=1";
	        //System.out.println(sql);
	    	st=conn.createStatement();
	        ResultSet rs = st.executeQuery(sql);
	        
	        while (rs.next()) {
	            UserDetailBean udb = new UserDetailBean();
	            udb.setName(rs.getString(1));
	            udb.setUsername(rs.getString(2));
	            udb.setEmail(rs.getString(3));
	            udb.setMobile(rs.getString(4));
	            udb.setCity(rs.getString(5));
	            udb.setGender(rs.getString(6));
	            user.add(udb);
	        }
	        
	       
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return user;
	}
	
	public List getAllUserDetail() {
	    List<UserDetailBean>user = new ArrayList();
	    try {
	    	String sql = "Select `name`, `username`, `email`, `mobile`, `city`, `gender`,`role` from user_table where status=1";
	       // System.out.println(sql);
	    	st=conn.createStatement();
	        ResultSet rs = st.executeQuery(sql);
	        
	        while (rs.next()) {
	            UserDetailBean udb = new UserDetailBean();
	            udb.setName(rs.getString(1));
	            udb.setUsername(rs.getString(2));
	            udb.setEmail(rs.getString(3));
	            udb.setMobile(rs.getString(4));
	            udb.setCity(rs.getString(5));
	            udb.setGender(rs.getString(6));
	            udb.setRole(rs.getString(7));     
	            user.add(udb);
	        }
	        
	       
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return user;
	}
	
	public boolean deleteUser(String username) throws SQLException
	{
		String sql = "UPDATE `user_table` SET `status`= 0 WHERE username = '"+username+"'";
		//System.out.println(sql);
       st=conn.createStatement();
       int i=st.executeUpdate(sql);
		if(i>0)
		{
			return true;
		}
		return false;
	}
	public boolean deleteFlight(String fid) throws SQLException
	{
		String sql = "UPDATE `flight_table` SET `status`= 0 WHERE flight_id = "+fid;
		st=conn.createStatement();
		int i=st.executeUpdate(sql);
		if(i>0)
		{
			return true;
		}
		return false;
	}
	public boolean cancelTicket(String pnr) throws SQLException
	{
		String sql = "UPDATE `ticket_detail_table` SET `status`= 0 WHERE pnr ='"+pnr+"'";
		st=conn.createStatement();
		int i=st.executeUpdate(sql);
		if(i>0)
		{
			return true;
		}
		return false;
	}

	public List getAvailFlightDetail(String from_location, String to_location, String doj) throws ParseException {
		List<AvailFlightBean>flights = new ArrayList();
		Date date_of_journey = new SimpleDateFormat("yyyy-MM-dd").parse(doj);
		SimpleDateFormat simpleDateformat = new SimpleDateFormat("EEEE"); 
        String dayofdate= simpleDateformat.format(date_of_journey);
		try {
			String sql = "SELECT ft.`flight_code`, ft.`from_location`, ft.`to_location`, ft.`dept_time`, ft.`arrival_time`, ft.`price`, at.`airline_name`,ft.`flight_id` FROM `flight_table` ft inner join airline_table at WHERE ft.airline_id = at.airline_id and ft.status=1 and ft.from_location='"+from_location+"' and ft.to_location='"+to_location+"' and frequency like '%"+dayofdate+"%'";
			//System.out.println(sql);
			st=conn.createStatement();
			ResultSet rs = st.executeQuery(sql);
			
			while (rs.next()) {
				AvailFlightBean afb = new AvailFlightBean();
				afb.setFlight_code(rs.getString(1));
				afb.setFrom_location(rs.getString(2));
				afb.setTo_location(rs.getString(3));
				afb.setDept_time(rs.getString(4));
				afb.setArrival_time(rs.getString(5));
				afb.setPrice(rs.getString(6));
				afb.setAirline_name(rs.getString(7));
				afb.setFlight_id(rs.getString(8));
				flights.add(afb);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return flights;
	}
}
