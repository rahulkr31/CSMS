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

@WebServlet("/deleteuser")
public class DeleteUserAction extends HttpServlet {
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
		
		Integer userid = Integer.parseInt(request.getParameter("user_id"));
		
		
		Connection con = null;
		PreparedStatement ps = null;
		PrintWriter pw = response.getWriter();
		
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");  
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/csms",dbuser,dbpass);
			ps = con.prepareStatement("UPDATE user SET deleted=?, status=?, updated_by=? WHERE user_id=?");
			ps.setString(1, "Deleted");
			ps.setInt(2, 0);
			ps.setInt(3, user);
			ps.setInt(4, userid);
			
			int r = ps.executeUpdate();
			
			if(r >= 1) {
				RequestDispatcher rd = null;
				request.setAttribute("notify", "User has been deleted.");
				rd = request.getRequestDispatcher("pendinguser.jsp");
				rd.forward(request, response);
			}
			
			con.close();
		}
		catch(Exception e)
		{
			pw.println(e);
		}
		pw.close();
		
	}

}
