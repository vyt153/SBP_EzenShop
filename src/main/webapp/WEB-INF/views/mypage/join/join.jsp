<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입</title>
<link rel="stylesheet" href="/style/style_join.css">
<script src="/resource/jquery-3.6.0.min.js"></script>
<script src="/script/script_Join.js"></script>
</head>
<body>
	<div id="wrap">
	<input type="hidden" id="vCode" value="${vCode }">
		<main id="main" class="memberPage dFlex">
			<div class="logoArea">
				<a href="/"> <img src="/images/MainLogo.png" alt="헤더로고이미지">
				</a>
			</div>
			<!-- 실제 작업영역 시작-->
			<div class="joinInsert">
				<form name="regFrm" id="regFrm">
					<ul id="regFrmTbl">
						<li>
							<h3>
								<label for="uid" class="req">아이디</label>
							</h3>
							<div>
								<input type="text" name="uid" id="uid" maxlength="20" autofocus />
								<button type="button" id="idChkBtn" class="frmBtn">
								ID 중복확인</button>
							</div>
							<p>* 영어대소문자, 숫자조합(3~20)</p>
						</li>
						<li>
							<h3>
								<label for="upw" class="req">비밀번호</label>
							</h3>
							<div>
								<input type="password" name="upw" id="upw" maxlength="20" /> 
								<label class="subTxt">
									<input type="checkbox" id="pwView"/> 
									<i></i> 비밀번호 보기
								</label>
							</div>
							<p>* 영어소문자/숫자, _, @, $, 5~20</p> <!-- 공통비번 1234로 필 변경! -->
						</li>
						<li>
							<h3>
								<label for="upw_Re" class="req">비밀번호 확인</label>
							</h3>
							<div>
								<input type="password" id="upw_Re" maxlength="20" /> 
							</div>
							<p id="pwChk"></p>
						</li>
						<li>
							<h3>
								<label for="uname" class="req">이름</label>
							</h3>
							<div>
								<input type="text" name="uname" id="uname" maxlength="20" />
							</div>
						</li>
						<li>
							<h3>
								<label for="uemail_01" class="req">Email</label>
							</h3>
							<div>
								<input type="text" id="uemail_01" name="uemail_01"
									maxlength="20" size="7" /> <span>@</span> <input type="text"
									id="uemail_02" maxlength="20" size="10" /> <select
									id="emailDomain" class="frmDropMenu">
									<option value="">직접입력</option>
									<option>naver.com</option>
									<option>daum.net</option>
									<option>google.com</option>
								</select>

								<button type="button" id="emailAuthBtn" class="frmBtn">인증코드받기</button>

								<input type="hidden" name="uemail" id="uemail" />
							</div>
						</li>
						<!-- 이메일 인증영역 시작 : Authentication Code 인증코드 -->
						<li id="emailAuthArea">
							<h3>
								<label for="emailAuth">인증코드 입력</label>
							</h3> 
							<div>
								<input type="text" id="emailAuth" name="emailAuth" size="25" />
								<button type="button" class="frmBtn">인증하기</button>
							</div>
						</li>
						<!-- div#emailAuthArea -->
						<li>
							<h3>성별</h3>
							<div class="genderArea">
								<label class="radioTxt">
									남&ensp;<input type="radio" name="gender" value="1" /><i></i>
								</label>
								<label class="radioTxt">
									여&ensp;<input type="radio" name="gender" value="2" /><i></i>
								</label>
							</div>
						</li>
						<li>
							<h3>
								<label for="ubirthday">생년월일</label>
							</h3>
							<div>
								<input type="text" name="ubirthday" id="ubirthday" maxlength="6"
									size="8" />
							</div>
							<p>ex. 830815</p>
						</li>
						<li>
							<h3>우편번호</h3>
							<div>
								<input type="text" name="uzipcode" id="uzipcode" maxlength="7"
									size="7" readonly />
								<button type="button" id="findZipBtn" class="frmBtn">우편번호찾기</button>
							</div> 
							<p>* 우편번호 찾기 버튼을 클릭하세요.</p>
						</li>
						<li>
							<h3>
								<label for="uaddr">주소</label>
							</h3>
							<div>
								<input type="text" name="uaddr" id="uaddr" maxlength="100"
									size="50" />
							</div>
						</li>
						<li>
							<h3>전화번호</h3>
							<div id="phoneNum">
								<select name="phoneNum1" id="phoneNum1" class="frmDropMenu">
									<option  value="010">010</option>
									<option value="011">011</option>
									<option value="012">012</option>
								</select>
								<span> - </span>
								<input type="text" id="phoneNum2" name="phoneNum2"> 
								<span> - </span>
								<input type="text" id="phoneNum3" name="phoneNum3" > 
								<input type="hidden" id="phoneNum" name="phoneNum"> 
							</div>
						</li>
						<li>
							<div class="btnArea">
								<button type="button" id="joinSbmBtn" class="frmBtn">회원가입</button>
								<button type="reset" class="frmBtn">다시쓰기</button>
							</div>
						</li>
					</ul>
				</form>
				<!-- form[name=regFrm] -->
			</div>
		</main>
		<!-- 실제 작업영역 끝 -->
	</div>
	<!-- div#wrap -->
</body>
</html>