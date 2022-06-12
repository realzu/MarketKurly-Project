<%@ page contentType="text/html; charset=Utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

	function uploadIt() {
		
		f = document.myForm;
		
		str = f.subject.value;
	    str = str.trim();
	    if(!str) {
	        alert("제목을 입력하세요 !!!");
	        f.subject.focus();
	        return;
	    }
	    f.subject.value = str;

	    str = f.upload.value;
	    if(!str) {
	        alert("이미지 파일을 선택 하세요 !!!");
	        f.upload.focus();
	        return;
	    }
	    
	    f.action="/study/item/upload_ok.do";
	    f.submit();
		
	}
	

</script>
</head>
<body>

<form action="" method="post" enctype="multipart/form-data" name="myForm">

<table width="600" border="0" cellpadding="0" cellspacing="0" align="center">

<tr><td colspan="2" height="3" bgcolor="#dbdbdb" align="center"></td></tr>

<tr>
	<td width="15%" height="30" bgcolor="#eeeeee" style="padding-left: 20px;">
	제&nbsp;&nbsp;&nbsp;목</td>
	<td width="85%" style="padding-left: 10px;">
	<input type="text" name="subject" size="70" maxlength="20" class="boxTF"/>
	</td>
</tr>

<tr><td colspan="2" height="1" bgcolor="#dbdbdb" align="center"></td></tr>

<tr>
	<td width="15%" height="30" bgcolor="#eeeeee" style="padding-left: 20px;">
	파&nbsp;&nbsp;&nbsp;일</td>
	<td width="85%" style="padding-left: 10px;">
	<input type="file" name="upload" size="70" maxlength="20" class="boxTF"/>
	</td>
</tr>

<tr><td colspan="2" height="3" bgcolor="#dbdbdb" align="center"></td></tr>

</table>


<table width="600" border="0" cellpadding="0" cellspacing="0" align="center">
<tr align="center">
	<td height="40">
	<input type="button" value=" 등록하기 " class="btn2" onclick="uploadIt();"/>
	<input type="reset" value=" 다시입력 " class="btn2" onclick="document.myForm.subject.focus();"/>
	</td>
</tr>


</table>
</form>


</body>
</html>