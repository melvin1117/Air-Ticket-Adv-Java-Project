<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.dao.airticketbooking.MySqlConnect"%>
       <%@page import="com.dao.airticketbooking.DaoClass"%>
   <%@page import="com.pojo.airticket.AvailFlightBean"%>
   <%@ page import="java.util.List" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="../include/header-app.html" />
</head>
<body>
<%
String username=null;
username=(String)session.getAttribute("username");
DaoClass dao = new DaoClass();
String from_location = request.getParameter("from_location");
String to_location = request.getParameter("to_location");
String doj = request.getParameter("doj");
List<AvailFlightBean> lafdb = dao.getAvailFlightDetail(from_location,to_location,doj);

%>
<jsp:include page="../include/navbar-app.jsp" />
<br>
        <br>
        <br><br><br>
        	<h1 style="text-align: center">List of Flights</h1>
        	<div class="container">
				<br>
  <div class="table-responsive">
  <table class="table table-bordered table-striped" align="center" width="100">
    <thead>
      <tr>
        <th>Flight Code</th>
        <th>Airline</th>
        <th>From</th>
        <th>To</th>
        <th>Departure</th>
        <th>Arrival</th>
        <th>Price</th>
        <th>Qty</th>
        <th>Proceed</th>
      </tr>
    </thead>
    <tbody>
    <%if(lafdb.size()>0){
    for(AvailFlightBean afb:lafdb) {%>
    <tr>
    <td><%=afb.getFlight_code() %></td>
    <td><%=afb.getAirline_name() %></td>
    <td><%=afb.getFrom_location() %></td>
    <td><%=afb.getTo_location() %></td>
    <td><%=afb.getDept_time() %></td>
    <td><%=afb.getArrival_time() %></td>
    <td>Rs. <%=afb.getPrice() %></td>
    <td><form   action="get_passenger_data.jsp" method="post">
    <input type="number" name="noOfSeat" id="noOfSeat" required>
     </td>
    <td>
								    		<input type="hidden" name="fid" id="fid" value=<%=afb.getFlight_id() %>>
								    		<input type="hidden" name="doj" id="doj" value=<%=doj %>>
								    		<input type="hidden" name="price" id="price" value=<%=afb.getPrice() %>>
								    		
								    		
								    		<input type="submit" name="book" value="Proceed" class="btn btn-block btn-primary">
								    	</form></td>
    </tr>
    <%} }
    
    else{
    %>
    <tr>
    <td colspan="9" style="text-align:center">No flights found. Try something else.</td></tr>
   <%} %> 
    </tbody>
    </table>
        </div>
        </div>
   <br><br><br><br>   <br><br><br><br><bR> <br><br><br> <br> <br> <br> <br> <br>  <br><br>
        <jsp:include page="../include/footer.jsp" />
</body>
</html>