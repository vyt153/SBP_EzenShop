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
<link rel="stylesheet" href="/style/style_eventList.css" />
</head>
<body>
	
	<div id = "wrap">
		
		<div id="innerWrap">
			
			<%@ include file ="/WEB-INF/views/inc/headerGNB_admin.jsp" %>
			<%@ include file ="/WEB-INF/views/inc/sitemap.jsp" %>
			<div id="content">
				<h3 class="title">EVENT</h3>
				<ul class="faq-menu">
					<li class="now">
						<a href="#">EVENT</a>
					</li>
					<li>
						<a href="#">당첨자발표</a>
					</li>
					<li>
						<a href="#">스토리</a>
					</li>
					<li>
						<a href="#">TV&amp;코디팁</a>
					</li>
					<li>
						<a href="#">데일리룩</a>
					</li>
				</ul>
				<!-- ul.faq-menu -->
				<div class="bbs-table-list">
					<div class="fixed-img-collist">
						<ul class="clear">
							
							<li>
								<a href="#">
								<span>
								<img src="https://board.makeshop.co.kr/board/special161/jogunshop_image2/%BC%B6%B3%D7%C0%CF_1.jpg" alt="">
								</span>
								적립금 소멸안내(1)                                                                                  
								</a>
							</li>
							<li>
								<a href="#">
								<span>
								<img src="https://board.makeshop.co.kr/board/special161/jogunshop_image2/th1.jpg" alt="">
								</span>
								이젠샵 앱설치하고 쇼핑 100배 즐기기(31)                                                                                
								</a>
							</li>
							<li>
								<a href="#">
								<span>
								<img src="https://board.makeshop.co.kr/board/special161/jogunshop_image2/2021benefit_th_1.jpg" alt="">
								</span>
								이젠샵 회원만을 위한 회원혜택                                                         
								</a>
							</li>
							<li>
								<a href="#">
								<span>
								<img src="https://board.makeshop.co.kr/board/special161/jogunshop_image2/20190902092517.jpg" alt="">
								</span>
								페이코로 결제하고 할인, 적립 받자(150)                                                                                   
								</a>
							</li>
						</ul>
						<!-- ul.clear -->
						<ul class="clear">
							
							<li>
								<a href="#">
								<span>
								<img src="https://board.makeshop.co.kr/board/special161/jogunshop_image2/smartmypage_20210825_1.jpg" alt="">
								</span>
								적립금 소멸안내(1)                                                                                  
								</a>
							</li>
							<li>
								<a href="#">
								<span>
								<img src="https://board.makeshop.co.kr/board/special161/jogunshop_image2/th_2.jpg" alt="">
								</span>
								이젠샵 앱설치하고 쇼핑 100배 즐기기(31)                                                                                
								</a>
							</li>
							<li>
								<a href="#">
								<span>
								<img src="https://board.makeshop.co.kr/board/special161/jogunshop_image2/e_main3_1.jpg" alt="">
								</span>
								7월 카드사 혜택안내(2)                                                      
								</a>
							</li>
						</ul>
						<!-- ul.clear -->
					</div>
					<!-- fixed-img-collist -->
				</div>
				<!-- bbs-table-list -->
				<div class="bbs-btm dFlex">
					<div class="bbs-sch">
						<form action="#" name="form1">
							<fieldset>
								<label for="">
									<input type="radio" name="shname" class="MS_input_checkbox">
									이름
								</label>
								<label for="">
									<input type="radio" name="title">
									제목
								</label>
								<label for="">
									<input type="radio" name="content">
									내용
								</label>
								<span class="key-wrap">
									<input type="text" name="text" class="MS_input_txt">
									<a href="#">
									<i class="xi-search">
										<img src="/images/srcIcon2.png" alt="">
									</i>
									</a>
								</span>
							</fieldset>
						</form>	
					</div>
					<!-- bbs-sch -->
					<div class="bbs-link">
						<a href="" class="CSSbuttonWhite">WRITE</a>
					</div>
					<!-- bbs-link -->
				</div>
				<!-- bbs-btm -->
				<div id="eventListPaging">
				<span>&lt;</span>
				<c:forEach var="i" begin="1" end="5" step="1">
				<span>${i}</span>
				</c:forEach>
				<span>&gt;</span>
			</div>
			<!-- div#userListPaging -->
			</div>
			<!-- content -->
		</div>
		<!-- innerWrap -->
		<%@ include file ="/WEB-INF/views/inc/footer.jsp" %>
	</div>
	<!-- div#wrap -->
	
	<script src="/script/jquery-3.6.4.min.js"></script>
	<script src="/script/script_eventList.js"></script>
	
</body>
</html>