<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
<link rel="stylesheet" href="/style/style.css">
<link rel="stylesheet" href="/style/style_index.css">
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
</head>
<fmt:formatNumber var="discountRate" value="${0.20}" type="percent" />
<body>
	<div id="wrap">

		<div id="innerWrap">

			
			<div id="mainPage">
				<main id="main">
					<div id="slideBtnArea">
						<div class="custom-prev-button">
						  <span class="arrow-left"></span>
						</div>
						
						<div class="custom-next-button">
						  <span class="arrow-right"></span>
						</div>
					</div>
					<!-- sildeBtnArea -->
					<div id="sildeArea">
						<div id="slideImgs" class="slide_div">
							<div>
								<img id="SlideImg1" src="images/index/SlideImg1.jpg" alt="SlideImg1">
							</div>
							<div>
								<img id="SlideImg2" src="images/index/SlideImg2.jpg" alt="SlideImg2">
							</div> 
							<div>
								<img id="SlideImg3" src="images/index/SlideImg3.jpg" alt="SlideImg3">
							</div>
							<div>
								<img id="SlideImg4" src="images/index/SlideImg4.jpg" alt="SlideImg4">
							</div>
							<div>
								<img id="SlideImg5" src="images/index/SlideImg5.jpg" alt="SlideImg5">
							</div>
							<div>
								<img id="SlideImg6" src="images/index/SlideImg6.jpg" alt="SlideImg6">
							</div>
							<div>
								<img id="SlideImg7" src="images/index/SlideImg7.jpg" alt="SlideImg7">
							</div>
							<div>
								<img id="SlideImg8" src="images/index/SlideImg8.jpg" alt="SlideImg8">
							</div>
						</div>
						<!-- div#slideImgs -->
					</div>
					<div id="dailyBestArea">
						<h1>TODAY BEST</h1>
						<div id="TodayBestArea" class="dFlex">

							<c:forEach var="i" begin="1" end="5" step="1">

								<div class="TodayBestImgArea">
									<div class="TodayBestImg dFlex">
										<a href="#"><img src="images/index/Best2.png" alt="해당 제품명"></a>
									</div>
									<!-- div.TodayBestImg -->
									<div class="TodayBestStatus dFlex">
										<div class="colorOption">
											<img src="images/index/ColorOption2png.png" alt="색상 이미지 첨부">
										</div>
										<!-- div.colorStatus -->
										<div class="reviewCnt">
											리뷰 : <span>50</span>
										</div>
										<!-- div.reviewCnt -->
									</div>
									<!-- div.TodayBestStatus -->
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
								</div>
								<!-- div.TodayBestImgArea -->

							</c:forEach>
						</div>
						<!-- div#TodayBestArea -->


					</div>
					<!-- div#dailyBestArea -->

					<hr>

					<div id="categoryBestArea">
						<h1>CATEGORY BEST</h1>
						<div id="cateroryGnbArea">
							<nav id="gnb">
								<!-- ul#mainMenu>li.mainLi*3>a[href=#]{메인메뉴$}+ul.subMenu>li.subLi*4>a[href=#]{서브메뉴$} -->
								<ul id="mainMenu" class="dFlex">
									<li class="mainLi"><a href="#">All</a></li>
									<li class="divider">|</li>
									<li class="mainLi"><a href="#">TOP</a></li>
									<li class="divider">|</li>
									<li class="mainLi"><a href="#">SHIRTS</a></li>
									<li class="divider">|</li>
									<li class="mainLi"><a href="#">PANTS</a></li>
									<li class="divider">|</li>
									<li class="mainLi"><a href="#">OUTER</a></li>
								</ul>
								<!-- ul#mainMenu -->
							</nav>
							<!-- nav#gnb -->
						</div>
						<!-- div#cateroryGnbArea -->


						<div class="categoryBestImgDiv dFlex">

							<c:forEach var="i" begin="1" end="4" step="1">

								<div class="categoryBestImgArea">
									<!-- div.categoryBestImg 시작 -->
									<div class="categoryBestImg dFlex">
										<a href="#"><img src="images/index/CategoryBest1.png"
											alt="해당 제품명"></a>
									</div>
									<!-- <!-- div.categoryBestImg 끝 -->
									<div class="TodayBestStatus dFlex">
										<div class="colorOption">
											<img src="images/index/ColorOption2png.png" alt="색상 이미지 첨부">
										</div>
										<!-- div.colorStatus -->
										<div class="reviewCnt">
											리뷰 : <span>50</span>
										</div>
										<!-- div.reviewCnt -->
									</div>
									<!-- div.TodayBestStatus -->
									<div class="goodsInfo">
										<a href="#" class="goodsName">[1+1]감사제 링클리프 반팔셔츠</a> <br>
										<a href="#" class="goodsSize">M~2XL(95~115)</a>
										<p class="goodsDescript">
											<!-- [세가지 타입의 기장 선택] -->
										</p>
										<p class="goodsPrice">
											37,800원<span data-link="${goodsDiscount}">15%</span>
										</p>
									</div>
									<!-- div.goodsInfo -->
									<div id="delStatusArea">
										<span id="rushOrder">주문폭주</span> <span id="fastDeliver">당일배송</span>
									</div>
									<!-- div#delStatusArea -->
								</div>
								<!-- div.categoryBestImgArea -->

							</c:forEach>

						</div>
						<!-- div.categoryBestImgDiv -->

						<div class="categoryBestImgDiv dFlex">

							<c:forEach var="i" begin="1" end="4" step="1">

								<div class="categoryBestImgArea">
									<!-- div.categoryBestImg 시작 -->
									<div class="categoryBestImg dFlex">
										<a href="#"><img src="images/index/CategoryBest2.png"
											alt="해당 제품명"></a>
									</div>
									<!-- <!-- div.categoryBestImg 끝 -->
									<div class="TodayBestStatus dFlex">
										<div class="colorOption">
											<img src="images/index/ColorOption2png.png" alt="색상 이미지 첨부">
										</div>
										<!-- div.colorStatus -->
										<div class="reviewCnt">
											리뷰 : <span>50</span>
										</div>
										<!-- div.reviewCnt -->
									</div>
									<!-- div.TodayBestStatus -->
									<div class="goodsInfo">
										<a href="#" class="goodsName">[1+1]감사제 링클리프 반팔셔츠</a> <br>
										<a href="#" class="goodsSize">M~2XL(95~115)</a>
										<p class="goodsDescript">
											<!-- [세가지 타입의 기장 선택] -->
										</p>
										<p class="goodsPrice">
											37,800원<span data-link="${goodsDiscount}">15%</span>
										</p>
									</div>
									<!-- div.goodsInfo -->
									<div id="delStatusArea">
										<span id="rushOrder">주문폭주</span> <span id="fastDeliver">당일배송</span>
									</div>
									<!-- div#delStatusArea -->
								</div>
								<!-- div.categoryBestImgArea -->

							</c:forEach>

						</div>
						<!-- div.categoryBestImgDiv -->

					</div>
					<!-- div#categotyBestArea -->

				</main>
				<!-- main#main -->


			</div>
			<!-- div#mainPage -->
		</div>

		
	</div>
	<!-- div#wrap -->

	<script src="../script/jquery-3.6.4.min.js"></script>
	<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<script src="../script/script.js"></script>
</body>
</html>

