function isValidEmail(email) {
	var format = /^((\w|[\-\.])+)@((\w|[\-\.])+)\.([A-Za-z]+)$/;
    if (email.search(format) != -1)
        return true; //올바른 포맷 형식
    return false;
}

String.prototype.trim = function() {
		var TRIM_PATTERN = /(^\s*)|(\s*$)/g;
		return this.replace(TRIM_PATTERN, "");
}

function sendIt() {
	
    f = document.myForm;
    
    str = f.itemName.value;
    str = str.trim();
    if(!str) {
        alert("상품명을 입력하세요");
        f.itemName.focus();
        return;
    }
    f.itemName.value = str;

    str = f.itemInfo.value;
    str = str.trim();
    if(!str) {
        alert("안내사항을 입력하세요");
        f.itemInfo.focus();
        return;
    }
    f.itemInfo.value = str;
    
    str = f.price.value;
    str = str.trim();
    if(!str) {
        alert("가격을 입력하세요");
        f.price.focus();
        return;
    }
    f.price.value = str;
    
    str = f.category.value;
    str = str.trim();
    if(!str) {
        alert("카테고리를 입력하세요");
        f.category.focus();
        return;
    }
    f.category.value = str;
    
    str = f.thumFile.value;
    if(!str) {
        alert("썸네일 파일을 선택 하세요");
        f.thumFile.focus();
        return;
    }
    
    str = f.image1.value;
    if(!str) {
        alert("상품설명 파일을 선택 하세요");
        f.image1.focus();
        return;
    }
    
    
    f.action="/SAZO/admin/write_ok.do";
    f.submit();
}
