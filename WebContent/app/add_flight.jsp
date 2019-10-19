<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@page import="com.dao.airticketbooking.MySqlConnect"%>
   <%@page import="com.dao.airticketbooking.DaoClass"%>
   <%@page import="com.pojo.airticket.AirLineDetails"%>
   <%@ page import="java.util.List" %>
	<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <jsp:include page="../include/header-app.html" />
        <style>
            body {
                background-color: transparent;
            }
            html {
                background: url(../img/signUpBack.jpg) no-repeat center center fixed;
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
DaoClass dao =new DaoClass();
List<AirLineDetails> ald = dao.getAirLines();
%>

 <jsp:include page="../include/navbar-app.jsp" />
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
                    <b><h2 style="font-weight:600; font-size:40px; color:#000;text-align: center;">Add Flight</h2></b>
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <form method="post" action="../AddFlightServlet">
                                <div class="form-group">
                                    <label for="flight_code" style="color:#FFF; font-weight:700">Flight Code:</label>
                                    <input type="text" class="form-control" id="flight_code" name="flight_code" required=" ">
                                </div>

                                <div class="form-group">
                                    <label for="from_location" style="color:#FFF; font-weight:700">Airline:</label>
                                    <select class="form-control" id="airline_id" name="airline_id">
                                    <%for(AirLineDetails l: ald){ 
                                    %>
								    <option value=<%=l.getAirline_id()%>><%=l.getAirline_name() %></option>
								    <%} %>
								  	</select>
                                </div>
                                <div class="form-group">
                                    <label for="from_location" style="color:#FFF; font-weight:700">From Location:</label>
                                    <select class="form-control" id="from_location" name="from_location">
								    
								  	</select>
                                </div>
                                
                                 <div class="form-group">
                                    <label for="to_location" style="color:#FFF; font-weight:700">To Location:</label>
                                    <select class="form-control" id="to_location" name="to_location">
								   
								  	</select>
                                </div>
                                <div class="form-group">
                                    <label for="dept_time" style="color:#FFF; font-weight:700">Departure Time:</label>
                                    <input type="time" class="form-control" id="dept_time" name="dept_time" required=" ">
                                </div>
                                
                                <div class="form-group">
                                    <label for="arrival_time" style="color:#FFF; font-weight:700">Arrival Time:</label>
                                    <input type="time" class="form-control" id="arrival_time" name="arrival_time" required=" ">
                                </div>

                                <div class="form-group">
                                    <label for="duration" style="color:#FFF; font-weight:700">Duration:</label>
                                    <input type="text" class="form-control" id="duration" name="duration" required=" ">
                                </div>

                                <div class="form-group">
                                    <label for="seat" style="color:#FFF; font-weight:700">Total Seats:</label>
                                    <input type="number" class="form-control" id="total_seat" name="total_seat" required=" ">
                                </div>

                                <div class="form-group">
                                    <label for="price" style="color:#FFF; font-weight:700">Price:</label>
                                    <input type="number" class="form-control" id="price" name="price" required=" ">
                                </div>
                                <div class="form-group">
                                    <label for="frequency" style="color:#FFF; font-weight:700">Frequency:</label>
                                    <select class="form-control" id="frequency" name="frequency" multiple required>
									  <option value="Monday">Monday</option>
									  <option value="Tuesday">Tuesday</option>
									  <option value="Wednesday">Wednesday</option>
									  <option value="Thursday">Thursday</option>
									  <option value="Friday">Friday</option>
									  <option value="Saturday">Saturday</option>
									  <option value="Sunday">Sunday</option>
									</select>
                                </div>
                                <button type="submit" class="btn btn-primary btn-block" style="color:#FFF; font-weight:700">Register</button>
                            </form>

                        </div>


                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="../include/footer.jsp" />
       <script type="text/javascript">
       $("#from_location").select2({
   	    placeholder: "Select a State",
   	    allowClear: true
   	});
      $("#to_location").select2({
  	    placeholder: "Select a State",
  	    allowClear: true
  	});
       $(document).ready(function(){
       	$.ajax({ url: '../apii/rest/city',
       	        context: document.body,
       	        type:'GET',
       	        success: function(response){
       	           
       	        	$.each(response,function(i,obj)
       	                    {
       	                    
       	                     var div_data="<option value="+obj+">"+obj+"  |  "+i+"</option>";
       	                    
       	                    $(div_data).appendTo('#from_location'); 
       	                    $(div_data).appendTo('#to_location');
       	                    });  
       	                    }
       	        	
       	        });
       	});
     
       
       </script>
</body>
</html>