<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>로그인</title>
		<link rel="stylesheet" href="/style/style_login.css">
		<script src="/resource/jquery-3.6.0.min.js"></script>
		<script src="/script/script_Login.js"></script>
	</head>
	<body>
		<div id="wrap">
			<main id="main" class="loginPage dFlex autoH">
				<div class="logoArea">
					<a href="/">
	    				<img src="/images/MainLogo.png" alt="헤더로고이미지">
	    			</a>
				</div>
				<!-- 실제 작업 영역 시작 -->
				<div class="loginDiv">
					<form action="" id="loginFrm" name="loginFrm">
						<div id="loginArea">
							<div id="loginInput">
								<input type="text" name="uid" placeholder="아이디 입력" id="uid"/>
								<input type="text" name="upw" placeholder="비밀번호 입력" id="upw"/>
							</div>
							<button type="button" id="loginBtn">로그인</button>
							<a href="https://kauth.kakao.com/oauth/authorize?client_id=${CLIENT_ID }&redirect_uri=${REDIRECT_URL }&response_type=code">
							<img alt="#" height="47px" src="/images/kakao_login_img.png"></a>
						</div>
						<!-- div#loginArea -->
					</form>
					<ul class="find_wrap" id="find_wrap">
		                <li><a target="_blank" href="findIdPage" class="find_text">아이디 찾기</a></li>
		                <li><a target="_blank" href="findPwPage" class="find_text">비밀번호 찾기</a></li>
		                <li><a target="_blank" href="joinAgreement" class="find_text">회원가입</a></li>
		            </ul>
				</div>
				<!-- 실제 작업 영역 끝 -->
			</main>
		</div>
		<!-- div#wrap -->
		<input type="hidden" value="${login }" id="login">
	</body>
</html>