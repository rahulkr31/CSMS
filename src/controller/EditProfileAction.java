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


@WebServlet("/editprof")
public class EditProfileAction extends HttpServlet {
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
		
		String email = request.getParameter("n_email");
		String add = request.getParameter("n_add");
		String role = request.getParameter("role");
		
		
		Connection con = null;
		PreparedStatement ps = null;
		PrintWriter pw = response.getWriter();
		
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");  
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/csms",dbuser,dbpass);
			ps = con.prepareStatement("UPDATE user SET email=?, address=?, updated_by=? WHERE user_id=?");
			ps.setString(1, email);
			ps.setString(2, add);
			ps.setInt(3, user);
			ps.setInt(4, user);
			
			int r = ps.executeUpdate();
			
			if(r >= 1) {
				RequestDispatcher rd = null;
				request.setAttribute("notify", "Changes saved.");
				
				if(role.equals("Operator")) {
					rd = request.getRequestDispatcher("operatorhome.jsp");
				} else if(role.equals("Admin")) {
					rd = request.getRequestDispatcher("adminhome.jsp");
				}
				
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
