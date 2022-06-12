<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<%--  <link rel="stylesheet" type="text/css" href="<%=cp %>/login/css/style.css"/>
<link rel="stylesheet" type="text/css" href="<%=cp %>/login/css/style2.css"/> --%>
<link rel="stylesheet" type="text/css" href="<%=cp %>/login/css/style3.css"/>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/mylist.css" /> 
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/real_main.css" /> 

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
<div class="tit_page">
<h2 class="tit">공지사항</h2>
<p class="sub">컬리의 새로운 소식들과 유용한 정보들을 한곳에서 확인하세요.</p>
</div>
<div id="main">
<div id="content">

<div id="qnb" class="quick-navigation">
<style>
    #qnb{position:absolute;z-index:1;right:20px;top:70px;width:80px;font:normal 12px/16px "Noto Sans";color:#333;letter-spacing:-0.3px;transition:top 0.2s}
    .goods-goods_view #qnb{top:20px}
    /* 배너 */
    #qnb .bnr_qnb{padding-bottom:7px}
    #qnb .bnr_qnb .thumb{width:80px;height:120px;vertical-align:top}
    /* 메뉴 */    
    #qnb .side_menu{width:80px;border:1px solid #ddd;border-top:0 none;background-color:#fff}
    #qnb .link_menu{display:block;height:29px;padding-top:5px;border-top:1px solid #ddd;text-align:center}
    #qnb .link_menu:hover,
    #qnb .link_menu.on{color:#5f0080}
    /* 최근본상품 */
    #qnb .side_recent{position:relative;margin-top:6px;border:1px solid #ddd;background-color:#fff}
    #qnb .side_recent .tit{display:block;padding:22px 0 6px;text-align:center}
    #qnb .side_recent .list_goods{overflow:hidden;position:relative;width:60px;margin:0 auto}
    #qnb .side_recent .list{position:absolute;left:0;top:0}
    #qnb .side_recent .link_goods{display:block;overflow:hidden;width:60px;height:80px;padding:1px 0 2px}
    #qnb .side_recent .btn{display:block;overflow:hidden;width:100%;height:17px;border:0 none;font-size:0;line-height:0;text-indent:-9999px}
    
    #qnb .side_recent .btn_up{position:absolute;left:0;top:0;background:url(https://res.kurly.com/pc/service/main/2002/ico_quick_up_hover.png) no-repeat 50% 50%}
    #qnb .side_recent .btn_up.off{background:url(https://res.kurly.com/pc/service/main/2002/ico_quick_up.png) no-repeat 50% 50%}
    #qnb .side_recent .btn_down{background:url(https://res.kurly.com/pc/service/main/2002/ico_quick_down_hover.png) no-repeat 50% 0}
    #qnb .side_recent .btn_down.off{background:url(https://res.kurly.com/pc/service/main/2002/ico_quick_down.png) no-repeat 50% 0}
    
    
    @media
    only screen and (-webkit-min-device-pixel-ratio: 1.5),
    only screen and (min-device-pixel-ratio: 1.5),
    only screen and (min-resolution: 1.5dppx) {
        #qnb .side_recent .btn_up{background-image:url(https://res.kurly.com/pc/service/main/2002/ico_quick_up_hover_x2.png);background-size:12px 18px}
        #qnb .side_recent .btn_down{background-image:url(https://res.kurly.com/pc/service/main/2002/ico_quick_down_hover_x2.png);background-size:12px 18px}
        #qnb .side_recent .btn_up.off{background-image:url(https://res.kurly.com/pc/service/main/2002/ico_quick_up_x2.png);background-size:12px 18px}
        #qnb .side_recent .btn_down.off{background-image:url(https://res.kurly.com/pc/service/main/2002/ico_quick_down_x2.png);background-size:12px 18px}
    }
    @media all and (max-width: 1250px){
        #qnb{display:none}
    }
</style>

<div class="bnr_qnb" id="brnQuick"></div>
<script>
    var brnQuick = {
        nowTime : '1646027835898',
        update : function(){
            $.ajax({
                url : campaginUrl + 'pc/service/bnr_quick.html'
            }).done(function(result){
                $('#brnQuick').html(result);
            });    
        }
    }
    brnQuick.update();
</script>
<script>
/**
 * 상품상세일때 현재 보고 있는 상품 담기. 상품URL & 상품이미지
 * 최종 저장 날짜로 부터 24시가 지날시 localStorage 삭제
 */
var getGoodsRecent = (function(){
    var i, len, getGoodsRecent, item, _nowTime = '1646027835898';

    _goodsRecent();
    function _goodsRecent(){
        if(localStorage.getItem('goodsRecent') === null){
            return false;
        }
        
        try{
            getGoodsRecent = JSON.parse(localStorage.getItem("goodsRecent"));
            len = getGoodsRecent.length;
            if(addDays(getGoodsRecent[len - 1].time, 1) < _nowTime){
                localStorage.removeItem('goodsRecent');
            }else{
                for(i = 0; i < len; i++){
                    item = '<li><a class="link_goods" href="/shop/goods/goods_view.php?goodsno=' + getGoodsRecent[i].no + '"><img src="' + getGoodsRecent[i].thumb + '" alt=""></a></li>';
                    $('.side_recent .list').append(item);
                }
                $('.side_recent').show();
            }
        } catch(e){
            console.log("JSON parse error from the Quick menu goods list!!!", e);
        }
    }

    function addDays(date, days){
        var result = new Date(date);
        result.setDate(result.getDate() + days);
        return result.getTime();
    }
    
    // return {
    // }
})();
</script>
</div>
<div class="layout-wrapper">
<div class="xans-element- xans-myshop xans-myshop-couponserial ">
<table width=100% align=center cellpadding=0 cellspacing=0>
<tr>
<td>
<table width=100%>
<tr>
<td>
<table class="boardView" width=100%>
<tr>
<th scope="row" style="border:none;">제목</th>
<td>마켓컬리 배송 안내</td>
</tr>
<tr>
<th scope="row">작성자</th>
<td>MarketKurly</td>
</tr>
<tr class="etcArea">
<td colspan="2">
<ul>
<li class="date ">
<strong class="th">작성일</strong> <span class="td">2016-01-08</span>
</li>
<li class="hit ">
<strong class="th">조회수</strong> <span class="td">3017890</span>
</li>
</ul>
</td>
</tr>
</table>
</td>
</tr>
<tr>
<td align=right class=eng style="padding:5px;">
</td>
</tr>
<tr>
<td id="noticeView"></td>
<script>
			var noticeView = new Vue({
				el: '#noticeView',
				data: {
					getData:null,
					eventPage: [], // 데이터불러오기
					eventView : null,
					type: 'pc'
				},
				methods: {
					update:function(){
						var $self = this;

                        // IE9 대응 스크립트 (ie9 이하에서만 window.XDomainRequest true)
                        if ( window.XDomainRequest ) {
                            jQuery.ajaxTransport(function( s ) {
                                if ( s.crossDomain && s.async ) {
                                    if ( s.timeout ) {
                                        s.xdrTimeout = s.timeout;
                                        delete s.timeout;
                                    }
                                    var xdr;
                                    return {
                                        send: function( _, complete ) {
                                            function callback( status, statusText, responses, responseHeaders ) {
                                                xdr.onload = xdr.onerror = xdr.ontimeout = jQuery.noop;
                                                xdr = undefined;
                                                complete( status, statusText, responses, responseHeaders );
                                            }
                                            xdr = new XDomainRequest();
                                            xdr.onload = function() {
                                                callback( 200, "OK", { text: xdr.responseText }, "Content-Type: " + xdr.contentType );
                                            };
                                            xdr.onerror = function() {
                                                callback( 404, "Not Found" );
                                            };
                                            xdr.onprogress = jQuery.noop;
                                            xdr.ontimeout = function() {
                                                callback( 0, "timeout" );
                                            };
                                            xdr.timeout = s.xdrTimeout || Number.MAX_VALUE;
                                            xdr.open( s.type, s.url );
                                            xdr.send( ( s.hasContent && s.data ) || null );
                                        },
                                        abort: function() {
                                            if ( xdr ) {
                                                xdr.onerror = jQuery.noop;
                                                xdr.abort();
                                            }
                                        }
                                    };
                                }
                            });
                        }

						$.ajax({
							url : campaginUrl + '/pc/notice/64.html'
						}).done(function(result){
							$('#noticeView').html(result);
						});
					}
				}
			});
			noticeView.update();
		</script>
</tr>
<tr><td height=1 bgcolor="#f4f4f4"></td></tr>
</table><br>
<table width=100% style="table-layout:fixed" cellpadding=0 cellspacing=0>
<tr>
<td align=center style="padding-top:10px;">
<table width=100%>
<tr>
<img src="/SAZO/image/img_main_190528_v2.jpg">
<img src="/SAZO/image/img_delivery1_v3.jpg">
<img src="/SAZO/image/img_delivery2.jpg">
<img src="/SAZO/image/img_delivery3.jpg">
<img src="/SAZO/image/img_delivery5.jpg">
<img src="/SAZO/image/bg_btm_delivery.jpg">
</tr>
<tr>
<td align=right><br/>
<a href="list.php?id=notice"><span class="bhs_button yb" style="float:none;">목록</span></a>
</td>
</tr>
</table>
</td>
</tr>
</table>
<div class="xans-element- xans-board xans-board-movement-1002 xans-board-movement xans-board-1002 "><ul>
<li class="prev ">
<strong>이전글</strong><a href="/board/free/read.html?no=27121&amp;board_no=1&amp;page="><a href="view.php?id=notice&no=55">후기게시판(Product review)과 1:1문의 게시판 운영정책</a>
</li>
<li class="next ">
<strong>다음글</strong><a href="/board/free/read.html?no=22443&amp;board_no=1&amp;page="><a href="view.php?id=notice&no=67">냉동제품 포장방법 변경(1/11~)에 대한 안내의 글</a>
</li>
</ul>
</div>
<br><table width=100% cellpadding=5 cellspacing=0>
<col width=100 align=right bgcolor=#f7f7f7 style="padding-right:10px">
<col style="padding-left:10px">
</table><p>
<br><textarea id=examC_64 style="display:none;width:100%;height:300px">&lt;div class=&quot;board_64&quot;&gt;

&lt;div class=&quot;view_pc&quot;&gt;

&lt;img src=&quot;https://res.kurly.com/images/cms/2019/notice/1905/pc/img_main_190528_v2.jpg&quot; alt=&quot;&quot; style=&quot;display:block&quot;&gt;
&lt;img src=&quot;https://res.kurly.com/images/cms/2019/notice/1905/pc/img_delivery1_190528_v2.jpg&quot; alt=&quot;&quot; style=&quot;display:block&quot;&gt;
&lt;img src=&quot;https://res.kurly.com/images/cms/2019/notice/1905/pc/img_delivery2_190528_v2.jpg&quot; alt=&quot;&quot; style=&quot;display:block&quot;&gt;
&lt;img src=&quot;https://res.kurly.com/images/cms/2019/notice/1905/pc/img_delivery3_190528_v3.jpg&quot; alt=&quot;&quot; style=&quot;display:block&quot;&gt;
&lt;img src=&quot;https://res.kurly.com/images/cms/2019/notice/1905/pc/img_delivery4_190528_v2.jpg&quot; alt=&quot;&quot; style=&quot;display:block&quot;&gt;

&lt;a href=&quot;javascript:address_chk_popup();&quot;&gt;
&lt;img src=&quot;https://res.kurly.com/images/cms/2019/notice/1905/pc/img_delivery5_190528_v2.jpg&quot; alt=&quot;&quot; style=&quot;display:block&quot;&gt;
&lt;/a&gt;

&lt;img src=&quot;https://res.kurly.com/images/cms/2019/notice/1905/pc/img_delivery6_190528_v2.jpg&quot; alt=&quot;&quot; style=&quot;display:block&quot;&gt;
&lt;img src=&quot;https://res.kurly.com/images/cms/2019/notice/1905/pc/img_delivery7_190528_v2.jpg&quot; alt=&quot;&quot; style=&quot;display:block&quot;&gt;
&lt;/div&gt;



&lt;div class=&quot;view_mobile&quot;&gt;

&lt;img src=&quot;https://res.kurly.com/images/cms/2019/notice/1905/mobile/m_img_main_190528.jpg&quot; alt=&quot;&quot; style=&quot;display:block&quot;&gt;
&lt;img src=&quot;https://res.kurly.com/images/cms/2019/notice/1905/mobile/m_img_cont1_190528.jpg&quot; alt=&quot;&quot; style=&quot;display:block&quot;&gt;
&lt;img src=&quot;https://res.kurly.com/images/cms/2019/notice/1905/mobile/m_img_cont2_190528_v2.jpg&quot; alt=&quot;&quot; style=&quot;display:block&quot;&gt;
&lt;img src=&quot;https://res.kurly.com/images/cms/2019/notice/1905/mobile/m_img_cont3_190528_v2.jpg&quot; alt=&quot;&quot; style=&quot;display:block&quot;&gt;

&lt;a href=&quot;javascript:address_chk_popup();&quot;&gt;
&lt;img src=&quot;https://res.kurly.com/images/cms/2019/notice/1905/mobile/m_img_cont4_190528.jpg&quot; alt=&quot;&quot; style=&quot;display:block&quot;&gt;
&lt;/a&gt;

&lt;div class=&quot;&quot; style=&quot;position:relative&quot;&gt;
&lt;div class=&quot;delivery_tab&quot;&gt;
&lt;img src=&quot;https://res.kurly.com/images/cms/2019/notice/1905/mobile/m_btn_delivery1_190528.jpg&quot; alt=&quot;&quot; style=&quot;display:block&quot;&gt;
&lt;img src=&quot;https://res.kurly.com/images/cms/2019/notice/1905/mobile/m_btn_delivery2_190528.jpg&quot; alt=&quot;&quot; style=&quot;display:none&quot;&gt;
&lt;/div&gt;
&lt;div class=&quot;delivery_select&quot;&gt;
&lt;a href=&quot;#none&quot; class=&quot;link_delivery1&quot; style=&quot;position:absolute;left:0;top:0;width:50%;height:100%&quot;&gt;&lt;/a&gt;
&lt;a href=&quot;#none&quot; class=&quot;link_delivery2&quot; style=&quot;position:absolute;right:0;top:0;width:50%;height:100%&quot;&gt;&lt;/a&gt;
&lt;/div&gt;
&lt;/div&gt;

&lt;div class=&quot;delivery_cont&quot;&gt;
&lt;img src=&quot;https://res.kurly.com/images/cms/2019/notice/1905/mobile/m_img_delivery1_190528_v2.jpg&quot; alt=&quot;&quot; style=&quot;display:block&quot;&gt;
&lt;img src=&quot;https://res.kurly.com/images/cms/2019/notice/1905/mobile/m_img_delivery2_190528.jpg&quot; alt=&quot;&quot; style=&quot;display:none&quot;&gt;
&lt;/div&gt;

&lt;/div&gt;

&lt;/div&gt;
</textarea>
</td></tr></table>
</div>
<script>
// KM-1483 Amplitude
KurlyTracker.setScreenName('delivery_guide'); // 배송안내
</script>
</div>
</div>


<!-- 하단 바 -->
<footer>
            <hr>
            <img class="fi" src="/SAZO/image/footer_img.jpg" alt="푸터 이미지">
            <div class="divfp">
                <p class="fp">
                    마켓컬리에서 판매되는 상품 중에는 마켓컬리에 입점한 개별 판매자가 판매하는 마켓플레이스(오픈마켓) 상품이 포함되어 있습니다.<br>
                    마켓플레이스(오픈마켓) 상품의 경우 컬리는 통신판매중개자로서 통신판매의 당사자가 아닙니다. 컬리는 해당 상품의 주문, 품질, 교환/환불 등 의무와 책임을 부담하지 않습니다.<br>
                    © KURLY CORP. ALL RIGHTS RESERVED</p>
            </div>
        </footer>
</body>
</html><script>
</script>