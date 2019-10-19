<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.dao.airticketbooking.MySqlConnect"%>
       <%@page import="com.dao.airticketbooking.DaoClass"%>
   <%@page import="com.pojo.airticket.FlightDetailBean"%>
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
List<FlightDetailBean> lfdb = dao.getFlightAllDetail();

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
        <th>Frequency</th>
        <th>Price</th>
        <th>Total Seat</th>
        <th>Status</th>
      </tr>
    </thead>
    <tbody>
    <%for(FlightDetailBean fdb:lfdb) {%>
    <tr>
    <td><%=fdb.getFlight_code() %></td>
    <td><%=fdb.getAirline_name() %></td>
    <td><%=fdb.getFrom_location() %></td>
    <td><%=fdb.getTo_location() %></td>
    <td><%=fdb.getDept_time() %></td>
    <td><%=fdb.getArrival_time() %></td>
    <td><%=fdb.getFrequency() %></td>
    <td><%=fdb.getPrice() %></td>
    <td><%=fdb.getTotal_seat() %></td>
    <%if(!fdb.getStatus().equals("1")){ %>
    <td style="color:red">Inactive</td>
    <%}else {%>
    <td style="color:green">Active</td>
    <%} %>
    </tr>
    <%} %>
    </tbody>
    </table>
        </div>
        </div>
   <br><br><br><br>   <br><br><br><br> <br> <br> <br> <br> <br> <br> <br>  <br><br>
        <jsp:include page="../include/footer.jsp" />
</body>
</html>