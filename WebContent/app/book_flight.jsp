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
DaoClass dao = new DaoClass();
List<FlightDetailBean> lfdb = dao.getFlightDetail();

%>
<jsp:include page="../include/navbar-app.jsp" />
<br>
        <br>
        <br><br>
        <br>
        	<h1 style="text-align: center">Book Flight</h1>
        	<div class="container">
				<br>
  			<div class="row">


                <div class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3 col-xs-8 col-xs-offset-2">
                    <br>
                    <br>
                    <br>
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <form method="post" action="list_of_avail_flight.jsp">
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
                                    <label for="date" style="color:#FFF; font-weight:700">Date of Journey:</label>
                                    <input type="date" class="form-control" id="doj" name="doj">
                                </div>

                                <button type="submit" class="btn btn-primary btn-block" style="color:#FFF; font-weight:700">Book</button> 
                            </form>

                        </div>


                    </div>
                </div>
            </div>
        </div>
   <br><br><br><br>   <br><br><br><br> <br> <br> <br> <br> <br> <br> <br>  <br><br>
        <jsp:include page="../include/footer.jsp" />
        <script>
        $(function(){
            var dtToday = new Date();
            
            var month = dtToday.getMonth() + 1;
            var day = dtToday.getDate();
            var year = dtToday.getFullYear();
            if(month < 10)
                month = '0' + month.toString();
            if(day < 10)
                day = '0' + day.toString();
            
            var maxDate = year + '-' + month + '-' + day;
           
            $('#doj').attr('min', maxDate);
        });
        
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