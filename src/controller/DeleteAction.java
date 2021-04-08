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

@WebServlet("/deletebkey")
public class DeleteAction extends HttpServlet {
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
		
		String keyinc = request.getParameter("deletekey");
		String page = request.getParameter("page");
		
		Connection con = null;
		PreparedStatement ps = null;
		RequestDispatcher rd = null;
		PrintWriter pw = response.getWriter();
		
		if(page.equals("area"))
		{
			try
			{
				Class.forName("com.mysql.jdbc.Driver");  
				con=DriverManager.getConnection("jdbc:mysql://localhost:3306/csms",dbuser,dbpass);
				ps = con.prepareStatement("UPDATE area SET deleted=?, updated_by=? WHERE area_name=? OR area_id=?");
				ps.setString(1, "Deleted");
				ps.setInt(2, user);
				ps.setString(3, keyinc);
				try {	ps.setInt(4, Integer.parseInt(keyinc));	}
				catch(NumberFormatException e) {	ps.setInt(4, -1);	}
				
				int r = ps.executeUpdate();
				
				if(r >= 1) {
					request.setAttribute("notify", "Area Deleted.");
					rd = request.getRequestDispatcher("deletearea.jsp");
				}
				
				con.close();
			}
			catch(Exception e)
			{
				pw.println(e.getMessage());
			}
			pw.close();
		}
		else if(page.equals("pack"))
		{
			try
			{
				Class.forName("com.mysql.jdbc.Driver");  
				con=DriverManager.getConnection("jdbc:mysql://localhost:3306/csms",dbuser,dbpass);
				ps = con.prepareStatement("UPDATE pack SET deleted=?, updated_by=? WHERE pack_name=? OR pack_id=?");
				ps.setString(1, "Deleted");
				ps.setInt(2, user);
				ps.setString(3, keyinc);
				try {	ps.setInt(4, Integer.parseInt(keyinc));	}
				catch(NumberFormatException e) {	ps.setInt(4, -1);	}
				
				int r = ps.executeUpdate();
				
				if(r >= 1) {
					request.setAttribute("notify", "Pack Deleted.");
					rd = request.getRequestDispatcher("deletepack.jsp");
				}
				
				con.close();
			}
			catch(Exception e)
			{
				pw.println(e.getMessage());
			}
			pw.close();
		}
		else if(page.equals("role"))
		{
			try
			{
				Class.forName("com.mysql.jdbc.Driver");  
				con=DriverManager.getConnection("jdbc:mysql://localhost:3306/csms",dbuser,dbpass);
				ps = con.prepareStatement("UPDATE role SET deleted=?, updated_by=? WHERE role_type=? OR role_id=?");
				ps.setString(1, "Deleted");
				ps.setInt(2, user);
				ps.setString(3, keyinc);
				try {	ps.setInt(4, Integer.parseInt(keyinc));	}
				catch(NumberFormatException e) {	ps.setInt(4, -1);	}
				
				int r = ps.executeUpdate();
				
				if(r >= 1) {
					request.setAttribute("notify", "Role Deleted.");
					rd = request.getRequestDispatcher("deleterole.jsp");
				}
				
				con.close();
			}
			catch(Exception e)
			{
				pw.println(e);
			}
			pw.close();
		}
		else if(page.equals("user"))
		{
			try
			{
				Class.forName("com.mysql.jdbc.Driver");  
				con=DriverManager.getConnection("jdbc:mysql://localhost:3306/csms",dbuser,dbpass);
				ps = con.prepareStatement("UPDATE user SET deleted=?, status=?, updated_by=? WHERE mobile_no=? OR email=?");
				ps.setString(1, "Deleted");
				ps.setInt(2, 0);
				ps.setInt(3, user);
				ps.setString(4, keyinc);
				ps.setString(5, keyinc);
				
				int r = ps.executeUpdate();
				
				if(r >= 1) {
					request.setAttribute("notify", "User Deleted.");
					rd = request.getRequestDispatcher("deleteuser.jsp");
				}
				
				con.close();
			}
			catch(Exception e)
			{
				pw.println(e);
			}
			pw.close();
		}
		
		rd.forward(request, response);
	}

}
