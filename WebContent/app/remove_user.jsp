<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.dao.airticketbooking.MySqlConnect"%>
       <%@page import="com.dao.airticketbooking.DaoClass"%>
   <%@page import="com.pojo.airticket.UserDetailBean"%>
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
List<UserDetailBean> ludb = dao.getUserDetail();

%>
<jsp:include page="../include/navbar-app.jsp" />
<br>
        <br>
        <br><br><br>
        	<h1 style="text-align: center">Remove User</h1>
        	<div class="container">
				<br>
  <div class="table-responsive">
  <table class="table table-bordered table-striped" align="center" width="100">
    <thead>
      <tr>
        <th>Name</th>
        <th>Username</th>
        <th>Email</th>
        <th>Mobile</th>
        <th>City</th>
        <th>Gender</th>
        <th>Remove</th>
      </tr>
    </thead>
    <tbody>
    <%for(UserDetailBean udb:ludb) {%>
    <tr>
    <td><%=udb.getName() %></td>
    <td><%=udb.getUsername() %></td>
    <td><%=udb.getEmail() %></td>
    <td><%=udb.getMobile() %></td>
    <td><%=udb.getCity() %></td>
    <td><%=udb.getGender() %></td>
    <td><form onSubmit="if(!confirm('Do you really want to remove?')){return false;}"  action="../api/deleteuser.jsp" method="post">
								    		<input type="hidden" name="uid" id="uid" value=<%=udb.getUsername() %>>
								    		<input type="submit" name="edit" value="Remove" class="btn btn-block btn-danger">
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