package com.controller.airticketbooking;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;

import com.dao.airticketbooking.DaoClass;

/**
 * Servlet implementation class BookFlightServlet
 */
@WebServlet("/BookFlightServlet")
public class BookFlightServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String ALPHA_NUM = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookFlightServlet() {
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

 			
 			int noOfSeat = Integer.parseInt(request.getParameter("noOfSeat"));
 			String flight_id = request.getParameter("fid");
 			String doj = request.getParameter("doj");
 			String p_name [] = new String[noOfSeat];
 			String p_age [] = new String[noOfSeat];
 			String p_gender [] = new String[noOfSeat];
 			String username = request.getParameter("username");
 			for(int i = 0;i<noOfSeat;i++)
 			{
 				p_name[i] = request.getParameter("p_name"+(i+1));
 				p_age[i] = request.getParameter("p_age"+(i+1));
 				p_gender[i] = request.getParameter("p_gender"+(i+1));
 			}
 			StringBuffer sb = new StringBuffer(6);
 			for (int i = 0; i < 6; i++) {
 			int ndx = (int) (Math.random() * ALPHA_NUM.length());
 			sb.append(ALPHA_NUM.charAt(ndx));
 			}
 			String pnr = sb.toString();
 			DaoClass dao  = new DaoClass();
			PrintWriter out= response.getWriter();
 			boolean result = dao.bookFlight(p_name,p_age,p_gender,flight_id,doj,pnr,noOfSeat,username);
			if(result){				
				out.println("<script> alert(\"Booking Successful.\"); window.location.replace(\"app/user_dashboard.jsp\");</script>");
			}
			else
			{
		    out.println("<script> alert(\"Error while booking.\"); window.location.replace(\"app/user_dashboard.jsp\");</script>");
			//	response.sendRedirect("login.jsp?error=passsword incorrect");
			}
 			
 			

 	}
 	

}
