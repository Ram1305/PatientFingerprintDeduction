/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package javapack;
 
import java.io.*;
import java.math.BigInteger;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.net.UnknownHostException;
import java.security.KeyPairGenerator;
import java.security.SecureRandom;
import java.security.Security;
import java.security.spec.ECFieldFp;
import java.security.spec.ECParameterSpec;
import java.security.spec.ECPoint;
import java.security.spec.EllipticCurve;
import javax.crypto.*;
import javax.crypto.spec.*;
import java.util.*;

public class Crypt {

    private static String filename;
    private static String password = "super_secret";

    ;
    private static FileInputStream inFile;
    private static FileOutputStream outFile;

    public static void EncryptFile(String InFileName, String OutFileName, String pubKey) throws Exception {

        filename = InFileName;

        inFile = new FileInputStream(filename);
        outFile = new FileOutputStream(OutFileName);

        PBEKeySpec keySpec = new PBEKeySpec(password.toCharArray());
        SecretKeyFactory keyFactory
                = SecretKeyFactory.getInstance("PBEWithMD5AndDES");
        SecretKey passwordKey = keyFactory.generateSecret(keySpec);

        byte[] salt = new byte[8];
        Random rnd = new Random();
        rnd.nextBytes(salt);
        int iterations = 100;

        PBEParameterSpec parameterSpec = new PBEParameterSpec(salt, iterations);

        Cipher cipher = Cipher.getInstance("PBEWithMD5AndDES");
        cipher.init(Cipher.ENCRYPT_MODE, passwordKey, parameterSpec);

        outFile.write(salt);

        byte[] input = new byte[64];
        int bytesRead;
        while ((bytesRead = inFile.read(input)) != -1) {
            byte[] output = cipher.update(input, 0, bytesRead);
            if (output != null) {
                outFile.write(output);
            }
        }

        byte[] output = cipher.doFinal();
        if (output != null) {
            outFile.write(output);
        }

        inFile.close();
        outFile.flush();
        outFile.close();

    } 
 public static String getotp(int keyLength) 
    {
        String AB = "0123456789";
        Random rnd = new Random();
        StringBuilder sb = new StringBuilder(keyLength);
        for (int i = 0; i < keyLength; i++) {
            sb.append(AB.charAt(rnd.nextInt(AB.length())));
        }
        return ("" + sb.toString() + "");
    }
    static public void DecryptFile(String InFileName, String OutFileName, String prvKey) throws Exception {

        filename = InFileName;

        inFile = new FileInputStream(filename);

        outFile = new FileOutputStream(OutFileName);

        PBEKeySpec keySpec = new PBEKeySpec(password.toCharArray());
        SecretKeyFactory keyFactory
                = SecretKeyFactory.getInstance("PBEWithMD5AndDES");
        SecretKey passwordKey = keyFactory.generateSecret(keySpec);

        byte[] salt = new byte[8];
        inFile.read(salt);
        int iterations = 100;

        PBEParameterSpec parameterSpec = new PBEParameterSpec(salt, iterations);

        Cipher cipher = Cipher.getInstance("PBEWithMD5AndDES");
        cipher.init(Cipher.DECRYPT_MODE, passwordKey, parameterSpec);

        byte[] input = new byte[64];
        int bytesRead;
        while ((bytesRead = inFile.read(input)) != -1) {
            byte[] output = cipher.update(input, 0, bytesRead);
            if (output != null) {
                outFile.write(output);
            }
        }

        byte[] output = cipher.doFinal();
        if (output != null) {
            outFile.write(output);
        }

        inFile.close();
        outFile.flush();
        outFile.close();
    }

   static public String  generateKeypair() {
        String certkeyarr="";
        try {
            Security.addProvider(new org.bouncycastle.jce.provider.BouncyCastleProvider());
            KeyPairGenerator keyGen = KeyPairGenerator.getInstance("ECDH", "BC");
            EllipticCurve curve = new EllipticCurve(new ECFieldFp(new BigInteger(
                    "fffffffffffffffffffffffffffffffeffffffffffffffff", 16)), new BigInteger(
                            "fffffffffffffffffffffffffffffffefffffffffffffffc", 16), new BigInteger(
                            "fffffffffffffffffffffffffffffffefffffffffffffffc", 16));
            ECParameterSpec ecSpec = new ECParameterSpec(curve, new ECPoint(new BigInteger(
                    "fffffffffffffffffffffffffffffffefffffffffffffffc", 16), new BigInteger(
                            "fffffffffffffffffffffffffffffffefffffffffffffffc", 16)), new BigInteger(
                            "fffffffffffffffffffffffffffffffefffffffffffffffc", 16), 1);
            keyGen.initialize(ecSpec, new SecureRandom());
            certkeyarr = keyGen.genKeyPair().getPrivate().toString();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return certkeyarr;
    }

    public static String getPrivateKey(int keyLength) 
    {
        String AB = "abcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        Random rnd = new Random();
        StringBuilder sb = new StringBuilder(keyLength);
        for (int i = 0; i < keyLength; i++) {
            sb.append(AB.charAt(rnd.nextInt(AB.length())));
        }
        return ("" + sb.toString() + "");
    }

    public static String getPublicKey(int keyLength) {
        String AB = "abcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        Random rnd = new Random();
        StringBuilder sb = new StringBuilder(keyLength);
        for (int i = 0; i < keyLength; i++) {
            sb.append(AB.charAt(rnd.nextInt(AB.length())));
        }

        return ("" + sb.toString() + "");
    }

    /*public static void main(String args[]) throws Exception
     {
     String key=RSACrypt.getPublicKey(10);
     RSACrypt.EncryptFile("D:\\NEDI.java", "D:\\NEDI1.java",key);
     RSACrypt.DecryptFile("D:\\NEDI1.java", "D:\\NEDI2.java",key);
     }*/
    
    
   public static String  system_ip()
    {
        String tmp="";
        try {
            InetAddress ipAddr = InetAddress.getLocalHost();
           // System.out.println(ipAddr.getHostAddress());
            tmp=ipAddr.getHostAddress();
        } catch (UnknownHostException ex) {
            ex.printStackTrace();
        }
        return tmp;
     } 
    public static String system_mac()
    {
        String tmp_mac="";
        InetAddress ip;
	try {

		ip = InetAddress.getLocalHost();
		//System.out.println("Current IP address : " + ip.getHostAddress());

		NetworkInterface network = NetworkInterface.getByInetAddress(ip);

		byte[] mac = network.getHardwareAddress();

		//System.out.print("Current MAC address : ");

		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < mac.length; i++) {
			sb.append(String.format("%02X%s", mac[i], (i < mac.length - 1) ? "-" : ""));
		}
                tmp_mac=sb.toString();
		//System.out.println(sb.toString());

	} catch (UnknownHostException e) {

		e.printStackTrace();

	} catch (SocketException e){

		e.printStackTrace();

	}
        
        
        return tmp_mac;
        
    }
}
