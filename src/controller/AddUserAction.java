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

@WebServlet("/adduser")
public class AddUserAction extends HttpServlet {
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
		String username = request.getParameter("username");
		String pass = request.getParameter("pass");
		String name = request.getParameter("name");
		String mobno = request.getParameter("mobno");
		String email = request.getParameter("email");
		Integer area = Integer.parseInt(request.getParameter("area"));
		String add = request.getParameter("address");
		String remk = request.getParameter("remark");
		Integer role = Integer.parseInt(request.getParameter("role"));
		
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");  
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/csms",dbuser,dbpass);
			
			ps = con.prepareStatement("insert into user(user_name, password, mobile_no, created_by, remark, name, email, address, status, area_code, role) values(?,?,?,?,?,?,?,?,?,?,?)");
			ps.setString(1, username);
			ps.setString(2, pass);
			ps.setString(3, mobno);
			ps.setInt(4, user);
			ps.setString(5, remk);
			ps.setString(6, name);
			ps.setString(7, email);
			ps.setString(8, add);
			ps.setInt(9, 1);
			ps.setInt(10, area);
			ps.setInt(11, role);
	
			int r = ps.executeUpdate();
			if(r>=1)
			{
				request.setAttribute("user", username);
				RequestDispatcher rd = request.getRequestDispatcher("adduser.jsp");
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
