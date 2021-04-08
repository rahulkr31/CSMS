package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/allocatepack")
public class AllocatePack extends HttpServlet {
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
		PreparedStatement ps1 = null;
		PrintWriter pw = resp.getWriter();
		
		String dbuser= getServletContext().getInitParameter("dbuser");
		String dbpass= getServletContext().getInitParameter("dbpass");
		
		resp.setContentType("text/html");
		
		Integer custid = Integer.parseInt(req.getParameter("cust_id"));
		Integer packid = Integer.parseInt(req.getParameter("pack"));
		Date expdate = null;
		Integer validity = null;
		Date newExpDate = null;
		String packname = null;
		
		if((req.getParameter("expdate")) != null) {
			try{	expdate = new SimpleDateFormat("yyyy-MM-dd").parse(req.getParameter("expdate"));	}
			catch(Exception e) {	pw.println(e);	}
		} else {
			expdate = new Date();
		}
		
				
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");  
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/csms",dbuser,dbpass);
			
			ps = con.prepareStatement("SELECT duration, pack_name FROM pack WHERE pack_id=? AND deleted IS NULL");
			ps.setInt(1, packid);
			ResultSet rs = ps.executeQuery();
			validity = rs.getInt(1);
			packname = rs.getString(2);
			
			rs.close();
			ps.close();
			
			newExpDate = addDays(expdate, validity);
			java.sql.Date sDate = new java.sql.Date(newExpDate.getTime());
			
			ps1 = con.prepareStatement("UPDATE consumer SET packd=?, expiry_date=?, status=? WHERE consumer_id=?");
			ps1.setInt(1, packid);
			ps1.setDate(2, sDate);
			ps1.setInt(3, 1);
			ps1.setInt(4, custid);
			
			int r = ps1.executeUpdate();
	
			
			if(r>=1)
			{
				req.setAttribute("notify", packname);
				RequestDispatcher rd = req.getRequestDispatcher("customerspack.jsp");
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
	
	public static Date addDays(Date date, int days) {
		GregorianCalendar cal = new GregorianCalendar();
		cal.setTime(date);
		cal.add(Calendar.DATE, days);

		return cal.getTime();
	}

}
