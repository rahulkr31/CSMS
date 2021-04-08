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

@WebServlet("/addrole")
public class AddRoleAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session=request.getSession(false);
		Integer user = (Integer) session.getAttribute("user");
		if (user == null) {
		   request.setAttribute("Error", "Session has ended.  Please login.");
		   RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
		   rd.forward(request, response);
		}
		
		Connection con = null;
		PreparedStatement ps = null;
		PrintWriter pw = response.getWriter();
		
		String dbuser= getServletContext().getInitParameter("dbuser");
		String dbpass= getServletContext().getInitParameter("dbpass");
		
		response.setContentType("text/html");
		String nrole = request.getParameter("nrole");
		String remk = request.getParameter("remark");
		
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");  
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/csms",dbuser,dbpass);
			
			ps = con.prepareStatement("insert into role(role_type, remark, created_by) values(?,?,?)");
			ps.setString(1,nrole);
			ps.setString(2,remk);
			ps.setInt(3,user);
	
			int r = ps.executeUpdate();
			if(r>=1)
			{
				request.setAttribute("role", nrole);
				RequestDispatcher rd = request.getRequestDispatcher("addrole.jsp");
				rd.include(request, response);
			}
			con.close();
			
		}
		catch(Exception e)
		{
			pw.println(e.getMessage());
		}

		pw.close();
		
	}

}
