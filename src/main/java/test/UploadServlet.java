package test;

import java.io.File;
import java.io.IOException;
import java.nio.charset.Charset;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/uploadd")
@MultipartConfig(fileSizeThreshold=1024*1024*2,	// 2MB
				 maxFileSize=1024*1024*10,		// 10MB
				 maxRequestSize=1024*1024*50)	// 50MB
public class UploadServlet extends HttpServlet {

	private static final String SAVE_DIR = "static/image/article";
	
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		RequestDispatcher rd = request.getRequestDispatcher("/views/test/upload.jsp");
		rd.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		// gets absolute path of the web application
		String appPath = request.getServletContext().getRealPath("");
		// constructs path of the directory to save uploaded file
		String savePath = appPath + File.separator + SAVE_DIR;

		// creates the save directory if it does not exists
		File fileSaveDir = new File(savePath);
		if (!fileSaveDir.exists()) {
			fileSaveDir.mkdir();
		}

			Part part = request.getPart("thumnail");
			String fileName = extractFileName(part);
			if(fileName!=null && !fileName.equals("")){
				
			
				// refines the fileName in case it is an absolute path
				fileName = new File(fileName).getName();
				if( checkFileName(fileName) ){ 
					fileName = generatedString().concat(fileName);
					part.write(savePath + File.separator + fileName);
				}
				
				File file = new File(savePath+"/anh tessttt ne.jpgyhjinydlbw"); 
			    if (!file.isDirectory()) { 
			      file.delete();
			    }
			    
			}
			else request.setAttribute("noFile", "No file updateeeeeeee");

		request.setAttribute("message", "Upload has been done successfully!" + "FILE NAME: " + fileName);
		getServletContext().getRequestDispatcher("/views/test/message.jsp").forward(request, response);
	}

	private boolean checkFileName(String fileName) {
		fileName = fileName.toLowerCase();
		String png  = "png";
		String jpg = "jpg";
		String jpeg = "jpeg";
		
		int index = fileName.lastIndexOf('.');
		boolean check1 =false;
		boolean check2 =false;
		boolean check3 = false;
		
		if(index>0){
			check1 = png.equalsIgnoreCase(fileName.substring(index+1));
			check2 = jpg.equalsIgnoreCase(fileName.substring(index+1));
			check3 = jpeg.equalsIgnoreCase(fileName.substring(index+1));
		} else return false;
		
		if(check1 || check2 ||check3) 
			return true;
		return false;
	}

	private String extractFileName(Part part) {
		String contentDisp = part.getHeader("content-disposition");
		String[] items = contentDisp.split(";");
		for (String s : items) {
			if (s.trim().startsWith("filename")) {
				return (s.substring(s.indexOf("=") + 2, s.length()-1));
			}
		}
		return "";
	}
	
	public String generatedString(){
		int leftLimit = 97; // letter 'a'
	    int rightLimit = 122; // letter 'z'
	    int targetStringLength = 10;
	    Random random = new Random();

	    String generatedString = random.ints(leftLimit, rightLimit + 1)
	      .limit(targetStringLength)
	      .collect(StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append)
	      .toString();
	    
	    return generatedString;
	}
}