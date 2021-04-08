<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*" %>
    
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
    <title>Edit Profile</title>
    
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

<body class="animsition">
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
                            <a href="#">
                                <i class="fas fa-home fa-fw"></i>Home</a>
                        </li>
                        <li class="has-sub">
                            <a class="js-arrow" href="#">
                                <i class="fas fa-user fa-fw"></i>User</a>
                            <ul class="navbar-mobile-sub__list list-unstyled js-sub-list">
                                <li>
                                    <a href="adduser.jsp"><i class="fas fa-plus fa-fw"></i>Add User</a>
                                </li>
                                <li>
                                    <a href="edituser.jsp"><i class="fas fa-edit fa-fw"></i>Edit User</a>
                                </li>
                                <li>
                                    <a href="viewuser.jsp"><i class="fas fa-search fa-fw"></i>View User</a>
                                </li>
                                <li>
                                    <a href="deleteuser.jsp"><i class="fas fa-trash fa-fw"></i>Delete User</a>
                                </li>
                                <li>
                                    <a href="restoreuser.jsp"><i class="fas fa-redo fa-fw"></i>Restore User</a>
                                </li>
                            </ul>
                        </li>
                        <li class="has-sub">
                            <a class="js-arrow" href="#">
                                <i class="fas fa-info fa-fw"></i>Role</a>
                            <ul class="navbar-mobile-sub__list list-unstyled js-sub-list">
                                <li>
                                    <a href="addrole.jsp"><i class="fas fa-plus fa-fw"></i>Add Role</a>
                                </li>
                                <li>
                                    <a href="editrole.jsp"><i class="fas fa-edit fa-fw"></i>Edit Role</a>
                                </li>
                                <li>
                                    <a href="viewrole.jsp"><i class="fas fa-search fa-fw"></i>View Role</a>
                                </li>
                                <li>
                                    <a href="deleterole.jsp"><i class="fas fa-trash fa-fw"></i>Delete Role</a>
                                </li>
                                <li>
                                    <a href="restorerole.jsp"><i class="fas fa-redo fa-fw"></i>Restore Role</a>
                                </li>
                            </ul>
                        </li>
                        <li class="has-sub">
                            <a class="js-arrow" href="#">
                                <i class="fas fa-map-pin fa-fw"></i>Area</a>
                            <ul class="navbar-mobile-sub__list list-unstyled js-sub-list">
                                <li>
                                    <a href="addarea.jsp"><i class="fas fa-plus fa-fw"></i>Add Area</a>
                                </li>
                                <li>
                                    <a href="editarea.jsp"><i class="fas fa-edit fa-fw"></i>Edit Area</a>
                                </li>
                                <li>
                                    <a href="viewarea.jsp"><i class="fas fa-search fa-fw"></i>View Area</a>
                                </li>
                                <li>
                                    <a href="deletearea.jsp"><i class="fas fa-trash fa-fw"></i>Delete Area</a>
                                </li>
                                <li>
                                    <a href="restorearea.jsp"><i class="fas fa-redo fa-fw"></i>Restore Area</a>
                                </li>
                            </ul>
                        </li>
                        <li class="has-sub">
                            <a class="js-arrow" href="#">
                                <i class="fas fa-desktop fa-fw"></i>Pack</a>
                            <ul class="navbar-mobile-sub__list list-unstyled js-sub-list">
                                <li>
                                    <a href="addpack.jsp"><i class="fas fa-plus fa-fw"></i>Add Pack</a>
                                </li>
                                <li>
                                    <a href="editpack.jsp"><i class="fas fa-edit fa-fw"></i>Edit Pack</a>
                                </li>
                                <li>
                                    <a href="viewpack.jsp"><i class="fas fa-search fa-fw"></i>View Pack</a>
                                </li>
                                <li>
                                    <a href="deletepack.jsp"><i class="fas fa-trash fa-fw"></i>Delete Pack</a>
                                </li>
                                <li>
                                    <a href="restorepack.jsp"><i class="fas fa-redo fa-fw"></i>Restore Pack</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="pendinguser.jsp">
                                <i class="fas fa-bullseye fa-fw"></i>Pending Users</a>
                        </li>
                        <li>
                            <a href="dashboard.jsp">
                                <i class="fas fa-tachometer-alt fa-fw"></i>Dashboard</a>
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
                        <li class="active">
                            <a href="#">
                                <i class="fas fa-home fa-fw"></i>Home</a>
                        </li>
                        <li class="has-sub">
                            <a class="js-arrow" href="#">
                                <i class="fas fa-user fa-fw"></i>User</a>
                            <ul class="list-unstyled navbar__sub-list js-sub-list">
                                <li>
                                    <a href="adduser.jsp"><i class="fas fa-plus fa-fw"></i>Add User</a>
                                </li>
                                <li>
                                    <a href="edituser.jsp"><i class="fas fa-edit fa-fw"></i>Edit User</a>
                                </li>
                                <li>
                                    <a href="viewuser.jsp"><i class="fas fa-search fa-fw"></i>View User</a>
                                </li>
                                <li>
                                    <a href="deleteuser.jsp"><i class="fas fa-trash fa-fw"></i>Delete User</a>
                                </li>
                                <li>
                                    <a href="restoreuser.jsp"><i class="fas fa-redo fa-fw"></i>Restore User</a>
                                </li>
                            </ul>
                        </li>
                        <li class="has-sub">
                            <a class="js-arrow" href="#">
                                <i class="fas fa-info fa-fw"></i>Role</a>
                            <ul class="list-unstyled navbar__sub-list js-sub-list">
                                <li>
                                    <a href="addrole.jsp"><i class="fas fa-plus fa-fw"></i>Add Role</a>
                                </li>
                                <li>
                                    <a href="editrole.jsp"><i class="fas fa-edit fa-fw"></i>Edit Role</a>
                                </li>
                                <li>
                                    <a href="viewrole.jsp"><i class="fas fa-search fa-fw"></i>View Role</a>
                                </li>
                                <li>
                                    <a href="deleterole.jsp"><i class="fas fa-trash fa-fw"></i>Delete Role</a>
                                </li>
                                <li>
                                    <a href="restorerole.jsp"><i class="fas fa-redo fa-fw"></i>Restore Role</a>
                                </li>
                            </ul>
                        </li>
                        <li class="has-sub">
                            <a class="js-arrow" href="#">
                                <i class="fas fa-map-pin fa-fw"></i>Area</a>
                            <ul class="list-unstyled navbar__sub-list js-sub-list">
                                <li>
                                    <a href="addarea.jsp"><i class="fas fa-plus fa-fw"></i>Add Area</a>
                                </li>
                                <li>
                                    <a href="editarea.jsp"><i class="fas fa-edit fa-fw"></i>Edit Area</a>
                                </li>
                                <li>
                                    <a href="viewarea.jsp"><i class="fas fa-search fa-fw"></i>View Area</a>
                                </li>
                                <li>
                                    <a href="deletearea.jsp"><i class="fas fa-trash fa-fw"></i>Delete Area</a>
                                </li>
                                <li>
                                    <a href="restorearea.jsp"><i class="fas fa-redo fa-fw"></i>Restore Area</a>
                                </li>
                            </ul>
                        </li>
                        <li class="has-sub">
                            <a class="js-arrow" href="#">
                                <i class="fas fa-desktop fa-fw"></i>Pack</a>
                            <ul class="list-unstyled navbar__sub-list js-sub-list">
                                <li>
                                    <a href="addpack.jsp"><i class="fas fa-plus fa-fw"></i>Add Pack</a>
                                </li>
                                <li>
                                    <a href="editpack.jsp"><i class="fas fa-edit fa-fw"></i>Edit Pack</a>
                                </li>
                                <li>
                                    <a href="viewpack.jsp"><i class="fas fa-search fa-fw"></i>View Pack</a>
                                </li>
                                <li>
                                    <a href="deletepack.jsp"><i class="fas fa-trash fa-fw"></i>Delete Pack</a>
                                </li>
                                <li>
                                    <a href="restorepack.jsp"><i class="fas fa-redo fa-fw"></i>Restore Pack</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="pendinguser.jsp">
                                <i class="fas fa-bullseye fa-fw"></i>Pending Users</a>
                        </li>
                        <li>
                            <a href="dashboard.jsp">
                                <i class="fas fa-tachometer-alt fa-fw"></i>Dashboard</a>
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
                                                    <a href="#">
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
                    <%
						String dbuser = pageContext.getServletContext().getInitParameter("dbuser");
						String dbpass = pageContext.getServletContext().getInitParameter("dbpass");
						
						String username = null;
						String mobno = null;
						String name = null;
						String email = null;
						String add = null;
						String area = null;
						String role = null;
						
						try
						{ 
						
							Class.forName("com.mysql.jdbc.Driver");  
							Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/csms",dbuser,dbpass);
							
							PreparedStatement ps = con.prepareStatement("SELECT u.user_name, u.mobile_no, u.address, a.area_name, r.role_type FROM `user` u JOIN `role` r ON u.role=r.role_id JOIN `area` a ON u.area_code=a.area_id WHERE u.deleted IS NULL AND u.user_id=?");
							ps.setInt(1, user);
							ResultSet rs = ps.executeQuery();
							
							while(rs.next())
							{
								username = rs.getString(1);
								mobno = rs.getString(2);
								add = rs.getString(3);
								area = rs.getString(4);
								role = rs.getString(5);
							}
							con.close();
						}
						catch(Exception e)
						{
							out.println(e.getMessage());
						}
						
						
                    	if(request.getAttribute("notify") != null)
                    	{
                    		out.println("<div class='sufee-alert alert with-close alert-primary alert-dismissible fade show'><span class='badge badge-pill badge-primary'>Success</span>"+request.getAttribute("notify")+
                    				"<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button></div>");
                    	}
                    
					
					%>
					
                    	<div class="row">
                            
                            <div class="col-md-12">
                                <div class="emp-profile">
                                
                                    <div class="row">
                                        <div class="col-md-2">
                                            <img src="images/icon/avatar-01.jpg" class="profile-img">
                                        </div>
                                        <div class="profile-head col-md-8">
                                            <div class="name-heading">
                                                <%=u_name %>
                                            </div>
                                            <div class="designation-heading">
                                                <%=role %>
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <input type="submit" class="profile-edit-btn" name="btnAddMore" value="Edit Profile"/>
                                        </div>
                                    </div>
                                    
                                    <br />
                                    
                                    <div class="row">
                                        <div class="col-md-8">
                                            <div class="tab-content profile-tab" id="myTabContent">
                                                <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
	                                                <div class="row">
	                                                    <div class="col-md-6">
	                                                        <label>User Name</label>
	                                                    </div>
	                                                    <div class="col-md-6">
	                                                        <p><%=username %></p>
	                                                    </div>
	                                                </div>
	                                                <div class="row">
	                                                    <div class="col-md-6">
	                                                        <label>Name</label>
	                                                    </div>
	                                                    <div class="col-md-6">
	                                                        <p><%=u_name %></p>
	                                                    </div>
	                                                </div>
	                                                <div class="row">
	                                                    <div class="col-md-6">
	                                                        <label>Phone</label>
	                                                    </div>
	                                                    <div class="col-md-6">
	                                                        <p><%=mobno %></p>
	                                                    </div>
	                                                </div>
	                                                <div class="row">
	                                                    <div class="col-md-6">
	                                                        <label>Profession</label>
	                                                    </div>
	                                                    <div class="col-md-6">
	                                                        <p><%=role %></p>
	                                                    </div>
	                                                </div>
	                                                <div class="row">
	                                                    <div class="col-md-6">
	                                                        <label>Area assigned</label>
	                                                    </div>
	                                                    <div class="col-md-6">
	                                                        <p><%=area %></p>
	                                                    </div>
	                                                </div>
	                                                <div class="row">
	                                                    <div class="col-md-6">
	                                                        <label>Email</label>
	                                                    </div>
	                                                    <div class="col-md-6 input-group">
	                                                        <p><input type="email" name="n_email" id="email" value="<%=u_email%>" class="form-control" required="required"></p>
	                                                    </div>
	                                                </div>
	                                                <div class="row">
	                                                    <div class="col-md-6">
	                                                        <label>Address</label>
	                                                    </div>
	                                                    <div class="col-md-6 input-group">
	                                                        <p><input type="text" name="n_add" id="add" value="<%=add%>" class="form-control" required="required"></p>
	                                                    </div>
	                                                </div>
	                                                
                                                </div>
                                            </div>
                                        </div>
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
