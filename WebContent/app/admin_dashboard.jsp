<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.dao.airticketbooking.MySqlConnect"%>
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
 %>
<jsp:include page="../include/navbar-app.jsp" />
 <br>
        <br>
        <br><br><br>
        <div class="container">
        	<h1 style="text-align: center">Welcome, <%=username.toUpperCase() %></h1>
            <div class="row">
                <div class="col-md-12 col-sm-12  col-xs-10">
                    <br>
                    <br>
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="row">
                             <div class="col-md-4 col-sm-4 col-xs-4">
                             <a href="add_flight.jsp"><button class="btn btn-primary btn-block btn-lg"><i class="glyphicon glyphicon-plane"></i>&nbsp;Add Flight</button></a>
                             </div>
                             
                             <div class="col-md-4 col-sm-4 col-xs-4">
                             <a href="remove_flight.jsp"><button class="btn btn-primary btn-block btn-lg"><i class="glyphicon glyphicon-remove-circle"></i>&nbsp;Remove Flight</button></a>
                             </div>
                             <div class="col-md-4 col-sm-4 col-xs-4">
                             <a href="list_flight.jsp"><button class="btn btn-primary btn-block btn-lg"><i class="glyphicon glyphicon-list-alt"></i>&nbsp;List of Flight</button></a>
                             </div>
                             <br><br><br><br><br><br><br>
                              <div class="col-md-4 col-sm-4 col-xs-4">
                             <a href="add_user.jsp"><button class="btn btn-primary btn-block btn-lg"><i class="glyphicon glyphicon-user"></i>&nbsp;Add User</button></a>
                             </div>
                             <div class="col-md-4 col-sm-4 col-xs-4">
                             <a href="remove_user.jsp"><button class="btn btn-primary btn-block btn-lg"><i class="glyphicon glyphicon-trash"></i>&nbsp;Remove User</button></a>
                             </div>
                            
                             
                             <div class="col-md-4 col-sm-4 col-xs-4">
                             <a href="list_user.jsp"><button class="btn btn-primary btn-block btn-lg"><i class="glyphicon glyphicon-list"></i></i>&nbsp;List of User</button></a>
                             </div>
                            
                             </div>
                             
                            
                            </div>
                         
                            
                            
                            </div>

                        </div>
		</div>
	</div>

                    
           <br><br><br><br>   <br><br><br><br> <br>  <br><br>
        <jsp:include page="../include/footer.jsp" />
</body>
</html>