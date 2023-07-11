<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<title>Document</title>
		<link rel="stylesheet" href="/style/style_Q&A.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
		<script src="/script/script_QnA.js"></script>
	</head>
	<body>
		<div id="wrap">
			<div id="innerWrap">
			<h1>Q&A</h1>
			<%@ include file="/WEB-INF/views/inc/headerGNB_admin.jsp"%>
			<%@ include file="/WEB-INF/views/inc/sitemap.jsp"%>
			
			<div id="qnaGNB">
				<ul class="dFlex">
					<li><a href="" class="checked">상품문의</a></li>
					<li><a href="">주문/결제/입금확인</a></li>
					<li><a href="">배송문의</a></li>
					<li><a href="">취소/변경</a></li>
					<li><a href="">교환/반품</a></li>
					<li><a href="">FAQ</a></li>
				</ul>
			</div>
			<table>
				<thead>
					<tr>
						<th>NO.</th>
						<th>PRODUCT</th>
						<th>CONTENT</th>
						<th>NAME</th>
						<th>HITS</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${qnaList }" var="q">	
					<tr onclick="location.href='qnaRead?num=${q.num}'">
						<td>${q.num }</td>
						<c:if test="${q.filename!=null && q.filename!=''}">
						<td><img src="qnaDir/${q.filename }" alt=""></td>
						</c:if>
						<c:if test="${q.filename==null||q.filename=='' }">
						<td></td>
						</c:if>
						<td id="content">
						<c:if test="${q.pos>0 }">
						<img src="images/Re.PNG" alt=""></c:if>
						${q.subject }
						</td>
						<td>${q.uname }</td>
						<td>${q.readCnt }</td>
					</tr>
					</c:forEach>
					<tr>
						<td>0</td>
						<td><img src="images/index/Best2.png" alt=""></td>
						<td id="content"> [쿨 -5˚C 텐셀 3type 히든밴딩 데님S~3XL(28~38)[세 가지 타입의 기장선택]] 사이즈 문의 </td>
						<td>UNAME</td>
						<td>1</td>
					</tr>
				</tbody>
			</table>
			
			<form action="qnaSearch" id="searchForm">
				<div id="aside" class="dFlex">
					<div id="qnaSearchArea" class="dFlex">
						<select name="keyField" id="">
							<option value="uname">이름</option>
							<option value="title">제목</option>
							<option value="content">내용</option>
							<option value="goodsName">상품</option>
						</select>
						<input type="text">
						<img src="<spring:url value='images/srcIcon.png'/>" alt="돋보기" />
					</div>
					<div id="pagingArea">
						<a href="">1</a>
						<a href="">2</a>
						<a href="">3</a>
						<a href="">4</a>
						<a href="">5</a>
					</div>
					<div id="writeArea" align="right">
						<c:if test="${uidSession!=null }">
						<div id="writeBtnArea">
							<a href="qnaWritePage?uid=${uidSession }">WRITE</a>
						</div>
						</c:if>
					</div>
				</div>
			</form>
			</div>
			<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
		</div>
		<!-- div#wrap -->
	</body>
</html>