package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegAction extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String dbuser= getServletContext().getInitParameter("dbuser");
		String dbpass= getServletContext().getInitParameter("dbpass");
		
		resp.setContentType("text/html");
		String uname = req.getParameter("username");
		String pass = req.getParameter("pass");
		String mobno = req.getParameter("phonenumber");
		//String role = req.getParameter("role");
		String add = req.getParameter("address");
		String email = req.getParameter("email");
		String name = req.getParameter("name");
		String remk = req.getParameter("remarks");
		Integer area = Integer.parseInt(req.getParameter("area"));
		
		Connection con = null;
		PreparedStatement ps = null;
		PrintWriter pw = resp.getWriter();
		
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");  
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/csms",dbuser,dbpass);
			ps = con.prepareStatement("insert into user(user_name, password, mobile_no, role, remark, name, email, address, status, area_code, created_by) values(?,?,?,?,?,?,?,?,?,?,?)");
			ps.setString(1,uname);
			ps.setString(2,pass);
			ps.setString(3,mobno);
			ps.setInt(4, 2);
			ps.setString(5,remk);
			ps.setString(6,name);
			ps.setString(7,email);
			ps.setString(8,add);
			ps.setInt(9,0);
			ps.setInt(10, area);
			ps.setInt(11, 0);
			int r = ps.executeUpdate();
			if(r>=1)
			{
				pw.println("You have been registered with Username "+uname);
				resp.sendRedirect("index.jsp");
			}
			con.close();
			pw.close();
			
		}
		catch(Exception e)
		{
			pw.println(e);
		}
		
	}
}
