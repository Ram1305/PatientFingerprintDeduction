 <%@ include file="include/dbconnect.jsp" %> 
 <%@page import="java.util.Random"%> 
<%@page import="java.sql.ResultSet"%>

<%

try
{
String a=request.getParameter("btn");
if(a.equals("Submit"))
{
 String name=request.getParameter("uname");
String pass=request.getParameter("pass");
  // out.print(name+""+pass);
    String qry="select * from user_details where username='"+name+"' && password='"+pass+"' ";
	//	out.print(qry);
		ResultSet rs=stmt.executeQuery(qry);
			if(rs.next())
			{
                            String mail=rs.getString("email");
		session.setAttribute("uname",name);
		session.setAttribute("email",mail);
           


			//response.sendRedirect("user_home.jsp");
			response.sendRedirect("user_1.jsp");
			}
			else
			{
%>
						<script language="javascript">
		alert("user name/ pass  Wrong!");
                window.location="user.jsp";
		</script>
						
						<%	

                        }
		rs.close();
    
    
}


}catch (Exception e)
{



//out.print(e);

}




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
                            <a class="nav-link" href="index.jsp">Home
                                <span class="sr-only">(current)</span>
                            </a>
                      </li>
                        <li class="nav-item  mr-3 mt-lg-0 mt-3">
                            <a class="nav-link" href="admin.jsp">Admin</a>
                        </li>
                        
                        <li class="nav-item active mr-3 mt-lg-0 mt-3">
                            <a class="nav-link" href="user.jsp">User</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="doctor.jsp">Doctor</a>
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
            <li class="breadcrumb-item active" aria-current="page">User</li>
        </ol>
    </nav>
    <!-- //breadcrumbs -->
    <!-- contact -->
    <section class="wthree-row w3-contact py-lg-5">
			<div class="container py-4">
            <div class="text-center wthree-title pb-sm-5 pb-3">
				<h3 class="w3l-sub">User Login </h3>
				<p class="w3l-sub">&nbsp;</p>
			  <form name="form1" method="post" action="">
			    <table width="37%" height="115" border="0" align="center">
                    <tr>
                      <td width="47%" class="tdsh"><div align="center" class="style2">
                          <div align="right">User name </div>
                      </div></td>
                      <td width="6%" class="tdsh"><div align="center" class="style2">:</div></td>
                      <td width="47%" class="tdsh"><label>
                        <input name="uname" type="text" id="uname">
                      </label></td>
                    </tr>
                    <tr>
                      <td class="tdsh"><div align="center" class="style2">
                          <div align="right">Password</div>
                      </div></td>
                      <td class="tdsh"><div align="center" class="style2">:</div></td>
                      <td class="tdsh"><label>
                        <input name="pass" type="password" id="pass">
                      </label></td>
                    </tr>
                    <tr>
                      <td class="tdsh">&nbsp;</td>
                      <td colspan="2" class="tdsh"><label>
                        <input name="btn" type="submit" class="btnclr" id="btn" value="Submit">
                        <span class="style3"> </span></label></td>
                    </tr>
                    <tr>
                      <td class="tdsh">&nbsp;</td>
                      <td colspan="2" class="tdsh"><a href="user_register.jsp">New User Registe Here... </a></td>
                    </tr>
                  </table>
				</form>
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
					<p class="text-secondary">� All rights reserved | Design by
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
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Login</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="#" method="post">
                        <div class="form-group">
                            <label for="recipient-name" class="col-form-label">Username</label>
                            <input type="text" class="form-control" placeholder=" " name="Name" id="recipient-name" required="">
                        </div>
                        <div class="form-group">
                            <label for="password" class="col-form-label">Password</label>
                            <input type="password" class="form-control" placeholder=" " name="Password" id="password" required="">
                        </div>
                        <div class="right-w3l">
                            <input type="submit" class="form-control" value="Login">
                        </div>
                        <div class="row sub-w3l my-3">
                            <div class="col sub-agile">
                                <input type="checkbox" id="brand1" value="">
                                <label for="brand1" class="text-secondary">
                                    <span></span>Remember me?</label>
                            </div>
                            <div class="col forgot-w3l text-right">
                                <a href="#" class="text-secondary">Forgot Password?</a>
                            </div>
                        </div>
                        <p class="text-center dont-do">Don't have an account?
                            <a href="#" data-toggle="modal" data-target="#exampleModalCenter2" class="text-dark font-weight-bold">
                                Register Now</a>
								
                        </p>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- //login -->
	 <!--/Register-->
    <div class="modal fade" id="exampleModalCenter2" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="login px-4 mx-auto mw-100">
                        <h5 class="modal-title text-center text-dark mb-4">REGISTER NOW</h5>
                        <form action="#" method="post">
                            <div class="form-group">
                                <label class="col-form-label">First name</label>

                                <input type="text" class="form-control" id="validationDefault01" placeholder="" required="">
                            </div>
                            <div class="form-group">
                                <label class="col-form-label">Last name</label>
                                <input type="text" class="form-control" id="validationDefault02" placeholder="" required="">
                            </div>

                            <div class="form-group">
                                <label class="mb-2 col-form-label">Password</label>
                                <input type="password" class="form-control" id="password1" placeholder="" required="">
                            </div>
                            <div class="form-group">
                                <label class="col-form-label">Confirm Password</label>
                                <input type="password" class="form-control" id="password2" placeholder="" required="">
                            </div>
							<div class="reg-w3l">
								<button type="submit" class="form-control submit mb-4">Register</button>
                           </div>
						   <p class="text-center pb-4">
                                <a href="#" class="text-secondary">By clicking Register, I agree to your terms</a>
                          </p>
                        </form>

                    </div>
                </div>

            </div>
        </div>
    </div>
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