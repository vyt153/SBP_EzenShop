<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EZENSHOP</title>
<link rel="stylesheet" href="/style/style.css" />
<link rel="stylesheet" href="/style/style_management.css" />
</head>
<body>
	
	<div id = "wrap">
		
		<div id="innerWrap">
			
			<%@ include file ="/WEB-INF/views/inc/headerGNB_admin.jsp" %>
			<%@ include file ="/WEB-INF/views/inc/sitemap.jsp" %>
			
			<div id="useListArea">
				
				<div id="userListHeader">
				
					<h1>회원관리</h1>
					
				</div>
				
				<div id="userListTblArea">
				
					<div class="userListTblHeader userListTbl dFlex">
						
						<span>닉네임</span>
						<span>이름</span>
						<span>나이</span>
						<span>성별</span>
						<span>전화번호</span>
						<span>주소</span>
						<span>가입시간</span>
						
					</div>
				
				
					
					<c:forEach begin="0" end="20" step="1" var="userList" items="${userList}">
						<div class="userListTbl dFlex">
						
					
							<span>${userList.uid}</span>
							<span>${userList.uname}</span>
							<span>${userList.ubirthday} </span>
							<span>${userList.gender}</span>
							<span>${userList.phoneNum}</span>
							<span>${userList.uaddr}</span>
							<%-- <fmt:formatDate var="tm"  value="${userList.joinTm}" pattern="yyyy-MM-dd"/> --%>
							<span>${userList.joinTm}</span>
					
						</div>
						<!-- div.userListTbl -->
						
				</c:forEach>
				
				</div>
				<!-- div#userListTblArea -->
				
				<div id="userListFooter">
				
					<div id="userListSrcArea" class = "dFlex">
					
						<div id="totalUser">
							<span>총 회원수 : </span>
						</div>
						
						<div id="userSrcArea" class = "dFlex">
							
							<select name="???" id="userSrcOption">
								<option>닉네임</option>
								<option>이름</option>
								<option>전화번호</option>
								<option>주소</option>
							</select>
							
							<input type="text">
							
							<button type="button" id="userSrcBtn">검색</button>
							
						</div>
						
					</div>
					<!-- div#userListSrcArea -->
					
					<div id="userListPaging">
						<span>&lt;</span>
						<c:forEach var="i" begin="1" end="5" step="1">
							<span>${i}</span>
						</c:forEach>
						<span>&gt;</span>
					</div>
					<!-- div#userListPaging -->
					
				</div>
				
			</div>
			<!-- div#useListArea -->
					
		</div>
		
		<%@ include file ="/WEB-INF/views/inc/footer.jsp" %>
	</div>
	<!-- div#wrap -->
	
	<script src="/script/jquery-3.6.4.min.js"></script>
	<script src="/script/script.js"></script>
	
</body>
</html>