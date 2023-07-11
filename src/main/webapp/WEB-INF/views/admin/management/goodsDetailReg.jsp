<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>	
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>상품상세등록페이지</title>
<link rel="stylesheet" href="/style/style.css">
<link rel="stylesheet" href="/style/style_detail.css">
<link rel="stylesheet" href="/style/style_goodsDetailReg.css">

</head>
<body>
 
	<div id="wrap">

		<div id="innerWrap">
			<%@ include file="/WEB-INF/views/inc/headerGNB_admin.jsp"%>
			<%@ include file="/WEB-INF/views/inc/sitemap.jsp"%>

			<main id="main">
				<div class="goods-thumb-area">
					
					<div id="goods-thumb" class="dFlex">
						<div id="goods-img">
							<div class="image-container">
								<img style="width: 570px;height: 735px;" id="preview-image"
									src="https://dummyimage.com/500x500/ffffff/000000.png&text=preview+image">
								<input type="file" name="files" form="form1" id="thumb-Image" required>
							</div>
							
							
						</div>
						
						
						<div id="goodsOrder">
							<h3 class="title">
								${goodsList.goodsName}  <br> <font class="size"
									style="font-size: 11px; color: #595959;">M~2XL(95~115)</font>
							</h3>
							
							<textarea name="goodsTXT" id="goodsTXT" cols="30" rows="10"
								form="form1" wrap="hard" maxlength="1000"></textarea>
							
							<div id="orderArea">
								<table>
									<tr>
										<td>소비자가</td>
										<fmt:formatNumber var="p1" value="${goodsList.goodsPrice}" pattern="#,###" />
										<td>${p1}</td>
									</tr>
									<c:if test="${goodsList.goodsDiscount <0}">
									<tr>
									<fmt:formatNumber var="p2" value="${goodsList.goodsPrice* goodsList.goodsDiscount}" pattern="#,###" />
									
										<td>판매가격</td>
										<td>${p2}</td>
									</tr>
									</c:if>
									
								</table>
								<hr>
								<div id="btnArea">
									<button class="fBtn">상품등록</button>
									<button type="reset" class="scBtn">초기화</button>
									
								</div>
								<!-- btnArea -->

							</div>
						<!-- 	orderArea -->
						</div>
						<!-- goodsOrder -->
						
					</div>
 				<!-- .goods-thumb -->
				
				<!-- form1 -->
				</div>
				<!-- goods-thumb-info -->
				
				
			</main>
			<!-- main#main -->

			<div id="mGnbMenu">
				<span><a href="#">코디상품</a></span> <span><a href="#">상세정보</a></span>
				<span><a href="#">가이드</a></span> <span><a href="#">상품리뷰</a></span> <span><a
					href="#">Q&amp;A</a></span>
			
			
					
				<div class="addImage-container">
					<input type="file" style="display: block;" name="files" 
					id="adImgs" class="files" form="form1" required multiple="multiple">
				</div>
				
			</div>
			
			

		</div>
		<!-- innerWrap -->
		<%@ include file="/WEB-INF/views/inc/footer.jsp"%>

	</div>
	
	<input type="hidden" name="goodsCode" class="goodsCode" value="${param.goodsCode}" form="form1">
	<form id="form1" method="post" enctype="multipart/form-data"></form>
	<form id="form2" method="post" enctype="multipart/form-data"></form>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<script src="/script/script_goodsDetailReg.js"></script>
</body>
</html>