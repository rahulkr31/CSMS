package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.Thread;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/logout")
public class Logout extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		resp.setContentType("text/html");
		
		PrintWriter pw = resp.getWriter();
		HttpSession session = req.getSession(false);
    	if(session != null)
    	{
    		session.invalidate();
    		pw.println("You have been logged out");
    		try
    		{
    		    Thread.sleep(1000);
    		}
    		catch(InterruptedException ex)
    		{
    		    Thread.currentThread().interrupt();
    		}
    	}
    		resp.sendRedirect("index.jsp");
	}
}
