package com.util;

public class MyUtil {

	//전체페이지
	public int getPageCount(int numPerPage, int dataCount) {
		
		int pageCount = 0;
		
		pageCount = dataCount / numPerPage;
		
		if(dataCount % numPerPage !=0) {
			pageCount++;
			
		}
		return pageCount;
	}
	
	//페이지 처리 메소드
	public String pageIndexList(int currentPage, int totalPage, String listUrl) {
		
		int numPerBlock = 5; //◀이전 6 7 8 9 10 다음▶ 이전과 다음 사이의 페이지 표시 수.
		int currentPageSetup; //◀에 들어있는 값.
		int page;	//6 7 8 9 10 페이지값. int i와 비슷하다.
		
		StringBuffer sb = new StringBuffer(); //String을 도와주는 보조 스트링버퍼와 스트링빌더가 있다.
		
		if(currentPage==0 || totalPage==0) {
			return "";
		}
		
		//list.jsp?pageNum=2 Url이 두개가 올 수 있다. 페이징작업.
		//list.jsp?searchKey=subject&searchValue=a
		if(listUrl.indexOf("?")!=-1	) { //listUrl의 인덱스값중에 ? 가 들어있나 확인.
			listUrl = listUrl + "&"; //만약 있다면 url에 &를 더해라
		}else {
			listUrl = listUrl + "?"; //없다면 Url에 ?를 더해라
		}
		
		 // 1 2 3 4 5 다음▶
		 //◀이전 6 7 8 9 10 다음▶
		 //◀이전 11 12 13 14 15 다음▶
		//◀ 만들기
		currentPageSetup = (currentPage/numPerBlock)*numPerBlock; //6 / 5 는 1에 나머지 1 에다 numPerblock값 5를 더하면  5

		if(currentPage % numPerBlock == 0) { //커런트페이지를 나눈값이 0으로 딱 떨어지면 셋업-넘퍼블록.
			currentPageSetup = currentPageSetup - numPerBlock; //이전페이지를 구하는 공식
		}
	
		//◀이전 <만들기
		if(totalPage > numPerBlock && currentPageSetup > 0) { //토탈페이지보다 크고 넘퍼블록이나 커런트페이지셋업이 0보다 크면 만들고 작으면 안만듬
			//
			sb.append("<a href=\"" + listUrl + "pageNum=" + 
			currentPageSetup + "\">◀이전</a>&nbsp;"); // \" 역슬래시따옴표는 닫는 따옴표로 인식하지않는다.
			
			//<a href="list.jsp?pageNum=5>◀이전</a>
		}
		
		//바로가기페이지 6 7 8 9 10
		
		page = currentPageSetup + 1;
		
		while(page <= totalPage && page <= (currentPageSetup + numPerBlock)) {
			//페이지가 토탈페이지보다 작거나 같고 && 페이지가 커런트페이지셋업 + 넘퍼블록보다 작거나 같은게 참이면
			
			if(page == currentPage) {
				sb.append("<font color=\"black\">" + page + "</font>&nbsp;");
				//<font color = "Fuchsia">9</font> 현재 보고있는 페이지에 색상을 준것.
				
			}else {
				
				sb.append("<a href=\"" + listUrl + "pageNum=" + page + "\">" + page + "</a>&nbsp;");
				
				//<a href="list.jsp?pageNum=7">7</a>&nbsp; 위와 동일. 현재보고있는 페이지가 아닌 다른페이지에 링크를준것.
			}
			
			page++; //++해주어야 와일문이 하나찍고 더하고 찍고 더하고 반복.
			
		}
		
		//다음▶
		//◀이전 6 7 8 9 10 다음▶
		//◀이전 11 12 13 14 15 다음▶
		if(totalPage - currentPageSetup > numPerBlock) {
			
			sb.append("<a href=\"" + listUrl + "pageNum=" + page + "\">다음▶</a>&nbsp;");
			//<a href="list.jsp?pageNum=11">다음▶</a>&nbsp; 위와 동일.
		}
		
		return sb.toString();
	}
	
	
}
