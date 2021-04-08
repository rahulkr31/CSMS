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


@WebServlet("/addcust")
public class AddCustAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session=req.getSession(false);
		Integer user = (Integer) session.getAttribute("user");
		if (user == null) {
		   req.setAttribute("Error", "Session has ended.  Please login.");
		   RequestDispatcher rd = req.getRequestDispatcher("index.jsp");
		   rd.forward(req, resp);
		}
		
		Connection con = null;
		PreparedStatement ps = null;
		PrintWriter pw = resp.getWriter();
		
		String dbuser= getServletContext().getInitParameter("dbuser");
		String dbpass= getServletContext().getInitParameter("dbpass");
		
		resp.setContentType("text/html");
		String name = req.getParameter("name");
		String mobno = req.getParameter("mobno");
		String email = req.getParameter("email");
		Integer stbid = Integer.parseInt(req.getParameter("stbid"));
		Integer vcno = Integer.parseInt(req.getParameter("vcno"));
		String add = req.getParameter("address");
		String remk = req.getParameter("remark");
		Integer area = Integer.parseInt(req.getParameter("area"));
		
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");  
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/csms",dbuser,dbpass);
			
			ps = con.prepareStatement("insert into consumer(name, mobile_no, email, address, setupboxid, vcno, created_by, updated_by, remark, status, area_code) values(?,?,?,?,?,?,?,?,?,?,?)");
			ps.setString(1,name);
			ps.setString(2,mobno);
			ps.setString(3,email);
			ps.setString(4,add);
			ps.setInt(5,stbid);
			ps.setInt(6,vcno);
			ps.setInt(7,user);
			ps.setInt(8,user);
			ps.setString(9,remk);
			ps.setInt(10,0);
			ps.setInt(11, area);
	
			int r = ps.executeUpdate();
			if(r>=1)
			{
				req.setAttribute("consumer", name);
				RequestDispatcher rd = req.getRequestDispatcher("addcust.jsp");
				rd.include(req, resp);
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
