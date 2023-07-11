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
<link rel="stylesheet" href="/style/style_categoryDetail.css" />

</head>
<fmt:formatNumber var="discountRate" value="${0.20}" type="percent" />
<body>
	
	<div id = "wrap">
		
		<div id="innerWrap">
			
			<%@ include file ="/WEB-INF/views/inc/headerGNB_admin.jsp" %>
			<%@ include file ="/WEB-INF/views/inc/sitemap.jsp" %>
			<div id="bestArea">
				<div id="title">
					<h3>BEST STYLE</h3>
				</div>
				<div class="bestItemArea dFlex">
					<c:forEach var="i" begin="1" end="4" step="1">
					<div class="item-list">
						<div class="bestImg">
							<a href="#"><img src="https://cdn2-aka.makeshop.co.kr/shopimages/jogunshop/037010000656.gif?1621233690" alt="topBest1"></a>
						</div>
						<!-- bestImg -->
						<div class="itemInfo">
							<div class="colorOption">
								<!-- 색상 옵션 이미지 -->
								<img src="images/index/ColorOption2png.png" alt="색상 이미지 첨부">
							</div>
							<!-- colorOption -->
							<div class="reviewCnt">
								리뷰 : <span>505</span>
							</div>
							<!-- div.reviewCnt -->
							<div class="goodsInfo">
								<a href="#" class="goodsName">[1+1]감사제 링클리프 반팔셔츠</a> <br>
								<a href="#" class="goodsSize">M~2XL(95~115)</a>

								<p class="goodsDescript">
								[세가지 타입의 기장 선택] 
								</p>
								<p class="goodsPrice">
									37,800원<span data-link="${goodsDiscount}">${discountRate}</span>
								</p>
							</div>
							<!-- div.goodsInfo -->
							<div id="delStatusArea">
								<span id="rushOrder">주문폭주</span> <span id="fastDeliver">당일배송</span>
							</div>
						</div>
						<!-- itemInfo -->
					</div>
					<!-- item-list -->
					</c:forEach>
				</div>
				<!-- bestItemArea -->
				<div class="bestItemArea dFlex">
					<c:forEach var="i" begin="1" end="4" step="1">
					<div class="item-list">
						<div class="bestImg">
							<a href="#"><img src="https://cdn2-aka.makeshop.co.kr/shopimages/jogunshop/014004000731.gif?1684468143" alt="topBest1"></a>
						</div>
						<!-- bestImg -->
						<div class="itemInfo">
							<div class="colorOption">
								<!-- 색상 옵션 이미지 -->
								<img src="images/index/ColorOption2png.png" alt="색상 이미지 첨부">
							</div>
							<!-- colorOption -->
							<div class="reviewCnt">
								리뷰 : <span>505</span>
							</div>
							<!-- div.reviewCnt -->
							<div class="goodsInfo">
								<a href="#" class="goodsName">[1+1]감사제 링클리프 반팔셔츠</a> <br>
								<a href="#" class="goodsSize">M~2XL(95~115)</a>
								<p class="goodsDescript">
									<!-- [세가지 타입의 기장 선택] --> 
								</p>
								<p class="goodsPrice">
									37,800원<span data-link="${goodsDiscount}">${discountRate}</span>
								</p>
							</div>
							<!-- div.goodsInfo -->
							<div id="delStatusArea">
								<span id="rushOrder">주문폭주</span> <span id="fastDeliver">당일배송</span>
							</div>
							<!-- delStatusArea -->
						</div>
						<!-- itemInfo -->
					</div>
					<!-- item-list -->
					</c:forEach>
				</div>
				<!-- bestItemArea -->
			</div>
			<!-- div#bestArea -->
		</div>
		<!-- innerWrap -->
		<div id="wrapper">
		<!-- categoryNameArea -->
		<div id="categoryNameArea">
				<div id="title" class="dFlex">
					<span id="categoryName">${"SHIRTS"}</span>
					<div class="class-list">
						<ul class="dFlex">
							<li><a href="#">+베이직</a></li>
							<li><a href="#">+청남방</a></li>
							<li><a href="#">+체크&amp;패턴</a></li>
							<li><a href="#">+스트라이프</a></li>
							<li><a href="#">+헨리넥&amp;차이나</a></li>
						</ul>
					</div>
				</div>
				<!-- div#title -->
					<div class="item-info dFlex">
						<div class="item-total">
							TOTAL
							<span>160</span>
							PRODUCT
						</div>
						<!-- item-total -->
						<div class="item-order">
							<ul class="dFlex">
								<li>
									<a href="#">
										<span class="on">
											New
										</span>
									</a>
								</li>
								<li>
									<a href="#">
										<span>Name</span>
									</a>
								</li>
								<li>
									<a href="#">
										<span>Hot</span>
									</a>
								</li>
								<li>
									<a href="#">
										<span>Best</span>
									</a>
								</li>
								<li>
									<a href="#">
										<span>High price</span>
									</a>
								</li>
								<li>
									<a href="#">
										<span>Low price</span>
									</a>
								</li>
								
							</ul>
						</div>
					</div>
					<!-- item-info -->
				<div class="categoryItemArea dFlex">
					<c:forEach var="i" begin="1" end="4" step="1">
					<div class="item-list">
						<div class="categoryImg">
							<a href="#"><img src="https://cdn2-aka.makeshop.co.kr/shopimages/jogunshop/014004000734.gif?1687241308" alt="topBest1"></a>
						</div>
						<!-- categoryImg -->
						<div class="itemInfo">
							<div class="colorOption">
								<!-- 색상 옵션 이미지 -->
								<img src="images/index/ColorOption2png.png" alt="색상 이미지 첨부">
							</div>
							<!-- colorOption -->
							<div class="reviewCnt">
								리뷰 : <span>505</span>
							</div>
							<!-- div.reviewCnt -->
							<div class="goodsInfo">
								<a href="#" class="goodsName">[1+1]감사제 링클리프 반팔셔츠</a> <br>
								<a href="#" class="goodsSize">M~2XL(95~115)</a>

								<p class="goodsDescript">
								[세가지 타입의 기장 선택] 
								</p>
								<p class="goodsPrice">
									37,800원<span data-link="${goodsDiscount}">${discountRate}</span>
								</p>
							</div>
							<!-- div.goodsInfo -->
							<div id="delStatusArea">
								<span id="rushOrder">주문폭주</span> <span id="fastDeliver">당일배송</span>
							</div>
						</div>
						<!-- itemInfo -->
					</div>
					<!-- item-list -->
					</c:forEach>
				</div>
				<!-- categoryItemArea -->
				<div class="categoryItemArea dFlex">
					<c:forEach var="i" begin="1" end="4" step="1">
					<div class="item-list">
						<div class="categoryImg">
							<a href="#"><img src="https://cdn2-aka.makeshop.co.kr/shopimages/jogunshop/014004000684.gif?1652076904" alt="topBest1"></a>
						</div>
						<!-- bestImg -->
						<div class="itemInfo">
							<div class="colorOption">
								<!-- 색상 옵션 이미지 -->
								<img src="images/index/ColorOption2png.png" alt="색상 이미지 첨부">
							</div>
							<!-- colorOption -->
							<div class="reviewCnt">
								리뷰 : <span>505</span>
							</div>
							<!-- div.reviewCnt -->
							<div class="goodsInfo">
								<a href="#" class="goodsName">[1+1]감사제 링클리프 반팔셔츠</a> <br>
								<a href="#" class="goodsSize">M~2XL(95~115)</a>
								<p class="goodsDescript">
									<!-- [세가지 타입의 기장 선택] --> 
								</p>
								<p class="goodsPrice">
									37,800원<span data-link="${goodsDiscount}">${discountRate}</span>
								</p>
							</div>
							<!-- div.goodsInfo -->
							<div id="delStatusArea">
								<span id="rushOrder">주문폭주</span> <span id="fastDeliver">당일배송</span>
							</div>
							<!-- delStatusArea -->
						</div>
						<!-- itemInfo -->
					</div>
					<!-- item-list -->
					</c:forEach>
				</div>
				<!-- categoryItemArea -->
				
			</div>
			<!-- div#bestArea -->
			<div id="categoryDetailPaging">
				<span>&lt;</span>
				<c:forEach var="i" begin="1" end="5" step="1">
				<span>${i}</span>
				</c:forEach>
				<span>&gt;</span>
			</div>
			<!-- div#userListPaging -->
		</div>
		<!-- wrapper -->
		
			
		<%@ include file ="/WEB-INF/views/inc/footer.jsp" %>
	</div>
	<!-- div#wrap -->
	
	<script src="/script/jquery-3.6.4.min.js"></script>
	<script src="/script/script_categoryDetail.js"></script>
	
</body>
</html>