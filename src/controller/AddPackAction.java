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


@WebServlet("/addpack")
public class AddPackAction extends HttpServlet {
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
		String npack = request.getParameter("npack");
		Integer duration = Integer.parseInt(request.getParameter("dur"));
		String remk = request.getParameter("remark");
		String descp = request.getParameter("descp");
		Integer cost = Integer.parseInt(request.getParameter("cost"));
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");  
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/csms",dbuser,dbpass);
			
			ps = con.prepareStatement("insert into pack(pack_name, duration, description, price, remark, created_by ) values(?,?,?,?,?,?)");
			ps.setString(1, npack);
			ps.setInt(2, duration);
			ps.setString(3, descp);
			ps.setInt(4, cost);
			ps.setString(5, remk);
			ps.setInt(6, user);
	
			int r = ps.executeUpdate();
			if(r>=1)
			{
				request.setAttribute("pack", npack);
				RequestDispatcher rd = request.getRequestDispatcher("addpack.jsp");
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
