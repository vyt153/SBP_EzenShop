/**
 * 
 */
 
 $(function(){
 
 	$("span.goReview").click(function(){
 		
 		var goodsCode = $("input#hidgoodsCode").val();
 		var num = $("input#hidnum").val();
 		
 		location.href = "/goodsReviewReg?goodsCode="+goodsCode+"&num="+num;
 		
 	});
 	
 	var reFocusChk = $("input#reFocusChk").val();
 	
 	if(reFocusChk!=null) {
 		$("div#reViewArea").focus();
 	}
 	
 	$("button#rAddBtn").click(function(){
 		var chk = confirm("리뷰를 등록하시겠습니까?");
 		if(chk){
 		$("form#reSubFrm").submit();
 		}
 	});
 	
 	
 });