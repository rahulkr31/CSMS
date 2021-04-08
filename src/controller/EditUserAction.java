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

@WebServlet("/edituser")
public class EditUserAction extends HttpServlet {
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
		
		Integer mobno = Integer.parseInt(request.getParameter("mobno"));
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		Integer area = Integer.parseInt(request.getParameter("area"));
		Integer role = Integer.parseInt(request.getParameter("role"));
		String add = request.getParameter("address");
		String remk = request.getParameter("remark");
		
		
		Connection con = null;
		PreparedStatement ps = null;
		PrintWriter pw = response.getWriter();
		
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");  
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/csms",dbuser,dbpass);
			ps = con.prepareStatement("UPDATE user SET updated_by=?, remark=?, email=?, address=?, area_code=?, role=? WHERE mobile_no=?");
			ps.setInt(1, user);
			ps.setString(2, remk);
			ps.setString(3, email);
			ps.setString(4,add);
			ps.setInt(5, area);
			ps.setInt(6, role);
			ps.setInt(7, mobno);
			
			int r = ps.executeUpdate();
			
			if(r >= 1) {
				String message = "Changes saved for "+name;
				request.setAttribute("notify", message);
				RequestDispatcher rd = request.getRequestDispatcher("edituser.jsp");
				rd.include(request, response);
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
