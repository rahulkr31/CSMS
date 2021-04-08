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

@WebServlet("/editcust")
public class EditCustAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		HttpSession session = req.getSession(false);
		Integer user = (Integer) session.getAttribute("user");
		if (user == null) {
		   req.setAttribute("Error", "Session has ended.  Please login.");
		   RequestDispatcher rd = req.getRequestDispatcher("index.jsp");
		   rd.forward(req, resp);
		}
		
		String dbuser= getServletContext().getInitParameter("dbuser");
		String dbpass= getServletContext().getInitParameter("dbpass");
		
		resp.setContentType("text/html");
		
		String name = req.getParameter("name");
		Integer custid = Integer.parseInt(req.getParameter("cust_id"));
		Integer stbid = Integer.parseInt(req.getParameter("stbid"));
		Integer vcno = Integer.parseInt(req.getParameter("vcno"));
		Integer area = Integer.parseInt(req.getParameter("area"));
		String add = req.getParameter("address");
		String remk = req.getParameter("remark");
		
		
		Connection con = null;
		PreparedStatement ps = null;
		PrintWriter pw = resp.getWriter();
		
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");  
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/csms",dbuser,dbpass);
			ps = con.prepareStatement("UPDATE consumer SET setupboxid=?, vcno=?, address=?, updated_by=?, remark=?, area_code=? WHERE consumer_id=?");
			ps.setInt(1,stbid);
			ps.setInt(2,vcno);
			ps.setString(3,add);
			ps.setInt(4,user);
			ps.setString(5,remk);
			ps.setInt(6, area);
			ps.setInt(7,custid);
			
			int r = ps.executeUpdate();
			
			if(r >= 1) {
				req.setAttribute("consumer", name);
				RequestDispatcher rd = req.getRequestDispatcher("editcust.jsp");
				rd.include(req, resp);
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
