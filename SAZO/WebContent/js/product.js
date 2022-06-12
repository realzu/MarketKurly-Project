function changeAmount(t) {
	var min_qty = 1;
	var this_qty = $("#inp").val()*1;
	var max_qty = '200'; // 현재 재고
	if(t=="m"){ 
		this_qty -= 1; 
		if(this_qty<min_qty){ //alert("최소구매수량 이상만 구매할 수 있습니다.");
			alert("수량은 1개 이상 입력해 주십시오."); 
			return;
		} 
	} 
	else if(t=="p"){ 
		this_qty += 1; 
		if(this_qty>max_qty){ alert("죄송합니다. 재고가 부족합니다."); 
		return; 
		}
	}
	$("#inp").val(this_qty);
}


function toBasket(){

	f = document.basket;

	if(confirm("장바구니에 담으시겠습니까?")) {
	f.action="/SAZO/market/basket.do";
	f.submit();
	}

}

