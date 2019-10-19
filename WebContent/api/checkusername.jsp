<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.dao.airticketbooking.MySqlConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    try{
       
        String username=request.getParameter("username");
        if(username.equals(""))
        {
        	out.print(2);
        	
        }
        else{
            Connection conn;
            conn=(Connection)MySqlConnect.ConnectDB();
            PreparedStatement ps = conn.prepareStatement("SELECT  * FROM user_table WHERE " +
                    "username = ?");
            ps.setString(1,request.getParameter("username"));
            ResultSet res = ps.executeQuery();
            if(res.first()){
                out.print(3);
            }
            else
            {
            	out.print(0);
            }
            conn.close();
        }
    }
        catch (Exception e){
            System.out.println(e);  
        }
%>