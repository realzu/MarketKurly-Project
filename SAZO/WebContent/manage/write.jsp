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
<title>이미지 등록</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/manage/data/style.css"/>
<script type="text/javascript" src="<%=cp%>/manage/data/manage.js"></script>
</head>
<body>

<br/><br/>

<table border="3px solid #D6D4A6"  width="600" align="center" cellspacing="0" cellpadding="0" style="padding-left: 20px;">
	<tr height="30">
		<td style="border: none;"><b>이미지 게시판</b></td>
	</tr>
</table>

<br/><br/>

<form action="" method="post" name="myForm" enctype="multipart/form-data">
<table width="600" align="center" cellspacing="0" cellpadding="0">

	<tr>
		<td colspan="2" height="3" bgcolor="#dbdbdb" align="center"></td>
	</tr>
	
	<tr>
		<th width="100" height="30" bgcolor="#eeeeee">상품명</th>
		<td style="padding-left: 20px;"><input type="text" name="itemName" class="boxTF" size="70"></td>
	</tr>
	
	<tr>
		<th width="100" height="30" bgcolor="#eeeeee">한마디</th>
		<td style="padding-left: 20px;"><input type="text" name="itemInfo" class="boxTF" size="70"></td>
	</tr>
	
	<tr>
		<td colspan="2" height="1" bgcolor="#dbdbdb" align="center"></td>
	</tr>
	
	<tr>
		<th width="100" height="30" bgcolor="#eeeeee">단위</th>
		<td style="padding-left: 20px;"><input type="text" name="unit" class="boxTF" size="70"></td>
	</tr>
	
	<tr>
		<td colspan="2" height="1" bgcolor="#dbdbdb" align="center"></td>
	</tr>
	
	<tr>
		<th width="100" height="30" bgcolor="#eeeeee">중량</th>
		<td style="padding-left: 20px;"><input type="text" name="kg" class="boxTF" size="70"></td>
	</tr>
	
	<tr>
		<td colspan="2" height="1" bgcolor="#dbdbdb" align="center"></td>
	</tr>
	
	<tr>
		<th width="100" height="30" bgcolor="#eeeeee">안내사항</th>
		<td style="padding-left: 20px;"><textarea cols="68" name="comments" class="boxTA"></textarea></td>
	</tr>
	
	<tr>
		<td colspan="2" height="1" bgcolor="#dbdbdb" align="center"></td>
	</tr>
	
	<tr>
		<th width="100" height="30" bgcolor="#eeeeee">알레르기</th>
		<td style="padding-left: 20px;"><input type="text" name="allegy" class="boxTF" size="70"></td>
	</tr>
	
	<tr>
		<td colspan="2" height="1" bgcolor="#dbdbdb" align="center"></td>
	</tr>
	
	<tr>
		<th width="100" height="30" bgcolor="#eeeeee">가격</th>
		<td style="padding-left: 20px;"><input type="text" name="price" class="boxTF" size="70"></td>
	</tr>
	
	<tr>
		<td colspan="2" height="1" bgcolor="#dbdbdb" align="center"></td>
	</tr>
	
	<tr>
		<th width="100" height="30" bgcolor="#eeeeee">카테고리</th>
		<td style="padding-left: 20px;"><input type="text" name="category" class="boxTF" size="70"></td>
	</tr>
	
	<tr>
		<td colspan="2" height="1" bgcolor="#dbdbdb" align="center"></td>
	</tr>
	
	<tr>
		<th width="100" height="30" bgcolor="#eeeeee">썸네일</th>
		<td style="padding-left: 20px;"><input type="file" name="thumFile" class="boxTF" size="70"></td>
	</tr>
	
	<tr>
		<td colspan="2" height="1" bgcolor="#dbdbdb" align="center"></td>
	</tr>
	
	<tr>
		<th width="100" height="30" bgcolor="#eeeeee">상품설명</th>
		<td style="padding-left: 20px;"><input type="file" name="image1" class="boxTF" size="70"></td>
	</tr>
	
	<tr>
		<td colspan="2" height="1" bgcolor="#dbdbdb" align="center"></td>
	</tr>
	
	<tr>
		<th width="100" height="30" bgcolor="#eeeeee">상세정보</th>
		<td style="padding-left: 20px;"><input type="file" name="image2" class="boxTF" size="70"></td>
	</tr>
	
	<tr>
		<td colspan="2" height="3" bgcolor="#dbdbdb" align="center"></td>
	</tr>
	
	<tr>
		<td colspan="2" height="1" bgcolor="#dbdbdb" align="center"></td>
	</tr>
	
	
	

</table>


<br/>

<table>
	<tr align="center">
		<td>
		<input type="button" class="btn1" value="등록하기" onclick="javascript:sendIt();"/>
		<input type="reset" class="btn1" value="다시입력" onclick="document.myForm.subject.focus();"/>
		<input type="button" class="btn1" value="작성취소" onclick="javascript:location.href='<%=cp%>/admin/list.do';"/>
		</td>
	</tr>
</table>
</form>
</body>
</html>