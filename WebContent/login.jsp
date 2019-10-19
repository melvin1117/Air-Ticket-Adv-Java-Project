<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<%@page import="com.dao.airticketbooking.MySqlConnect"%>
	<%@ page import="java.sql.*" %>
    <html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
      <title>Air Booking | An awesome place to book your air ticket</title>
      <link rel="stylesheet" href="webjars/bootstrap/3.3.7/css/bootstrap.min.css" />
      <link rel="stylesheet" href="webjars/font-awesome/4.7.0/css/font-awesome.min.css" />
      <script src="webjars/jquery/3.2.1/jquery.min.js"></script>
      <script src="webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>
      <link href="css/grayscale.css" rel="stylesheet">
      <script src="js/grayscale.js"></script>
      <!-- fonts -->
      <link href="http://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic" rel="stylesheet" type="text/css">
      <link href="http://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
      <link href="https://fonts.googleapis.com/css?family=Cookie|Great+Vibes" rel="stylesheet">
      <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500" rel="stylesheet">
        <style>
            body {
                background-color: transparent;
            }
            html {
                background: url(img/loginBack.png) no-repeat center center fixed;
                -webkit-background-size: cover;
                -moz-background-size: cover;
                -o-background-size: cover;
                background-size: cover;
            }
            .panel {
                background: rgba(142, 142, 142, .65);
            }
        </style>
    </head>
	
    <body>
    <%
	String username=null;
	username=(String)session.getAttribute("username");
	
	if(username!=null)
	{
		%>
		<script> window.location.replace("index.jsp");</script>
	<%} %>
        <jsp:include page="/include/navbar.jsp" />
        <br>
        <br>
        <br>
        <br>
        <div class="container">
            <div class="row">


                <div class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3 col-xs-8 col-xs-offset-2">
                    <br>
                    <br>
                    <br>
                    <b><h2 style="font-weight:600; font-size:40px; color:#FFF">Login</h2></b>
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <form method="post" action="LoginServlet">
                                <div class="form-group">
                                    <label for="username" style="color:#FFF; font-weight:700">Username:</label>
                                    <input type="text" class="form-control" id="username" name="username">
                                </div>

                                <div class="form-group">
                                    <label for="password" style="color:#FFF; font-weight:700">Password:</label>
                                    <input type="password" class="form-control" id="password" name="password">
                                </div>

                                <button type="submit" class="btn btn-primary btn-block" style="color:#FFF; font-weight:700">Login</button> 
                            </form>

                        </div>


                    </div>
                </div>
            </div>
        </div><br><br><br><br><br><Br>
       <footer style="top: 136px;" class="footer">
<div class="container">
        <span class="copyright">Copyright © Nissan Digital 2018 | Designed by <a href="https://www.linkedin.com/in/shubham-melvin-felix/" target="_blank">Shubham Melvin Felix</a></span>
    </div>

</footer>
    </body>

    </html>