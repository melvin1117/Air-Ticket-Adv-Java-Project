<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.dao.airticketbooking.MySqlConnect"%>
       <%@page import="com.dao.airticketbooking.DaoClass"%>
   <%@page import="com.pojo.airticket.TicketDetails"%>
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
List<TicketDetails> td = dao.getTicketDetails(username);

%>
<jsp:include page="../include/navbar-app.jsp" />
<br>
        <br>
        <br><br><br>
        	<h1 style="text-align: center">Cancel Ticket</h1>
        	<div class="container">
				<br>
  <div class="table-responsive">
  <table class="table table-bordered table-striped" align="center" width="100">
    <thead>
      <tr>
        <th>PNR</th>
        <th>Departure Date</th>
        <th>Airline</th>
        <th>Cancel</th>
 
      </tr>
    </thead>
    <tbody>
    <%for(TicketDetails tdd:td) {%>
    <tr>
    <td><%=tdd.getPnr() %></td>
    <td><%=tdd.getDoj() %></td>
    <td><%=tdd.getAirline_name() %></td>
    <td><form onSubmit="if(!confirm('Do you really want to cancel?')){return false;}"  action="../api/cancelticket.jsp" method="post">
								    		<input type="hidden" name="pnr" id="pnr" value=<%=tdd.getPnr() %>>
								    		<input type="submit" name="edit" value="Cancel" class="btn btn-block btn-danger">
								    	</form></td>
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