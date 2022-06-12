<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/SAZO/css/real_main.css">
<title>메인페이지</title>

<script type="text/javascript">
    
    	function search(){
    		
    		f = document.search;
    		f.action="<%=cp%>/market/search.do?num=2";
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


		<!--메인페이지-->
		<main> <!-- 메인페이지 배너-->
		<section class="main_visual">
			<ul class="main_v_list">
				<li><img src="/SAZO//image/main_ex1.jpg" alt="메인이미지"></li>
				<li><img src="/SAZO//image/main_ex2.jpg" alt="메인이미지"></li>
				<li><img src="/SAZO//image/main_ex3.jpg" alt="메인이미지"></li>
				<li><img src="/SAZO//image/main_ex4.jpg" alt="메인이미지"></li>
				<li><img src="/SAZO//image/main_ex5.jpg" alt="메인이미지"></li>
			</ul>
		</section>
		<img class="arrow_right1" src="/SAZO//image/arrow_right1.png"
			alt="오른쪽 화살표"> <img class="arrow_left1"
			src="/SAZO//image/arrow_left1.png" alt="왼쪽 화살표"> <!--상품 리스트-->
		<a href="#">
			<p class="list_sub">베스트 상품!</p>
		</a>
		<div class="pro_list">
			<ul class="list">
				<li><img src="../image/sample1.jpg"><br>
				<br> <span id="pro_name"><b>담금초</b></span><br>
				<br> <span id="pro_sale"><b>20%</b></span> &nbsp;<span
					id="pro_price">16,000원</span><br>
				<br> <span id="pro_realprice">20,000원</span></li>
				<li><img src="../image/sample2.jpg"><br>
				<br> <span id="pro_name"><b>김치찌개</b></span><br>
				<br> <span id="pro_sale"><b>10%</b></span> &nbsp;<span
					id="pro_price">9,000원</span><br>
				<br> <span id="pro_realprice">10,000원</span></li>
				<li><img src="../image/sample3.jpeg"><br>
				<br> <span id="pro_name"><b>사과는 애뽈 5개입</b></span><br>
				<br> <span id="pro_sale"><b></b></span> &nbsp;<span
					id="pro_price">2,500원</span><br>
				<br> <span id="pro_realprice"></span></li>
				<li><img src="../image/sample4.jpg"><br>
				<br> <span id="pro_name"><b>부침 &amp; 튀김가루</b></span><br>
				<br> <span id="pro_sale"><b>85%</b></span> &nbsp;<span
					id="pro_price">5,000원</span><br>
				<br> <span id="pro_realprice">75,000원</span></li>
				<li><img src="../image/sample3.jpeg"><br>
				<br> <span id="pro_name"><b>사과는 애뽈 5개입</b></span><br>
				<br> <span id="pro_sale"><b></b></span> &nbsp;<span
					id="pro_price">2,500원</span><br>
				<br> <span id="pro_realprice"></span></li>
				<li><img src="../image/sample1.jpg"><br>
				<br> <span id="pro_name"><b>담금초</b></span><br>
				<br> <span id="pro_sale"><b>20%</b></span> &nbsp;<span
					id="pro_price">16,000원</span><br>
				<br> <span id="pro_realprice">20,000원</span></li>
				<li><img src="../image/sample2.jpg"><br>
				<br> <span id="pro_name"><b>김치찌개</b></span><br>
				<br> <span id="pro_sale"><b>10%</b></span> &nbsp;<span
					id="pro_price">9,000원</span><br>
				<br> <span id="pro_realprice">10,000원</span></li>
			</ul>
		</div>
		<img class="arrow_right" src="../image/arrow_right.png" alt="오른쪽 화살표">
		<img class="arrow_left" src="../image/arrow_left.png" alt="왼쪽 화살표">

		<div class="banner1">
			<img src="../image/sample7.jpg">
		</div>

		<p class="product_recom">MD추천</p>
		<div class="md_reco">
			<input type="radio" id="tab-1" name="show" checked /> <input
				type="radio" id="tab-2" name="show" /> <input type="radio"
				id="tab-3" name="show" /> <input type="radio" id="tab-4"
				name="show" /> <input type="radio" id="tab-5" name="show" /> <input
				type="radio" id="tab-6" name="show" /> <input type="radio"
				id="tab-7" name="show" /> <input type="radio" id="tab-8"
				name="show" /> <input type="radio" id="tab-9" name="show" /> <input
				type="radio" id="tab-10" name="show" /> <input type="radio"
				id="tab-11" name="show" /> <input type="radio" id="tab-12"
				name="show" /> <input type="radio" id="tab-13" name="show" /> <input
				type="radio" id="tab-14" name="show" /> <input type="radio"
				id="tab-15" name="show" /> <input type="radio" id="tab-16"
				name="show" /> <input type="radio" id="tab-17" name="show" /> <input
				type="radio" id="tab-18" name="show" /> <input type="radio"
				id="tab-19" name="show" />

			<div class="md_recom1">
				<label for="tab-1">&ensp;선물하기&ensp;</label> <label for="tab-2">&ensp;채소&ensp;</label>
				<label for="tab-3">&ensp;과일·견과·쌀&ensp;</label> <label for="tab-4">&ensp;수산·해산·건어물&ensp;</label>
				<label for="tab-5">&ensp;정육·계란&ensp;</label> <label for="tab-6">&ensp;국·반찬·메인요리&ensp;</label>
				<label for="tab-7">&ensp;샐러드·간편식&ensp;</label> <label for="tab-8">&ensp;면·양념·오일&ensp;</label>
			</div>
			<div class="md_recom2">
				<label for="tab-9">&ensp;생수·음료·우유·커피&ensp;</label> <label
					for="tab-10">&ensp;간식·과자·떡&ensp;</label> <label for="tab-11">&ensp;베이커리·치즈·델리&ensp;</label>
				<label for="tab-12">&ensp;건강식품&ensp;</label> <label for="tab-13">&ensp;생활용품·리빙·캠핑&ensp;</label>
				<label for="tab-14">&ensp;스킨케어·메이크업&ensp;</label> <label
					for="tab-15">&ensp;헤어·바디·구강&ensp;</label>
			</div>
			<div class="md_recom3">
				<label for="tab-16">&ensp;주방용품 &ensp;</label> <label for="tab-17">&ensp;가전제품&ensp;</label>
				<label for="tab-18">&ensp;반려동물&ensp;</label> <label for="tab-19">&ensp;베이비·키즈·완구&ensp;</label>
			</div>

			<div class="md_pro1">
				<div>
					<ul class="list1">
						<li><img src="../image/Godiva.jpg"><br>
						<br> <span id="pro_name"><b>고디바</b></span><br>
						<br> <span id="pro_sale"><b></b></span> &nbsp;<span
							id="pro_price">43,000원</span><br>
						<br> <span id="pro_realprice"></span></li>
						<li><img src="../image/body1.jpg"><br>
						<br> <span id="pro_name"><b> 마르마르디 바디 디럭스 세트 </b></span><br>
						<br> <span id="pro_sale"><b></b></span> &nbsp;<span
							id="pro_price">24,900원</span><br>
						<br> <span id="pro_realprice"></span></li>
						<li><img src="../image/body2.jpg"><br>
						<br> <span id="pro_name"><b>마르마르디 바디스프레이 세트</b></span><br>
						<br> <span id="pro_sale"><b>10%</b></span> &nbsp;<span
							id="pro_price">27,000원</span><br>
						<br> <span id="pro_realprice">30,000원</span></li>
						<li><img src="../image/potato.jpg"><br>
						<br> <span id="pro_name"><b>강원도 춘천 감자빵</b></span><br>
						<br> <span id="pro_sale"><b>20%</b></span> &nbsp;<span
							id="pro_price">16,000원</span><br>
						<br> <span id="pro_realprice">20,000원</span></li>
						<a href="#">
							<li id="md_pro_p">선물하기 〉</li>
						</a>
					</ul>
				</div>

				<div>
					<ul class="list1">
						<li><img src="../image/swpo.jpg"><br>
						<br> <span id="pro_name"><b>[무농약]고구마</b></span><br>
						<br> <span id="pro_sale"><b>10%</b></span> &nbsp;<span
							id="pro_price">8,990원</span><br>
						<br> <span id="pro_realprice">원래가격 얼마일까</span></li>
						<li><img src="../image/nang.jpg"><br>
						<br> <span id="pro_name"><b>냉이 150g</b></span><br>
						<br> <span id="pro_sale"><b></b></span> &nbsp;<span
							id="pro_price">5,190원</span><br>
						<br> <span id="pro_realprice"></span></li>
						<li><img src="../image/kong.jpg"><br>
						<br> <span id="pro_name"><b>[무농약]콩나물 300g</b></span><br>
						<br> <span id="pro_sale"><b>10%</b></span> &nbsp;<span
							id="pro_price">900원</span><br>
						<br> <span id="pro_realprice">1000원</span></li>
						<li><img src="../image/papu.jpg"><br>
						<br> <span id="pro_name"><b>파프리카 2입</b></span><br>
						<br> <span id="pro_sale"><b></b></span> &nbsp;<span
							id="pro_price">3,980원</span><br>
						<br> <span id="pro_realprice"></span></li>
						<a href="/SAZO/market/list_cate.do?category=veg">
							<li id="md_pro_p">채소 〉</li>
						</a>
					</ul>
				</div>

				<div>
					<ul class="list1">
						<li><img src="../image/apple.jpg"><br>
						<br> <span id="pro_name"><b>부사는 동사</b></span><br>
						<br> <span id="pro_sale"><b>10%</b></span> &nbsp;<span
							id="pro_price">9,000원</span><br>
						<br> <span id="pro_realprice">10,000원</span></li>
						<li><img src="../image/kome.jpg"><br>
						<br> <span id="pro_name"><b>참, 외롭다</b></span><br>
						<br> <span id="pro_sale"><b></b></span> &nbsp;<span
							id="pro_price">29,900원</span><br>
						<br> <span id="pro_realprice"></span></li>
						<li><img src="../image/str.jpg"><br>
						<br> <span id="pro_name"><b>딸기는 딸기</b></span><br>
						<br> <span id="pro_sale"><b>50%</b></span> &nbsp;<span
							id="pro_price">10,000원</span><br>
						<br> <span id="pro_realprice">20,000원</span></li>
						<li><img src="../image/oran.jpg"><br>
						<br> <span id="pro_name"><b>오렌지를 먹어본지</b></span><br>
						<br> <span id="pro_sale"><b>10%</b></span> &nbsp;<span
							id="pro_price">18,000원</span><br>
						<br> <span id="pro_realprice">20,000원</span></li>
						<a href="/SAZO/market/list_cate.do?category=fruit">
							<li id="md_pro_p">과일·견과·쌀 〉</li>
						</a>
					</ul>
				</div>

				<div>
					<ul class="list1">
						<li><img src="../image/oys.jpg"><br>
						<br> <span id="pro_name"><b>굴은 굴이다</b></span><br>
						<br> <span id="pro_sale"><b>50%</b></span> &nbsp;<span
							id="pro_price">25,000원</span><br>
						<br> <span id="pro_realprice">50,000원</span></li>
						<li><img src="../image/squ.jpg"><br>
						<br> <span id="pro_name"><b>오징오징어</b></span><br>
						<br> <span id="pro_sale"><b>20%</b></span> &nbsp;<span
							id="pro_price">16,000원</span><br>
						<br> <span id="pro_realprice">20,000원</span></li>
						<li><img src="../image/sal.jpg"><br>
						<br> <span id="pro_name"><b>연어존맛탱</b></span><br>
						<br> <span id="pro_sale"><b></b></span> &nbsp;<span
							id="pro_price">18,000원</span><br>
						<br> <span id="pro_realprice"></span></li>
						<li><img src="../image/ggo.jpg"><br>
						<br> <span id="pro_name"><b>꼬막은 꼬막해</b></span><br>
						<br> <span id="pro_sale"><b>10%</b></span> &nbsp;<span
							id="pro_price">9,000원</span><br>
						<br> <span id="pro_realprice">10,000원</span></li>
						<a href="/SAZO/market/list_cate.do?category=fish">
							<li id="md_pro_p">수산·해산·건어물 〉</li>
						</a>
					</ul>
				</div>

				<div>
					<ul class="list1">
						<li><img src="../image/chch.jpg"><br>
						<br> <span id="pro_name"><b>양념칙흰구의</b></span><br>
						<br> <span id="pro_sale"><b></b></span> &nbsp;<span
							id="pro_price">15,000원</span><br>
						<br> <span id="pro_realprice"></span></li>
						<li><img src="../image/chineck.jpg"><br>
						<br> <span id="pro_name"><b>닭을꼬치</b></span><br>
						<br> <span id="pro_sale"><b>5%</b></span> &nbsp;<span
							id="pro_price">8,900원</span><br>
						<br> <span id="pro_realprice">15,000원</span></li>
						<li><img src="../image/koka4.jpg"><br>
						<br> <span id="pro_name"><b>한우는비싸</b></span><br>
						<br> <span id="pro_sale"><b>12%</b></span> &nbsp;<span
							id="pro_price">89,000원</span><br>
						<br> <span id="pro_realprice">95,000원</span></li>
						<li><img src="../image/ko.jpg"><br>
						<br> <span id="pro_name"><b>꼬치</b></span><br>
						<br> <span id="pro_sale"><b>50%</b></span> &nbsp;<span
							id="pro_price">10,000원</span><br>
						<br> <span id="pro_realprice">20,000원</span></li>
						<a href="/SAZO/market/list_cate.do?category=meat">
							<li id="md_pro_p">정육·계란 〉</li>
						</a>
					</ul>
				</div>

			</div>
			<div class="banner1">
				<a href="#"><img
					src="../image/%EB%A7%88%EC%BC%93%EC%BB%AC%EB%A6%AC%20%ED%95%98%EB%8B%A8%20%EB%B0%B0%EB%84%88.jpg"></a>
			</div>
			<footer>
				<hr class=hr2>
				<img class="fi" src="../image/footer_img.jpg" alt="푸터 이미지">
				<div class="divfp">
					<p class="fp">
						마켓컬리에서 판매되는 상품 중에는 마켓컬리에 입점한 개별 판매자가 판매하는 마켓플레이스(오픈마켓) 상품이 포함되어
						있습니다.<br> 마켓플레이스(오픈마켓) 상품의 경우 컬리는 통신판매중개자로서 통신판매의 당사자가 아닙니다.
						컬리는 해당 상품의 주문, 품질, 교환/환불 등 의무와 책임을 부담하지 않습니다.<br> © KURLY
						CORP. ALL RIGHTS RESERVED
					</p>
				</div>
			</footer>

		</div>
		</main>
	</div>
	<script src="/SAZO/js/main_banner.js"></script>
	<script src="/SAZO/js/pro_list.js"></script>
</body>
</html>
