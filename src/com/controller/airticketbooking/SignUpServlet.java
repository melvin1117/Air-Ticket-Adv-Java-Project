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
 * Servlet implementation class SignUpServlet
 */
@WebServlet("/SignUpServlet")
public class SignUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignUpServlet() {
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
			String name = request.getParameter("name");
			String mobile = request.getParameter("mobile");
			String email = request.getParameter("email");
			String city = request.getParameter("city");
			String password = request.getParameter("password");
			String hash_password=DigestUtils.sha256Hex(password);
			String gender = request.getParameter("gender");
			String who = request.getParameter("who");
			DaoClass dao  = new DaoClass();
			PrintWriter out= response.getWriter();
			boolean result = dao.signup(username,hash_password,name,mobile,email,city,gender);
			if(result && who.equals("usinguser")){				
				out.println("<script> alert(\"Successfully Registered.\"); window.location.replace(\"index.jsp\");</script>");
			}
			else if(result && who.equals("usingadmin")){				
				out.println("<script> alert(\"Successfully Registered.\"); window.location.replace(\"app/admin_dashboard.jsp\");</script>");
			}
			else
			{
		    out.println("<script> alert(\"Error registering user.\"); window.location.replace(\"login.jsp\");</script>");
			//	response.sendRedirect("login.jsp?error=passsword incorrect");
			}
	}


}
