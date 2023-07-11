 
$(function(){
 	$("div#qnaGNB>ul a").click(function(){
 		$("#qnaGNB>ul>li a").attr("class","");
 		$(this).attr("class","checked");
 		console.log(123);
 	});
 		
 	$("#fileDelBtn").click(function(){
		$(".spanFile").html("");
		$(".spanFile + small").text("* 파일이 삭제 됐습니다.");
		$("#fileDelData").val("1");
	});
 });