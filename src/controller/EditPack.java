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

@WebServlet("/EditPack")
public class EditPack extends HttpServlet {
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
		
		Integer packid = Integer.parseInt(request.getParameter("packid"));
		String packname = request.getParameter("packname");
		Integer dur = Integer.parseInt(request.getParameter("duration"));
		String descp = request.getParameter("description");
		Integer cost = Integer.parseInt(request.getParameter("cost"));
		String remk = request.getParameter("remark");
		
		
		Connection con = null;
		PreparedStatement ps = null;
		PrintWriter pw = response.getWriter();
		RequestDispatcher rd = null;
		
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");  
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/csms",dbuser,dbpass);
			ps = con.prepareStatement("UPDATE pack SET pack_name=?, duration=?, description=?, price=?, remark=?, updated_by=? WHERE pack_id=?");
			ps.setString(1, packname);
			ps.setInt(2, dur);
			ps.setString(3, descp);
			ps.setInt(4, cost);
			ps.setString(5, remk);
			ps.setInt(6, user);
			ps.setInt(7, packid);
			
			int r = ps.executeUpdate();
			
			if(r >= 1) {
				String message = "Changes saved for "+packname;
				request.setAttribute("notify", message);
				rd = request.getRequestDispatcher("editpack.jsp");
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
