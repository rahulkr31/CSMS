package controller;

import java.io.IOException; 
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginAction extends HttpServlet 
{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String dbuser= getServletContext().getInitParameter("dbuser");
		String dbpass= getServletContext().getInitParameter("dbpass");
		
		resp.setContentType("text/html");
		String uname = req.getParameter("user_name");
		String pass = req.getParameter("password");
		
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement ps = null;
		PrintWriter pw = resp.getWriter();
		RequestDispatcher rd = null;
		
		try
		{  
			Class.forName("com.mysql.jdbc.Driver");  
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/csms",dbuser,dbpass);
			ps = con.prepareStatement("SELECT u.password, u.user_id, u.name, u.email, r.role_type FROM user u JOIN role r ON u.role=r.role_id WHERE u.user_name=? OR u.email=? AND u.status=? AND u.deleted IS NULL");
			ps.setString(1, uname);
			ps.setString(2, uname);
			ps.setInt(3, 1);
			rs = ps.executeQuery();  
			if(rs.next())
			{
				if(rs.getString(1).equals(pass))
				{
					int user = rs.getInt(2);
					String name = rs.getString(3);
					String email = rs.getString(4);
					
					if(rs.getString(5).equals("Admin"))
					{
						HttpSession session = req.getSession();
						session.setAttribute("user", user);
						session.setAttribute("u_name", name);
						session.setAttribute("u_email", email);
						rd = req.getRequestDispatcher("adminhome.jsp");
					}
					else if(rs.getString(5).equals("Operator"))
					{
						HttpSession session = req.getSession();
						session.setAttribute("user", user);
						session.setAttribute("u_name", name);
						session.setAttribute("u_email", email);
						rd = req.getRequestDispatcher("operatorhome.jsp");
					}
				}
				else
				{
					req.setAttribute("error", "Invalid Password.");
					rd = req.getRequestDispatcher("index.jsp");
				}
			}
			else
			{
				req.setAttribute("error", "Invalid User name.");
				rd = req.getRequestDispatcher("index.jsp");
			}
			
			rd.forward(req, resp);
			
			con.close();
			pw.close();
		}
		catch(Exception e)
		{ pw.println(e);}
	}
}
