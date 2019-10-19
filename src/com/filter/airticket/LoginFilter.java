package com.filter.airticket;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class LoginFilter
 */
@WebFilter("/app/*")
public class LoginFilter implements Filter {
    @Override
    public void init(FilterConfig config)
        throws ServletException {
        // If you have any <init-param> in web.xml, then you could get them
        // here by config.getInitParameter("name") and assign it as field.
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
        throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;
        HttpSession session = request.getSession(false);

        String requestPath = request.getRequestURI();
        if (
            session == null ||
            session.getAttribute("username") == null) { // change "user" for the session attribute you have defined
            response.sendRedirect("../login.jsp"); // No logged-in user found, so redirect to login page.
        } else {
        	if(!session.getAttribute("role").equals("admin") && needsAuthenticationAdmin(requestPath))
        	{
        		System.out.println(session.getAttribute("role"));
        		response.sendRedirect("../index.jsp");
        	}
        	if(!session.getAttribute("role").equals("user") && needsAuthenticationUser(requestPath))
        	{
        		response.sendRedirect("../index.jsp");
        	}
        	
            chain.doFilter(req, res); // Logged-in user found, so just continue request.
        }
    }

    @Override
    public void destroy() {
        // If you have assigned any expensive resources as field of
        // this Filter class, then you could clean/close them here.
    }

    //basic validation of pages that do not require authentication
    private boolean needsAuthenticationAdmin(String url) {
        String[] validNonAuthenticationUrls =
            { "add_flight.jsp", "add_user.jsp","remove_user.jsp","remove_flight.jsp","list_flight.jsp","list_user.jsp","admin_dashboard.jsp" };
        for(String validUrl : validNonAuthenticationUrls) {
            if (url.endsWith(validUrl)) {
                return true;
            }
        }
        return false;
    }
  //basic validation of pages that do not require authentication
    private boolean needsAuthenticationUser(String url) {
        String[] validNonAuthenticationUrls =
            { "book_flight.jsp", "booked_history.jsp","cancel_flight.jsp","get_passenger_data.jsp","user_dashboard.jsp","list_of_avail_flight.jsp" };
        for(String validUrl : validNonAuthenticationUrls) {
            if (url.endsWith(validUrl)) {
                return true;
            }
        }
        return false;
    }
}