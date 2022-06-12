<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>이미지 게시판</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/manage/data/style.css"/>
<script type="text/javascript" src="<%=cp%>/manage/data/manage.js"></script>
</head>
<body>

<br/><br/>

<table border="3px solid #D6D4A6"  width="600" align="center" cellspacing="0" cellpadding="0" style="padding-left: 20px;">
	<tr height="30">
		<td style="border: none;"><b>이미지 게시판${lists }</b></td>
	</tr>
</table>

<br/><br/>

<table width="600" >
	<tr>
		<td colspan="2">
			Total : ${dataCount } articles, ${totalPage } pages / Now page is ${currentPage } 
		</td>
		<td align="right">
			<input type="button" class="btn1" value="게시물 등록" onclick="javascript:location.href='<%=cp%>/admin/write.do';">
		</td>
	<tr>
	
	<tr>
		<td colspan="3" height="3" bgcolor="#dbdbdb" align="center"></td>
	</tr>
	
	<%
		int cnt=0;
	%>
	<c:forEach var="dto" items="${lists }">
	<%
		if(cnt==0) {
			out.print("<tr>");
		}
		cnt++;
	%>
		<td>
			<a href="<%=cp%>/market/product.do?itemNum=${dto.itemNum}" ><img alt="" src="${imagePath }${dto.itemNum }/${dto.thumFile}" width="180" height="180"/></a><br/>
			<a href="${deletePath }&itemNum=${dto.itemNum}"> ${dto.itemName} 삭제</a><br/>
		</td>
	<%
		if(cnt==3) {
			out.print("</tr>");
			cnt=0;
		}
		
	%>
	</c:forEach>
	
	<tr>
		<td colspan="3" align="center">${pageIndexList }</td>
	</tr>
	
	<tr>
		<td colspan="3" height="3" bgcolor="#dbdbdb" align="center"></td>
	</tr>
	
</table>
<br/><br/>


</body>
</html>