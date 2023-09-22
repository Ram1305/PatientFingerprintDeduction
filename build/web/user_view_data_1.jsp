 <%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileReader"%>
<%@page import="javapack.Crypt"%>
<%@page import="javapack.Data_split"%>
<%@page import="java.io.File"%>
<%@ include file="include/dbconnect.jsp" %> 
 <%@page import="java.util.Random"%> 
<%@page import="java.sql.ResultSet"%>

<%

String id=request.getParameter("id");
String file="";
int sts=0;
ResultSet rs1=stmt.executeQuery("select * from user_files where id='"+id+"'");
if(rs1.next())
{
    file=(rs1.getString("fname")); 
    
}
   String filename=file;
 File p1 = new File(getServletContext().getRealPath("/"));

 File output_f = new File(getServletContext().getRealPath("/") +"decrypt/");
 Data_split.joint(""+p1,""+output_f, filename);

 ///mathc data
  File fs3 = new File(config.getServletContext().getRealPath("/") +"encrypt/",filename);
      FileReader fr3 = new FileReader(fs3);
      BufferedReader br3 = new BufferedReader(fr3);
      String line3;
      String text3="";
      while((line3 = br3.readLine()) != null)
      {
          text3=line3;
      }

 
  
 ////
   File fs2 = new File(config.getServletContext().getRealPath("/") +"decrypt/",filename);
      FileReader fr2 = new FileReader(fs2);
      BufferedReader br2 = new BufferedReader(fr2);
      String line2;
      String text2="";
      while((line2 = br2.readLine()) != null)
      {
          text2=line2;
      }
 
 text3=text3.trim();
 text2=text2.trim();
 int b=(text3.length());
 //out.print("aaa");
 int c=(text2.length());
 //if(text3.equals(text2))
 
     String email=(String)session.getAttribute("email");
String key="";
ResultSet rs0=stmt3.executeQuery("select * from user_files where id='"+id+"'");
while(rs0.next())
{
    key=rs0.getString("pri_key");
}
session.setAttribute("pk", key);
 session.setAttribute("file", filename);
 javapack.Mail.SendMail(email, "Secret Key", key, "");
   response.sendRedirect("user_view_data_2.jsp");
 
 
 
 
 ////////decrypt
// String pri_key=(String)session.getAttribute("pri_key");
// File in = new File(getServletContext().getRealPath("/") +"decrypt/"+filename);
//File out1 = new File(getServletContext().getRealPath("/") +"test/"+filename);
//out.println(in);
//out.println(out1);
// String InFileName=""+in;
// String OutFileName=""+out1;
// String prvKey=pri_key;
// Crypt.DecryptFile(InFileName, OutFileName, prvKey);








%>