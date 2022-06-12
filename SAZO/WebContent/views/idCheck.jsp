<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    request.setCharacterEncoding("UTF-8");
    String cp = request.getContextPath();
    String message = request.getParameter("message");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
    <title>아이디 중복 체크</title>
    
    <style type="text/css">
        #wrap {
            width: 490px;
            text-align :center;
            margin: 0 auto 0 auto;
        }
        
        #chk{
            text-align :center;
        }
        
        #cancelBtn{
            visibility:visible;
        }
        
        #useBtn{
             visibility:hidden;
        }

.button{
	outline: none;
}
.styled-button{
	display: inline-block;
	width: 175px;
	height: 50px;
	border: 1px solid #5f0080;
    background-color: #fff;
    font-size: 14px;
    color: #5f0080;
    line-height: 50px;
    text-align: center;
}  
        .styled-button_active{
        	
        	font-size: 13px;
        	width: 70px;
        	height: 25px;
        	line-height:0px;
        	background-color: #5F0080;
        	color: #fff;
        	
        }
        
 
   </style>
    
<script type="text/javascript">
    
        var httpRequest = null;
        
        // httpRequest 객체 생성
        function getXMLHttpRequest(){
            var httpRequest = null;
        
            if(window.ActiveXObject){
                try{
                    httpRequest = new ActiveXObject("Msxml2.XMLHTTP");    
                } catch(e) {
                    try{
                        httpRequest = new ActiveXObject("Microsoft.XMLHTTP");
                    } catch (e2) { httpRequest = null; }
                }
            }
            else if(window.XMLHttpRequest){
                httpRequest = new window.XMLHttpRequest();
            }
            return httpRequest;    
        }
        
        
        // 회원가입창의 아이디 입력란의 값을 가져온다.
        function pValue(){
            document.getElementById("id").value = opener.document.myForm.id.value;
        }
        
        // 아이디 중복체크
        function idCheck(){
        	
 
            var id = document.getElementById("id").value;
            
 
            if (!id) {
                alert("아이디를 입력하지 않았습니다.");
                return false;
            } else {
                var param="id="+id
                httpRequest = getXMLHttpRequest();
                httpRequest.onreadystatechange = callback;
                httpRequest.open("POST", "MemberIdCheckAction.do", true);    
                httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded'); 
                httpRequest.send(param);
            }
        }
        
        function callback(){
            if(httpRequest.readyState == 4){
                // 결과값을 가져온다.
                var resultText = httpRequest.responseText;
                if(resultText == 0){
                    alert("사용할수없는 아이디입니다.");
                    document.getElementById("cancelBtn").style.visibility='visible';
                    document.getElementById("useBtn").style.visibility='hidden';
                    document.getElementById("msg").innerHTML ="";
                } 
                else if(resultText == 1){ 
                    document.getElementById("cancelBtn").style.visibility='hidden';
                    document.getElementById("useBtn").style.visibility='visible';
                    document.getElementById("msg").innerHTML = "사용 가능한 아이디입니다.";
                }
            }
        }
        
        // 사용하기 클릭 시 부모창으로 값 전달 
        function sendCheckValue(){
            // 중복체크 결과인 idCheck 값을 전달한다.
            opener.document.myForm.idDuplication.value ="idCheck";
            // 회원가입 화면의 ID입력란에 값을 전달
            opener.document.myForm.id.value = document.getElementById("id").value;
            
            if (opener != null) {
                opener.chkForm = null;
                self.close();
            }    
        }   
        
        function checkid() {
        	f = document.checkForm;
        	f.action = "/SAZO/market/check1.do";
        	f.submit();
        }
        
        
</script>
    
</head>


<body onload="pValue()">


<div id="wrap">
    <br>
    <b><font size="4" color="#5F0080">아이디 중복체크</font></b>
    <hr size="1" width="460">
    <br>
    <div id="chk">
        <form id="checkForm" name="checkForm">
            <input type="text" name="id" id="userId" value="${id }">
            
            <input   type="button" value="중복확인" class="styled-button_active"  
            onclick="checkid()">
        </form>
        <c:if test="${!empty message }">
        <div id="msg">${message }</div>
        </c:if>
        
        <br>
        <input class="styled-button_active"  id="cancelBtn" type="button" value="닫기" onclick="window.close()"><br>
        <input id="useBtn" type="button" value="사용하기" onclick="sendCheckValue()">
    </div>
</div>    
</body>
</html>