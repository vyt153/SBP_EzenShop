/**
 * 
 */
 
 $(function(){
 
 		/* 회원정보 상세보기 시작 */
	$("#userListTblArea div.userListTbl").click(function(){
		let num = $(this).attr("data-link");
		//alert("num : " + num + "\n상세보기 OK");
		location.href="userView?num="+num;
	});
	/* 회원정보 상세보기 끝 */
	
 
 });