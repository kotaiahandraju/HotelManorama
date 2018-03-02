package CommonUtils;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.springframework.web.multipart.MultipartFile;

public class FileUploadUtil {

	public static String ImageUpload(MultipartFile file, HttpServletRequest request) throws IOException {
		String keyName = null;
		FileUploadUtil obj = new FileUploadUtil();
		JSONObject reponse = new JSONObject();
		int i = 0;
		String imgUrl = null;
			keyName = CommonUtils.getAutoGenId();
			byte[] bytes = file.getBytes();
//			// Creating the directory to store file
//			//String rootPath = System.getProperty("catalina.home");
//			//String rootPath = request.getSession().getServletContext().getRealPath("/");
//			System.out.println("--rootPath----"+rootPath);
//			File dir = new File(rootPath + File.separator + "webapps"+ File.separator + "img");
			
			
		        String rootPath = request.getSession().getServletContext().getRealPath("/");
		        File dir = new File(rootPath + File.separator +"img"+ File.separator+"manoramaImages");
		        System.out.println("--dir----"+dir);
		        if (!dir.exists()) {
		            dir.mkdirs();
		        }
		     // Create the file on server
		        File serverFile = new File(dir.getAbsolutePath() + File.separator + keyName+".jpg");
			BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
			stream.write(bytes);
			stream.close();
			imgUrl = "img/manoramaImages/"+keyName+".jpg";
			// System.out.println(file.getName());

			// MultipartFile mf = (MultipartFile)request.getParameter("");

			//imgUrl = obj.uploadfile(serverFile, true, keyName);
				reponse.put("old", imgUrl);
			
		return  imgUrl;

	}
}
