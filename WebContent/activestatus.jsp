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
    <title>Active Status</title>
    
    <link rel = "icon" href = "images/icon/logo-mini.png" type = "image/x-icon"> 

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
                        <li>
                            <a href="customerpack.jsp">
                                <i class="fas fa-desktop"></i>Recharge</a>
                        </li>
                        <li class="active">
                            <a href="#">
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
                                                    <a href="#">
                                                        <img src="images/icon/avatar-01.jpg" alt="User" />
                                                    </a>
                                                </div>
                                                <div class="content">
                                                    <h5 class="name"><%=u_name %></h5>
                                                    <span class="email"><%=u_email %></span>
                                                </div>
                                            </div>
                                            <div class="account-dropdown__body">
                                                <div class="account-dropdown__item">
                                                    <a href="editproflie.jsp">
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
                                <div class="table-responsive table--no-card m-b-30">
                                    <table class="table table-borderless table-striped table-earning">
                                        <thead>
                                            <tr>
                                                <th>Consumer id</th>
                                                <th>Name</th>
                                                <th>Mobile No</th>
                                                <th>Email</th>
                                                <th>Address</th>
                                                <th>Setup Box id</th>
                                                <th>VC No.</th>
												<th>Pack Detail</th>
												<th>Created by</th>
												<th>Created on</th>
												<th>Updated by</th>
												<th>Updated on</th>
												<th>Remark</th>
												<th>Status</th>
												<th>Area</th>
                                            </tr>
                                        </thead>
                                        <tbody>
										<%
											String dbuser = pageContext.getServletContext().getInitParameter("dbuser");
											String dbpass = pageContext.getServletContext().getInitParameter("dbpass");
											
											try
											{
												
												Class.forName("com.mysql.jdbc.Driver");  
												Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/csms",dbuser,dbpass);
												PreparedStatement ps = con.prepareStatement("SELECT c.consumer_id, c.name, c.mobile_no, c.email, c.address, c.setupboxid, c.vcno, p.pack_name, u.name, c.created_on, up.name, c.updated_on, c.remark, c.status, a.area_name FROM `consumer` c JOIN `area` a ON c.area_code=a.area_id JOIN `user` u ON c.created_by=u.user_id JOIN `user` up ON c.updated_by=up.user_id JOIN `pack` p ON c.packd=p.pack_id WHERE c.deleted IS NULL AND c.status=?");
												ps.setInt(1, 1);
												ResultSet rs = ps.executeQuery();
												while(rs.next())
												{
													String status = (rs.getInt(15) == 1)?"Active":"Inactive";
													out.println("<tr><td>"+rs.getInt(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getString(4)+
															    "</td><td>"+rs.getString(5)+"</td><td>"+rs.getInt(6)+"</td><td>"+rs.getInt(7)+"</td><td>"+rs.getString(8)+
															    "</td><td>"+rs.getString(9)+"</td><td>"+rs.getString(10)+"</td><td>"+rs.getString(11)+"</td><td>"+rs.getString(12)+
															    "</td><td>"+rs.getString(13)+"</td><td>"+rs.getString(14)+"</td><td>"+status+"</td></tr>");
												}
												con.close();
											}
											catch(Exception e)
											{
												out.println(e.getMessage());
											}
											
										%>
                                        </tbody>
                                    </table>
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
