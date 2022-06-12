<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<%-- <link rel="stylesheet" type="text/css" href="<%=cp %>/css/style3.css"/> --%>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/mylist.css" /> 
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/real_main.css" /> 

<script type="text/javascript">

	function sendIt() {
		
		var f = document.myForm;
		
		str = f.id.value;
		str = str.trim();
		if(!str){
			alert("아이디를 입력하세요.");
			f.id.focus();
			return;
		}
		f.id.value = str;
		
		str = f.pwd.value;
		str = str.trim();
		if(!str){
			alert("비밀번호를 입력하세요.");
			f.pwd.focus();
			return;
		}
		f.pwd.value = str;
		
		f.action = "<%=cp%>/market/login_ok.do";
		f.submit();
	}

</script>
<script type="text/javascript">

	function join(){
		
	
	
		var f = document.myForm2;
	
		f.action ="<%=cp%>/market/join.do";
		f.submit();
	}
	
</script>
</head>
<body>
     <div class="container">
  <header>
			<div class="deliver">
				<a href="/SAZO/market/view.do"> <b><span>&nbsp;샛별·택배</span>
						배송안내 〉</b>
				</a>
			</div>
			<nav class="jlc">
				<ul>
					<c:if test="${empty sessionScope.test.id }">
						<a href="/SAZO/market/join.do">
							<li><span>회원가입&emsp;|&emsp;</span></li>
						</a>
						<a href="/SAZO/market/login.do">
							<li><span>로그인</span></li>
						</a>
					</c:if>
					<c:if test="${!empty sessionScope.test.id }">
						<li><a href="/SAZO/market/mypage.do">${sessionScope.test.id }님
								어서오세요.&emsp;|&emsp; </a></li>

						<a href="/SAZO/market/logout.do">
							<li>로그아웃</li>
						</a>
					</c:if>
				</ul>
			</nav>
			<div class="logo">
				<a href="/SAZO/market/main.do"><img
					src="/SAZO//image/%EB%A7%88%EC%BC%93%EC%BB%AC%EB%A6%AC%20%EB%A1%9C%EA%B3%A0.png"
					alt="마켓컬리 로고" /></a>
			</div>

			<!--카테고리바-->
			<div class="manuBar">
				<ul class="main1">
					<li><a href="#"><b><img
								src="/SAZO//image/ico_gnb_all_off.png" alt="카테고리 아이콘">&ensp;&ensp;전체
								카테고리</b></a>
						<ul class="main2">
							<li><a href="/SAZO/market/list_cate.do?category=veg">&ensp;&ensp;채소
									<ul class="main3">
										<li><a href="/SAZO/market/list_cate.do?category=veg">&ensp;&ensp;친환경</a></li>
										<li><a href="/SAZO/market/list_cate.do?category=veg">&ensp;&ensp;고구마·감자·당근</a></li>
										<li><a href="/SAZO/market/list_cate.do?category=veg">&ensp;&ensp;시금치·쌈채소·나물</a></li>
										<li><a href="/SAZO/market/list_cate.do?category=veg">&ensp;&ensp;브로콜리·파프리카·양배추</a></li>
										<li><a href="/SAZO/market/list_cate.do?category=veg">&ensp;&ensp;양파·대파·마늘·배추</a></li>
										<li><a href="/SAZO/market/list_cate.do?category=veg">&ensp;&ensp;오이·호박·고추</a></li>
										<li><a href="/SAZO/market/list_cate.do?category=veg">&ensp;&ensp;냉동·이색·간편채소</a></li>
										<li><a href="/SAZO/market/list_cate.do?category=veg">&ensp;&ensp;콩나물·버섯</a></li>
									</ul>
							</a></li>
							<li><a href="/SAZO/market/list_cate.do?category=fluit">&ensp;&ensp;과일·견과·쌀
									<ul class="main3">
										<li><a href="/SAZO/market/list_cate.do?category=fluit">&ensp;&ensp;친환경</a></li>
										<li><a href="/SAZO/market/list_cate.do?category=fluit">&ensp;&ensp;제철과일</a></li>
										<li><a href="/SAZO/market/list_cate.do?category=fluit">&ensp;&ensp;국산과일</a></li>
										<li><a href="/SAZO/market/list_cate.do?category=fluit">&ensp;&ensp;수입과일</a></li>
										<li><a href="/SAZO/market/list_cate.do?category=fluit">&ensp;&ensp;간편과일</a></li>
										<li><a href="/SAZO/market/list_cate.do?category=fluit">&ensp;&ensp;냉동·건과일</a></li>
										<li><a href="/SAZO/market/list_cate.do?category=fluit">&ensp;&ensp;견과류</a></li>
										<li><a href="/SAZO/market/list_cate.do?category=fluit">&ensp;&ensp;쌀·잡곡</a></li>
									</ul>
							</a></li>
							<li><a href="/SAZO/market/list_cate.do?category=fish">&ensp;&ensp;수산·해산·건어물
									<ul class="main3">
										<li><a href="/SAZO/market/list_cate.do?category=fish">&ensp;&ensp;제철수산</a></li>
										<li><a href="/SAZO/market/list_cate.do?category=fish">&ensp;&ensp;생선류</a></li>
										<li><a href="/SAZO/market/list_cate.do?category=fish">&ensp;&ensp;굴비·반건류</a></li>
										<li><a href="/SAZO/market/list_cate.do?category=fish">&ensp;&ensp;오징어·낙지·문어</a></li>
										<li><a href="/SAZO/market/list_cate.do?category=fish">&ensp;&ensp;새우·게·랍스터</a></li>
										<li><a href="/SAZO/market/list_cate.do?category=fish">&ensp;&ensp;해산물·조개류</a></li>
										<li><a href="/SAZO/market/list_cate.do?category=fish">&ensp;&ensp;수산가공품</a></li>
										<li><a href="/SAZO/market/list_cate.do?category=fish">&ensp;&ensp;김·미역·해조류</a></li>
										<li><a href="/SAZO/market/list_cate.do?category=fish">&ensp;&ensp;건어물·다시팩</a></li>
									</ul>
							</a></li>
							<li><a href="/SAZO/market/list_cate.do?category=meat">&ensp;&ensp;정육·계란
									<ul class="main3">
										<li><a href="/SAZO/market/list_cate.do?category=meat">&ensp;&ensp;국내산 소고기</a></li>
										<li><a href="/SAZO/market/list_cate.do?category=meat">&ensp;&ensp;수입산 소고기</a></li>
										<li><a href="/SAZO/market/list_cate.do?category=meat">&ensp;&ensp;돼지고기</a></li>
										<li><a href="/SAZO/market/list_cate.do?category=meat">&ensp;&ensp;계란류</a></li>
										<li><a href="/SAZO/market/list_cate.do?category=meat">&ensp;&ensp;닭·오리고기</a></li>
										<li><a href="/SAZO/market/list_cate.do?category=meat">&ensp;&ensp;양념육·돈까스</a></li>
										<li><a href="/SAZO/market/list_cate.do?category=meat">&ensp;&ensp;양고기</a></li>
									</ul>
							</a></li>
							<li><a href="#">&ensp;&ensp;국·반찬·메인요리
									<ul class="main3">
										<li><a href="#">&ensp;&ensp;국·탕·찌개</a></li>
										<li><a href="#">&ensp;&ensp;밀키트·메인요리</a></li>
										<li><a href="#">&ensp;&ensp;밑반찬</a></li>
										<li><a href="#">&ensp;&ensp;김치·젓갈·장류</a></li>
										<li><a href="#">&ensp;&ensp;두부·어묵·부침개</a></li>
										<li><a href="#">&ensp;&ensp;베이컨·햄·통조림</a></li>
									</ul>
							</a></li>
							<li><a href="#">&ensp;&ensp;샐러드·간편식
									<ul class="main3">
										<li><a href="#">&ensp;&ensp;샐러드·닭가슴살</a></li>
										<li><a href="#">&ensp;&ensp;도시락·밥류</a></li>
										<li><a href="#">&ensp;&ensp;파스타·면류</a></li>
										<li><a href="#">&ensp;&ensp;떡볶이·튀김·순대</a></li>
										<li><a href="#">&ensp;&ensp;피자·핫도그·만두</a></li>
										<li><a href="#">&ensp;&ensp;폭립·떡갈비·안주</a></li>
										<li><a href="#">&ensp;&ensp;죽·스프·카레</a></li>
										<li><a href="#">&ensp;&ensp;선식·시리얼</a></li>
									</ul>
							</a></li>
							<li><a href="#">&ensp;&ensp;면·양념·오일
									<ul class="main3">
										<li><a href="#">&ensp;&ensp;파스타·면류</a></li>
										<li><a href="#">&ensp;&ensp;식초·소스·드레싱</a></li>
										<li><a href="#">&ensp;&ensp;양념·액젓·장류</a></li>
										<li><a href="#">&ensp;&ensp;식용유·참기름·오일</a></li>
										<li><a href="#">&ensp;&ensp;소금·설탕·향신료</a></li>
										<li><a href="#">&ensp;&ensp;밀가루·가루·믹스</a></li>
									</ul>
							</a></li>
							<li><a href="#">&ensp;&ensp;생수·음료·우유·커피
									<ul class="main3">
										<li><a href="#">&ensp;&ensp;생수·탄산수</a></li>
										<li><a href="#">&ensp;&ensp;음료·주스</a></li>
										<li><a href="#">&ensp;&ensp;우유·두유·요거트</a></li>
										<li><a href="#">&ensp;&ensp;커피</a></li>
										<li><a href="#">&ensp;&ensp;차</a></li>
									</ul>
							</a></li>
							<li><a href="#">&ensp;&ensp;간식·과자·떡
									<ul class="main3">
										<li><a href="#">&ensp;&ensp;과자·스낵·쿠키</a></li>
										<li><a href="#">&ensp;&ensp;초콜릿·젤리·캔디</a></li>
										<li><a href="#">&ensp;&ensp;떡·한과</a></li>
										<li><a href="#">&ensp;&ensp;아이스크림</a></li>
									</ul>
							</a></li>
							<li><a href="#">&ensp;&ensp;베이커리·치즈·델리
									<ul class="main3">
										<li><a href="#">&ensp;&ensp;식빵·빵류</a></li>
										<li><a href="#">&ensp;&ensp;잼·버터·스프레드</a></li>
										<li><a href="#">&ensp;&ensp;케이크·파이·디저트</a></li>
										<li><a href="#">&ensp;&ensp;치즈</a></li>
										<li><a href="#">&ensp;&ensp;델리</a></li>
										<li><a href="#">&ensp;&ensp;올리브·피클</a></li>
									</ul>
							</a></li>
							<li><a href="#">&ensp;&ensp;건강식품
									<ul class="main3">
										<li><a href="#">&ensp;&ensp;영양제</a></li>
										<li><a href="#">&ensp;&ensp;유산균</a></li>
										<li><a href="#">&ensp;&ensp;홍삼·인삼·꿀</a></li>
										<li><a href="#">&ensp;&ensp;건강즙·건강음료</a></li>
										<li><a href="#">&ensp;&ensp;건강분말·건강환</a></li>
										<li><a href="#">&ensp;&ensp;다이어트·이너뷰티</a></li>
									</ul>
							</a></li>
							<li><a href="#">&ensp;&ensp;전통주
									<ul class="main3">
										<li><a href="#">&ensp;&ensp;막걸리·약주</a></li>
										<li><a href="#">&ensp;&ensp;증류주·과실주</a></li>
									</ul>
							</a></li>
							<li><a href="#">&ensp;&ensp;생활용품·리빙·캠핑
									<ul class="main3">
										<li><a href="#">&ensp;&ensp;휴지·티슈</a></li>
										<li><a href="#">&ensp;&ensp;여성·위생용품</a></li>
										<li><a href="#">&ensp;&ensp;세제·청소용품</a></li>
										<li><a href="#">&ensp;&ensp;화훼·인테리어소품</a></li>
										<li><a href="#">&ensp;&ensp;의약외품·마스크</a></li>
										<li><a href="#">&ensp;&ensp;생활잡화·문구</a></li>
										<li><a href="#">&ensp;&ensp;캠핑용품</a></li>
									</ul>
							</a></li>
							<li><a href="#">&ensp;&ensp;스킨케어·메이크업
									<ul class="main3">
										<li><a href="#">&ensp;&ensp;스킨·미스트·패드</a></li>
										<li><a href="#">&ensp;&ensp;에센스·앰플·로션</a></li>
										<li><a href="#">&ensp;&ensp;크림·오일</a></li>
										<li><a href="#">&ensp;&ensp;클렌징</a></li>
										<li><a href="#">&ensp;&ensp;마스크팩</a></li>
										<li><a href="#">&ensp;&ensp;선케어</a></li>
										<li><a href="#">&ensp;&ensp;메이크업</a></li>
										<li><a href="#">&ensp;&ensp;맨즈케어</a></li>
										<li><a href="#">&ensp;&ensp;뷰티소품·기기</a></li>
									</ul>
							</a></li>
							<li><a href="#">&ensp;&ensp;헤어·바디·구강
									<ul class="main3">
										<li><a href="#">&ensp;&ensp;구강·면도</a></li>
										<li><a href="#">&ensp;&ensp;샴푸·컨디셔너</a></li>
										<li><a href="#">&ensp;&ensp;트리트먼트·팩</a></li>
										<li><a href="#">&ensp;&ensp;헤어에센스·염모</a></li>
										<li><a href="#">&ensp;&ensp;바디워시·스크럽</a></li>
										<li><a href="#">&ensp;&ensp;바디로션·크림</a></li>
										<li><a href="#">&ensp;&ensp;핸드·립·데오</a></li>
										<li><a href="#">&ensp;&ensp;향수·디퓨저</a></li>
										<li><a href="#">&ensp;&ensp;헤어·바디소품</a></li>
									</ul>
							</a></li>
							<li><a href="#">&ensp;&ensp;주방용품
									<ul class="main3">
										<li><a href="#">&ensp;&ensp;주방소모품·잡화</a></li>
										<li><a href="#">&ensp;&ensp;주방·조리도구</a></li>
										<li><a href="#">&ensp;&ensp;냄비·팬·솥</a></li>
										<li><a href="#">&ensp;&ensp;보관용기·텀블러</a></li>
										<li><a href="#">&ensp;&ensp;식기·테이블웨어</a></li>
										<li><a href="#">&ensp;&ensp;컵·잔·커피도구</a></li>
									</ul>
							</a></li>
							<li><a href="#">&ensp;&ensp;가전제품
									<ul class="main3">
										<li><a href="#">&ensp;&ensp;주방가전</a></li>
										<li><a href="#">&ensp;&ensp;생활가전</a></li>
										<li><a href="#">&ensp;&ensp;계절가전</a></li>
										<li><a href="#">&ensp;&ensp;디지털·PC</a></li>
										<li><a href="#">&ensp;&ensp;대형·설치가전</a></li>
									</ul>
							</a></li>
							<li><a href="#">&ensp;&ensp;반려동물
									<ul class="main3">
										<li><a href="#">&ensp;&ensp;강아지 간식</a></li>
										<li><a href="#">&ensp;&ensp;강아지 주식</a></li>
										<li><a href="#">&ensp;&ensp;고양이 간식</a></li>
										<li><a href="#">&ensp;&ensp;고양이 주식</a></li>
										<li><a href="#">&ensp;&ensp;반려동물 용품</a></li>
										<li><a href="#">&ensp;&ensp;배변·위생</a></li>
										<li><a href="#">&ensp;&ensp;소용량·샘플</a></li>
									</ul>
							</a></li>
							<li><a href="#">&ensp;&ensp;베이비·키즈·완구
									<ul class="main3">
										<li><a href="#">&ensp;&ensp;분유·간편 이유식</a></li>
										<li><a href="#">&ensp;&ensp;이유식 재료</a></li>
										<li><a href="#">&ensp;&ensp;간식·음식·음료</a></li>
										<li><a href="#">&ensp;&ensp;건강식품</a></li>
										<li><a href="#">&ensp;&ensp;이유·수유용품</a></li>
										<li><a href="#">&ensp;&ensp;기저귀·물티슈</a></li>
										<li><a href="#">&ensp;&ensp;세제·위생용품</a></li>
										<li><a href="#">&ensp;&ensp;스킨·구강케어</a></li>
										<li><a href="#">&ensp;&ensp;완구·잡화류</a></li>
									</ul>
							</a></li>
							<li><a href="#">&ensp;&ensp;컬리의 추천
									<ul>

									</ul>
							</a></li>
						</ul></li>
					<li><a href="/SAZO/market/list_new.do?num=2"><b>신상품</b></a></li>
					<li><a href="/SAZO/market/list_best.do?num=1"><b>베스트</b></a></li>
					<li><a href="/SAZO/market/list_price.do?num=3"><b>알뜰쇼핑</b></a></li>
					<li><a href="/SAZO/market/list_new.do?num=2"><b>특가/혜택</b></a></li>

					<li><input name="searchValue" class="search" type="text"
						value="" placeholder="검색어를 입력해주세요"> <a
						href="/SAZO/market/search.do?num=2"><img class="search_icon"
							src="/SAZO//image/ico_search_40x40.png"></a></li>

				</ul>
				<ul id="logos1">
					<li id="logos"><a href="#"><img
							src="/SAZO//image/ico_delivery_setting.png" alt="위치로고"></a></li>
					<li id="logos"><a href="#"><img
							src="/SAZO//image/btn-heart-off.png" alt="위시리트스로고"></a></li>
					<li id="logos"><a href="/SAZO/market/basketck.do"><img
							src="/SAZO//image/ico_cart.png" alt="카트로고"></a></li>
				</ul>
			</div>
			<hr class="hr1">
		</header>



<div class="section_login">
<h3 class="tit_login">로그인</h3>
<div class="write_form">
<div class="write_view_login_view">

<form method="post" name="myForm" id="form" action="">
<input type=hidden name=returnUrl value="">
<input type=hidden name=return_url value="">
<input type=hidden name=recommend_id value="">
<input type=hidden name=close value="">
<input type="text" name="id" size="20" tabindex="1" value="" placeholder="아이디를 입력해주세요">
<input type="password" name="pwd" size="20" tabindex="2" placeholder="비밀번호를 입력해주세요">
<div class="checkbox_save">
<label class="label_checkbox checked">
<input type="checkbox" id="chk_security" name="chk_security" value="y" checked="checked" onChange="if( this.checked){$(this).parent().addClass('checked')}else{$(this).parent().removeClass('checked')} ">
보안접속
</label>

<div class="login_search">
<a class="link" onclick="KurlyTrackerLink('/member/find/id', 'select_find_id')" href="#none">
아이디 찾기
</a>
<span class="bar"></span>
<a class="link" onclick="KurlyTrackerLink('/member/find/password', 'select_find_password')" href="#none">
비밀번호 찾기
</a>
</div>
</div>
<!-- 로그인하면 메인페이지로 가게끔 -->
<button class="btn_type1" type="button" onclick="sendIt();">
<span class="txt_type">로그인</span>
</button>
</form>


<form action="" name="myForm2">
<a class="btn_type2 btn_member" onclick="join();" href="#none">
<span class="txt_type">회원가입</span>
</a>
</form>
<!--  회원가입 버튼을 누르면 회원가입창으로 가게끔. -->

</div>
</div>
</div>
<br><br><br><br><br><br><br><br><br><br>
		<footer>
            <hr class=hr2>
            <img class="fi" src="/SAZO//image/footer_img.jpg" alt="푸터 이미지">
            <div class="divfp">
                <p class="fp">
                    마켓컬리에서 판매되는 상품 중에는 마켓컬리에 입점한 개별 판매자가 판매하는 마켓플레이스(오픈마켓) 상품이 포함되어 있습니다.<br>
                    마켓플레이스(오픈마켓) 상품의 경우 컬리는 통신판매중개자로서 통신판매의 당사자가 아닙니다. 컬리는 해당 상품의 주문, 품질, 교환/환불 등 의무와 책임을 부담하지 않습니다.<br>
                    © KURLY CORP. ALL RIGHTS RESERVED</p>
            </div>
        </footer>
</body> 
</html>