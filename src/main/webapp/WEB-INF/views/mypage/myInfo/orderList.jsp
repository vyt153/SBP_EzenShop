<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EZENSHOP</title>
<link rel="stylesheet" href="/style/style.css" />
<link rel="stylesheet" href="/style/style_orderList.css" />
</head>
<body>

	<div id="wrap">

		<div id="innerWrap">

			<%@ include file="/WEB-INF/views/inc/headerGNB_admin.jsp"%>
			<%@ include file="/WEB-INF/views/inc/sitemap.jsp"%>
			<!-- 작업시작 -->


				<div id="userListHeader">

					<h1>나의 주문 내역</h1>
					<hr>
				</div>
<!-- userListHeader -->
				<div id="orderListTblArea">

					<div class="orderListTblHeader orderListTbl dFlex">
						
								<span>상품명</span>
								<span>가격</span>
								<span>수량</span>
								<span>옵션</span>
								<span>결제금액</span>
								<span>결제일</span>
						
				

					</div>



					<%-- <c:forEach begin="0" end="20" step="1" var="orederList" items=""> --%>
						<div class="orderListTbl dFlex" data-link="">


								<span>상품명</span>
								<span>가격</span>
								<span>수량</span>
								<span>옵션</span>
								<span>결제금액</span>
								<span>결제일</span>
						
				
						

						</div>
						<!-- div.userListTbl -->

					<%-- </c:forEach> --%>

				</div>
				<!-- div#userListTblArea -->
				</div>
			<!-- ListArea -->
				<!-- 작업   -->
			

			<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
		</div>
		<!-- div#wrap -->

		<script src="/script/jquery-3.6.4.min.js"></script>
		<script src="/script/script.js"></script>
</body>
</html>