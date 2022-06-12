package com.util;

public class MyUtil {

	//��ü������
	public int getPageCount(int numPerPage, int dataCount) {
		
		int pageCount = 0;
		
		pageCount = dataCount / numPerPage;
		
		if(dataCount % numPerPage !=0) {
			pageCount++;
			
		}
		return pageCount;
	}
	
	//������ ó�� �޼ҵ�
	public String pageIndexList(int currentPage, int totalPage, String listUrl) {
		
		int numPerBlock = 5; //������ 6 7 8 9 10 ������ ������ ���� ������ ������ ǥ�� ��.
		int currentPageSetup; //���� ����ִ� ��.
		int page;	//6 7 8 9 10 ��������. int i�� ����ϴ�.
		
		StringBuffer sb = new StringBuffer(); //String�� �����ִ� ���� ��Ʈ�����ۿ� ��Ʈ�������� �ִ�.
		
		if(currentPage==0 || totalPage==0) {
			return "";
		}
		
		//list.jsp?pageNum=2 Url�� �ΰ��� �� �� �ִ�. ����¡�۾�.
		//list.jsp?searchKey=subject&searchValue=a
		if(listUrl.indexOf("?")!=-1	) { //listUrl�� �ε������߿� ? �� ����ֳ� Ȯ��.
			listUrl = listUrl + "&"; //���� �ִٸ� url�� &�� ���ض�
		}else {
			listUrl = listUrl + "?"; //���ٸ� Url�� ?�� ���ض�
		}
		
		 // 1 2 3 4 5 ������
		 //������ 6 7 8 9 10 ������
		 //������ 11 12 13 14 15 ������
		//�� �����
		currentPageSetup = (currentPage/numPerBlock)*numPerBlock; //6 / 5 �� 1�� ������ 1 ���� numPerblock�� 5�� ���ϸ�  5

		if(currentPage % numPerBlock == 0) { //Ŀ��Ʈ�������� �������� 0���� �� �������� �¾�-���ۺ��.
			currentPageSetup = currentPageSetup - numPerBlock; //������������ ���ϴ� ����
		}
	
		//������ <�����
		if(totalPage > numPerBlock && currentPageSetup > 0) { //��Ż���������� ũ�� ���ۺ���̳� Ŀ��Ʈ�������¾��� 0���� ũ�� ����� ������ �ȸ���
			//
			sb.append("<a href=\"" + listUrl + "pageNum=" + 
			currentPageSetup + "\">������</a>&nbsp;"); // \" �������õ���ǥ�� �ݴ� ����ǥ�� �ν������ʴ´�.
			
			//<a href="list.jsp?pageNum=5>������</a>
		}
		
		//�ٷΰ��������� 6 7 8 9 10
		
		page = currentPageSetup + 1;
		
		while(page <= totalPage && page <= (currentPageSetup + numPerBlock)) {
			//�������� ��Ż���������� �۰ų� ���� && �������� Ŀ��Ʈ�������¾� + ���ۺ�Ϻ��� �۰ų� ������ ���̸�
			
			if(page == currentPage) {
				sb.append("<font color=\"black\">" + page + "</font>&nbsp;");
				//<font color = "Fuchsia">9</font> ���� �����ִ� �������� ������ �ذ�.
				
			}else {
				
				sb.append("<a href=\"" + listUrl + "pageNum=" + page + "\">" + page + "</a>&nbsp;");
				
				//<a href="list.jsp?pageNum=7">7</a>&nbsp; ���� ����. ���纸���ִ� �������� �ƴ� �ٸ��������� ��ũ���ذ�.
			}
			
			page++; //++���־�� ���Ϲ��� �ϳ���� ���ϰ� ��� ���ϰ� �ݺ�.
			
		}
		
		//������
		//������ 6 7 8 9 10 ������
		//������ 11 12 13 14 15 ������
		if(totalPage - currentPageSetup > numPerBlock) {
			
			sb.append("<a href=\"" + listUrl + "pageNum=" + page + "\">������</a>&nbsp;");
			//<a href="list.jsp?pageNum=11">������</a>&nbsp; ���� ����.
		}
		
		return sb.toString();
	}
	
	
}
