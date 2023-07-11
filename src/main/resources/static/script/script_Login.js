/**
 * 
 */
 
 $(function(){
	// 로그인 버튼 전송
	$("#loginBtn").click(function(){
		fnLoginSbm();
	});
	// 엔터키 이벤트
	$(window).keydown(function(){
		let code = event.keyCode;
		if(code==13) return false;
	});
	$(window).keyup(function(){
		let code = event.keyCode;
		if(code==13) fnLoginSbm();
	});
	
	if($("#login").val()=='false'){
		alert("일치하는 계정이 없습니다.");
		$("#login").val('');
	}
	
	function fnLoginSbm(){
		let uid = $("#uid").val().trim();
		$("#uid").val(uid);
		let upw = $("#upw").val().trim();
		$("#upw").val(upw);
		
		if (uid == "") {
			alert("아이디를 입력해주세요.");
			$("#uid").focus();
			return;
		} else if (upw == "") {
			alert("비밀번호를 입력해주세요.");
			$("#upw").focus();
			return;
		} else {			
			$("#loginFrm").attr("action", "login");
			$("#loginFrm").submit();
		}
	}
	
});