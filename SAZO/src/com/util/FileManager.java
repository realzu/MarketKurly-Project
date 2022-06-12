package com.util;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

public class FileManager {
	//오리지널파일네임과 세이브파일네임명을 둘다 필요로함. 
	//다운로드는 리스폰스가 필수 서버가 클라이언트에게 내려주는것.
	//파일 다운로드.
	public static boolean doFileDownload(HttpServletResponse response,		
			String saveFileName, String originalFileName, String path) {	
										
		try {
			
			String filePath = path + File.separator + saveFileName; //파일경로는 위에서 받은 경로 + 파일세퍼레이터 + 저장된파일이름.
			
			if(originalFileName==null||originalFileName.equals("")) {
				originalFileName = saveFileName;
			}
			
			//파일을 다운받아 클라이언트 컴에 저장할떄 한글이름 깨짐 방지.
			originalFileName = 
					new String(originalFileName.getBytes("euc-kr"),"ISO-8859-1");
			
			File f = new File(filePath);
			
			if(!f.exists()) {
				return false;   //여길 통과하면 파일이 있다는것.
			}
			
			response.setContentType("application/octet-stream"); //파일의 이름중 abc.txt에서 .은 옥텟이라고함
							//메모장,워드,한글등등 어플리케이션에서 만든 옥텟으로구분하는 파일이다. 라는뜻
			response.setHeader("Content-disposition", "attachment;fileName=" + originalFileName);
							//내려보내는 파일의 형식은 위와같고 내려보내는건 이파일이다 라는뜻
			
			BufferedInputStream bis = 
					new BufferedInputStream(new FileInputStream(f)); //파일을 bis에 넣고 클라이언트에게 줘야함
			
			OutputStream out = response.getOutputStream(); //아웃풋스트림으로 내보냄.
			
			int data;
			byte[] bytes = new byte[4096];
			
			while((data=bis.read(bytes, 0, 4096))!=-1) {
				out.write(bytes,0,data);
			} //data는 bis의 bytes를 0부터 4096까지 다읽어라 내보낸다 
				//out.write bytes를 0부터 data가 있을때 까지
			
			out.flush();
			out.close();
			bis.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
			return false;
		}
		
		return true;
	}
				
	
	
	
	
	
	
	
	
	//파일 삭제.
	public static void doFileDelete(String fileName, String path) {
		
		try {
			
			String filePath = path + File.separator + fileName;
			
			File f = new File(filePath);
			
			if(f.exists()) // 파일의 이름과 경로를 받아서 f 가 있으면
				f.delete(); //물리적인 파일을 삭제하는 방법 //파일삭제해라~
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		
	}

}
