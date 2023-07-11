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
				<h3 class="title">문의사항</h3>
				
					<div id="goods-thumb" class="dFlex">
				<c:if test="${qna.filename!=null&&qna.filename!='' }">
						<div id="goods-img">
							<img src="/qnaDir/${qna.filename}"
								alt="이미지0"> <span class="msg"></span>
						</div>
				</c:if>
						<!-- goods_img -->
						
			
							<div id="qnaBox">
								<table id="qnaDetail">
									<tr>
										<th>제목</th>
										<td colspan="2"><b>${qna.subject}</b></td>
									</tr>
									<tr>
										<th>작성자</th>
										<td>${qna.uname}</td>
										<th>작성일</th>
										<td width="150px">${qna.regtm}</td>
									</tr>
									<tr height="300px">
										<th id="content" >내용</th>
										<td colspan="3">${qna.content}</td>
									</tr>
								</table>
							</div>
						
					</div>
					<!-- .goods-thumb -->
					<div id="btnArea">
					<c:if test="${qna.uname==uidSession}">
						<button onclick="location.href='qnaModPage?num=${qna.num}'">수정하기</button>
						<button onclick="location.href='qnaDelete?num=${qna.num}'">삭제하기</button>
					</c:if>
						<button type="button" onclick="location.href='qna'">목록보기</button>
						<button type="button" onclick="location.href='replyPage?num=${qna.num}'">답글달기</button>
					</div>
					
				</div>
				<!-- goods-thumb-area -->
			</main>
			<!-- main#main -->

		</div>

		<%@ include file="/WEB-INF/views/inc/footer.jsp"%>

	</div>



	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
</body>
</html>