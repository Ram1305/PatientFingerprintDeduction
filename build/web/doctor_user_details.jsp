 
<%@page import="javapack.Data_split"%>
<%@page import="javapack.Crypt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.fileupload.*, java.util.List, java.io.File, java.util.Iterator"%>
<%@ page import="org.apache.commons.io.*" %>
<%@ include file="include/dbconnect.jsp" %>
<%@page import="java.sql.ResultSet"%>
 <%

String pub_key=Crypt.getPublicKey(16);
String pri_key=Crypt.getPrivateKey(16);
String dname=(String)session.getAttribute("dname");
 
%>
<!DOCTYPE html>
<html lang="zxx">
<head>
    <title>Alleviating A Medical Category Bootstrap responsive Web Template | Contact :: w3layouts</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="utf-8" />
    <meta name="keywords" content="Alleviating Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
	SmartPhone Compatible web template, free WebDesigns for Nokia, Samsung, LG, Sony Ericsson, Motorola web design" />
    <script>
        addEventListener("load", function () {
            setTimeout(hideURLbar, 0);
        }, false);

        function hideURLbar() {
            window.scrollTo(0, 1);
        }
    </script>
    <!-- Custom Theme files -->
    <link href="css/bootstrap.css" type="text/css" rel="stylesheet" media="all">
    <link href="css/style.css" type="text/css" rel="stylesheet" media="all">
    <!-- font-awesome icons -->
    <link href="css/fontawesome-all.min.css" rel="stylesheet">
    <!-- //Custom Theme files -->
	 <!-- online-fonts -->
	<link href="//fonts.googleapis.com/css?family=Lato:400,700" rel="stylesheet">
    <link href="//fonts.googleapis.com/css?family=Montserrat:200,300,400,500,600,700,800,900" rel="stylesheet"><!-- //online-fonts -->
    <style type="text/css">
<!--
.style2 {color: #2E6290; font-weight: bold; }
.style3 {	color: #FA8B37;
	font-weight: bold;
}
-->
    </style>
</head>
<body>
        <!-- header -->
        <header>
            <nav class="navbar navbar-expand-lg navbar-light bg-gradient-secondary">
                <h1>
                    <a class="navbar-brand text-white" href="index.html">
                       EHR Medical Data
                    </a>
                </h1>
                <button class="navbar-toggler ml-md-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ml-lg-auto text-center">
                    <li class="nav-item   mr-3 mt-lg-0 mt-3">
                            <a class="nav-link" href="doctor_home.jsp">Home
                                <span class="sr-only">(current)</span>
                            </a>
                      </li>
                        <li class="nav-item  mr-3 mt-lg-0 mt-3">
                            <a class="nav-link" href="admin_data_upload.jsp">Data Upload</a>
                        </li>
                        
                        <li class="nav-item mr-3 mt-lg-0 mt-3 active">
                            <a class="nav-link" href="doctor_user_details.jsp">User Details</a>
                        </li>
                        <li class="nav-item ">
                            <a class="nav-link" href="index.jsp">Logout</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>
 <!-- main image slider container -->
        <div class="inner-banner">
</div> 
    <!-- end of main image slider container -->
	 <!-- breadcrumbs -->
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a href="index.jsp">Home</a>
            </li>
            <li class="breadcrumb-item active" aria-current="page">Doctor</li>
        </ol>
    </nav>
    <!-- //breadcrumbs -->
    <!-- contact -->
    <section class="wthree-row w3-contact py-lg-5">
			<div class="container py-4">
            <div class="text-center wthree-title pb-sm-5 pb-3">
				<h3 class="w3l-sub">User Details   </h3>
				<p class="w3l-sub">&nbsp;</p>
			   
			    <table width="666" height="106" border="0" align="center">
                  <%
  ResultSet rs0=stmt3.executeQuery("select * from user_details");
		int s=0;	
                   while(rs0.next())
			{
                         if(s==0)
                         {
                            %>
                  <tr>
                    <td width="41"><h4><strong><span class="style1">Id</span></strong></h4></td>
                    <td width="166"><h4><strong><span class="style1">Name</span></strong></h4></td>
                    <td width="115"><h4><strong><span class="style1">Contact</span></strong></h4></td>
                    <td width="104"><h4><strong><span class="style1">Email</span></strong></h4></td>
                    <td width="107"><h4><strong><span class="style1">Address</span></strong></h4></td>
                    <td width="107"><h4><strong><span class="style1">Cdate</span></strong></h4></td>
                  </tr>
                  <% 
                         }
			  s++;

%>
                  <tr>
                    <td><span class="style7">
                      <% out.print(s);%>
                    </span></td>
                    <td><span class="style7">
                      <% out.print(rs0.getString("name"));%>
                    </span></td>
                    <td><span class="style7">
                      <% out.print(rs0.getString("contact"));%>
                    </span></td>
                    <td><span class="style7">
                      <% out.print(rs0.getString("email"));%>
                    </span></td>
                    <td><span class="style7">
                      <% out.print(rs0.getString("address"));%>
                    </span></td>
                    <td><span class="style7">
                      <% out.print(rs0.getString("cdate"));%>
                    </span></td>
                  </tr>
                  <%
		
		
		}
		%>
                </table>
            </div>
            <!-- contact details -->
            <div class="row contact-form py-lg-5">
                <!-- contact left grid --><!-- //contact left grid -->
                <!-- contact right grid -->
                <!--  //contact right grid -->
            </div>
            <!-- //contact details  -->
        </div>
    </section>
    <!-- //contact -->
    <!-- map -->
 
    <!--// map-->

<!-- footer -->
	<footer class="py-sm-5">
		<div class="container">
		  <div class="row py-5">
				<!-- footer grid1 --><!-- //footer grid1 -->
				<!-- footer grid2 --><!-- //footer grid2 -->
				<!-- footer grid3 --><!-- //footer grid3 -->
			  <!-- footer grid4  -->
			  <!-- //footer grid4 -->
            </div>
			<div class="cpy-right text-center  pt-3">
				
				<div class="copyrightbottom">
					<p class="text-secondary">ï¿½ All rights reserved | Design by
						<a href="#" class="text-white"> Admin.</a>
					</p>
				</div>
				<div class="copyrighttop">
					<ul>
						<li>
							<h4>Follow us on:</h4>
						</li>
						<li>
							<a class="facebook" href="#">
								<i class="fab fa-facebook-f"></i>
							</a>
						</li>
						<li>
							<a class="facebook" href="#">
								<i class="fab fa-twitter"></i>
							</a>
						</li>
						<li>
							<a class="facebook" href="#">
								<i class="fab fa-google-plus-g"></i>
							</a>
						</li>
						<li>
							<a class="facebook" href="#">
								<i class="fab fa-pinterest-p"></i>
							</a>
						</li>
					</ul>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
		<!-- //footer container -->
	</footer>
	<!-- //footer -->

	<!-- login  -->
 
    <!-- //login -->
	 <!--/Register-->
 
    <!--//Register-->

    <!-- //footer -->
    <!-- js -->
    <script src="js/jquery-2.2.3.min.js"></script>
    <!-- //js -->
    <!-- script for password match -->
    <script>
        window.onload = function () {
            document.getElementById("password1").onchange = validatePassword;
            document.getElementById("password2").onchange = validatePassword;
        }

        function validatePassword() {
            var pass2 = document.getElementById("password2").value;
            var pass1 = document.getElementById("password1").value;
            if (pass1 != pass2)
                document.getElementById("password2").setCustomValidity("Passwords Don't Match");
            else
                document.getElementById("password2").setCustomValidity('');
            //empty string means no validation error
        }
    </script>
    <!-- script for password match -->
    <!-- start-smooth-scrolling -->
    <script src="js/move-top.js"></script>
    <script src="js/easing.js"></script>
    <script>
        jQuery(document).ready(function ($) {
            $(".scroll").click(function (event) {
                event.preventDefault();

                $('html,body').animate({
                    scrollTop: $(this.hash).offset().top
                }, 1000);
            });
        });
    </script>
    <!-- //end-smooth-scrolling -->
    <!-- smooth-scrolling-of-move-up -->
    <script>
        $(document).ready(function () {
            /*
            var defaults = {
                containerID: 'toTop', // fading element id
                containerHoverID: 'toTopHover', // fading element hover id
                scrollSpeed: 1200,
                easingType: 'linear' 
            };
            */

            $().UItoTop({
                easingType: 'easeOutQuart'
            });

        });
    </script>
    <script src="js/SmoothScroll.min.js"></script>
    <!-- //smooth-scrolling-of-move-up -->
    <!-- Bootstrap core JavaScript
================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="js/bootstrap.js"></script>
</body>
</html>