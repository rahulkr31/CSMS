<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@page import="java.sql.*" %>
    
<%
	Integer user = (Integer) session.getAttribute("user");
	if (user == null) {
	   request.setAttribute("Error", "Session has ended.  Please login.");
	   RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
	   rd.forward(request, response);
	}
	
	String u_name = (String) session.getAttribute("u_name");
	String u_email = (String) session.getAttribute("u_email");
	
%>


<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Title Page-->
    <title>Recharge</title>
    
    <link rel = "icon" href = "images/icon/logo-mini.png" type = "image/icon">

    <!-- Fontfaces CSS-->
    <link href="css/font-face.css" rel="stylesheet" media="all">
    <link href="vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <link href="vendor/font-awesome-5/css/fontawesome-all.min.css" rel="stylesheet" media="all">
    <link href="vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">

    <!-- Bootstrap CSS-->
    <link href="vendor/bootstrap-4.1/bootstrap.min.css" rel="stylesheet" media="all">

    <!-- Vendor CSS-->
    <link href="vendor/animsition/animsition.min.css" rel="stylesheet" media="all">
    <link href="vendor/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet" media="all">
    <link href="vendor/wow/animate.css" rel="stylesheet" media="all">
    <link href="vendor/css-hamburgers/hamburgers.min.css" rel="stylesheet" media="all">
    <link href="vendor/slick/slick.css" rel="stylesheet" media="all">
    <link href="vendor/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="vendor/perfect-scrollbar/perfect-scrollbar.css" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <link href="css/theme.css" rel="stylesheet" media="all">

</head>

<body class="animsition"  onload="noBack();" onpageshow="if (event.persisted) noBack();" onunload="">
    <div class="page-wrapper">
        <!-- HEADER MOBILE-->
        <header class="header-mobile d-block d-lg-none">
            <div class="header-mobile__bar">
                <div class="container-fluid">
                    <div class="header-mobile-inner">
                        <a class="logo" href="index.html">
                            <img src="images/icon/logo.png" alt="CSMS" width="150" height="64"  />
                        </a>
                        <button class="hamburger hamburger--slider" type="button">
                            <span class="hamburger-box">
                                <span class="hamburger-inner"></span>
                            </span>
                        </button>
                    </div>
                </div>
            </div>
            <nav class="navbar-mobile">
                <div class="container-fluid">
                    <ul class="navbar-mobile__list list-unstyled">
                        <li>
                            <a href="operatorhome.jsp">
                                <i class="fas fa-home"></i>Home</a>
                        </li>
                        <li>
                            <a href="addcust.jsp">
                                <i class="fas fa-user-plus"></i>Add Customer</a>
                        </li>
                        <li>
                            <a href="editcust.jsp">
                                <i class="fas fa-edit"></i>Edit Customer</a>
                        </li>
                        <li>
                            <a href="viewcust.jsp">
                                <i class="far fa-eye"></i>View Customer</a>
                        </li>
                        <li>
                            <a href="customerpack.jsp">
                                <i class="fas fa-desktop"></i>Recharge</a>
                        </li>
                        <li>
                            <a href="activestatus.jsp">
                                <i class="fas fa-bullseye"></i>Active Status</a>
                        </li>
                        <li>
                            <a href="deletecust.jsp">
                            	<i class="fas fa-trash fa-fw"></i>Delete Customer</a>
                        </li>
                        <li>
                            <a href="restorecust.jsp">
                            	<i class="fas fa-redo fa-fw"></i>Restore Customer</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>
        <!-- END HEADER MOBILE-->

        <!-- MENU SIDEBAR-->
        <aside class="menu-sidebar d-none d-lg-block">
            <div class="logo">
                <a href="#">
                    <img src="images/icon/logo.png" alt="CSMS" width="150" height="64"  />
                </a>
            </div>
            <div class="menu-sidebar__content js-scrollbar1">
                <nav class="navbar-sidebar">
                    <ul class="list-unstyled navbar__list">
                        <li>
                            <a href="operatorhome.jsp">
                                <i class="fas fa-home"></i>Home</a>
                        </li>
                        <li>
                            <a href="addcust.jsp">
                                <i class="fas fa-user-plus"></i>Add Customer</a>
                        </li>
                        <li>
                            <a href="editcust.jsp">
                                <i class="fas fa-edit"></i>Edit Customer</a>
                        </li>
                        <li>
                            <a href="viewcust.jsp">
                                <i class="fas fa-eye"></i>View Customer</a>
                        </li>
                        <li class="active">
                            <a href="customerpack.jsp">
                                <i class="fas fa-desktop"></i>Recharge</a>
                        </li>
                        <li>
                            <a href="activestatus.jsp">
                                <i class="fas fa-bullseye"></i>Active Status</a>
                        </li>
                        <li>
                            <a href="deletecust.jsp">
                            	<i class="fas fa-trash fa-fw"></i>Delete Customer</a>
                        </li>
                        <li>
                            <a href="restorecust.jsp">
                            	<i class="fas fa-redo fa-fw"></i>Restore Customer</a>
                        </li>
                    </ul>
                </nav>
            </div>
        </aside>
        <!-- END MENU SIDEBAR-->

        <!-- PAGE CONTAINER-->
        <div class="page-container">
            <!-- HEADER DESKTOP-->
            <header class="header-desktop">
                <div class="section__content section__content--p30">
                    <div class="container-fluid">
                        <div class="header-wrap">
                            <div class="header-button">
                                <div class="account-wrap">
                                    <div class="account-item clearfix js-item-menu">
                                        <div class="image">
                                            <img src="images/icon/avatar-01.jpg" alt="John Doe" />
                                        </div>
                                        <div class="content">
                                            <a class="js-acc-btn" href="#"><%=u_name %></a>
                                        </div>
                                        <div class="account-dropdown js-dropdown">
                                            <div class="info clearfix">
                                                <div class="image">
                                                    <img src="images/icon/avatar-01.jpg" alt="User" />
                                                </div>
                                                <div class="content">
                                                    <h5 class="name"><%=u_name %></h5>
                                                    <span class="email"><%=u_email %></span>
                                                </div>
                                            </div>
                                            <div class="account-dropdown__body">
                                                <div class="account-dropdown__item">
                                                    <a href="editprofile.jsp">
                                                        <i class="zmdi zmdi-account"></i>Account Setting</a>
                                                </div>
                                            </div>
                                            <div class="account-dropdown__footer">
                                                <a href="logout">
                                                    <i class="zmdi zmdi-power"></i>Logout</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </header>
            <!-- HEADER DESKTOP-->

            <!-- MAIN CONTENT-->
            <div class="main-content">
                <div class="section__content section__content--p30">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="au-card au-card--no-shadow au-card--no-pad m-b-40">
                                    <div class="au-card-title" style="background-image:url('images/bg-title-01.jpg');">
                                        <div class="bg-overlay bg-overlay--blue"></div>
                                        <h3>    <i class="fas fa-edit"></i>Allocate Pack</h3>
                                    </div>
                                    <div class="card-body card-block">
                                        <%
                                            String dbuser = pageContext.getServletContext().getInitParameter("dbuser");
                                            String dbpass = pageContext.getServletContext().getInitParameter("dbpass");
                                            
                                            String searchid = request.getParameter("search_id");
                                            
                                            String name = null;
                                            String phone = null;
                                            Integer stbid = null;
                                            Integer vcno = null;
                                            Integer custid = null;
                                            Date expdate = null;
                                            
                                            try
                                            {
                                                
                                                Class.forName("com.mysql.jdbc.Driver");  
                                                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/csms",dbuser,dbpass);
                                                PreparedStatement ps = con.prepareStatement("SELECT consumer_id, name, mobile_no, setupboxid, vcno, expiry_date FROM consumer WHERE mobile_no=? OR setupboxid=? OR vcno=? AND deleted IS NULL AND status=?");
                                                ps.setString(1,searchid);
                                                try {
	                                                ps.setInt(2,Integer.parseInt(searchid));
	                                                ps.setInt(3,Integer.parseInt(searchid));
                                                } catch(NumberFormatException e) {
                                                	ps.setInt(2, -1);
                                                	ps.setInt(3, -1);
                                                }
                                                ps.setInt(4, 1);
                                                
                                                ResultSet rs = ps.executeQuery();
                                                while(rs.next())
                                                {
                                                    custid = rs.getInt(1);
                                                    name = rs.getString(2);
                                                    phone = rs.getString(3);
                                                    stbid = rs.getInt(4);
                                                    vcno = rs.getInt(5);
                                                    expdate = rs.getDate(6);
                                                }
                                                con.close();
                                            }
                                            catch(Exception e)
                                            {
                                                out.println(e.getMessage());
                                            }
                                        %>
                                        <div class="tab-content profile-tab" id="myTabContent">
	                                       <div class="row">
	                                           <div class="col-sm-2">
	                                               <label>Name</label>
	                                           </div>
	                                           <div class="col-sm-6">
	                                               <p><%=name %></p>
	                                           </div>
	                                       </div>
	                                       <div class="row">
	                                           <div class="col-sm-2">
	                                               <label>Mobile No.</label>
	                                           </div>
	                                           <div class="col-sm-6">
	                                               <p><%=phone %></p>
	                                           </div>
	                                       </div>
	                                       <div class="row">
	                                           <div class="col-sm-2">
	                                               <label>Setup Box Id</label>
	                                           </div>
	                                           <div class="col-sm-6">
	                                               <p><%=stbid %></p>
	                                           </div>
	                                       </div>
	                                       <div class="row">
	                                           <div class="col-sm-2">
	                                               <label>VC Number</label>
	                                           </div>
	                                           <div class="col-sm-6">
	                                               <p><%=vcno %></p>
	                                           </div>
	                                       </div>
		                                </div>
                                        <form action="allocatepack" method="post" class="">
                                        	<input type="hidden" name="cust_id" value="<%=custid %>" />
                                        	<input type="hidden" name="expdate" value="<%=expdate %>" />
                                        	
                                            	<div class="table-responsive table-responsive-data2">
				                                    <table class="table table-data2">
				                                        <thead>
				                                            <tr>
				                                                <th></th>
				                                                <th></th>
				                                                <th></th>
				                                            </tr>
				                                        </thead>
				                                        <tbody>
   	<%
        try
        {
            
            Class.forName("com.mysql.jdbc.Driver");  
            Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/csms",dbuser,dbpass);
            PreparedStatement ps1 = con1.prepareStatement("SELECT pack_id, pack_name, duration, description, price FROM pack");
            
            ResultSet rs1 = ps1.executeQuery();
            while(rs1.next())
            {
                out.println("<tr class='tr-shadow'><td><label class='au-checkbox'><input type='radio' name='pack' value="+rs1.getInt(1)+"><span class='au-checkmark'></span></label></td><td><div class='table-data__info'>");
                out.println("<h4>"+rs1.getString(2)+" | "+rs1.getInt(3)+"</h4><p class='table-data-desc'>"+rs1.getString(4)+"</p></div></td><td><span class='block-email'>"+rs1.getInt(5)+"</span></td></tr><tr class='spacer'></tr>");
            }
            con1.close();
        }
        catch(Exception e)
        {
            out.println(e.getMessage());
        }
    %>     
				                                        </tbody>
				                                    </table>
				                                </div>
                                            <div class="form-actions form-group">
                                                <button type="submit" class="btn btn-primary btn-sm">Allocate Pack</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <!-- END MAIN CONTENT-->
            <!-- END PAGE CONTAINER-->
        </div>

    </div>

    <!-- Jquery JS-->
    <script src="vendor/jquery-3.2.1.min.js"></script>
    <!-- Bootstrap JS-->
    <script src="vendor/bootstrap-4.1/popper.min.js"></script>
    <script src="vendor/bootstrap-4.1/bootstrap.min.js"></script>
    <!-- Vendor JS       -->
    <script src="vendor/slick/slick.min.js">
    </script>
    <script src="vendor/wow/wow.min.js"></script>
    <script src="vendor/animsition/animsition.min.js"></script>
    <script src="vendor/bootstrap-progressbar/bootstrap-progressbar.min.js">
    </script>
    <script src="vendor/counter-up/jquery.waypoints.min.js"></script>
    <script src="vendor/counter-up/jquery.counterup.min.js">
    </script>
    <script src="vendor/circle-progress/circle-progress.min.js"></script>
    <script src="vendor/perfect-scrollbar/perfect-scrollbar.js"></script>
    <script src="vendor/chartjs/Chart.bundle.min.js"></script>
    <script src="vendor/select2/select2.min.js">
    </script>

    <!-- Main JS-->
    <script src="js/main.js"></script>
    
    <SCRIPT type="text/javascript">
	    window.history.forward();
	    function noBack() { window.history.forward(); }
	</SCRIPT>

</body>

</html>
<!-- end document-->
