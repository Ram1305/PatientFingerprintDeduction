 
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
                        <li class="nav-item  mr-3 mt-lg-0 mt-3 active">
                            <a class="nav-link" href="admin_data_upload.jsp">Data Upload</a>
                        </li>
                        
                        <li class="nav-item mr-3 mt-lg-0 mt-3">
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
				<h3 class="w3l-sub">Data Upload  </h3>
				<p class="w3l-sub">&nbsp;</p>
			  <form action="" method="post" enctype="multipart/form-data" name="form1">
			    <table width="510" height="179" border="0" align="center" >
                  <tr>
                    <td>Username</td>
                    <td><div align="left">
                      <label>
                        <input name="uname" type="text" id="uname" required="">
                      </label>
                    </div></td>
                  </tr>
                  <tr>
                    <td>Public key </td>
                    <td><div align="left">
                      <%out.print(pub_key);%>
                    </div></td>
                  </tr>
                  <tr>
                    <td>Private key </td>
                    <td><div align="left">
                      <%out.print(pri_key);%>
                    </div></td>
                  </tr>
                  <tr>
                    <td width="215">Select Data</td>
                    <td width="231"><label>
                      <div align="left">
                        <input type="file" name="file">
                        </div>
                    </label></td>
                  </tr>
                  <tr>
                    <td>&nbsp;</td>
                    <td><div align="left">
                      <label>
                        <input type="submit" name="Submit" value="Submit">
                        </label>
                    </div></td>
                  </tr>
                </table>
			       
<%
String dest_p=pri_key;
String rdate="";

java.util.Calendar calendar = java.util.Calendar.getInstance();

             String day=String.valueOf(calendar.get(java.util.Calendar.DATE));
             String month=String.valueOf(calendar.get(java.util.Calendar.MONTH)+1);
             String year=String.valueOf(calendar.get(java.util.Calendar.YEAR));
			 
			  rdate=day+"-"+month+"-"+year; 
String upfile_name="";
String txt="";
try
{
  
            String ImagePath = "";
            boolean isMultipart = FileUpload.isMultipartContent(request);

           
            if (!isMultipart) {
                request.getRequestDispatcher("admin_data_upload.jsp").forward(request, response);
                return;
            }

           
            DiskFileUpload upload = new DiskFileUpload();

            List items = upload.parseRequest(request);

        
           Iterator itr = items.iterator();

            while (itr.hasNext()) {
                FileItem item = (FileItem) itr.next();
                
  

                if (item.isFormField()) {

                 
                    String fieldName = item.getFieldName();


                    if (fieldName.equals("uname")) {
                        txt = item.getString();
                    }
                }
                else
                {

                  
                   File f = new File(config.getServletContext().getRealPath("/") +"upload/");
                 File split1 = new File(getServletContext().getRealPath("/") +"1");
                   File split02 = new File(getServletContext().getRealPath("/"));
                   File split2 = new File(getServletContext().getRealPath("/") +"2");
                   File split21 = new File(getServletContext().getRealPath("/") +"3");
                   File split22 = new File(getServletContext().getRealPath("/") +"4");
                   File split23 = new File(getServletContext().getRealPath("/") +"5");
                   File split3 = new File(getServletContext().getRealPath("/") +"encrypt");
                    if (f.exists() == false) {
                        f.mkdir();
                    }
                     if (split1.exists() == false) {
                        split1.mkdir();
                    }
                     if (split2.exists() == false) {
                        split2.mkdir();
                    }
                     
                     if (split21.exists() == false) {
                        split21.mkdir();
                    } if (split22.exists() == false) {
                        split22.mkdir();
                    } if (split23.exists() == false) {
                        split23.mkdir();
                    }  
                     
                     
                     
                     
                     
                     
                     
                      if (split3.exists() == false) {
                        split3.mkdir();
                    }
                    File fullFile = new File(item.getName());
                 
                    upfile_name=""+fullFile;
			File  fileType=new File(item.getContentType());
                  	 
			double filesize=item.getSize();
                        double fs1=filesize/(1024*1024);


                   File savedFile = new File(getServletContext().getRealPath("/") +"upload/", fullFile.getName());
                  
                   File savedFile1 = new File(getServletContext().getRealPath("/") +"encrypt/", fullFile.getName());

                    item.write(savedFile);
                    
                    
                    String df=""+savedFile;
                    String df1=""+savedFile1;
                    session.setAttribute("file", df);
                   upfile_name=""+fullFile;
			   fileType=new File(item.getContentType());
                  String	ftype=""+fileType;
			  filesize=item.getSize();

 Crypt.EncryptFile(df, df1, dest_p);
              double s_size= Data_split.chunk(df1, ""+split1,""+split02,upfile_name);
                   ResultSet ns=stmt.executeQuery("select max(id) as maxid from user_files");
                    ns.next();
                    int id1=ns.getInt("maxid");
                    int id2=id1+1;
                    String qq="insert into user_files  values("+id2+",'"+dname+"','"+txt+"','"+filesize+"','"+upfile_name+"','"+rdate+"','-','"+s_size+"','"+pri_key+"','0','0','0')";
                    stmt.executeUpdate(qq);
         
 
                 %>
						<script language="javascript">
		alert("Upload Successfully");
                window.location="doctor_home.jsp";
		</script>
						
						<%

                
                }
            } 
			                  
     
}
            catch(Exception e)
                    {
                    // out.print(e);
                    }

%> 
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