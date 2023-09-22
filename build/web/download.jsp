<%@page import="javapack.Crypt"%>
<%@page import="javapack.Data_split"%>

<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@ page  import="java.io.FileInputStream" %>
<%@ page  import="java.io.BufferedInputStream"  %>
<%@ page  import="java.io.File"  %>
<%@ page import="java.io.IOException" %>
<%

BufferedInputStream buf=null;
   ServletOutputStream myOut=null;
try{
//
//   
   String filename=request.getParameter("file1");
////////data retrive
//    File p1 = new File(getServletContext().getRealPath("/") +"1/");
// File p2 = new File(getServletContext().getRealPath("/") +"2/");
// File output_f = new File(getServletContext().getRealPath("/") +"encrypt/"+filename);
// Data_split.joint(""+p1,""+p2,""+output_f, filename);
// ////////decrypt
// String pri_key=(String)session.getAttribute("pri_key");
// File in = new File(getServletContext().getRealPath("/") +"encrypt/"+filename);
//File out1 = new File(getServletContext().getRealPath("/") +"test/"+filename);
////out.println(in);
////out.println(out1);
// String InFileName=""+in;
// String OutFileName=""+out1;
// String prvKey=pri_key;
// Crypt.DecryptFile(InFileName, OutFileName, prvKey);

////////////////



myOut = response.getOutputStream();




     File myfile = new File(getServletContext().getRealPath("/") +"upload/"+filename);
     
     //set response headers
      response.setContentType("application/octet-stream");
     
     response.addHeader("Content-Disposition","attachment; filename="+filename);


     response.setContentLength((int) myfile.length());
     
     FileInputStream input = new FileInputStream(myfile);
     buf = new BufferedInputStream(input);
     int readBytes = 0;

     //read from the file; write to the ServletOutputStream
     while((readBytes = buf.read()) != -1)
       myOut.write(readBytes);

} catch (IOException ioe){
     
        throw new ServletException(ioe.getMessage( ));
         
     } finally {
         
     //close the input/output streams
         if (myOut != null)
             myOut.close( );
          if (buf != null)
          buf.close( );
         
     }

   
   
%>