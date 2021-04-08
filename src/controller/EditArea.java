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

@WebServlet("/EditArea")
public class EditArea extends HttpServlet {
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
		
		Integer areaid = Integer.parseInt(request.getParameter("areaid"));
		String areaname = request.getParameter("areaname");
		String remk = request.getParameter("remark");
		
		
		Connection con = null;
		PreparedStatement ps = null;
		PrintWriter pw = response.getWriter();
		RequestDispatcher rd = null;
		
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");  
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/csms",dbuser,dbpass);
			ps = con.prepareStatement("UPDATE area SET area_name=?, remark=?, updated_by=? WHERE area_id=?");
			ps.setString(1, areaname);
			ps.setString(2, remk);
			ps.setInt(3, user);
			ps.setInt(4, areaid);
			
			int r = ps.executeUpdate();
			
			if(r >= 1) {
				String message = "Changes saved for "+areaname;
				request.setAttribute("notify", message);
				rd = request.getRequestDispatcher("editarea.jsp");
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
