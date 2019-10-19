<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html>

    <head>
        <jsp:include page="../include/header-app.html" />
        <style>
            body {
                background-color: transparent;
            }
            html {
                background: url(../img/add_user.jpg) no-repeat center center fixed;
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
	username=(String)session.getAttribute("username");%>
        <jsp:include page="../include/navbar-app.jsp" />
        <br>
        <br>
        <br>
        <br>
        <div class="container">
            <div class="row">


                <div class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3 col-xs-8 col-xs-offset-2">
                    <br>
                    <b><h2 style="font-weight:600; font-size:40px; color:#000; text-align:center">Add User</h2></b>
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <form method="post" action="../SignUpServlet">
                                <div class="form-group">
                                    <label for="name" style="color:#FFF; font-weight:700">Name:</label>
                                    <input type="text" class="form-control" id="name" name="name" required=" ">
                                </div>
                                <div class="form-group">
                                    <label for="username" style="color:#FFF; font-weight:700">Username:</label>
                                    <input type="text" class="form-control" id="username" name="username" required=" " onblur="checkUsernameAvail()">
                                	<span2 id="uname_check" style="display:none; padding-bottom: 10px "></span2>
                                </div>

                                <div class="form-group">
                                    <label for="email" style="color:#FFF; font-weight:700">Email:</label>
                                    <input type="email" class="form-control" id="email" name="email" required=" ">
                                </div>

                                <div class="form-group">
                                    <label for="mobile" style="color:#FFF; font-weight:700">Mobile:</label>
                                    <input type="text" class="form-control" id="mobile" name="mobile" required=" ">
                                </div>

                                <div class="form-group">
                                    <label for="City" style="color:#FFF; font-weight:700">City:</label>
                                    <input type="text" class="form-control" id="city" name="city" required=" ">
                                </div>
                                
                                <div class="form-group">
                                    <label for="gender" style="color:#FFF; font-weight:700">Gender:</label><br>
                                    <label class="radio-inline" style="color:#FFF; font-weight:700"><input type="radio" name="gender" value="Male" checked>Male</label>
									<label class="radio-inline" style="color:#FFF; font-weight:700"><input type="radio" name="gender" value="Female">Female</label>
                                </div>

                                <div class="form-group">
                                    <label for="password" style="color:#FFF; font-weight:700">Password:</label>
                                    <input type="password" class="form-control" id="password" name="password" required=" ">
                                </div>

                                <div class="form-group">
                                    <label for="cpassword" style="color:#FFF; font-weight:700">Confirm Password:</label>
                                    <input type="password" class="form-control" id="cpassword" name="cpassword" required=" ">
                                </div>
								<input type="hidden" name="who" value="usingadmin" >
                                <button type="submit" class="btn btn-primary btn-block" style="color:#FFF; font-weight:700">Register</button>
                            </form>

                        </div>


                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="../include/footer.jsp" />
        <script>
				function checkUsernameAvail()
				{
					var uname=document.getElementById('username').value;
					if( (uname.length>4 && uname.length <=15))
					{
					//console.log(uname)
					 $.ajax({
					 	type:'GET', 
					 	url: '../api/checkusername.jsp?username='+uname,
					 	//dataType: 'json',
					 	success: function(data){
					 	//console.log(data);
        				if (data==0)
        				{
        					//console.log(data);
        					document.getElementById('uname_check').style.display="block";
        					document.getElementById('uname_check').style.color="green";
        					document.getElementById('username').style.borderColor = "green";
        					$("#uname_check").html("");
        				}
        				else if(data==2)
        				{
        					document.getElementById('uname_check').style.display="block";
        					document.getElementById('uname_check').style.color="red";
        					document.getElementById('username').style.borderColor = "red";
        					$("#uname_check").html("Username cannot be empty");
        				}
        				else
        				{
        					//console.log(data);
        					document.getElementById('uname_check').style.display="block";
        					document.getElementById('uname_check').style.color="red";
        					document.getElementById('username').style.borderColor = "red";
        					$("#uname_check").html("Username Already Exists. Try something else");
        				}
   					 },
   					 error: function(xhr, status, error) {
				      console.log("error");
				   }
   					});
				}
				else
				{
					document.getElementById('uname_check').style.display="block";
        					document.getElementById('uname_check').style.color="red";
        					document.getElementById('username').style.borderColor = "red";
        					$("#uname_check").html("Username must be between 5 to 15 character");	
				}
			}
			</script>
    </body>
	
    </html>