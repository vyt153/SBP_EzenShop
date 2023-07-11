<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Document</title>
<link rel="stylesheet" href="/style/style.css">
<link rel="stylesheet" href="/style/style_detail.css">

</head>
<body>

	<div id="wrap">

		<div id="innerWrap">

			<%@ include file="/WEB-INF/views/inc/headerGNB_admin.jsp"%>
			<%@ include file="/WEB-INF/views/inc/sitemap.jsp"%>
<main id="main">
				<div class="goods-thumb-area">
					<div id="goods-thumb" class="dFlex">
						<c:set var="goodsCode" value="${productDetail.goodsCode}"/>
						<c:set var="num" value="${productDetail.num}"/>
						
						<div id="goods-img">
							<img src="/uploadDir/${productDetail.filename}" alt="이미지0"> <span class="msg"></span>
						</div>
						<!-- goods_img -->
						<div id="goodsOrder">
			
						<h3 class="title">${productDetail.goodsName}
						<br>
						<font class="size" style="font-size: 11px;color: #595959;">M~2XL(95~115)</font>
						</h3>
						<pre class="preFirst">
						${productDetail.goodsTXT}
					</pre>

							<div id="orderArea">
								<table>
									<tr>
										<td>소비자가</td>
													<fmt:formatNumber var="productDetail" value="${productDetail.goodsPrice}" pattern="#,###" />
										<td>${productDetail}원</td>
									</tr>
									<tr>
										<td>판매가격</td>
										<td>${productDetail}원</td>
									</tr>
									<tr>
										<td>색상</td>
										<td><select>
												<option>옵션 선택</option>
												<option>블랙</option>
												<option>레드</option>
												<option>화이트</option>
										</select></td>
									</tr>
									<tr>
										<td>사이즈</td>
										<td>
											<div class="sizeBtn">
												<button>M(95~100)</button>
												<button>L(100~105)</button>
												<button>XL(105~110)</button>
												<button>2XL(110~115)</button>
											</div>
										</td>
									</tr>
									<tr>
										<td>배송정보</td>
										<td>
											<button class="sendBtn">실시간재고</button>
										</td>
									</tr>
								</table>
								<hr>
								<div id="btnArea">
									<span>총 상품 금액</span> <span>원</span> <br>
	
									<button class="fBtn">구매하기</button>
									<button class="scBtn">장바구니</button>
									<button class="scBtn">관련상품</button>
								</div>
								<!-- btnArea -->
	
							</div>
							<!-- orderArea -->
						</div>
						<!-- goodsOrder -->
					</div>
					<!-- .goods-thumb -->
				</div>
				<!-- goods-thumb-info -->
			</main>
			<!-- main#main -->

			<div id="mGnbMenu">
				<span><a href="#">코디상품</a></span> <span><a href="#">상세정보</a></span>
				<span><a href="#">가이드</a></span> <span><a href="#">상품리뷰</a></span> <span><a
					href="#">Q&amp;A</a></span>
			</div>

		</div>
		
			<%@ include file="/WEB-INF/views/shop/productReview.jsp" %>

	

			<div id="qnaArea">
				<span>Q&A</span>

			</div>

		</div>
		<%@ include file="/WEB-INF/views/inc/footer.jsp"%>


	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<script src="/script/script.js"></script>
</body>
</html>