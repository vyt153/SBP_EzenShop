/**
 * 
 */
 
$(function(){
 	
 	/* 상품상세 등록 페이지 이동 goodsDetailReg.jsp  */
 	$("button#saleRegBtn").click(function(){
 		let goodsCode = $(this).attr("data-link");
 		// let num = $(this).val().trim();
 		//alert(goodsCode);
 		// alert(num);
 		
 		location.href="/goodsDetailReg?goodsCode="+goodsCode;
 	});
 	
    /* 상품등록 색상테이블 추가 */
	$("#colorAddBtn").click(function(){

	 	var div = $(this).closest("div.colorSizeCnt");
		var clone = $(div).clone();
		var closest = $(this).closest("div#colorSizeCntArea");
		$(clone).appendTo(closest);
		
	});
 	
 	/* 상품등록 색상테이블 제거 */
 	$("#colorDelBtn").click(function(){
 		
 		var len = $("div.colorSizeCnt").length;
 		
 		if(len > 1) {
 			$("div.colorSizeCnt:last-child").remove();
 		}
 		
 	});
 	
 	/* 카테고리 변경 */
 	$("select#cateBig").change(function(){
 	
 		var cateBig = $(this).val();
 		
 		if (cateBig == 'TOP') {
 			$("select#goodsCategory").html('<option>맨투맨</option><option>후드티</option><option>니트</option><option>긴팔티</option><option>반팔티</option>');
 		} else if (cateBig == 'SHIRTS') {
 			$("select#goodsCategory").html('<option>베이직</option><option>청남방</option><option>체크/패턴</option><option>헨리넥</option>');
 		} else if (cateBig == 'PANTS') {
 			$("select#goodsCategory").html('<option>청바지</option><option>면바지</option><option>반바지</option><option>슬렉스</option>');
 		} else if (cateBig == 'OUTER') {
 			$("select#goodsCategory").html('<option>패딩</option><option>코트</option><option>자켓</option><option>가디건</option><option>조끼</option>');
 		} else if (cateBig == 'ETC') {
 			$("select#goodsCategory").html('<option>가방</option><option>신발</option>');
 		} else if (cateBig == 'ACC') {
 			$("select#goodsCategory").html('<option>양말</option><option>모자</option><option>장갑</option><option>안경</option>');
 		}
 	
 	});
 	
 	$(function(){
 		var optSel = $("input#optionSel").val();
 		console.log("optSel = " + optSel);

 		if((optSel == '맨투맨') || (optSel == '후드티') || (optSel == '니트') || (optSel == '긴팔티') ||(optSel == '반팔티')) {
 			$(this).val('TOP');
 			$("select#goodsCategory").val(optSel);
 			console.log("goodsCategory : " + $("select#goodsCategory").val());

 		} else if((optSel == '베이직') || (optSel == '청남방') || (optSel == '체크/패턴') || (optSel == '헨리넥')) {

 			$("select#cateBig").val('SHIRTS');
 			$("select#goodsCategory").html('<option>베이직</option><option>청남방</option><option>체크/패턴</option><option>헨리넥</option>');
 			$("select#goodsCategory").val(optSel);
 			console.log($("select#goodsCategory").val());

 		} else if((optSel == '청바지') || (optSel == '면바지') || (optSel == '반바지') || (optSel == '슬렉스')) {
 				
 			$("select#cateBig").val('PANTS');
 			$("select#goodsCategory").html('<option>청바지</option><option>면바지</option><option>반바지</option><option>슬렉스</option>');
 			$("select#goodsCategory").val(optSel);
 			console.log($("select#goodsCategory").val());
 				
 		} else if((optSel == '패딩') || (optSel == '코트') || (optSel == '자켓') || (optSel == '가디건') || (optSel == '조끼')) {

 			$("select#cateBig").val('OUTER');
 			$("select#goodsCategory").html('<option>패딩</option><option>코트</option><option>자켓</option><option>가디건</option><option>조끼</option>');
 			$("select#goodsCategory").val(optSel);
 			console.log($("select#goodsCategory").val());

 		} else if((optSel == '가방') || (optSel == '신발')) {
 		
 			$("select#cateBig").val('ETC');
 			$("select#goodsCategory").html('<option>가방</option><option>신발</option>');
 			$("select#goodsCategory").val(optSel);
 			console.log($("select#goodsCategory").val());

 		} else if((optSel == '양말') || (optSel == '모자') || (optSel == '장갑') || (optSel == '안경')){

 			$("select#cateBig").val('ACC');
 			$("select#goodsCategory").html('<option>양말</option><option>모자</option><option>장갑</option><option>안경</option>');
 			$("select#goodsCategory").val(optSel);
 			console.log($("select#goodsCategory").val());

 		}
 		console.log($("select#cateBig").val());
 	});
 	
 	/* 상품등록 유효성 검사 */
 	$("button#goodsStockBtn").click(function(){
 	
 		let goodsCode = $("input#goodsCode").val().trim();
 		let goodsName = $("input#goodsName").val().trim();
 		let goodsPrice = $("input#goodsPrice").val().trim();
 		let len = $("div.colorSizeCnt").length; 
		
 		if (goodsCode=="") {
 			$("input#goodsCode").focus();
 			alert("상품코드를 입력해주세요.");
 		} else if (goodsName == "") {
 			$("input#goodsName").focus();
 			alert("상품이름을 입력해주세요.");
 		} else if (goodsPrice == "") {
 			$("input#goodsPrice").focus();
 			alert("가격을 입력해주세요.");
 		} else {
 		
 			/* 색상 인풋값 유효성 검사 */
 			
 			for(var i=1; i<len+1; i++) {
				var c = $("div.colorSizeCnt:nth-child("+i+")").children("div.colorSelect").children("input[name=goodsColor]");
				var cTest = $("div.colorSizeCnt:nth-child("+i+")").children("div.colorSelect").children("input[name=goodsColor]").val();
				if (cTest == null || cTest == "") {
					alert("색상을 입력해주세요");
					c.focus();
				} else {
					$("form#goodsStockFrm").submit();
				}
			}
 		}
 	
 	});

	/* 삭제 체크박스 정방향 역방향 체크 */
	$("#chkAll").click(function(){
 		var chk = $(this).prop("checked");
 		
 		if (chk) {
 			$(".chk").prop("checked",true);
 		} else {
 			$(".chk").prop("checked",false);
 		}
 	});
 	
 	$(".chk").click(function(){
 		var chk = $(this).prop("checked");
 		var chkCnt = $(".chk").length;
 		var chkCC = $("input:checkbox[name='delCode']:checked").length;
 		if (!chk) {
 			$("#chkAll").prop("checked",false);
 		} else if (chk) {
 			if (chkCnt == chkCC) {
 				$("#chkAll").prop("checked",true);
 			}
 		}
 		
 	});
	/* 삭제 체크박스 정방향 역방향 체크 종료 */
	
	/* 삭제 여부 */
	$("button#delBtn").click(function(){
		chkToF = confirm("정말로 삭제하시겠습니까?");
		
		if (chkToF) {
			alert("삭제되었습니다.");
			$("form#delFrm").submit();
		} else {
			alert("취소하였습니다.");
		}
		
	});
	
	// 상품 수정하기
	$("button#goodsModBtn").click(function(){
		
		let modToF = confirm("수정하시겠습니까?");
		
		let goodsCode = $("input#goodsCode").val().trim();
 		let goodsName = $("input#goodsName").val().trim();
 		let goodsPrice = $("input#goodsPrice").val().trim();
 		let len = $("div.colorSizeCnt").length; 
		
		if (modToF) {
 		if (goodsCode=="") {
 			$("input#goodsCode").focus();
 			alert("상품코드를 입력해주세요.");
 		} else if (goodsName == "") {
 			$("input#goodsName").focus();
 			alert("상품이름을 입력해주세요.");
 		} else if (goodsPrice == "") {
 			$("input#goodsPrice").focus();
 			alert("가격을 입력해주세요.");
 		} else {
 		
 			/* 색상 인풋값 유효성 검사 */
 			
 			for(var i=1; i<len+1; i++) {
				var c = $("div.colorSizeCnt:nth-child("+i+")").children("div.colorSelect").children("input[name=goodsColor]");
				var cTest = $("div.colorSizeCnt:nth-child("+i+")").children("div.colorSelect").children("input[name=goodsColor]").val();
				if (cTest == null || cTest == "") {
					alert("색상을 입력해주세요");
					c.focus();
				} else {
					$("form#goodsModFrm").attr("action","/goodsModProc");
					$("form#goodsModFrm").submit();
				}
			}
 		}
 		} else {
 			alert("취소하였습니다.");
 		}
		
	});
 	
 
 	
});