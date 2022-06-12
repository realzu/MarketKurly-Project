<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
		request.setCharacterEncoding("UTF-8");
		String cp = request.getContextPath();
		
%>
<!DOCTYPE html>
<html>
<title>메인페이지</title>
<link rel="stylesheet" type="text/css" href="../css/real_main.css">

<head>
</head>
<body>
    <div class="container">
        <header>
            <div class="deliver">
              <a href="/SAZO/market/view.do">
                   <b><span>&nbsp;샛별·택배</span> 배송안내 〉</b>
               </a>
            </div>
            
        <nav  class="jlc">
           <ul>
           <c:if test="${empty sessionScope.test.id }">
               <a href="/SAZO/market/join.do">
                    <li><span>회원가입&emsp;|&emsp;</span></li>
                </a>
               <a href="/SAZO/market/login.do">
                    <li><span>로그인&emsp;&emsp;</span></li>
                </a>
           </c:if>
           <c:if test="${!empty sessionScope.test.id }">
                    <li><a href="/SAZO/market/mypage.do">${sessionScope.test.id }님 어서오세요.&emsp;|&emsp; </a></li>
           
                <a href="/SAZO/market/logout.do"> 
                    <li>로그아웃</li>
                </a>
            </c:if>     
            </ul>
        </nav>
         <img class = "logo" src="../image/%EB%A7%88%EC%BC%93%EC%BB%AC%EB%A6%AC%20%EB%A1%9C%EA%B3%A0.png" alt="마켓컬리 로고"/>
         <nav class="category_bar">
         <ul>
            <li><b><img src="./main/image/ico_gnb_all_off.png" alt="카테고리 아이콘">&ensp;&ensp;전체 카테고리</b></li>
            <a href="/SAZO/market/list_new.do?num=2">
             <li><b>신상품</b></li>
             </a>
             <a href="/SAZO/market/list_best.do?num=1">
             <li><b>베스트</b></li>
             </a>
             <a href="/SAZO/market/list_price.do?num=3">
             <li><b>알뜰쇼핑</b></li>
             </a>
        
         </ul>
             <input class="search" type="text" value="검색어를 입력해주세요" >
            <a href="/SAZO/market/search.do?num=2"><img class="search_icon" src="../image/ico_search_40x40.png"></a>
            <ul>
             <li id="logos"><a href="#"><img src="../image/ico_delivery_setting.png" alt="위치로고"></a></li>
             <li id="logos"><a href="/SAZO/market/basketck.do"><img src="../image/ico_cart.png" alt="카트로고"></a></li>
         </ul>
         </nav>
    
         
    </header>
        
    <!--메인페이지-->
    <main>
        <img class="mainBanner" src="../image/main_ex.jpg" alt="메인이미지">

        <div class="this_pd1">
            <p class="sub">이 상품 어때요?</p><br>
                <ul class="sub1">
                        <li><img src="../image/sample1.jpg"></li>
                        <li><img src="../image/sample2.jpg"></li>
                        <li><img src="../image/sample3.jpeg"></li>
                        <li><img src="../image/sample4.jpg"></li>
                    </ul>
                    <img  class="arrow_right" src="../image/arrow_right.png" alt="오른쪽 화살표">
        </div>
        
        <div class="banner1">
            <img src="../image/sample7.jpg">
        </div>
        
        <div class="this_pd2">
            <p class="sub">놓치면 후회할 가격 〉 </p>
                <ul class="sub1">
                        <li><img src="../image/sample1.jpg"></li>
                        <li><img src="../image/sample2.jpg"></li>
                        <li><img src="../image/sample3.jpeg"></li>
                        <li><img src="../image/sample4.jpg"></li>
                    </ul>
                    <img  class="arrow_right" src="../image/arrow_right.png" alt="오른쪽 화살표">
        </div>
         <div class="this_pd4">
             <p class="sub">후기 1,000개 돌파 상품 〉 </p>
                  <ul class="sub1">
                        <li><img src="../image/sample1.jpg"></li>
                        <li><img src="../image/sample2.jpg"></li>
                        <li><img src="../image/sample3.jpeg"></li>
                        <li><img src="../image/sample4.jpg"></li>
                    </ul>
                    <img  class="arrow_right" src="../image/arrow_right.png" alt="오른쪽 화살표">
        </div>       
         <div class="this_pd4">
             <p class="sub">뷰티유튜버 이사배의 장바구니 〉 </p>
                   <ul class="sub1">
                        <li><img src="../image/sample1.jpg"></li>
                        <li><img src="../image/sample2.jpg"></li>
                        <li><img src="../image/sample3.jpeg"></li>
                        <li><img src="../image/sample4.jpg"></li>
                    </ul>
                    <img  class="arrow_right" src="../image/arrow_right.png" alt="오른쪽 화살표">
        </div>
        <div class="this_pd4">
             <p class="sub">지금 가장 핫한 상품 〉 </p>
                   <ul class="sub1">
                        <li><img src="../image/sample1.jpg"></li>
                        <li><img src="../image/sample2.jpg"></li>
                        <li><img src="../image/sample3.jpeg"></li>
                        <li><img src="../image/sample4.jpg"></li>
                    </ul>
                    <img  class="arrow_right" src="../image/arrow_right.png" alt="오른쪽 화살표">
        </div>     
     <div class="this_pd4">
             <p class="sub">마감세일 〉 </p>
               <ul class="sub1">
                        <li><img src="../image/sample1.jpg"></li>
                        <li><img src="../image/sample2.jpg"></li>
                        <li><img src="../image/sample3.jpeg"></li>
                        <li><img src="../image/sample4.jpg"></li>
                    </ul>
                    <img  class="arrow_right" src="../image/arrow_right.png" alt="오른쪽 화살표">
        </div>  
          <div class="this_pd4">
             <p class="sub">공유가 많은 상품 랭킹 〉 </p>
             <p class="sub_sub">최근 2주간 공유가 가장 많았어요</p>
            <table>
            </table>
        </div>
        <p class="sub"> MD추천</p>
        <div  class="md_recom">
            <p id="md1">&ensp;선물하기&ensp;</p>
            <p id="md1">&ensp;채소&ensp;</p>
            <p id="md1">&ensp;과일·견과·쌀&ensp;</p>
            <p id="md1">&ensp;수산·해산·건어물&ensp;</p>
            <p id="md1">&ensp;정육·계란&ensp;</p>
            <p id="md1">&ensp;국·반찬·메인요리&ensp;</p>
            <p id="md1">&ensp;샐러드·간편식&ensp;</p>
            <p id="md1">&ensp;면·양념·오일&ensp;</p>
        </div>
        <div class="md_recom">
            <p id="md2">&ensp;생수·음료·우유·커피&ensp;</p>
            <p id="md2">&ensp;간식·과자·떡&ensp;</p>
            <p id="md2">&ensp;베이커리·치즈·델리&ensp;</p>
            <p id="md2">&ensp;건강식품&ensp;</p>
            <p id="md2">&ensp;생활용품·리빙·캠핑&ensp;</p>
            <p id="md2">&ensp;스킨케어·메이크업&ensp;</p>
            <p id="md2">&ensp;헤어·바디·구강&ensp;</p>
        </div>
        <div class="md_recom">
            <p id="md3">&ensp;주방용품 &ensp;</p>
            <p id="md3">&ensp;가전제품&ensp;</p>
            <p id="md3">&ensp;반려동물&ensp;</p>
            <p id="md3">&ensp;베이비·키즈·완구&ensp;</p>
        </div>
          <ul class="sub1">
                       <br><br>
                        <li><img src="../image/sample1.jpg"></li>
                        <li><img src="../image/sample2.jpg"></li>
                        <li><img src="../image/sample3.jpeg"></li>
                        <li><img src="../image/sample4.jpg"></li>
                    </ul>
            <img  class="arrow_right" src="../image/arrow_right.png" alt="오른쪽 화살표">
            <div class="md_recom">
                <p id="md_recom_p">선물하기 전체보기</p>
            </div>
        <table>
             
         </table>
          <div class="this_pd4">
             <p class="sub">후기 1,000개 돌파 상품 〉 </p>
                   <ul class="sub1">
                        <li><img src="../image/sample1.jpg"></li>
                        <li><img src="../image/sample2.jpg"></li>
                        <li><img src="../image/sample3.jpeg"></li>
                        <li><img src="../image/sample4.jpg"></li>
                    </ul>
                    <img  class="arrow_right" src="../image/arrow_right.png" alt="오른쪽 화살표">
        </div>       
         <div class="this_pd4">
             <p class="sub">후기 1,000개 돌파 상품 〉 </p>
                    <ul class="sub1">
                        <li><img src="../image/sample1.jpg"></li>
                        <li><img src="../image/sample2.jpg"></li>
                        <li><img src="../image/sample3.jpeg"></li>
                        <li><img src="../image/sample4.jpg"></li>
                    </ul>
                    <img  class="arrow_right" src="../image/arrow_right.png" alt="오른쪽 화살표">
        </div>       
           
                <div class="banner1" >
            <img src="../image/%EB%A7%88%EC%BC%93%EC%BB%AC%EB%A6%AC%20%ED%95%98%EB%8B%A8%20%EB%B0%B0%EB%84%88.jpg">
        </div>
    </main>
    
     <footer>
       <hr>
          <img class="fi" src="../image/footer_img.jpg" alt="푸터 이미지">
          <div class="divfp">
          <p class="fp"> 
              마켓컬리에서 판매되는 상품 중에는 마켓컬리에 입점한 개별 판매자가 판매하는 마켓플레이스(오픈마켓) 상품이 포함되어 있습니다.<br>
             마켓플레이스(오픈마켓) 상품의 경우 컬리는 통신판매중개자로서 통신판매의 당사자가 아닙니다. 컬리는 해당 상품의 주문, 품질, 교환/환불 등 의무와 책임을 부담하지 않습니다.<br>
            © KURLY CORP. ALL RIGHTS RESERVED</p>
         </div>
     </footer>   
    </div>
        
</body>
</html>