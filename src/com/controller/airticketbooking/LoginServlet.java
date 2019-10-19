package com.controller.airticketbooking;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;

import com.dao.airticketbooking.DaoClass;
/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
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

			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String hash_password=DigestUtils.sha256Hex(password);
			DaoClass dao  = new DaoClass();
			PrintWriter out= response.getWriter();
			boolean result = dao.login(username,hash_password);
			if(result){
				String role = dao.getRole(username);
				if(role.equalsIgnoreCase( "admin")){
					HttpSession session=request.getSession();
					session.setAttribute("username", username);
					session.setAttribute("role",role);
					session.setMaxInactiveInterval(30*60);
					response.sendRedirect("app/admin_dashboard.jsp");
				}
				else {
					HttpSession session=request.getSession();
					session.setAttribute("username", username);
					session.setAttribute("role",role);
					session.setMaxInactiveInterval(30*60);
					response.sendRedirect("app/user_dashboard.jsp");
				}
					
				
			}
			else
			{
		    out.println("<script> alert(\"Username or password is incorrect.\"); window.location.replace(\"login.jsp\");</script>");
			//	response.sendRedirect("login.jsp?error=passsword incorrect");
			}
	}
	

}
