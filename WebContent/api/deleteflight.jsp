<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.dao.airticketbooking.DaoClass"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    try{
       
        	String fid=request.getParameter("fid");
           	DaoClass dao = new DaoClass();
           	boolean status = dao.deleteFlight(fid);
            if(status){
                out.print("<script> alert(\"Successfully Deleted.\"); window.location.replace(\"../app/remove_flight.jsp\");</script>");
            }
            else
            {
                out.print("<script> alert(\"Problem occured while Deleting.\"); window.location.replace(\"../app/remove_flight.jsp\");</script>");
            	
            }
    }
        catch (Exception e){
            System.out.println(e);  
        }
%>