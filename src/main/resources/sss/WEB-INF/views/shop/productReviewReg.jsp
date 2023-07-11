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
<link rel="stylesheet" href="/style/style_review.css" />
</head>
<body>
	
	<div id = "wrap">
		
		<div id="innerWrap">
			
			<%@ include file ="/WEB-INF/views/inc/headerGNB.jsp" %>
			<%@ include file ="/WEB-INF/views/inc/sitemap.jsp" %>
			
			<!-- 상품정보 가져오기 -->
			<c:forEach var="list" items="${goodsList}">
				<c:set var="goodsCode" value="${list.goodsCode}"/>
				<c:set var="goodsName" value="${list.goodsName}"/>
				<c:set var="num" value="${list.num}"/>
				<c:set var="oriFilename" value="${list.oriFilename}"/>
			</c:forEach>
			<input type="hidden" name="goodsCode" value="${goodsCode}" form="reSubFrm"/>
			<input type="hidden" name="goodsName" value="${goodsName}" form="reSubFrm"/>
			<input type="hidden" name="num" value="${num}" form="reSubFrm"/>
			
			<!-- 주문정보 가져오기 -->
			<input type="hidden" name="goodsSize" value="##" form="reSubFrm">
			<input type="hidden" name="goodsColor" value="##" form="reSubFrm">
			
			<!-- 닉네임 세션가져오기 -->
			<c:set var="unameSession" value="${unameSession}"/>
			<input type="hidden" name="uname" value="${unameSession}" form="reSubFrm">
			
			<div id="reviewRegArea">
				<h1>상품리뷰 작성</h1>

				<div id="rArea">

					<div id="rtextarea">
					
						<span>상품후기</span>
						<div class="goodsInfoArea">
							<img src="/uploadDir/${productDetail.filename}">
							<span>상품이름 : ${goodsName}</span>
						</div>
						<div class="addReviewImgArea">
							<span>사진등록</span>
							<form id="reSubFrm" action="/goodsReviewRegProc" method="POST" enctype="multipart/form-data" >
								<input type="file" name="files" multiple/>
							</form>
						</div>
						<div class="review_Star">
							<fieldset>
								<span class="text-bold"></span> 
								<input type="radio" name="reStar" value="5" id="rate1" form="reSubFrm">
								<label for="rate1">★</label>
								<input type="radio" name="reStar" value="4" id="rate2" form="reSubFrm">
								<label for="rate2">★</label> 
								<input type="radio" name="reStar" value="3" id="rate3" form="reSubFrm">
								<label for="rate3">★</label> 
								<input type="radio" name="reStar" value="2" id="rate4" form="reSubFrm">
								<label for="rate4">★</label> 
								<input type="radio" name="reStar" value="1" id="rate5" form="reSubFrm">
								<label for="<r></r>ate5">★</label>
							</fieldset>
						</div>
						<textarea name="reContent" placeholder="상품후기를 작성해주세요." form="reSubFrm"></textarea>
					
					</div>
					
					<div id="rUserInfo">
						<span>	
							키 : 
						</span>
						<input type="text" name="height" placeholder = "키를 입력해주세요" form="reSubFrm">
						<span>
							몸무게 : 
						</span>
						<input type="text" name="weight" placeholder = "몸무게를 입력해주세요" form="reSubFrm">
					</div>
				</div>
				
				
				<div id="rBtnArea">
					
					<button type="button" id="rAddBtn">등록하기</button>
					<button type="button" id="backList">목록으로</button>
					
				</div>
				
			</div>
			
		</div>
		
		<%@ include file ="/WEB-INF/views/inc/footer.jsp" %>
	</div>
	<!-- div#wrap -->
	
	<script src="/script/jquery-3.6.4.min.js"></script>
	<script src="/script/script_Review.js"></script>
	
</body>
</html>