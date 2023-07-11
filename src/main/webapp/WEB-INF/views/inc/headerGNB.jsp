<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <link rel="stylesheet" href="/style/style_GNB.css" />
 <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<body>
	
	<div id="headerGNBPage">
		
		<div id="topGNB"  class="dFlex gnbs">
			<nav class="topGnb">
				<ul id="topUl" class="dFlex">
					<li><a href="loginPage">LOGIN</a></li>
					<li>|</li>
					<li><a href="joinAgreement">JOIN</a></li>
					<li>|</li>
					<li>MYPAGE</li>
					<li>|</li>
					<li>ORDER</li>
					<li>|</li>
					<li>CART(0)</li>
					<li>|</li>
					<li class="slideCommu">
						COMMUNITY
						<ul class="commuUl">
							<li><a href="/qna">Q&A</a></li>
							<li>FAQ</li>
							<li>공지사항</li>
							<li>포토리뷰</li>
						</ul>
					</li>
					<li>|</li>
					<li class="goSite">사이트맵</li>
				</ul>
			</nav>
		</div>
		
		<div id="bottomGNB"  class="dFlex gnbs">

			<div id="logoArea">
				<img src="<spring:url value='images/MainLogo.png'/>" alt="메인로고" />
			</div>

			<div id="gnbArea">

				<nav id="headerGNB">

					<ul id="headerUl" class="dFlex">
						<li class="headerLi">BEST</li>
						<li class="headerLi">NEW</li>
						<li class="headerLi">
							TOP
							<ul class="downGnb">
								<li>맨투맨</li>
								<li>후드티</li>
								<li>니트</li>
								<li>긴팔티</li>
								<li>반팔티</li>
							</ul>
						</li>
						<li class="headerLi">
							SHIRTS
							<ul class="downGnb">
								<li>베이직</li>
								<li>청남방</li>
								<li>체크/패턴</li>
								<li>헨리넥</li>
							</ul>
						</li>
						<li class="headerLi">
							PANTS
							<ul class="downGnb">
								<li>청바지</li>
								<li>면바지</li>
								<li>반바지</li>
								<li>슬랙스</li>
							</ul>
						</li>
						<li class="headerLi">
							OUTER
							<ul class="downGnb">
								<li>패딩</li>
								<li>코드</li>
								<li>자켓</li>
								<li>가디건</li>
								<li>조끼</li>
							</ul>
						</li>
						<li class="headerLi">
							ETC
							<ul class="downGnb">
								<li>신발</li>
								<li>가방</li>
							</ul>
						</li>
						<li class="headerLi">
							ACC
							<ul class="downGnb">
								<li>양말</li>
								<li>모자</li>
								<li>장갑</li>
								<li>안경</li>
							</ul>
						</li>
						<li class="headerLi">SALE</li>
					</ul>

				</nav>

			</div>

			<div id="gnbSearchArea" class="dFlex">
				<input type="text">
				<img src="<spring:url value='images/srcIcon.png'/>" alt="돋보기" />
			</div>

		</div>
		
		
	</div>
	
	<script src="/script/jquery-3.6.4.min.js"></script>
	<script src="/script/script_GNB.js"></script>
	
</body> 