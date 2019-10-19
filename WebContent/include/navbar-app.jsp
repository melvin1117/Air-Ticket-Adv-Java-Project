       <div class="navbar navbar-custom navbar-fixed-top top-nav-collapse" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand" href="../index.jsp">
                   <i class="fa fa-paper-plane"></i>&nbsp;<span style="font-weight: 400;">Paper</span><strong style="font-weight:700;">Plane<span style="font-size: 12px;">.com</span> </strong>
                </a>
            </div>
			<!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse navbar-right">
                <ul class="nav navbar-nav">
                     <li>
                        <a href="#about">About</a>
                    </li>
                    <li>
                        <a href="#contact">Contact</a>
                    </li>
                    <%
					String username=null;
					username=(String)session.getAttribute("username");
					//System.out.println(username+"\t yui");
					if(username==null )
					{
						%>
                    <li>
                    <a href="signup.jsp"><span class="glyphicon glyphicon-edit"></span></a>
                    
                    </li>
                    
                    <li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span></a></li>
                    <%}
					else
                    	{
						if(session.getAttribute("role").equals("admin")){
                    	%>
                    	<li> <a href="admin_dashboard.jsp"><i class="glyphicon glyphicon-dashboard" style="top:3px;"></i></a>
                    	<li>
                    	<%}else
                    	{%>
                    		<li> <a href="user_dashboard.jsp"><i class="glyphicon glyphicon-dashboard" style="top:3px;"></i></a>
                        	<li>
                    	<%}
                    		%>
                    <form action="../LogoutServlet" method="post"><div id="logout"><i class="glyphicon glyphicon-log-out" style="cursor:pointer; top:17px;"></i></div>
                   <input type="submit" id="sub" style="display:none">
                   </form>
                    </li>
                    	<%} %>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </div>
     <script>
    
    	$("#logout").on("click", function () {

    	document.getElementById("sub").click();
    
    	});
    </script>