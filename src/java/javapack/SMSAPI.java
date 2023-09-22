package javapack;

import java.net.*;
import java.io.*;

public class SMSAPI {

    public static String url = "";
    public static String charset = "UTF-8";

    private static String buildRequestString(String targetPhoneNo, String message) throws UnsupportedEncodingException {
        String query = "http://bulksms.mysmsmantra.com:8080/WebSMS/SMSAPI.jsp?username=fantazy&password=1483727597&sendername=fantaz&mobileno=91"+targetPhoneNo+",&message="+URLEncoder.encode(message);
        return query;
    }

    public static String sendMessage(String reciever, String message) throws Exception {
        //To establish the connection and perform the post request
        URLConnection connection = new URL(buildRequestString(reciever, message)).openConnection();
        connection.setRequestProperty("Accept-Charset", charset);

        //This automatically fires the request and we can use it to determine the response status
        InputStream response = connection.getInputStream();
        BufferedReader br = new BufferedReader(new InputStreamReader(response));
        return br.readLine();
    }

    public static void main(String[] args) throws Exception {

     /// sendMessage("9965139536","main");
        
    }
}
