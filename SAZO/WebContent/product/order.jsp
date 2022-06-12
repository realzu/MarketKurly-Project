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
<title>주문 내역</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/real.css" />
<script type="text/javascript" src="<%=cp%>/js/product.js"></script>
</head>
<body>
<div id="orderlist">

	<form name="basket1" method="post">
	<c:forEach var="dto" items="${orderlist }">
		<dl>
			<%-- <dd><input type='checkbox' name='cartbox' value='${dto.itemNum }'/></dd> --%>
			<dd><input type="hidden" name="itemNum" value="${dto.itemNum }"/></dd>
			<dd style="width: 250px" class="itemNum" style="float: left;">상품번호 : ${dto.itemNum } 상품명 : ${dto.itemName }</dd>
			<dd><img alt="" src="${imagePath }${dto.itemNum }/${dto.thumFile}" width="180" height="180"/></dd>
			<dd class="amount">구매 수량 : ${dto.amount }</dd>
			<dd class="price">합계 금액 : ${dto.price }원</dd>

		</dl>
	</c:forEach>
	</form>
		<dl>
			<dd>총 구매 금액 : ${total }원</dd>
			<!-- <dd><input type="text" id="total" value="" size="20"/></dd> -->
		</dl>
		<form name="basket2" method="post">
		<dl>
			<dd>
			<!-- <input type='checkbox' name='cartbox' value='sellectall' onclick="selectAll(this)"/>전체 선택 -->
			<a href="#" onclick="deleteAll();">전체 삭제</a> | 
			<a href="/SAZO/market/order.do">결제하기</a>
		</dl>
		</form>
</div>
</body>
</html>