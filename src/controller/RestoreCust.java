package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/restorecust")
public class RestoreCust extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession(false);
		Integer user = (Integer) session.getAttribute("user");
		if (user == null) {
		   request.setAttribute("Error", "Session has ended.  Please login.");
		   RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
		   rd.forward(request, response);
		}
		
		String dbuser= getServletContext().getInitParameter("dbuser");
		String dbpass= getServletContext().getInitParameter("dbpass");
		
		response.setContentType("text/html");
		
		String keyinc = request.getParameter("restorekey");
		
		Connection con = null;
		PreparedStatement ps = null;
		RequestDispatcher rd = null;
		PrintWriter pw = response.getWriter();
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");  
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/csms",dbuser,dbpass);
			ps = con.prepareStatement("UPDATE consumer SET deleted=?, updated_by=? WHERE mobile_no=? or setupboxid=? or vcno=?");
			ps.setString(1, null);
			ps.setInt(2, user);
			ps.setString(3,keyinc);
            try {
                ps.setInt(4,Integer.parseInt(keyinc));
                ps.setInt(5,Integer.parseInt(keyinc));
            } catch(NumberFormatException e) {
            	ps.setInt(4, -1);
            	ps.setInt(5, -1);
            }
			
			int r = ps.executeUpdate();
			
			if(r >= 1) {
				request.setAttribute("notify", "Customer Restored.");
				rd = request.getRequestDispatcher("restorecust.jsp");
			}
			
			con.close();
		}
		catch(Exception e)
		{
			pw.println(e.getMessage());
		}
		pw.close();
		
		rd.forward(request, response);
		
	}

}
