package CommonUtils;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.UUID;

import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;


public class CommonUtils {
	public static String getAutoGenId(){
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
	
	
	public static String getDate() {

		SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MMM-yyyy");
		Calendar cal = Calendar.getInstance();
		 String regDate = dateFormat.format(cal.getTime());
		return regDate;
	}
	public static String generatePIN() 
	{   
	    int x = (int)(Math.random() * 9);
	    x = x + 1;
	    String randomPIN = (x + "") + ( ((int)(Math.random()*1000)) + "" );
	    return randomPIN;
	}
	public static Timestamp getIndainDate(String startDate) throws ParseException {

		 System.out.println("date........................."+startDate);
		 java.text.DateFormat format1 = new java.text.SimpleDateFormat("dd-MMM-yyyy hh:mm");
		 java.util.Date date = format1.parse(startDate);
		 java.sql.Timestamp timestamp = new java.sql.Timestamp(date.getTime());
		 System.out.println(timestamp);
		return timestamp;
	}
}
