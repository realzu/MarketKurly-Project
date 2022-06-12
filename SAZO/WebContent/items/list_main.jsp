<%@ page contentType="text/html; charset=Utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마켓컬리 :: 메인상품리스트</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/style4.css"/>
</head>
<body>
	<div id="itemList"><%--페이지전체 --%>		

			<div class="leftInfo">총 ${dataCount }개</div>

		<div id="itemImg"><%--상품리스트 --%>		
			
			<table>
				<%
					int cnt = 0;
				%>			
	
				<c:forEach var="dto" items="${lists_m }">
				
					<%
					if(cnt==0) {
						out.print("<tr>");
					}
					cnt++;
					%>					
					
					<td>	
						<div><a href="<%=cp%>/market/product.do?itemNum=${dto.itemNum}">
							<img alt="${dto.itemName }" src="${imagePath }${dto.itemNum }/${dto.thumFile}" class="img"/></a>
						</div>						 
							<br/>				 
						<div class="imgInfo"><a class="imgInfo" href="<%=cp%>/market/product.do?itemNum=${dto.itemNum}">							
							<span class="block1">${dto.itemName }</span>
							<span class="block2">${dto.price }원</span>
							<span class="block3">${dto.itemInfo }</span></a>
						</div>
					</td>
					<%
					if(cnt==4) {
						out.print("</tr>");
						cnt=0;
					}					
					%>
				</c:forEach>
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				<%--  else if(num==2){ %>
				<c:forEach var="dto" items="${lists_d }">
				
					<%
					if(cnt==0) {
						out.print("<tr>");
					}
					cnt++;
					%>
					
					<td>	
						<div><a href="<%=cp%>/market/product.do?itemNum=${dto.itemNum}">
							<img alt="${dto.itemName }" src="${imagePath }${dto.itemNum }/${dto.thumFile}" class="img"/></a>
						</div>						 
							<br/>				 
						<div class="imgInfo"><a class="imgInfo" href="<%=cp%>/market/product.do?itemNum=${dto.itemNum}">							
							<span class="block1">${dto.itemName }</span>
							<span class="block2">${dto.price }원</span>
							<span class="block3">${dto.itemInfo }</span></a>
						</div>
					</td>

					<%
					if(cnt==3) {
						out.print("</tr>");
						cnt=0;
					}					
					%>
				</c:forEach>
				
				<%} else if(num==3){ %>
				<c:forEach var="dto" items="${lists_lp }">
				
					<%
					if(cnt==0) {
						out.print("<tr>");
					}
					cnt++;
					%>
					
					<td>	
						<div><a href="<%=cp%>/market/product.do?itemNum=${dto.itemNum}">
							<img alt="${dto.itemName }" src="${imagePath }${dto.itemNum }/${dto.thumFile}" class="img"/></a>
						</div>						 
							<br/>				 
						<div class="imgInfo"><a class="imgInfo" href="<%=cp%>/market/product.do?itemNum=${dto.itemNum}">							
							<span class="block1">${dto.itemName }</span>
							<span class="block2">${dto.price }원</span>
							<span class="block3">${dto.itemInfo }</span></a>
						</div>
					</td>

					<%
					if(cnt==3) {
						out.print("</tr>");
						cnt=0;
					}					
					%>
				</c:forEach>
				
				<%} else { %>
				<c:forEach var="dto" items="${lists_hp }">
				
					<%
					if(cnt==0) {
						out.print("<tr>");
					}
					cnt++;
					%>
					
					<td>	
						<div><a href="<%=cp%>/market/product.do?itemNum=${dto.itemNum}">
							<img alt="${dto.itemName }" src="${imagePath }${dto.itemNum }/${dto.thumFile}" class="img"/></a>
						</div>						 
							<br/>				 
						<div class="imgInfo"><a class="imgInfo" href="<%=cp%>/market/product.do?itemNum=${dto.itemNum}">							
							<span class="block1">${dto.itemName }</span>
							<span class="block2">${dto.price }원</span>
							<span class="block3">${dto.itemInfo }</span></a>
						</div>
					</td>

					<%
					if(cnt==3) {
						out.print("</tr>");
						cnt=0;
					}					
					%>
					</c:forEach>
				<%} %> --%>
			</table>		

					
		</div><%--상품리스트 끝 --%>
		

		<div id="pgIndex">
			<c:if test="${dataCount!=0 }">
				${pageIndexList }
			</c:if>
			<c:if test="${dataCount==0 }">
				등록된 상품이 없습니다.
			</c:if>
		</div>			

	</div>
	<br/><br/>

	
</body>
</html>