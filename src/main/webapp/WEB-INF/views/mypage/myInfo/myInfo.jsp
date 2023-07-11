<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EZENSHOP</title>
<link rel="stylesheet" href="/style/style.css" />
<link rel="stylesheet" href="/style/style_join.css">
</head>
<body>
	
	<div id = "wrap">
		
		<div id="innerWrap">
			
			<%@ include file ="/WEB-INF/views/inc/headerGNB_admin.jsp" %>
			<%@ include file ="/WEB-INF/views/inc/sitemap.jsp" %>
		<main id="main" class="memberPage dFlex">
		
				<!-- 실제 작업영역 시작-->
			<h2>회원정보 수정</h2>
			<div class="joinInsert">
				<form name="regFrm" id="regFrm">
					<ul id="regFrmTbl">
						<li>
							<h3>
								<label for="uid" class="req">아이디</label>
							</h3>
							 <span>${memberInfo.uid } <input type="hidden" name="uid" value="${uidSession}"></span>
							<div>
							
							</div>
						</li>
						<li>
							<h3>
								<label for="upw" class="req">비밀번호</label>
							</h3>
							<div>
							<c:if test="${memberInfo.oauth=='KAKAO' }"><c:set value="disabled" var="KAKAO"/> 
							</c:if>
								<input type="password" name="upw" id="upw" maxlength="20" ${KAKAO }/> 
								<label class="subTxt">
									<input type="checkbox" id="pwView" /> 
									<i></i> 비밀번호 보기
								</label>
							</div>
							<p>* 영어소문자/숫자, _, @, $, 5~20</p> <!-- 공통비번 1234로 필 변경! -->
						</li>
						<li>
							<h3>
								<label for="upw_Re" class="req" >비밀번호 확인</label>
							</h3>
							<div>
								<input type="password" id="upw_Re" maxlength="20"  ${KAKAO }/> 
							</div>
							<p id="pwChk"></p>
						</li>
						<li>
							<h3>
								<label for="uname" class="req">이름</label>
							</h3>
							<div>
								<input type="text" value="${memberInfo.uname}" name="uname" id="uname" maxlength="20" />
							</div>
						</li>
						<li>
							<h3>
								<label for="uemail_01" class="req">Email</label>
							</h3>
							<c:set var="email" value="${fn:split(memberInfo.uemail,'@') }"/>
							<div>
								<input type="text" id="uemail_01" name="uemail_01" value="${email[0] }"
									maxlength="20" size="7" /> <span>@</span> <input type="text"
									id="uemail_02" maxlength="20" size="10" value="${email[1] }"/> <select
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
							<c:if test="${memberInfo.gender=='male' }">
								<c:set var="male" value="checked"/>
							</c:if>
							<c:if test="${memberInfo.gender=='female' }">
								<c:set var="female" value="checked"/>
							</c:if>
							<div class="genderArea">
								<label class="radioTxt">
									남&ensp;<input type="radio" name="gender" value="male" ${male }/><i></i>
								</label>
								<label class="radioTxt">
									여&ensp;<input type="radio" name="gender" value="female" ${female }/><i></i>
								</label>
							</div>
						</li>
						<li>
							<h3>
								<label for="ubirthday">생년월일</label>
							</h3>
							<div>
								<input type="text" name="ubirthday" id="ubirthday" maxlength="8"
									value="${memberInfo.ubirthday }" size="8" />
							</div>
							<p>ex. 19830815</p>
						</li>
						<li>
							<h3>우편번호</h3>
							<div>
								<input type="text" name="uzipcode" id="uzipcode" maxlength="7"
									size="7" value="${memberInfo.uzipCode }" readonly />
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
									size="50" value="${memberInfo.uaddr }"/>
							</div>
						</li>
						<li>
							<h3>전화번호</h3>
							<div id="phoneNumArea">
							<c:set value="${fn:split(memberInfo.phoneNum, '-') }" var="phoneNum" />
								<select id="phoneNum1" class="frmDropMenu">
								
								<c:if test="${phoneNum[0]=='10' }"><c:set var="010" value="selected"/></c:if>
								<c:if test="${phoneNum[0]=='11' }"><c:set var="011" value="selected"/></c:if>
								<c:if test="${phoneNum[0]=='12' }"><c:set var="012" value="selected"/></c:if>
									<option value="010" ${010 }>010</option>
									<option value="011" ${011 }>011</option>
									<option value="012" ${012 }>012</option>
								</select>
								<span> - </span>
								<input type="text" id="phoneNum2" value="${phoneNum[1] }" maxlength="4"> 
								<span> - </span>
								<input type="text" id="phoneNum3" value="${phoneNum[2] }" maxlength="4"> 
							<input type="hidden" id="phoneNum" name="phoneNum"> 
							</div>
						</li>
						<li>
							<div class="btnArea">
								<button type="button" id="joinSbmBtn" class="frmBtn">수정하기</button>
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
		
		<%@ include file ="/WEB-INF/views/inc/footer.jsp" %>
	</div>
	<!-- div#wrap -->
	
	<script src="/script/jquery-3.6.4.min.js"></script>
	<script src="/script/script_myInfo.js"></script>
	
</body>
</html>