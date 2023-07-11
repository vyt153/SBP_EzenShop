<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Document</title>
<link rel="stylesheet" href="/style/style_Q&A.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="/script/script_QnA.js"></script>
</head>
<body>
	<div id="wrap">
		<div id="innerWrap">
			<h1>MYPAGE</h1>
			<%@ include file="/WEB-INF/views/inc/headerGNB_admin.jsp"%>
			<%@ include file="/WEB-INF/views/inc/sitemap.jsp"%>

			<div id="qnaGNB">
				<ul class="dFlex">
					<li><a href="modMyInfoPage?uid=${uidSession }">정보수정</a></li>
					<li><a href="">주문내역</a></li>
					<li><a href="">장바구니</a></li>
				</ul>
				<hr>
			</div>
			<div id="userInfo">
				<h3>개인정보</h3>
				<dl>
					<dt>이 &nbsp;&nbsp;&nbsp; 름</dt>
					<dd>
						<b>${memberInfo.uname } 님</b>
					</dd>
				</dl>
				<dl>
					<dt>전 &nbsp;&nbsp;&nbsp; 화</dt>
					<dd>${memberInfo.phoneNum }</dd>
				</dl>
				<dl>
					<dt>이 메 일</dt>
					<dd>${memberInfo.uemail }</dd>
				</dl>
				<dl>
					<dt>주 &nbsp;&nbsp;&nbsp; 소</dt>
					<dd>${memberInfo.uaddr }</dd>
				</dl>
				<dl>
					<dt></dt>
					<dd></dd>
				</dl>
			</div>
			<h3 class="mypageTitle">주문내역</h3>
			<table>
				<thead>
					<tr>
						<th>NO.</th>
						<th>PRODUCT</th>
						<th>PRODUCTNAME</th>
						<th>SIZE</th>
						<th>COLOR</th>
						<th>PRICE</th>
						<th>ORDER_DATE</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>0</td>
						<td><img src="images/index/Best2.png" alt=""></td>
						<td id="content">[쿨 -5˚C 텐셀 3type 히든밴딩 데님S~3XL(28~38)[세 가지
							타입의 기장선택]] 사이즈 문의</td>
						<td>UNAME</td>
						<td>1</td>
					</tr>
					<tr>
						<td>0</td>
						<td><img src="images/index/Best2.png" alt=""></td>
						<td id="content">[쿨 -5˚C 텐셀 3type 히든밴딩 데님S~3XL(28~38)[세 가지
							타입의 기장선택]] 사이즈 문의</td>
						<td>UNAME</td>
						<td>1</td>
					</tr>
					<tr>
						<td>0</td>
						<td><img src="images/index/Best2.png" alt=""></td>
						<td id="content">[쿨 -5˚C 텐셀 3type 히든밴딩 데님S~3XL(28~38)[세 가지
							타입의 기장선택]] 사이즈 문의</td>
						<td>UNAME</td>
						<td>1</td>
					</tr>
					<tr>
						<td>0</td>
						<td><img src="images/index/Best2.png" alt=""></td>
						<td id="content">[쿨 -5˚C 텐셀 3type 히든밴딩 데님S~3XL(28~38)[세 가지
							타입의 기장선택]] 사이즈 문의</td>
						<td>UNAME</td>
						<td>1</td>
					</tr>
					<tr>
						<td>0</td>
						<td><img src="images/index/Best2.png" alt=""></td>
						<td id="content">[쿨 -5˚C 텐셀 3type 히든밴딩 데님S~3XL(28~38)[세 가지
							타입의 기장선택]] 사이즈 문의</td>
						<td>UNAME</td>
						<td>1</td>
					</tr>
					<tr>
						<td>0</td>
						<td></td>
						<td id="content">[쿨 -5˚C 텐셀 3type 히든밴딩 데님S~3XL(28~38)[세 가지
							타입의 기장선택]] 사이즈 문의</td>
						<td>UNAME</td>
						<td>1</td>
					</tr>
				</tbody>
			</table>
			<h3 class="mypageTitle">장바구니</h3>
			<table>
				<thead>
					<tr>
						<th>NO.</th>
						<th>PRODUCT</th>
						<th>PRODUCTNAME</th>
						<th>SIZE</th>
						<th>COLOR</th>
						<th>PRICE</th>
						<th>SELL_STATUS</th>
						<th>DELETE</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>0</td>
						<td><img src="images/index/Best2.png" alt=""></td>
						<td id="content">[쿨 -5˚C 텐셀 3type 히든밴딩 데님S~3XL(28~38)[세 가지
							타입의 기장선택]] 사이즈 문의</td>
						<td>UNAME</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td><input type="checkbox"></td>
					</tr>
					<tr>
						<td>0</td>
						<td><img src="images/index/Best2.png" alt=""></td>
						<td id="content">[쿨 -5˚C 텐셀 3type 히든밴딩 데님S~3XL(28~38)[세 가지
							타입의 기장선택]] 사이즈 문의</td>
						<td>UNAME</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
					</tr>
					<tr>
						<td>0</td>
						<td><img src="images/index/Best2.png" alt=""></td>
						<td id="content">[쿨 -5˚C 텐셀 3type 히든밴딩 데님S~3XL(28~38)[세 가지
							타입의 기장선택]] 사이즈 문의</td>
						<td>UNAME</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
					</tr>
					<tr>
						<td>0</td>
						<td><img src="images/index/Best2.png" alt=""></td>
						<td id="content">[쿨 -5˚C 텐셀 3type 히든밴딩 데님S~3XL(28~38)[세 가지
							타입의 기장선택]] 사이즈 문의</td>
						<td>UNAME</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
					</tr>
					<tr>
						<td>0</td>
						<td><img src="images/index/Best2.png" alt=""></td>
						<td id="content">[쿨 -5˚C 텐셀 3type 히든밴딩 데님S~3XL(28~38)[세 가지
							타입의 기장선택]] 사이즈 문의</td>
						<td>UNAME</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
					</tr>
					<tr>
						<td>0</td>
						<td></td>
						<td id="content">[쿨 -5˚C 텐셀 3type 히든밴딩 데님S~3XL(28~38)[세 가지
							타입의 기장선택]] 사이즈 문의</td>
						<td>UNAME</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
					</tr>
				</tbody>
			</table>
			<form action="qnaSearch" id="searchForm">
				<div id="aside" class="dFlex">
					<div id="qnaSearchArea" class="dFlex">
						<select name="keyField" id="">
							<option value="goodsName">상품이름</option>
							<option value="title">제목</option>
							<option value="content">내용</option>
							<option value="goodsName">상품</option>
						</select> <input type="text"> <img
							src="<spring:url value='images/srcIcon.png'/>" alt="돋보기" />
					</div>
					<div id="pagingArea">
						<a href="">1</a> <a href="">2</a> <a href="">3</a> <a href="">4</a>
						<a href="">5</a>
					</div>
				</div>
			</form>
		</div>
		<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
	</div>
	<!-- div#wrap -->
</body>
</html>