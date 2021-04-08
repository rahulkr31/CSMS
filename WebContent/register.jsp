<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@page import = "java.sql.*,java.lang.*" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Title Page-->
    <title>Register</title>
	
    <!-- Titlebar Icon -->
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
        <div class="page-content-register--bge5">
            <div class="container">
                <div class="login-wrap" style="max-width: 1080px;">
                    <div class="login-content">
                        <div class="login-logo">
                            <a href="#">
                                <img src="images/icon/logo.png" alt="CSMS"  width="150" height="64" />
                            </a>
                        </div>
                        <div class="login-form">
                            <form action="register" method="post" id="register-form">
                            	<div class="row">
	                                <div class="form-group col-md-6">
	                                    <label><i class="fas fa-user"></i> Username</label>
	                                    <input type="text" name="username" id="username" placeholder="Choose a User Name" required="required" class="au-input au-input--full" />
	                                </div>
	                                <div class="form-group col-md-6">
	                                    <label><i class="fas fa-envelope"></i> Email Address</label>
	                                    <input type="email" name="email" id="email" placeholder="Your Email" required="required" class="au-input au-input--full" />
	                                </div>
                             	</div>
                             	<div class="row">
	                                <div class="form-group col-md-6">
	                                    <label><i class="fas fa-key"></i> Password</label>
	                                    <input type="password" name="pass" id="pass" placeholder="Your Password" required="required" class="au-input au-input--full" />
	                                </div>
	                                <div class="form-group col-md-6">
	                                    <label><i class="fa fa-key"></i> Re-Enter Password</label>
	                                    <input type="password" name="re_pass" id="re_pass" placeholder="Repeat your Password" required="required" class="au-input au-input--full" />
	                                </div>
	                            </div>
	                            <div class="row">
	                                <div class="form-group col-md-6">
	                                    <label><i class="fas fa-user"></i> Name</label>
	                                    <input type="text" name="name" id="name" placeholder="Your Name" required="required" class="au-input au-input--full" />
	                                </div>
	                                <div class="form-group col-md-6">
	                                    <label><i class="fa fa-mobile-alt"></i> Mobile Number</label>
	                                    <input type="text" name="phonenumber" id="phonenumber" placeholder="Your Mobile Number" required="required" class="au-input au-input--full" />
	                                </div>
	                            </div>
	                            <div class="row">
	                                <div class="form-group col-md-6">
	                                    <label><i class="fas fa-map-marker-alt"></i> Area</label>
	                                    <select name="area" id="area" class="au-input au-input--full" style="padding: 9px 15px 9px;">
	                                        <option disabled="disabled" selected="selected">Select Area</option>
	                                        <%
	                                        
		                                    	String dbuser = pageContext.getServletContext().getInitParameter("dbuser");
		                                    	String dbpass = pageContext.getServletContext().getInitParameter("dbpass");	
	                                        
	                                           	try 
	                                           	{
	                                            	Class.forName("com.mysql.jdbc.Driver");
	                                            	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/csms",dbuser,dbpass);
	                                            	PreparedStatement ps = con.prepareStatement("SELECT area_id, area_name FROM area WHERE NOT area_id=?");
	                                            	ps.setInt(1, 1);
	                                            	ResultSet rs = ps.executeQuery();
	                                                while(rs.next())
	                                                {
	                                                	out.println("<option value='"+rs.getString(1)+"'>"+rs.getString(2)+"</option>");
	                                                }
	                                           	}
	                                           	catch(Exception e)
	                                           	{
	                                           		out.println("error loading areas");
	                                           	}
                                          	%>
	                                    </select>
	                                </div>
	                                <div class="form-group col-md-6">
	                                    <label><i class="fas fa-home"></i> Address</label>
	                                    <input type="text" name="address" id="address" placeholder="Address" required="required" class="au-input au-input--full" />
	                                </div>
                                </div>
                                <div class="row">
	                                <div class="form-group col-md-6">
	                                    <label><i class="fas fa-question"></i> Role</label>
	                                    <input type="text" name="role" id="role" placeholder="Role" readonly="readonly" value="Operator" class="au-input au-input--full" />
	                                </div>
	                                <div class="form-group col-md-6">
	                                    <label><i class="fas fa-pencil-alt"></i> Remarks</label>
	                                    <input type="text" name="remarks" id="remarks" placeholder="Any Remarks(Optional)" class="au-input au-input--full" />
                                	</div>
                                </div>
                                <div class="login-checkbox">
                                    <label>
                                        <input type="checkbox" name="aggree">Agree the terms and policy
                                    </label>
                                </div>
                                <br>
                                <button class="au-btn au-btn--block au-btn--blue m-b-20" type="submit" style="width: 50%; margin:auto; display:block;"  onclick="register();">register</button>
                            </form>
                            <br>
                            <div class="register-link">
                                <p>
                                    Already have account?
                                    <a href="index.jsp">Sign In</a>
                                </p>
                            </div>
                            <br>
                        </div>
                    </div>
                </div>
            </div>
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
    
    <script type="text/javascript">
    	function register()
    	{
    		var pass = $("#pass").val();
    		var repass = $("#re_pass").val();
    		if(pass !== repass)
    		{
    			alert("Passwords are not equal");
    			return false;
    		}
    		$("#register-form").submit();
    	}
    	window.history.forward();
	    function noBack() { window.history.forward(); }
    </script>

</body>

</html>
<!-- end document-->