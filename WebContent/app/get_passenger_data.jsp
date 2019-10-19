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
int noOfSeat = Integer.parseInt(request.getParameter("noOfSeat"));
String fid = request.getParameter("fid");
String doj = request.getParameter("doj");
Double  price = Double.parseDouble(request.getParameter("price"));
//List<AvailFlightBean> lafdb = dao.getAvailFlightDetail(from_location,to_location,doj);
%>
<jsp:include page="../include/navbar-app.jsp" />
<br>
        <br><br><br>
        <br>
        	<h1 style="text-align: center">Enter Passenger(s) Detail</h1>
        	<div class="container">
				<br>
				  <div class="row">


                <div class="col-md-4 col-md-offset-2 col-sm-4 col-sm-offset-2">
                    <br>
                    <br>                    
                    <form onSubmit="if(!confirm('Do you really want to book?')){return false;}" method="post" action="../BookFlightServlet">
                    <%for(int i =1;i<=noOfSeat;i++) {%>
                    <div class="panel panel-default">
                        <div class="panel-body">
                            
                                <div class="form-group">
                                    <label for="name" style="color:#000; font-weight:700">Passenger <%=i %> Name:</label>
                                    <input type="text" class="form-control" id="p_name<%=i %>" name="p_name<%=i %>">
                                </div>
                                <div class="form-group">
                                    <label for="age" style="color:#000; font-weight:700">Passenger <%=i %> Age:</label>
                                    <input type="number" class="form-control" id="p_age<%=i %>" name="p_age<%=i %>">
                                </div>
                                 <div class="form-group">
                                    <label for="gender" style="color:#000; font-weight:700">Passenger <%=i %> Gender:</label><br>
                                    <label class="radio-inline" style="color:#000; font-weight:700"><input type="radio" name="p_gender<%=i %>" value="Male" checked>Male</label>
									<label class="radio-inline" style="color:#000; font-weight:700"><input type="radio" name="p_gender<%=i %>" value="Female">Female</label>
                                </div>

                        </div>


                    </div>
                    <%} %>
                    			<input type="hidden" name="fid" id="fid" value=<%=fid %>>
								<input type="hidden" name="doj" id="doj" value=<%=doj %>>
								<input type="hidden" name="noOfSeat" id="noOfSeat" value=<%=noOfSeat %>>
								<input type="hidden" name="username" id="username" value=<%=username %>>
                                <button type="submit" class="btn btn-primary btn-block" style="color:#FFF; font-weight:700">Proceed</button> &nbsp;<a style="color:#FFF; font-weight:600" href="forgetpass.jsp">Forget Password?</a>
                    </form>
                </div>
                <div class="col-md-4 col-sm-4 ">
                <br><br>
                <div class="panel panel-default">
                        <div class="panel-body">
                            
                                <h3>Cost of 1 ticket: Rs.<%=price %></h3>
                                <h3>Cost of <%=noOfSeat %> ticket: Rs.<%=price*noOfSeat %></h3>

                        </div>


                    </div>
                </div>
            </div>
			
        </div>
   <br><br><br><br>   <br><br><br><br><bR> <br><br><br> <br> <br> <br> <br> <br>  <br><br>
        <jsp:include page="../include/footer.jsp" />
</body>
</html>