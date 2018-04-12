/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CommonUtils;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Properties;

import javax.servlet.ServletContext;

import com.aurospaces.neighbourhood.bean.OTP;
public class Sms {
	public static boolean sendMessage(ServletContext objContext,OTP otp){
		boolean bSentSms = false;
		String postData="";
		String retval = "";
		String Username ="";
		String Password = "";
		//String MobileNo = "917411184869";
		String MobileNo = otp.getMobileNumber();
		//String Message = "Test message from Dova Soft Dova Soft Dova Soft123456 ";
		String Message = "Hi"+otp.getName()+","+otp.getOtp()+"OTP for Hotel Manorama.";
		String SenderID = "";
		InputStream input = null;
		String mailContent = null;
		String smsUrl = null;
		String smsOtpText = null;
		String requestUrl = null;
		try{
			Properties prop = new Properties();
			String propertiespath = objContext.getRealPath("Resources"+ File.separator + "DataBase.properties");
			input = new FileInputStream(propertiespath);
			// load a properties file
			prop.load(input);
			Username =prop.getProperty("smsUserName");
			Password =prop.getProperty("smsPassword");
			SenderID =prop.getProperty("smsSenderID");
			smsUrl =prop.getProperty("smsUrl");
			
			 System.out.println("Username = " + Username);
			System.out.println("Password = " + Password);
			 System.out.println("SenderID = " + SenderID);
			 System.out.println("smsUrl = " + smsUrl);
			 
			 requestUrl  = "http://182.18.160.225/index.php/api/bulk-sms?username="+URLEncoder.encode(Username, "UTF-8")+"&password="+ URLEncoder.encode(Password, "UTF-8")+"&from="+SenderID+"&to="+URLEncoder.encode(MobileNo, "UTF-8")+"&message="+URLEncoder.encode(Message, "UTF-8")+"&sms_type=2";
			 System.out.println("requestUrl = " + requestUrl);
		        URL url = new URL(requestUrl);
		        HttpURLConnection uc = (HttpURLConnection)url.openConnection();
		        String response = uc.getResponseMessage();
		        System.out.println("SMS response:"+response);
		        uc.disconnect();
		        if(response.equals("OK")){
		        	bSentSms = true;
		        }
		        		
		        System.out.println("SMS bSentSms:"+bSentSms);
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("Error While sending............."+e);
		}
		return bSentSms;
	}
    
}
