<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    request.setCharacterEncoding("UTF-8");
    String cp = request.getContextPath();
%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>마켓컬리 :: 내일의 장보기,마켓컬리</title>

<%-- <link rel="stylesheet" type="text/css" href="<%=cp%>/marketMember/css/join.css"/> --%>

<link rel="stylesheet" type="text/css" href="<%=cp%>/css/style.css"/>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/style2.css"/>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/style3.css"/>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/real_main.css" /> 
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/mylist.css" /> 
<script type="text/javascript" src="https://res.kurly.com/js/lib/jquery-1.10.2.min.js"></script>


<script type="text/javascript" src="<%=cp%>/js/util.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript">


	

	function sendIt() {
	
	var f = document.myForm;
	
		//아이디 입력 확인
		if(!f.id.value){
		alert("아이디 입력 하세요")
		f.id.focus();
		return;
		}//end 아이디 입력확인 
		
		//아이디 유효성
		for (var i = 0; i < f.id.value.length; i++) {
	            ch = f.id.value.charAt(i)
	            if (!(ch >= '0' && ch <= '9') && !(ch >= 'a' && ch <= 'z')&&!(ch >= 'A' && ch <= 'Z')) {
	                alert("아이디는 영문 대소문자, 숫자만 입력가능합니다.")
	                document.f.id.focus();
	                document.f.id.select();
	                return false;
	        }
	    }
		//end 아이디 유효성
		
		//아이디 길이
		 if (f.id.value.length<6 ) {
	            alert("아이디를 6자이상 입력해주세요.")
	            f.id.focus();
	            return false;
	        }
		//end 아이디 길이
		
		/* //아이디 중복체크
		if(f.chk.value == "0"){
			alert("아이디 중복체크를 해주세요")
			f.id.focus();
			return false;
		}//아이디 중복체크  */
			
		//비밀번호 입력여부
		if(!f.pwd.value){
		alert("비밀번호 입력 하세요")
		f.pwd.focus();
		return;
		}
		//end 비밀번호 입력여부
		
		//비밀번호 길이
		if(f.pwd.value.length<8 ){
			alert("비밀번호를 8자이상 입력바랍니다")
			f.pwd.focus();
			return;
		}//end 비밀번호 길이
		
		//비밀번호 재확인
		if(!f.pwd2.value){
			alert("비밀번호를 한번 더 입력바랍니다")
			f.pwd2.focus();
			return;
		}//end 비밀번호 재확인
		
		//비밀번호 비교
		if(f.pwd2.value!=f.pwd.value){
		alert("비밀번호가 일치하지 않습니다.")
		f.pwd2.focus();
		return; 
		}
		//end 비밀번호 비교
		
		//이름입력 여부 
		str = f.name.value;
		str = str.trim();
		
		if(!f.name.value){
		alert("이름 입력 하세요")
		f.name.focus();
		return;
		}
		
		if(!isValidKorean(str)){
		alert("\n이름에 숫자나 특수문자기호는 입력하실수 없습니다."
				+"\n다시한번 정확히 이름 입력 바랍니다.");
		f.name.focus()
		return;
		}	
		f.name.value = str;
		//end 이름입력 여부
		
		//이메일 입력 여부
		if(!f.email.value){
			alert("이메일 입력 하세요")
			f.email.focus();
			return;
		}
		//end 이메일 입력 여부
		
		//email 형식확인
		if(f.email.value){
			if(!isValidEmail(f.email.value)){
				alert("\n정상적인 E-Mail을 입력하세요.");
				f.email.focus();
				return;
			}
		}
		//end eamil 형식확인
		
		//전화번호 입력 여부
		if (!f.tel.value) {
			alert("전화번호를 입력하세요")
			f.tel.focus();
			return;
		}
		//end 전화번호 입력 여부
		
		//주소입력
		if(!f.addr1.value){
			alert("주소를 입력해주세요 ex)경기도")
			f.addr1.focus();
			return;
			}
		
		if(!f.addr2.value){
			alert("주소를 입력해주세요 ex)수원시")
			f.addr2.focus();
			return;
			}
		
		if(!f.addr3.value){
			alert("주소를 입력해주세요 ex)조원동")
			f.addr3.focus();
			return;
			}
		//end 주소입력
		
		f.action = "<%=cp %>/market/join_ok.do";
		f.submit();
		
		
	}//sendIt
	
	
	
	
	
	//중복검사 눌렀을때 새로운 창 띄우기 	
	function idCheck(){
		
	    var f = document.myForm;
		
		window.name = "parentForm";
	 	window.open("check.do",
	   	"myForm", "width=500, height=300, resizable = no, scrollbars = no");
	 	 
		
	
	<%-- f.action = "<%=cp %>/member/join_ok.do";
	f.submit(); --%>
	
	
	
	}//end openIdChk()
	
</script>
</head>
<body class="member-join">
<div class="container">
        <header>
            <div class="deliver">
                <a href="/SAZO/market/view.do">
                    <b><span>&nbsp;샛별·택배</span> 배송안내 〉</b>
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
                    <li><a href="/SAZO/market/mypage.do">${sessionScope.test.id }님 어서오세요.&emsp;|&emsp; </a></li>
           
                <a href="/SAZO/market/logout.do"> 
                    <li>로그아웃</li>
                </a>
           		 </c:if>     	
            </ul>
            </nav>
            <div class="logo">
                <a href="/SAZO/market/main.do"><img src="/SAZO//image/%EB%A7%88%EC%BC%93%EC%BB%AC%EB%A6%AC%20%EB%A1%9C%EA%B3%A0.png" alt="마켓컬리 로고" /></a>
            </div>

            <!--카테고리바-->
            <div class="manuBar">
                <ul class="main1">
                    <li><a href="#"><b><img src="/SAZO//image/ico_gnb_all_off.png" alt="카테고리 아이콘">&ensp;&ensp;전체 카테고리</b></a>
                        <ul class="main2">
                            <li><a href="#">&ensp;&ensp;채소
                                    <ul class="main3">
                                        <li><a href="#">&ensp;&ensp;친환경</a></li>
                                        <li><a href="#">&ensp;&ensp;고구마·감자·당근</a></li>
                                        <li><a href="#">&ensp;&ensp;시금치·쌈채소·나물</a></li>
                                        <li><a href="#">&ensp;&ensp;브로콜리·파프리카·양배추</a></li>
                                        <li><a href="#">&ensp;&ensp;양파·대파·마늘·배추</a></li>
                                        <li><a href="#">&ensp;&ensp;오이·호박·고추</a></li>
                                        <li><a href="#">&ensp;&ensp;냉동·이색·간편채소</a></li>
                                        <li><a href="#">&ensp;&ensp;콩나물·버섯</a></li>
                                    </ul>
                                </a></li>
                            <li><a href="#">&ensp;&ensp;과일·견과·쌀
                                    <ul class="main3">
                                        <li><a href="#">&ensp;&ensp;친환경</a></li>
                                        <li><a href="#">&ensp;&ensp;제철과일</a></li>
                                        <li><a href="#">&ensp;&ensp;국산과일</a></li>
                                        <li><a href="#">&ensp;&ensp;수입과일</a></li>
                                        <li><a href="#">&ensp;&ensp;간편과일</a></li>
                                        <li><a href="#">&ensp;&ensp;냉동·건과일</a></li>
                                        <li><a href="#">&ensp;&ensp;견과류</a></li>
                                        <li><a href="#">&ensp;&ensp;쌀·잡곡</a></li>
                                    </ul>
                                </a></li>
                            <li><a href="#">&ensp;&ensp;수산·해산·건어물
                                    <ul class="main3">
                                        <li><a href="#">&ensp;&ensp;제철수산</a></li>
                                        <li><a href="#">&ensp;&ensp;생선류</a></li>
                                        <li><a href="#">&ensp;&ensp;굴비·반건류</a></li>
                                        <li><a href="#">&ensp;&ensp;오징어·낙지·문어</a></li>
                                        <li><a href="#">&ensp;&ensp;새우·게·랍스터</a></li>
                                        <li><a href="#">&ensp;&ensp;해산물·조개류</a></li>
                                        <li><a href="#">&ensp;&ensp;수산가공품</a></li>
                                        <li><a href="#">&ensp;&ensp;김·미역·해조류</a></li>
                                        <li><a href="#">&ensp;&ensp;건어물·다시팩</a></li>
                                    </ul>
                                </a></li>
                            <li><a href="#">&ensp;&ensp;정육·계란
                                    <ul class="main3">
                                        <li><a href="#">&ensp;&ensp;국내산 소고기</a></li>
                                        <li><a href="#">&ensp;&ensp;수입산 소고기</a></li>
                                        <li><a href="#">&ensp;&ensp;돼지고기</a></li>
                                        <li><a href="#">&ensp;&ensp;계란류</a></li>
                                        <li><a href="#">&ensp;&ensp;닭·오리고기</a></li>
                                        <li><a href="#">&ensp;&ensp;양념육·돈까스</a></li>
                                        <li><a href="#">&ensp;&ensp;양고기</a></li>
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
                        </ul>
                    </li>
                    <li><a href="/SAZO/market/list_new.do?num=2"><b>신상품</b></a></li>
                    <li><a href="/SAZO/market/list_best.do?num=1"><b>베스트</b></a></li>
                    <li><a href="/SAZO/market/list_price.do?num=3"><b>알뜰쇼핑</b></a></li>
                    <li><a href="/SAZO/market/list_new.do?num=2"><b>특가/혜택</b></a></li>
				
                    <li><input name="searchValue" class="search" type="text" value="" placeholder="검색어를 입력해주세요">
                        <a href="/SAZO/market/search.do?num=2"><img class="search_icon" src="/SAZO//image/ico_search_40x40.png"></a>
                    </li>
               
                </ul>
                <ul id="logos1">
                    <li id="logos"><a href="#"><img src="/SAZO//image/ico_delivery_setting.png" alt="위치로고"></a></li>
                    <li id="logos"><a href="#"><img src="/SAZO//image/btn-heart-off.png" alt="위시리트스로고"></a></li>
                    <li id="logos"><a href="/SAZO/market/basketck.do"><img src="/SAZO//image/ico_cart.png" alt="카트로고"></a></li>
                </ul>
            </div>
            <hr class="hr1">
        </header>


<style>
  #headerLogo{position:relative;width:1050px;height:63px;margin:0 auto}
  #headerLogo .bnr_delivery{position:absolute;left:-1px;top:-28px;margin:auto;height:22px}
  #headerLogo .logo{position:absolute;left:0;bottom:6px;width:100%;height:79px;text-align:center}
  #headerLogo .logo .link_main{display:inline-block;height:79px}
  #headerLogo .logo img{display:block;width:103px;height:79px;margin:0 auto}
  #headerLogo .logo #gnbLogoContainer {margin:0 auto}
  #gnb.gnb_stop {height: 56px}
  #gnb.gnb_stop .fixed_container{position:fixed;z-index:300;left:0;top:0;width:100%}
  #gnb .gnb_kurly{position:relative;z-index:300;min-width:1050px;background-color:#fff;font-family:'Noto Sans';letter-spacing:-0.3px}
  #gnb .gnb_kurly:after{content:"";position:absolute;z-index:299;left:0;top:56px;width:100%;height:9px;background:url(https://res.kurly.com/pc/service/common/1902/bg_1x9.png) repeat-x 0 100%}
  #gnb .inner_gnbkurly{position:relative;width:1050px;height:56px;margin:0 auto}
  /* 검색창 */
  #gnb .gnb_search{position:absolute;right:174px;top:10px;width:242px}
  #gnb .gnb_search .inp_search{width:242px;height:36px;padding:0 60px 0 14px;border:1px solid #f7f7f6;border-radius:18px;background-color:#f7f7f7;font-family: 'Noto Sans';font-weight:400;font-size:12px;color:#666;line-height:16px;outline:none}
  #gnb .gnb_search .inp_search.focus{background-color:#fff;color:#333}
  #gnb .gnb_search .btn_search{position:absolute;right:5px;top:3px;width:30px;height:30px}
  /* 장바구니 */
  #gnb .cart_count{position:absolute;right:-5px;top:10px}
  #gnb .cart_count .inner_cartcount{text-align:center;font-weight:400}
  #gnb .cart_count .btn_cart{display:block;width:36px;height:36px;background:url(https://res.kurly.com/pc/service/common/2011/ico_cart.svg) no-repeat 50% 50%}
  #gnb .cart_count .btn_cart:hover{background:url(https://res.kurly.com/pc/service/common/2011/ico_cart_on.svg?v=1) no-repeat 50% 50%}
  #gnb .cart_count .num{display:none;position:absolute;left:19px;top:-1px;min-width:20px;height:20px;padding:0 5px;border:2px solid #fff;border-radius:10px;background-color:#5f0080;font-size:9px;color:#fff;line-height:15px;text-align:center;white-space:nowrap}
  #gnb .cart_count img{display:block;width:36px;height:36px;margin:0 auto}
  #gnb .cart_count .msg_cart{display:none;position:absolute;right:-7px;top:61px;width:348px;border:1px solid #ddd;background-color:#fff;/* opacity:0; */}
  #gnb .cart_count .inner_msgcart{display:block;overflow:hidden;padding:20px 0 20px 20px}
  #gnb .cart_count .msg_cart .thumb{float:left;width:46px;height:60px}
  #gnb .cart_count .msg_cart .desc{float:left;width:260px;padding:8px 0 0 20px;font-weight:700;font-size:14px;line-height:21px}
  #gnb .cart_count .msg_cart .desc.add{padding-top:0;margin-top:-5px;}
  #gnb .cart_count .msg_cart .tit{display:block;overflow:hidden;width:100%;color:#999;white-space:nowrap;text-overflow:ellipsis}
  #gnb .cart_count .msg_cart .name{overflow:hidden;float:left;max-width:178px;text-overflow:ellipsis}
  #gnb .cart_count .msg_cart .txt{display:block;padding-top:3px;color:#333}
  #gnb .cart_count .msg_cart .point{position:absolute;right:13px;top:-14px;width:20px;height:14px;background:url(https://res.kurly.com/pc/ico/1903/ico_layer_point.png) no-repeat 0 0}
  #gnb .cart_count .msg_cart .repeat{display:none}
  #gnb .cart_count .msg_cart .add .repeat{display:block}
  /* GNB메인 */
  #gnb .gnb_main{overflow:hidden;width:1050px;margin:0 auto}
  #gnb .gnb_main .gnb{float:left;width:100%}
  #gnb .gnb_main .gnb li{float:left}
  #gnb .gnb_main .gnb .lst{background:none}
  #gnb .gnb_main .gnb a{overflow:hidden;float:left;width:124px;height:55px;padding:16px 0 0;font-size:16px;color:#333;line-height:20px;text-align:center}
  #gnb .gnb_main .gnb a .txt{font-weight:700}
  #gnb .gnb_main .gnb a:hover,
  #gnb .gnb_main .gnb a.on{font-weight:700;color:#5f0080}
  #gnb .gnb_main .gnb a:hover .txt{border-bottom:1px solid #5f0080}
  #gnb .gnb_main .menu1 a{width:148px}
  #gnb .gnb_main .menu1 .ico{float:left;width:16px;height:14px;margin:5px 14px 0 0;background:url(https://res.kurly.com/pc/service/common/1908/ico_gnb_all_off.png) no-repeat}
  #gnb .gnb_main .menu1 a.on .ico,
  #gnb .gnb_main .menu1 a:hover .ico{background:url(https://res.kurly.com/pc/service/common/1908/ico_gnb_all.png) no-repeat 0 0}
  #gnb .gnb_main .menu1 a.on .txt,
  #gnb .gnb_main .menu1 a:hover .txt,
  #gnb .gnb_main .menu1 .txt{float:left;font-weight:700;border-bottom:0}
  #gnb .gnb_main .menu3 a{width:116px}
  #gnb .gnb_main .lst a{width:116px}
  /* GNB서브 */
  #gnb .gnb_sub{display:none;overflow:hidden;position:absolute;z-index:301;left:0;top:55px;width:213px;padding-top:1px}
  #gnb .gnb_sub .inner_sub{width:100%;border:1px solid #ddd;background:url(https://res.kurly.com/pc/service/common/1908/bg_gnb_sub_v3.png) repeat-y 0 0}
  #gnb .size_over{overflow-x:hidden;overflow-y:auto}
  #gnb .gnb_sub .gnb_menu{width:219px}
  #gnb .gnb_sub .gnb_menu li{width:100%;text-align:left}
  #gnb .gnb_sub .gnb_menu li:first-child{padding-top:0}
  #gnb .gnb_sub .menu{display:block;overflow:hidden;width:100%;height:40px;padding:8px 0 0 14px;cursor:pointer}
  #gnb .gnb_sub .gnb_menu li:first-child .menu{height:39px;padding-top:7px}
  #gnb .gnb_sub .current .menu{background:#f7f7f7}
  #gnb .gnb_sub .current .txt,
  #gnb .gnb_sub .menu.on.off:hover .txt,
  #gnb .gnb_sub .menu.on .txt{font-weight:700;color:#5f0080}
  #gnb .gnb_sub .ico{float:left;width:24px;height:24px}
  #gnb .gnb_sub .ico img{width:24px;height:24px}
  #gnb .gnb_sub .ico .ico_off{display:block}
  #gnb .gnb_sub .ico .ico_on{display:none}
  #gnb .gnb_sub .current .ico_off,
  #gnb .gnb_sub .menu.on .ico_off,
  #gnb .gnb_sub .menu:hover .ico_off{display:none}
  #gnb .gnb_sub .current .ico_on,
  #gnb .gnb_sub .menu.on .ico_on,
  #gnb .gnb_sub .menu:hover .ico_on{display:block}
  #gnb .gnb_sub .ico_arrow{display:none;float:right;width:16px;height:17px;padding:6px 9px 0 0}
  #gnb .gnb_sub .ico_arrow img{width:7px;height:11px}
  #gnb .gnb_sub .current .ico_arrow{display:block}
  #gnb .gnb_sub .txt{float:left;padding:0 4px 0 10px;font-weight:400;font-size:14px;color:#333;line-height:22px;white-space:nowrap}
  #gnb .gnb_sub .ico_new{overflow:hidden;float:left;width:14px;height:14px;margin-top:5px;background-position:50% 50%;background-repeat:no-repeat;background-size:14px 14px;font-size:0;line-height:0;text-indent:-9999px}
  #gnb .gnb_sub .sub_menu{position:absolute;z-index:0;left:200px;top:0;width:248px;height:100%;padding:0 0 0 20px;background:url(https://res.kurly.com/images/common/bg_1_1.gif) repeat 0 0;opacity:0;transition:opacity 0.2s}
  #gnb .gnb_sub .current .sub_menu{z-index:1;opacity:1;transition:opacity 0.5s}
  #gnb .gnb_sub .sub_menu li:first-child{padding-top:11px}
  #gnb .gnb_sub .sub_menu .sub{display:block;overflow:hidden;height:40px;padding-left:20px;font-size:14px;color:#333;line-height:18px;cursor:pointer}
  #gnb .gnb_sub .sub_menu .sub:hover .name{border-bottom:1px solid #5f0080;font-weight:700;color:#5f0080}
  #gnb .gnb_sub .sub_menu .sub.on{font-weight:700;color:#5f0080}
  #gnb .gnb_sub .recommend{overflow:hidden;width:529px;padding:21px 0 0 40px}
  #gnb .gnb_sub .recommend li{float:left;width:120px;height:130px;padding:0 10px 0 0}
  #gnb .gnb_sub .recommend li:first-child{padding-top:0}
  #gnb .gnb_sub .recommend .sub{display:block;overflow:hidden;width:120px;height:130px;padding:0;cursor:pointer}
  #gnb .gnb_sub .recommend .thumb{display:block;width:110px;height:83.4px;margin-bottom:8px;background-position:50% 50%;background-repeat:no-repeat;background-size:cover}
  #gnb .gnb_sub .recommend .thumb img{width:110px;height:84px}
  #gnb .gnb_sub .recommend .name{font-size:14px;line-height:18px}
  #gnb .btn_location{overflow:hidden;position:absolute;right:107px;top:10px;width:36px;height:36px;border:0 none;background:url(https://res.kurly.com/pc/ico/2008/ico_delivery_setting_done.svg) no-repeat 50% 50%;font-size:0;text-indent:-9999px}
  #gnb .btn_location.on{background-image:url(https://res.kurly.com/pc/ico/2008/ico_delivery_setting.svg?ver=1)}
  #gnb .layer_location{display:none;position:absolute;z-index:300;right:41px;top:56px;width:315px;padding:18px 18px 19px 20px;border:1px solid #ddd;background-color:#fff}
  #gnb .layer_location:after{content:"";position:absolute;right:66px;top:-50px;width:36px;height:50px;background:url(https://res.kurly.com/pc/ico/2011/ico_point_up_18x12.svg) no-repeat 50% 100%}
  #gnb .layer_location *{font-weight:500;font-size:16px;color:#333;line-height:24px;letter-spacing:-0.34px}
  #gnb .layer_location .delivery{display:inline-block;padding-top:8px;font-size:14px;font-weight:normal;letter-spacing:-0.2px;line-height:normal;}
  #gnb .layer_location .courierTime{display:inline-block;margin-left:6px;display:inline-block;font-size:14px;font-weight:normal;line-height:normal;color:#666;letter-spacing:-0.2px;}
  #gnb .layer_location .star{color:#5f0080}
  #gnb .layer_location .regular{color:#666}
  #gnb .layer_location .none{color:#999}
  #gnb .layer_location .btn{display:block;width:100%;height:36px;margin-top:17px;padding-bottom:2px;border-radius:3px;font-size:12px;line-height:32px;letter-spacing:0;text-align:center}
  #gnb .layer_location a.btn{padding-top:0}
  #gnb .layer_location .btn.default{border:1px solid #5f0080;background-color:#fff;color:#5f0080}
  #gnb .layer_location .btn.active{border:1px solid #5f0081;background-color:#5f0080;color:#fff}
  #gnb .layer_location .btn .ico{display:inline-block;width:20px;height:20px;margin:6px 0 0 -6px;background:url(https://res.kurly.com/pc/ico/2008/ico_search_40x40.png) no-repeat 50% 50%;background-size:20px 20px;vertical-align:top}
  #gnb .layer_location .group_button{display:block;overflow:hidden}
  #gnb .layer_location .double .default{float:left;width:110px}
  #gnb .layer_location .double .active{float:right;width:159px}
  #gnb .layer_location .double .btn {margin-left: 0; margin-right:0;}
  #gnb .layer_location .emph{color:#5f0080}
  #gnb .location_set:hover .btn_location.on{background-image:url(https://res.kurly.com/pc/ico/2010/ico_delivery_setting_on.svg)}
  #gnb .location_set.show .layer_location,
  #gnb .location_set:hover .layer_location{display:block}
  #gnb .location_set .btn_location.off,
  #gnb .location_set .btn_location.off:hover{background-image:url(https://res.kurly.com/pc/ico/2008/ico_delivery_off.svg?ver=1);cursor:default}
  #gnb .location_set.off .layer_location,
  #gnb .location_set.off:hover .layer_location{display:none}
  #gnb .gnbPick{
    display: inline-block;
    position: absolute;
    right: 51px;
    top: 10px;
    width: 36px;
    height: 36px;
    font-size: 0px;
  }
  #gnb .gnbPick .btn_pick{
    display: inline-block;
    width: 36px;
    height: 36px;
    border: none;
    color: transparent;
    background: url(https://res.kurly.com/pc/service/pick/btn-heart-off.svg) no-repeat 50% 50%;
    cursor: pointer;
  }
  #gnb .gnbPick .btn_pick:hover{
    background: url(https://res.kurly.com/pc/service/pick/btn-heart-hover.svg) no-repeat 50% 50%;
  }
  /* 오류 */
  #gnb .layer_location .error .txt{display:block;color:#333}
  @media
  only screen and (-webkit-min-device-pixel-ratio: 1.5),
  only screen and (min-device-pixel-ratio: 1.5),
  only screen and (min-resolution: 1.5dppx) {
    #gnb .gnb_sub .ico_new{background:url(https://res.kurly.com/pc/ico/1808/ico_new_gnb_16x16.png) no-repeat 0 0;background-size:14px 14px}
    #gnb .cart_count .msg_cart .point{background:url(https://res.kurly.com/pc/ico/1903/ico_layer_point_x2.png) no-repeat 0 0;background-size:20px 14px}
    #gnb .gnb_main .menu1 .ico{background:url(https://res.kurly.com/pc/service/common/1908/ico_gnb_all_off_x2.png) no-repeat 0 0;background-size:16px 14px}
    #gnb .gnb_main .menu1 a.on .ico,
    #gnb .gnb_main .menu1 a:hover .ico{background:url(https://res.kurly.com/pc/service/common/1908/ico_gnb_all_x2.png) no-repeat 0 0;background-size:16px 14px}
  }
  .gnb_search .init{position:relative}
  .gnb_search .init .btn_delete{overflow:hidden;position:absolute;left:170px;top:-36px;width:36px;height:36px;border:0 none;background:url(https://res.kurly.com/pc/ico/2010/ico_search_del.svg) no-repeat 50% 50%;background-size:12px 12px;font-size:0;line-height:0;text-indent:-9999px;opacity:0}
  .gnb_search .init .btn_delete.on{opacity:1}
</style>

<!-- 회원가입 글자-->
<div class="tit_page">
<h2 class="tit">회원가입</h2>
</div>
<!-- end 회원가입 글자 -->

<div id="main">
<div id="content">

<div id="qnb" class="quick-navigation">
<div class="bnr_qnb" id="brnQuick"></div>
</div>

<div class="page_aticle">

<script type="text/javascript" src="/asset/js/useKurly/libText.bundle.js"></script>
<script src="/shop/data/skin/designgj/godo.password_strength.js" type="text/javascript"></script>
<script src="/common_js/join_v1.js?ver=1.65.2"></script>
<div class="type_form member_join ">

<!-- <form id=form name=frmMember method=post action="/shop/member/indb.php" onsubmit="return chkForm2(this)" novalidate>
<input type=hidden name=mode value="joinMember">
<input type="hidden" name="check_mobile" value="">
<input type="hidden" name="auth_finish_code" value="">
<input type=hidden name=rncheck value="">
<input type=hidden name=dupeinfo value="">
<input type=hidden name=pakey value="">
<input type=hidden name=foreigner value="">
<input type=hidden name=passwordSkin value="Y">
<input type=hidden name=private2 value="">
<input type=hidden name=private3 value="">
<input type=hidden name='return_url' value=""> -->

<!-- 회원가입입력 -->
<form action="" method="post" name="myForm">
<p class="page_sub"><span class="ico">*</span>필수입력사항</p>
<table class="tbl_comm">

<!-- -----------------------------------------------------------------------------------------------------아이디 입력 -->
<tr class="fst">
<th>아이디<span class="ico">*<span class="screen_out">필수항목</span></span></th>
<td>
<input type="text" name="id" value="" maxlength="16" required fld_esssential option=regId label="아이디" placeholder="6자 이상의 영문 혹은 영문과 숫자를 조합">
<!-- <input type="hidden" name="chk_id" required fld_esssential label="아이디중복체크" value=""> -->

<!-- 아이디 중복체크 클릭 -->
<input type="button"  value="중복확인" class="btn default" onclick="idCheck()">

<input type="hidden" name="chk" value="0">


<!-- <a class="btn default" href="confirmId()">중복확인</a> -->
<p class="txt_guide square">
<span class="txt txt_case1">6자 이상의 영문 혹은 영문과 숫자를 조합</span>
<span class="txt txt_case2">아이디 중복확인</span>
</p>
</td>
</tr>
<!-- -------------------------------------------------------------------------------------------------end 아이디 입력 -->

<!-- --------------------------------------------------------------------------------------------------------비밀번호 -->
<tr>
<th>비밀번호<span class="ico">*<span class="screen_out">필수항목</span></span></th>
<td>
<input type=password name="pwd" required fld_esssential option=regPass label="비밀번호" maxlength="16" class="reg_pw" placeholder="비밀번호를 입력해주세요">
<p class="txt_guide square">
<span class="txt txt_case1">10자 이상 입력</span>
<span class="txt txt_case2">영문/숫자/특수문자(공백 제외)만 허용하며, 2개 이상 조합</span>
<span class="txt txt_case3">동일한 숫자 3개 이상 연속 사용 불가</span>
</p>
</td>
</tr>
<!-- -----------------------------------------------------------------------------------------------end 비밀번호 설정 -->

<!-- 비밀번호 확인 -->
<tr class="member_pwd">
<th>비밀번호확인<span class="ico">*<span class="screen_out">필수항목</span></span></th>
<td>
<input type=password name="pwd2" required fld_esssential option=regPass label="비밀번호" maxlength="16" class="confirm_pw" placeholder="비밀번호를 한번 더 입력해주세요">
<p class="txt_guide square">
<span class="txt txt_case1">동일한 비밀번호를 입력해주세요.</span>
</p>
</td>
</tr>
<!-- end 비밀번호 확인 -->

<!-- ------------------------------------------------------------------------------------------------------------이름 -->
<tr>
<th>이름<span class="ico">*<span class="screen_out">필수항목</span></span></th>
<td>
<input type="text" name="name" value="" required fld_esssential label="이름" placeholder="이름을 입력해주세요">
</td>
</tr>
<!-- --------------------------------------------------------------------------------------------------------end 이름 -->

<!-- ----------------------------------------------------------------------------------------------------------이메일 -->
<tr>
<th>이메일<span class="ico">*<span class="screen_out">필수항목</span></span></th>
<td>
<input type="text" name="email" value="" data-email="" size=30 required fld_esssential option=regEmail label="이메일" placeholder="예: marketkurly@kurly.com">
<input type="hidden" name="chk_email" required fld_esssential label="이메일중복체크">

</td>
</tr>
<!-- ------------------------------------------------------------------------------------------------------end 이메일 -->

<!-- ----------------------------------------------------------------------------------------------------------휴대폰 -->
<tr class="field_phone">
<th>휴대폰<span class="ico">*<span class="screen_out">필수항목</span></span></th>
<td>
<div class="phone_num">
<input type="text"  value="" pattern="[0-9]*" name="tel" placeholder="숫자만 입력해주세요" class="inp">
<!-- <input type="hidden" name="mobile[]" id="mobile0" value="" required fld_esssential option=regNum label="휴대폰">
<input type="hidden" name="mobile[]" id="mobile1" value="" required fld_esssential option=regNum label="휴대폰">
<input type="hidden" name="mobile[]" id="mobile2" value="" required fld_esssential option=regNum label="휴대폰"> -->
</div>
<!-- ------------------------------------------------------------------------------------------------------end 휴대폰 -->

<!-- ------------------------------------------------------------------------------------------------------------주소 -->
<tr>
<th>주소<span class="ico">*<span class="screen_out">필수항목</span></span></th>
<td class="field_address">
<!-- <input type="text" name="addr1" value="" placeholder="ex)경기도"/>
<input type="text" name="addr2" value="" placeholder="ex)수원시"/>
<input type="text" name="addr3" value="" placeholder="ex)상세주소"/> -->
<!-- <input type="hidden" name="zonecode" id="zonecode" size="5" value="">
<input type="hidden" name="zipcode[]" id="zipcode0" size="3" value="">
<input type="hidden" name="zipcode[]" id="zipcode1" size="3" value="">
<input type="hidden" name="deliPoli" id="deliPoli" size="1" value="">
<input type="hidden" id="baseAddressType" name="base_address_type" value="">
<div id="selectAddress">
<input type="text" name="addr" id="addr" value="" readonly="readonly" label="주소">
<input type="hidden" name="address" id="address" value="" required readonly="readonly" label="주소">
<input type="hidden" name="road_address" id="road_address" required value="" label="주소">
</div> -->

<input type="hidden" id="sample4_postcode" placeholder="우편번호">
<input type="text" name="addr1" id="sample4_roadAddress" readonly="readonly" placeholder="도로명주소">
<input type="hidden" id="sample4_jibunAddress" placeholder="지번주소">
<span id="guide" style="color:#999; display:none"></span>
<input type="text" name="addr2" id="sample4_extraAddress" readonly="readonly" placeholder="참고항목">
<input type="text" name="addr3" id="sample4_detailAddress" placeholder="상세주소">


<a href="#none" id="addressSearch" class="search" onclick="sample4_execDaumPostcode()">
<span id="addressNo" class="address_no" >주소 검색</span>

<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>


</a>
<div id="selectAddressSub">
<input type="text" name="address_sub" id="address_sub" value="" class="byteTotext" placeholder="나머지 주소를 입력해주세요">
<p id="delivery"></p>

</div>

<p class="txt_guide">
<span class="txt txt_case1">배송지에 따라 상품 정보가 달라질 수 있습니다.</span>
</p> 

</td>
</tr>
<!-- --------------------------------------------------------------------------------------------------------end 주소 -->

<!-- --------------------------------------------------------------------------------------------------------생년월일 -->
<tr>
<th>생년월일</th>
<td>
<div class="birth_day">
<input type="text" name="birth" id="birth_month" pattern="[0-9]*" value="" label="생년월일" size=6 maxlength=8 
placeholder="            YYYY            /            MM            /            DD            ">

<!-- <input type="text" name=birth[] id="birth_month" pattern="[0-9]*" value="" label="생년월일" size=2 maxlength=2 placeholder="MM">
<span class="bar"></span>
<input type="text" name=birth[] id="birth_day" pattern="[0-9]*" value="" label="생년월일" size=2 maxlength=2 placeholder="DD"> -->
</div>
<p class="txt_guide">
<span class="txt bad"></span>
</p>
</td>
</tr>
<!-- ----------------------------------------------------------------------------------------------------end 생년월일 -->

<!-- ------------------------------------------------------------------------------------------------------------성별 -->
<tr class="select_sex">
<th>성별</th>
<td>
<label class="">
<input type="radio" name="gender" value="남자">
<span class="ico"></span>남자
</label>
<label class="">
<input type="radio" name="gender" value="여자">
<span class="ico"></span>여자
</label>
<label class="checked">
<input type="radio" name="gender" value="null" checked="checked">
<span class="ico"></span>선택안함
</label>
</td>
</tr>
<!-- --------------------------------------------------------------------------------------------------------end 성별 -->

<!-- ----------------------------------------------------------------------------------------------------이용약관동의 -->
<tr class="reg_agree">
<th>이용약관동의 <span class="ico">*<span class="screen_out">필수항목</span></span></th>
<td>
<div class="bg_dim"></div>
<div class="check">
<label class="check_agree label_all_check label_block">
<input type=checkbox name="agree_allcheck">
<span class="ico"></span>전체 동의합니다.
</label>
<p class="sub">선택항목에 동의하지 않은 경우도 회원가입 및 일반적인 서비스를 이용할 수 있습니다.</p>
</div>
<div class="check_view">
<label class="check_agree label_block">
<input type="checkbox" value="" name="agree" required label="이용약관">
<span class="ico"></span>이용약관 동의 <span class="sub">(필수)</span>
</label>
<a href="#none" class="link btn_link btn_agreement">약관보기 </a>
</div>


<div class="layer layer_agreement">
<div class="inner_layer">
<h4 class="tit_layer">이용약관 <span class="sub">(필수)</span></h4>
<div class="box_tbl" id="serviceView"></div>
<script>
                var serviceView = new Vue({
                  el: '#serviceView',
                  data: {
                    pageUrl : campaginUrl + 'pc/service/agreement.html',
                    storagetObj : null,
                    eventStart : false, // 딱 한번만실행
                  },
                  methods: {
                    update:function(){
                      var $self = this;
                      $.ajax({
                        url : $self.pageUrl
                      }).done(function(result){
                        $('#serviceView').html(result);
                        $self.storagetObj = JSON.parse(sessionStorage.getItem("agreement"));
                        if(!$self.eventStart){
                          $self.eventStart = true;
                          $self.pageUrl = campaginUrl + 'pc/service/' + $self.storagetObj[$self.storagetObj.length-1].name + '.html'
                          $self.update();
                        }
                      });
                    }
                  }
                });
                serviceView.update();
              </script>
<button type="button" class="btn_ok">확인</button>
<button type="button" class="btn_close"><span class="screen_out">레이어 닫기</span></button>
</div>
</div>

<div class="check_view">
<label class="check_agree label_block">
<input type="checkbox" id="private1" name="private1" value="" required label="개인정보 수집·이용">
<span class="ico"></span>개인정보 수집·이용 동의 <span class="sub">(필수)</span>
</label>
<a href="#none" class="link btn_link btn_essential">약관보기 </a>
</div>

<div class="layer layer_essential">
<div class="inner_layer">
<div class="in_layer">
<h4 class="tit_layer">개인정보 수집·이용 동의 <span class="sub">(필수)</span></h4>
<div class="box_tbl">
<table cellpadding="0" cellspacing="0" width="100%">
<caption class="screen_out">개인정보 수집·이용 동의 (필수)</caption>
<thead>
<tr>
<th scope="row" class="tit1">수집 목적</th>
<th scope="row" class="tit2">수집 항목</th>
<th scope="row" class="tit3">보유 기간</th>
</tr>
</thead>
<tbody>
<tr>
<td>이용자 식별 및 본인여부</td>
<td rowspan="4">이름, 아이디, 비밀번호, 휴대폰번호, 이메일, 주소</td>
<td rowspan="4" class="emph">회원 탈퇴 <br>즉시 파기 <br><br>부정이용 방지를 위하여 30일 동안 보관 (아이디, 휴대폰 번호) 후 파기 </td>
</tr>
<tr>
<td>거점 기반 서비스 제공</td>
</tr>
<tr>
<td>계약 이행 및 약관변경 등의 고지를 위한 연락, 본인의사 확인 및 민원 등의 고객 고충 처리</td>
</tr>
<tr>
<td>부정 이용 방지, 비인가 사용방지 및 서비스 제공 및 계약의 이행</td>
</tr>
<tr>
<td>서비스방문 및 이용기록 분석, 부정이용 방지 등을 위한 기록 관리</td>
<td>서비스 이용기록, IP주소, 쿠키, MAC 주소, 모바일 기기정보(광고식별자, OS/ 앱 버전)</td>
<td class="emph">회원 탈퇴 즉시 또는 이용 목적 달성 즉시 파기</td>
</tr>
</tbody>
</table>
</div>
<p class="txt_service">서비스 제공을 위해서 필요한 최소한의 개인정보입니다. 동의를 해 주셔야 서비스를 이용하실 수 있으며, 동의하지 않으실 경우 서비스에 제한이 있을 수 있습니다.</p>
</div>
<button type="button" class="btn_ok"><span class="txt_type">확인</span></button>
<button type="button" class="btn_close"><span class="screen_out">레이어 닫기</span></button>
</div>
<button type="button" class="btn_close"><span class="screen_out">레이어 닫기</span></button>
</div>

<div class="check_view">
<input type="hidden" id="consentHidden" name="consent[1]" value="">
<label class=" check_agree label_block">
<input type="checkbox" name="hiddenCheck">
<span class="ico"></span>개인정보 수집·이용 동의 <span class="sub">(선택)</span>
</label>
<a href="#none" class="link btn_link btn_choice">약관보기 </a>
</div>

<div class="layer layer_choice">
<div class="inner_layer">
<div class="in_layer">
<h4 class="tit_layer">개인정보 수집·이용 동의 <span class="sub">(선택)</span></h4>
<div class="box_tbl">
<table cellpadding="0" cellspacing="0" width="100%">
<caption class="screen_out">개인정보의 수집 및 이용목적</caption>
<thead>
<tr>
 <th scope="row" class="tit1">수집 목적</th>
<th scope="row" class="tit2">수집 항목</th>
<th scope="row" class="tit3">보유 기간</th>
</tr>
</thead>
<tbody>
<tr>
<td>맞춤형 회원 서비스 제공</td>
<td>성별, 생년월일</td>
<td class="emph">회원 탈퇴<br> 즉시 파기</td>
</tr>
</tbody>
</table>
</div>
<p class="txt_service">동의를 거부하시는 경우에도 서비스는 이용하실 수 있습니다.</p>
</div>
<button type="button" class="btn_ok"><span class="txt_type">확인</span></button>
<button type="button" class="btn_close"><span class="screen_out">레이어 닫기</span></button>
</div>
</div>

<div class="check_view">
<label class="label_block check_agree ">
<input type="checkbox" name="marketing">
<span class="ico"></span>무료배송, 할인쿠폰 등 혜택/정보 수신 동의 <span class="sub">(선택)</span>
</label>
<div class="check_event email_sms">
<label class="label_block check_agree ">
<input type="checkbox" name="sms" value="n">
<span class="ico"></span>SMS
</label>
<label class="label_block check_agree ">
<input type="checkbox" name="mailling" value="n">
<span class="ico"></span>이메일
</label>
</div>
<p class="sms_info">
동의 시 한 달간 [5% 적립] + [무제한 무료배송] <span class="sub">(첫 주문 후 적용)</span>
</p>
</div>
<div class="check_view">
<label class=" check_agree label_block">
<input type="checkbox" value="n" name="fourteen_chk" required label="만 14세 이상">
<span class="ico"></span>본인은 만 14세 이상입니다. <span class="sub">(필수)</span>
</label>
</div>
</td>
</tr>
</table>
<!-- ---------------------------------------------------------------------------------------------------end 이용약관  -->


<!-- ---------------------------------------------------------------------------------------------------가입하기 버튼 -->
<div id="formSubmit" class="form_footer">
<button type="button" class="btn active btn_join" 
onclick="sendIt();">가입하기</button>

</div>
<!-- ----------------------------------------------------------------------------------------------end 가입하기 버튼  -->

</form>
</div>

<iframe id="ifrmRnCheck" name="ifrmRnCheck" style="display:none;"></iframe>
<iframe id="ifrmHpauth" name="ifrmHpauth" style="display:none;"></iframe>
<script src="/shop/data/skin/designgj/js/pw_validate.js?ver=1.65.2"></script>
<script src="/shop/data/skin/designgj/js/delivery_address.js?ver=1.65.2"></script>
<script type="text/javascript">
  $(document).ready(function() {
    $('input[name=name]').on('keyup keydown blur', function(){
      preventSpecialChars($(this), 'write');
    });

    $("#formSubmit .btn_submit").click(function(){
      $("input[type='text']").each(function(){
        var input_txt = $(this).val();
        var input_trim_txt = input_txt.replace(/(^\s*)|(\s*$)/gi, "");
        $(this).val(input_trim_txt);
      })
    });

    // PRDPJ-159 장차석 : 사용자 아이디와 추처인 아이디 중복 안되도록 처리
    var $nameRecommid = $('[name=recommid]');
    var $nameMId = $('[name=id]');
    $($nameRecommid , $nameMId).blur(function(){
      if ($.trim($nameMId.val()) !== '' && $.trim($nameRecommid.val()) !== '' &&
        ($nameRecommid.val() === $nameMId.attr('data-id') || $nameRecommid.val() === $nameMId.val())) {
        $nameRecommid.val('');
        alert('추천인 아이디에는 본인 아이디를 입력할 수 없습니다.');
      }
    });

    //개인정보처리방침
    function getAgreement() {
      jQuery.ajax({
        url: "/shop/service/private.php",
        cache: false,
        dataType: "html",
        type: "GET",
        contentType: 'text/html; charset=UTF-8',
        success: function(data) {
          jQuery(".agreement_box").html( jQuery(data).find('.hundred'));
        }
      });
    }
    getAgreement();

    // 레이어 열기,닫기
    $('.check_view .btn_link').on('click',function(e){
      e.preventDefault();
      var $layer1 = $(this).is('.btn_agreement');
      var $layer2 = $(this).is('.btn_essential');
      var $layer3 = $(this).is('.btn_choice');
      var bgDimd = $('.bg_dim');
      var $target = $(this).parents('.reg_agree').find('.layer');

      var $agreement = $(this).parents('.reg_agree').find('.layer_agreement');
      var $essential = $(this).parents('.reg_agree').find('.layer_essential');
      var $choice = $(this).parents('.reg_agree').find('.layer_choice');
      var topResult = null;

      if($layer1 == true){
        bgDimd.show();
        $agreement.show();
        $essential.hide();
        $choice.hide();
        topResult = $agreement;
      }else if($layer2 == true){
        bgDimd.show();
        $essential.show();
        $agreement.hide();
        $choice.hide();
        topResult = $essential;
      }else if($layer3 == true){
        bgDimd.show();
        $choice.show();
        $essential.hide();
        $agreement.hide();
        topResult = $choice;
      }
      topResult.css({
        'margin-top':-topResult.height() / 2
      });
    });
    $('.reg_agree .btn_ok,.reg_agree .btn_close').on('click',function(e){
      e.preventDefault();
      $(this).parents('.layer').hide();
      $('.bg_dim').hide();
    });

    // 이용약관전체동의
    var agree = $('.reg_agree');
    $('.check_agree input[name = agree_allcheck]').change(function(){
      if($(this).is(':checked') === true){
        $('.check_agree').addClass('checked')
        agree.find('input[type=checkbox]').attr('checked','checked');
        agree.find('input[type=checkbox]').prop('checked','checked');
        agree.find('input[type=checkbox]').val('y');
        $('#consentHidden').val('y');
      }else{
        $('.check_agree').removeClass('checked')
        agree.find('input[type=checkbox]').attr('checked','');
        agree.find('input[type=checkbox]').prop('checked','');
        agree.find('input[type=checkbox]').val('n');
        $('#consentHidden').val('n');
      }
    });
    $('.reg_agree').find('input[type=checkbox]').change(function(){
      if($(this).is(':checked')){
        $(this).parent().addClass('checked');
        $(this).attr('checked','checked');
        $(this).prop('checked','checked');
        $(this).val('y');
        if($(this).attr('name') == 'hiddenCheck') $('#consentHidden').val('y');
      }else{
        $(this).parent().removeClass('checked');
        $(this).attr('checked','');
        $(this).prop('checked','');
        $(this).val('n');
        if($(this).attr('name') == 'hiddenCheck') $('#consentHidden').val('n');
      }
      $('.reg_agree').find('input[type=checkbox]').each(function(){
        if($(this).is(':checked') === false){
          $('.label_all_check').removeClass('checked');
          return false;
        }
      });
      if($(this).attr('name') === 'marketing'){
        if($(this).is(':checked')){
          $('.email_sms').find('.check_agree').addClass('checked');
          $('.email_sms').find('input').attr('checked','checked');
          $('.email_sms').find('input').prop('checked','checked');
          $('.email_sms').find('input').val('y');
        }else{
          $('.email_sms').find('.check_agree').removeClass('checked');
          $('.email_sms').find('input').attr('checked','');
          $('.email_sms').find('input').prop('checked','');
          $('.email_sms').find('input').val('n');
        }
      }
      if($(this).attr('name') === 'mailling' || $(this).attr('name') === 'sms'){
        var emailSmsCount = 0;
        $(this).parents('.email_sms').find('input').each(function(){
          if($(this).is(':checked')) emailSmsCount++;
        });
        if(emailSmsCount === 2){
          $('input[name=marketing]').parent().addClass('checked');
          $('input[name=marketing]').attr('checked','checked');
          $('input[name=marketing]').prop('checked','checked');
        }else{
          $('input[name=marketing]').parent().removeClass('checked');
          $('input[name=marketing]').attr('checked','');
          $('input[name=marketing]').prop('checked','');
        }
      }

      // 전체동의
      if($('.reg_agree').find('.checked').length >= 7){
        $('.check_agree input[name = agree_allcheck]').parent().addClass('checked');
        $('.check_agree input[name = agree_allcheck]').prop('checked','checked');
      }else{
        $('.check_agree input[name = agree_allcheck]').parent().removeClass('checked');
        $('.check_agree input[name = agree_allcheck]').prop('checked','');
      }
    });

    function inputFocus() {
      $('#form input').focus(function () {
        var element = $(this);
        if (element.offset().top - $(window).scrollTop() < 80)
        {
          $('html, body').animate({
            scrollTop: element.offset().top - 80
          }, 0);
        }
      });
    }
    inputFocus();


    // 글자 갯수확인 + 문장조합확인
    var checkType1 = false;// 갯수
    var checkType2 = false;// 문자
    var checkType3 = false;// 문자만
    function check_confirm(characterReg, minNum){
      if(characterReg.length < minNum){
        checkType1 = false;
      }else{
        checkType1 = true;
      }

      var checkNumber = characterReg.search(/[0-9]/g); // 숫자
      var checkEnglish = characterReg.search(/[a-zA-Z]/ig); // 대소문자
      var checkSpecial = characterReg.search(/[~`!>@?/<#"'\$;:\]%\.\^,&\[*()_\+\-=|\\{}]/ig); // 특수문자
      var checkAscii = characterReg.search(/[^a-zA-Z0-9~`!>@?/<#"'\$;:\]%\.\^,&\[*()_\+\-=|\\{}]/ig); // 아스키 특수문자

      if(checkNumber >= 0 && checkEnglish >= 0 && checkAscii === -1) {
        checkType2 = true;
        checkType3 = true;
        if(checkSpecial !== -1) checkType3 = false;
      }else if(checkNumber >= 0 && checkSpecial !== -1 && checkAscii === -1){
        checkType2 = true;
        checkType3 = false;
      }else if(checkEnglish >= 0 && checkSpecial !== -1 && checkAscii === -1) {
        checkType2 = true;
        checkType3 = false;
      }else if( checkEnglish >= 0 && checkSpecial === -1 && checkAscii === -1) {
        checkType3 = true;
        if (checkNumber === -1) checkType2 = false;
      }else{
        checkType2 = false;
        checkType3 = false;
      }
    }


    // 아이디검증
    var saveId;
    $('[name=m_id]').on('focus',function(){
      saveId = $(this).val();
      $(this).parent().find('.txt_guide').show();
    });
    $('[name=m_id]').on('keyup', function(){
      var $target = $(this).parent().find('.txt_guide');
      var $chkVal =  $(this).val();
      var $numMin = 6;
      if(saveId !== $chkVal) class_change($target.eq(1),'bad');// 중복확인후 수정될때
      check_confirm($chkVal,$numMin);
      if(checkType1 === true && checkType3 === true){
        class_change($target.find('.txt_case1'), 'good');
        $(this).attr('data-validator',"true");
      }else{
        class_change($target.find('.txt_case1'),'bad');
        $(this).attr('data-validator',"false");
      }
      if($('[name=chk_id]').val() == 1){
        $('[name=chk_id]').val('');
        class_change($target.find('.txt_case2'),'bad');
      }
    });

    // 비밀번호검증
    $('[name=password], [name=newPassword], [name=password2], [name=confirmPassword]').on('focus',function(){
      $(this).parent().find('.txt_guide').show();
    });
    $('[name=password], [name=newPassword], [name=password2], [name=confirmPassword]').on('blur', function () {
      if ($(this).parent().find('.txt').hasClass('bad') || $.trim($(this).val()) === "" ){
        if (!$(this).hasClass('bad')) $(this).addClass('bad');
      } else {
        if ($(this).hasClass('bad')) $(this).removeClass('bad')
      }
    });
    $('input[name=password2], [name=confirmPassword]').on('keyup', function(){
      var $target = $(this).parent().find('.txt_guide');

      if( ( $("[name=password]").val() === $('[name=password2]').val() && $.trim($("[name=password]").val()) != "") || ( $("[name=newPassword]").val() === $('[name=confirmPassword]').val() && $.trim($("[name=newPassword]").val()) != "") ) {
        class_change($target.find('.txt_case1'),'good');
      }else{
        class_change($target.find('.txt_case1'),'bad');
      }
    });

    $('input[name=password], [name=newPassword]').on('keyup', function(e){
      var $target = $(this).parent().find('.txt_guide');
      var $chkVal =  $(this).val();
      var $numMin = 10;

      check_confirm($chkVal,$numMin);

      if(checkType1 === false && checkType2 === false){
        class_change($target.find('.txt_case1'),'bad');
        class_change($target.find('.txt_case2'),'bad');
      }
      if(checkType1 === true && checkType2 === false){
        class_change($target.find('.txt_case1'),'good');
        class_change($target.find('.txt_case2'),'bad');
      }
      if(checkType1 === false && checkType2 === true){
        class_change($target.find('.txt_case1'),'bad');
        class_change($target.find('.txt_case2'),'good');
      }
      if(checkType1 === true && checkType2 === true){
        class_change($target.find('.txt_case1'),'good');
        class_change($target.find('.txt_case2'),'good');
      }

      var hasThreeOrMoreConsecutiveNumbers = pwValidate.hasThreeOrMoreConsecutiveNumbers($chkVal)
      if (hasThreeOrMoreConsecutiveNumbers) {
        class_change($target.find('.txt_case3'),'bad');
      } else {
        class_change($target.find('.txt_case3'),'good');
      }

      if($(this).attr('id') == 'newPassword'){
        if($('[name=originalPassword]').val() == $('[name=newPassword]').val() ){
          class_change($target.find('.txt_case4'),'bad');
        }else{
          class_change($target.find('.txt_case4'),'good');
        }
        $('[name=confirmPassword]').trigger('keyup');
        var newPasswordCheckNum = 0;
        $target.find('.txt').each(function(){
          if($(this).hasClass('good')) newPasswordCheckNum++;
          $('[name=newPasswordCheck]').val(newPasswordCheckNum);
        });
      }else{
        $('[name=password2]').trigger('keyup');
      }
    });

    $("#selectRecommend label").on('click', function (e) {
      var target = $(e.target)
      var wrapper = target.closest('.group_radio')

      var inputOptions = wrapper.find('label')
      var targetInput = target.closest('.radio_wrapper').find('label')

      var selectOptionId = targetInput.find('input').attr('id')
      var inputWrapper = wrapper.siblings('.input_wrapper')
      var textBox = inputWrapper.find('input')
      var defaultMessage = {
        'recommendId': '추천인 아이디를 입력해주세요.',
        'eventName': '참여 이벤트명을 입력해주세요.'
      }
      var placeholderMessage = defaultMessage[selectOptionId]

      // 라디오버튼 토글
      inputOptions.not(targetInput).removeClass('checked')
      targetInput.addClass('checked')

      // 기존 텍스트 리셋
      textBox.val("")

      // placeholder 텍스트 변경
      textBox.attr('placeholder', placeholderMessage)

      // input name, value값 변경
      var nameOptions = {
        'recommendId': 'recommid',
        'eventName': 'ex2'
      }
      textBox.attr('id', nameOptions[selectOptionId])
      inputWrapper.addClass('selected')
    })
  });

  // 클래스변경
  function class_change(obj,state){
    if(state === 'good') {
      if (obj.hasClass('bad')) obj.removeClass('bad');
      obj.addClass('good');
    }else{
      if(obj.hasClass('good')) obj.removeClass('good');
      obj.addClass('bad');
    }
  }

  // 중복확인
 /*  function chkId() {
    var alertMsg = "아이디는 6자 이상의 영문 혹은 영문과 숫자 조합만 가능합니다";
    var $target = $("[name='m_id']").parent().find('.txt_case2');
    var id_txt = $("[name='m_id']").val();
    var id_trim_txt = id_txt.replace(/(^\s*)|(\s*$)/gi, "");
    $("input[name='m_id']").val(id_trim_txt);
    var form = document.frmMember;
    if ($("input[name='m_id']").val() === "") {
      alert("아이디를 입력해 주세요.");
      return;
    }
    if($("input[name='m_id']").val().length < 6){alert("아이디는 6자 이상의 영문 혹은 영문과 숫자 조합만 가능합니다");return;}
    if (!chkText(form.m_id,form.m_id.value,"아이디를 입력해주세요")) return;
    var idPattern = /^[a-zA-Z0-9]{1}[^"']{3,15}$/; // chkPatten 메소드에서 가져옴
    var isValidId = eval(idPattern);
    if (!isValidId.test(form.m_id.value)) {
      alert(alertMsg);
      return;
    }
    var $idValidator = $("[name='m_id']").attr('data-validator');
    if($idValidator === "false"){
      $("[name=chk_id]").val('');
      alert(alertMsg);
      if($target.hasClass('good')) $target.removeClass('good');
      $target.addClass('bad');
    }else{
      ifrmHidden.location.href = "indb.php?mode=chkId&m_id=" + form.m_id.value;
    }
  }
  function chkId2(num){
    var $target = $("[name='m_id']").parent().find('.txt_case2');
    var id_txt = $("[name='m_id']").val();
    if(num == 1){
      if($target.hasClass('bad')) $target.removeClass('bad');
      $target.addClass('good');
      $("[name='m_id']").attr('data-id',id_txt);
    }else{
      if($target.hasClass('good')) $target.removeClass('good');
      $target.addClass('bad');
    }
  }

  //
  function chkEmailChange($target){
    if($target.val() === $target.data('email') && $target.val().trim() !== ''){
      $('[name=chk_email]').val('1');
    }else{
      $('[name=chk_email]').val('0');
    }
  } */
  
/*   // 이메일 중복확인
  function chkEmail()
  {
    var email_txt = $("input[name='email']").val();
    var trim_txt = email_txt.replace(/(^\s*)|(\s*$)/gi, "");
    var email_regex=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
    $("input[name='email']").val(trim_txt)
    if ($("input[name='email']").val() === "") {
      alert("이메일 주소를 입력해 주세요.");
      $('[name=chk_email]').val('0');
      return false;
    }
    if(email_regex.test(trim_txt) === false) {
      alert("잘못된 이메일 형식입니다.");
      $('[name=chk_email]').val('0');
      return false;
    }

    var form = document.frmMember;
    if (!chkText(form.email,form.email.value,"이메일을 입력해주세요")){
      $('[name=chk_email]').val('0');
      return;
    }
    if (!chkPatten(form.email,form.email.getAttribute('option'),"정상적인 이메일 주소를 입력해주세요.")){
      $('[name=chk_email]').val('0');
      return;
    }

    $('[name=chk_email]').val('1');

    var chkUrl = "indb.php?mode=chkEmail&email=" + form.email.value + "&m_id=";
    ifrmHidden.location.href = chkUrl;
  }

  $("input[name='mobileInp']").change(function() {
    $("input[name='check_mobile']").val("0");
  });

  // 생년월일 입력시 폼 포커스 이벤트
  $('.birth_day input').focus(function(){
    $(this).parent().addClass('on');
  }).keyup(function(){
    var inputText = $(this).val();
    var number = $(this).val().replace(/[^0-9]/g,'');
    $(this).val(number);
  }).blur(function(){
    $(this).parent().removeClass('on');
    // KM-1261 회원가입 14세 인증
    birthCheckAction.validatorText();
  });


  // 현재 비밀번호 확인
  function checkCurrentPassword(el) {
    var currentPassword = $(el).val();
    var errorMessage = $(el).parent().find(".txt_guide");
    if (currentPassword.trim() === "") {
      errorMessage.hide();
      $('[name=originalPasswordCheck]').val('1');
      return false;
    }
    var req = {password:currentPassword};
    kurlyApi({
      method:'post',
      // url:'/v1/users/check/password',
      url:'/v3/auth/check-password',
      data:req
    }).then(function (response) {
      if(response.status === 204){
        errorMessage.hide();
        $('[name=originalPasswordCheck]').val('1');
        return true;
      }else{
        errorMessage.show();
        $('[name=originalPasswordCheck]').val('0');
        return false;
      }
    }.bind(this)).catch(function(err){
      errorMessage.show();
      $('[name=originalPasswordCheck]').val('0');
      return false;
    });
  }
  //end 현재 비밀번호 확인

  function chkForm2(f) {
    if($('[name=originalPasswordCheck]').val() === '0'){
      alert('현재 비밀번호를 확인해주세요', function(){
        $('[name=originalPassword]').focus();
      });
      return false;
    }

    if($('#originalPassword').val() != "" || $('#newPassword').val() != "" || $('#confirmPassword').val() != ""){
      if($('[name=newPasswordCheck]').val() < 4){
        alert('새 비밀번호를 확인해주세요', function(){
          $("[name=newPassword]").focus();
        });
        return false;
      }
      if($('#confirmPassword').val() != $('#newPassword').val()){
        alert('새 비밀번호 확인을 확인해주세요', function(){
          $('#confirmPassword').focus();
        });
        return false;
      }
    }

    //이메일 중복확인
    if($('[name=chk_email]').val() !== '1'){
      alert('이메일 중복확인을 확인해주세요', function(){
        $('[name=email]').focus();
      });
      return false;
    }
    //이메일 중복확인

    if(! preventSpecialChars($('input[name=name]'), 'result')){
      return false;
    }

    if ($("input[name='check_mobile']").val() !== "1")
    {
      alert("휴대폰 인증을 완료해 주세요.", function () {
        $('#btn_cert').focus();
      });
      return false;
    }


    var email_txt = $("input[name='email']").val();
    var trim_txt = email_txt.replace(/(^\s*)|(\s*$)/gi, "");
    var email_regex=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
    $("input[name='email']").val(trim_txt)
    if(email_regex.test(trim_txt) === false) {
      alert('잘못된 이메일 형식입니다.', function () {
        $('input[name=email]').focus();
      });
      return false;
    }

    // KM-1261 회원가입 14세 인증
    if(! birthCheckAction.validatorForm()){
      return false;
    }

    if (chkForm(f) === false) {
      return false;
    }
    return true;
  }
  //end KM-1261 회원가입 14세 인증

  $(document).ready(function() {
    // 추천인 자동 설정
    var recommRegExp = new RegExp("recommid=([^&]+)", "i");
    var match = location.search.match(recommRegExp);
    if(match !== null && match.length === 2) {
      $('#recommendId').click();
      $('input[name=recommid]').val("");
    }
  }); */


  // KM-1483 Amplitude
  KurlyTracker
    .setScreenName('sign_up')
    .setAction('view_sign_up', { join_path: 'kurly' })
    .sendData();
</script>
</div>
</div>
</div>
<!-- end 회원가입 -->
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