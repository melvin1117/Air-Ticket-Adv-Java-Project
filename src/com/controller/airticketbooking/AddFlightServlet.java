package com.controller.airticketbooking;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.digest.DigestUtils;

import com.dao.airticketbooking.DaoClass;

/**
 * Servlet implementation class AddFlightServlet
 */
@WebServlet("/AddFlightServlet")
public class AddFlightServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddFlightServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
  	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
  	 */
  	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  		// TODO Auto-generated method stub
  		try {
  			doProcess(request,response);
  		} catch (ClassNotFoundException | SQLException e) {
  			// TODO Auto-generated catch block
  			e.printStackTrace();
  		}
  	}

  	/**
  	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
  	 */
  	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  		// TODO Auto-generated method stub
  		try {
  			doProcess(request,response);
  		} catch (ClassNotFoundException | SQLException e) {
  			// TODO Auto-generated catch block
  			e.printStackTrace();
  		}
  	}
  	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException, ClassNotFoundException {

  			
  			String flight_code = request.getParameter("flight_code");
  			String airline_id = request.getParameter("airline_id");
  			String to_location = request.getParameter("to_location");
  			String from_location = request.getParameter("from_location");
  			String dept_time = request.getParameter("dept_time");
  			System.out.println(dept_time);
  			String arrival_time = request.getParameter("arrival_time");
  			String duration = request.getParameter("duration");
  			String total_seat = request.getParameter("total_seat");
  			String price = request.getParameter("price");
  			String [] frequncy = request.getParameterValues("frequency");
  			DaoClass dao  = new DaoClass();
  			PrintWriter out= response.getWriter();
  			boolean result = dao.addFlight(flight_code,airline_id,from_location,to_location,dept_time,arrival_time,duration,total_seat,price, frequncy);
  			if(result){				
  				out.println("<script> alert(\"Successfully Added.\"); window.location.replace(\"app/admin_dashboard.jsp\");</script>");
  			}
  			else
  			{
  		    out.println("<script> alert(\"Error adding flight.\"); window.location.replace(\"app/admin_dashboard.jsp\");</script>");
  			//	response.sendRedirect("login.jsp?error=passsword incorrect");
  			}
  	}



}
