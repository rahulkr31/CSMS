<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import = "java.sql.*" %>
    
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
    <title>View Customer</title>
    
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
                            <a href="#">
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
                    <img src="images/icon/logo.png" alt="CSMS" width="150" height="64" />
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
                        <li class="active">
                            <a href="#">
                                <i class="fas fa-eye"></i>View Customer</a>
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
                            <div class="col-lg-9">
                                <div class="au-card au-card--no-shadow au-card--no-pad m-b-40">
                                    <div class="au-card-title" style="background-image:url('images/bg-title-01.jpg');">
                                        <div class="bg-overlay bg-overlay--blue"></div>
                                        <h3>    <i class="fas fa-eye"></i>View Customer</h3>
                                    </div>
                                    <div class="card-body card-block">
                                        <form action="custsearch.jsp" method="post" class="">
                                            <div class="form-actions form-group">
                                                <button type="submit" class="btn btn-primary btn-sm">View All Customers</button>
                                            </div>
                                        </form>
                                        
                                        <p style="display: block; text-align:center;">OR</p>
                                        <br><br>
                                        
                                        <form action="awcustsearch.jsp" method="post" class="">
                                            <div class="form-group">
                                                <div class="input-group">
                                                    <div class="input-group-addon">
                                                        <i class="fa fa-search"></i>
                                                    </div>
                                                    <select name="area" id="area" class="form-control" required="required">
                                                        <option selected="selected" disabled="disabled">Select Area</option>
                                                        <%
	                                                        String dbuser = pageContext.getServletContext().getInitParameter("dbuser");
	                                                        String dbpass = pageContext.getServletContext().getInitParameter("dbpass");
	                                                        
                                                        	try 
                                                        	{
	                                                        	Class.forName("com.mysql.jdbc.Driver");
	                                                        	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/csms",dbuser,dbpass);
	                                                        	PreparedStatement ps = con.prepareStatement("SELECT area_id, area_name FROM area WHERE deleted IS NULL AND NOT area_id = ?");
	                                                        	ps.setInt(1, 1);
	                                                        	ResultSet rs = ps.executeQuery();
	                                                            while(rs.next())
	                                                            {
	                                                            	out.println("<option value='"+rs.getString(1)+"'>"+rs.getString(2)+"</option>");
	                                                            }
                                                        	}
                                                        	catch(Exception e)
                                                        	{
                                                        		out.println("error loading area");
                                                        	}
                                                        	
                                                        %>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-actions form-group">
                                                <button type="submit" class="btn btn-primary btn-sm">View Area Wise Customer</button>
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