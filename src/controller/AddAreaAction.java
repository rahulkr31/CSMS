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


@WebServlet("/addarea")
public class AddAreaAction extends HttpServlet {
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
		String area = request.getParameter("narea");
		String remk = request.getParameter("remark");
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");  
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/csms",dbuser,dbpass);
			
			ps = con.prepareStatement("insert into area(area_name, created_by, remark,) values(?,?,?)");
			ps.setString(1, area);
			ps.setInt(2, user);
			ps.setString(3, remk);
	
			int r = ps.executeUpdate();
			if(r>=1)
			{
				request.setAttribute("area", area);
				RequestDispatcher rd = request.getRequestDispatcher("addarea.jsp");
				rd.forward(request, response);
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
