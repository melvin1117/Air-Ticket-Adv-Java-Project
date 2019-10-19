<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.dao.airticketbooking.DaoClass"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    try{
       
        	String pnr=request.getParameter("pnr");
           	DaoClass dao = new DaoClass();
           	boolean status = dao.cancelTicket(pnr);
            if(status){
                out.print("<script> alert(\"Successfully Cancelled.\"); window.location.replace(\"../app/user_dashboard.jsp\");</script>");
            }
            else
            {
                out.print("<script> alert(\"Problem occured while Cancelling.\"); window.location.replace(\"../app/user_dahboard.jsp\");</script>");
            	
            }
    }
        catch (Exception e){
            System.out.println(e);  
        }
%>