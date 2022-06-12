package com.util;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

public class FileManager {
	//�����������ϳ��Ӱ� ���̺����ϳ��Ӹ��� �Ѵ� �ʿ����. 
	//�ٿ�ε�� ���������� �ʼ� ������ Ŭ���̾�Ʈ���� �����ִ°�.
	//���� �ٿ�ε�.
	public static boolean doFileDownload(HttpServletResponse response,		
			String saveFileName, String originalFileName, String path) {	
										
		try {
			
			String filePath = path + File.separator + saveFileName; //���ϰ�δ� ������ ���� ��� + ���ϼ��۷����� + ����������̸�.
			
			if(originalFileName==null||originalFileName.equals("")) {
				originalFileName = saveFileName;
			}
			
			//������ �ٿ�޾� Ŭ���̾�Ʈ �Ŀ� �����ҋ� �ѱ��̸� ���� ����.
			originalFileName = 
					new String(originalFileName.getBytes("euc-kr"),"ISO-8859-1");
			
			File f = new File(filePath);
			
			if(!f.exists()) {
				return false;   //���� ����ϸ� ������ �ִٴ°�.
			}
			
			response.setContentType("application/octet-stream"); //������ �̸��� abc.txt���� .�� �����̶����
							//�޸���,����,�ѱ۵�� ���ø����̼ǿ��� ���� �������α����ϴ� �����̴�. ��¶�
			response.setHeader("Content-disposition", "attachment;fileName=" + originalFileName);
							//���������� ������ ������ ���Ͱ��� ���������°� �������̴� ��¶�
			
			BufferedInputStream bis = 
					new BufferedInputStream(new FileInputStream(f)); //������ bis�� �ְ� Ŭ���̾�Ʈ���� �����
			
			OutputStream out = response.getOutputStream(); //�ƿ�ǲ��Ʈ������ ������.
			
			int data;
			byte[] bytes = new byte[4096];
			
			while((data=bis.read(bytes, 0, 4096))!=-1) {
				out.write(bytes,0,data);
			} //data�� bis�� bytes�� 0���� 4096���� ���о�� �������� 
				//out.write bytes�� 0���� data�� ������ ����
			
			out.flush();
			out.close();
			bis.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
			return false;
		}
		
		return true;
	}
				
	
	
	
	
	
	
	
	
	//���� ����.
	public static void doFileDelete(String fileName, String path) {
		
		try {
			
			String filePath = path + File.separator + fileName;
			
			File f = new File(filePath);
			
			if(f.exists()) // ������ �̸��� ��θ� �޾Ƽ� f �� ������
				f.delete(); //�������� ������ �����ϴ� ��� //���ϻ����ض�~
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		
	}

}
