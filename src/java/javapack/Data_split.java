 

package javapack;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Data_split
{
    public static String test(String f_path,String odd,String even,String fname)
    {
        try {
            BufferedReader reader = null;
            PrintWriter writer = null;
            String file = f_path;
            reader = new BufferedReader(new FileReader(file));
             String line;    
             line = reader.readLine();
             
            for (int i = 1; line != null; i++) {
                writer = new PrintWriter(new FileWriter(odd+"\\"+ i + ".txt"));
              int numLinesPerChunk = 3;
               for (int j = 0; j < numLinesPerChunk && line != null; j++) {
                    writer.println(line);
                   line = reader.readLine();
              }
               writer.flush();
            }
        } catch (FileNotFoundException ex) {
            Logger.getLogger(Data_split.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(Data_split.class.getName()).log(Level.SEVERE, null, ex);
        }
      return "success";  
        
   }
    public static void main1(String args[])
    {
      String text="";
      String in="D:/test.txt";
      String out="D:/";
        
        try {
            BufferedReader reader = new BufferedReader(new FileReader(in));
            StringBuilder sb = new StringBuilder();
            String line;

            while((line = reader.readLine())!= null){
                sb.append(line+"\n");
                           System.out.print(line);
 
            }
          text=""+sb;
            int length=sb.length();
            length=length-1;
          
            int s_length=length/5;
         int a=0;
/////////////// sub strng
           for (int i = 0,j=s_length; i < text.length(); i=i+s_length,j=j+s_length) 
                {
		a++;
  String substr=text.substring(i,j);
  /////sustr write
 
            String r22=substr;
            String strPath = out+""+a+".txt";
            File strFile = new File(strPath);
            boolean fileCreated = strFile.createNewFile();
            Writer objWriter = new BufferedWriter(new FileWriter(strFile));
            objWriter.write(r22);
            objWriter.flush();
            objWriter.close();
         

                }
           
            
        } catch (Exception ex) {
        }

        
        
    }
    public static double chunk(String in1,String out1,String out2,String f_name)
    {
           String text="";
      String in=in1;
      String out=out1;
       int length=0;
       double dsl=0;
       
//      String in="D:/test.txt";
//      String out="D:/";
        
        try {
            BufferedReader reader = new BufferedReader(new FileReader(in));
            StringBuilder sb = new StringBuilder();
            String line;

            while((line = reader.readLine())!= null){
                sb.append(line+"\n");
                          // System.out.print(line);
 
            }
          text=""+sb;
             length=sb.length();
        dsl=sb.length();

            length=length-1;
          
            int s_length=length/5;
         int a=0;
/////////////// sub strng
           for (int i = 0,j=s_length; i < text.length(); i=i+s_length,j=j+s_length) 
                {
		a++;
  
  /////sustr write
 if((a==5))
 {
     String substr=text.substring(i,length);
     String r22=substr;
            String strPath = out2+"\\"+a+"\\"+a+"_"+f_name;
            File strFile = new File(strPath);
            boolean fileCreated = strFile.createNewFile();
            Writer objWriter = new BufferedWriter(new FileWriter(strFile));
            objWriter.write(r22);
            objWriter.flush();
            objWriter.close(); 
            a++;
 }
 else
 {
     String substr=text.substring(i,j);
     String r22=substr;
            String strPath = out2+"\\"+a+"\\"+a+"_"+f_name;
            File strFile = new File(strPath);
            boolean fileCreated = strFile.createNewFile();
            Writer objWriter = new BufferedWriter(new FileWriter(strFile));
            objWriter.write(r22);
            objWriter.flush();
            objWriter.close();   
 }
            
         

                }
           
            
        } catch (Exception ex) {
        }
return dsl/5;
    }
    public static void joint(String in1,String out,String f_name)
    { 
          try
       {
        String text="";
   
       int a=0;
    for (int i = 1; i <=5; i++) 
     {      
a++;
if(a==0)
{
     String f_path = in1+"\\"+a+"\\"+a+"_"+f_name;
 //String f_path=""+in1+"\\"+i+"_"+f_name;
 BufferedReader reader = new BufferedReader(new FileReader(f_path));
            StringBuilder sb = new StringBuilder();
            String line;
            while((line = reader.readLine())!= null)
            {
                sb.append(line);
            }
            text=text+""+sb; 
}
else
{
    
  String f_path= in1+"\\"+a+"\\"+a+"_"+f_name;
  BufferedReader reader = new BufferedReader(new FileReader(f_path));
            StringBuilder sb = new StringBuilder();
            String line;
            while((line = reader.readLine())!= null){
                sb.append(line);
            }
          text=text+""+sb.toString().trim();     
}
 }
     System.out.print(text);

    //////////////////write
    String r22=text.trim();
            String strPath = out+"\\"+f_name;
            File strFile = new File(strPath);
            boolean fileCreated = strFile.createNewFile();
            Writer objWriter = new BufferedWriter(new FileWriter(strFile));
            objWriter.write(r22);
            objWriter.flush();
            objWriter.close();  
       }catch(Exception e)      
       {
           System.out.println(e);
       }
          
    }
    public static void main(String args[])
    {
        //joint("D:\\user\\input1","D:\\user\\input","D:\\user\\output","arun.txt");
    }
} 