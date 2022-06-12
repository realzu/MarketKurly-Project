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
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/real_main.css" /> 
<%-- <link rel="stylesheet" type="text/css" href="<%=cp%>/css/style.css"/>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/style2.css"/> --%>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/style3.css"/>

<script type="text/javascript" src="https://res.kurly.com/js/lib/jquery-1.10.2.min.js"></script>

<script type="text/javascript">

	function sendIt() {
	
	var f = document.myForm;
	
		if(!f.id.value){
		alert("아이디 입력 하세요")
		f.id.focus();
		return;
		}
		
		if(!f.pwd.value){
		alert("비밀번호 입력 하세요")
		f.pwd.focus();
		return;
		}
		
		if(f.pwd2.value!=f.pwd.value){
		alert("비밀번호 확인 하세요")
		f.pwd2.focus();
		return; 
		}
		
		if(!f.name.value){
		alert("이름 입력 하세요")
		f.name.focus();
		return;
		}
		
		if(!f.email.value){
			alert("이메일 입력 하세요")
			f.email.focus();
			return;
		}
		
		if (!f.tel.value) {
			alert("전화번호를 입력하세요")
			f.tel.focus();
			return;
			
		}
		
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
		
		
		
		if(!f.birth.value){
			alert("생년월일을 입력해주세요")
			f.birth.focus();
			return;
			}
		
		
		if(!f.gender.value){
		alert("성별 입력 하세요")
		f.gender.focus();
		return;
		}
		
		f.action = "<%=cp %>/market/join_ok.do";
		f.submit();
		
		
	}//sendIt
		
		
	

 
	//중복검사 눌렀을때 새로운 창 띄우기 	
	function openIdChk(){
		        
	  window.name = "parentForm";
	  window.open("marketMember/idCheck.jsp",
	   "chkForm", "width=500, height=300, resizable = no, scrollbars = no");    
	}
	
	

</script>
</head>
<body class="member-join">
<div class="container">
<header>
            <div class="deliver">
              <a href="/SAZO/market/view.do">
                   <b><span>&nbsp;샛별·택배</span> 배송안내 </b>
               </a>
            </div>
        <nav  class="jlc">
           <ul>
               <a href="/SAZO/market/join.do">
                    <li><span>회원가입&emsp;|&emsp;</span></li>
                </a>
                <a href="/SAZO/market/login.do">
                    <li>로그인&emsp;</li>
                </a>  
                   <!-- <a href="#"> 
                        <li>|&emsp;고객센터 ▼
                            <ul>
                                <li><a href="#">공지사항</a></li><br>
                                <li><a href="#">자주하는 질문</a></li>
                            </ul>
                        </li>
                    </a>-->
            </ul>
        </nav>
        <div class="logo">
         <a href="#"><img src="../image/%EB%A7%88%EC%BC%93%EC%BB%AC%EB%A6%AC%20%EB%A1%9C%EA%B3%A0.png" alt="마켓컬리 로고"/></a>
        </div>
        
        
    <!--카테고리바-->
         <div class="cate_bar">
             <ul class="main1">
                <li><a href="#"><b><img src="../image/ico_gnb_all_off.png" alt="카테고리 아이콘">&ensp;&ensp;전체 카테고리</b></a>
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
                            <li><a href="#">&ensp;&ensp;국·반찬·메인요리</a></li>
                            <li><a href="#">&ensp;&ensp;샐러드·간편식</a></li>
                            <li><a href="#">&ensp;&ensp;면·양념·오일</a></li>
                            <li><a href="#">&ensp;&ensp;생수·음료·우유·커피</a></li>
                            <li><a href="#">&ensp;&ensp;간식·과자·떡</a></li>
                            <li><a href="#">&ensp;&ensp;베이커리·치즈·델리</a></li>
                            <li><a href="#">&ensp;&ensp;건강식품</a></li>
                            <li><a href="#">&ensp;&ensp;전통</a></li>
                            <li><a href="#">&ensp;&ensp;생활용품·리빙·캠핑</a></li>
                            <li><a href="#">&ensp;&ensp;스킨케어·메이크업 </a></li>
                            <li><a href="#">&ensp;&ensp;헤어·바디·구강 </a></li>
                            <li><a href="#">&ensp;&ensp;주방용품</a></li>
                            <li><a href="#">&ensp;&ensp;가전제품</a></li>
                            <li><a href="#">&ensp;&ensp;반려동물 </a></li>
                            <li><a href="#">&ensp;&ensp;베이비·키즈·완구</a></li>
                            <li><a href="#">&ensp;&ensp;컬리의 추천 </a></li>
                        </ul>
                 </li>
                 <li><a href="#"><b>신상품</b></a></li>
                 <li><a href="#"><b>베스트</b></a></li>
                 <li><a href="#"><b>알뜰쇼핑</b></a></li>
                 <li><a href="#"><b>특가/혜택</b></a></li>

                <li><input class="search" type="text" value="검색어를 입력해주세요" >
                <img class="search_icon" src="../image/ico_search_40x40.png"></li>
                 <li id="logos"><a href="#"><img src="../image/ico_delivery_setting.png" alt="위치로고"></a></li>
                 <li id="logos"><a href="#"><img src="../image/ico_cart.png" alt="카트로고"></a></li>
                 </ul>
        </div>
    </header>



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

<input type="button"  value="중복확인" class="btn default" style="width:80px" onclick="openIdChk()">


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
<p class="txt_guide">
<span class="txt txt_case1"></span>
</p>
</td>
</tr>
<!-- ------------------------------------------------------------------------------------------------------end 휴대폰 -->

<!-- ------------------------------------------------------------------------------------------------------------주소 -->
<tr>
<th>주소<span class="ico">*<span class="screen_out">필수항목</span></span></th>
<td class="field_address">
<input type="text" name="addr1" value="" placeholder="ex)경기도"/>
<input type="text" name="addr2" value="" placeholder="ex)수원시"/>
<input type="text" name="addr3" value="" placeholder="ex)상세주소"/>
<!-- <input type="hidden" name="zonecode" id="zonecode" size="5" value="">
<input type="hidden" name="zipcode[]" id="zipcode0" size="3" value="">
<input type="hidden" name="zipcode[]" id="zipcode1" size="3" value="">
<input type="hidden" name="deliPoli" id="deliPoli" size="1" value="">
<input type="hidden" id="baseAddressType" name="base_address_type" value="">
<div id="selectAddress">
<input type="text" name="addr" id="addr" value="" readonly="readonly" label="주소">
<input type="hidden" name="address" id="address" value="" required readonly="readonly" label="주소">
<input type="hidden" name="road_address" id="road_address" required value="" label="주소"> -->
</div>

<a href="#none" id="addressSearch" class="search" onclick="('/juso.jsp',530,500,'center')">
<span id="addressNo" class="address_no" data-text="재검색">주소 검색</span>
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
placeholder="YYYY  MM  DD">

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



<!-- ------------------------------------------------------------------------------------추천인 아이디, 참여 이벤트명 -->

<!-- --------------------------------------------------------------------------------end 추천인 아이디, 참여 이벤트명 -->

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

</body>
</html>