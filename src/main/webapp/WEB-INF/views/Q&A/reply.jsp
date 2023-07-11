<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<title>Document</title>
		<link rel="stylesheet" href="/style/style.css">
		<link rel="stylesheet" href="/style/style_Q&A.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
		<script src="/script/script_QnA.js"></script>
	</head>
	<body>
		<div id="wrap">
			<div id="innerWrap">
			<h1>답변글</h1>
			<%@ include file="/WEB-INF/views/inc/headerGNB_admin.jsp"%>
			<%@ include file="/WEB-INF/views/inc/sitemap.jsp"%>
			<form action="/reply"  method="post" enctype="multipart/form-data">
				<table id="inquiryTBL">
					<tbody>
						<tr>
							<th>이름</th>
							<td>
							<input type="hidden" name="num" value="${qna.num }">
							<input type="hidden" name="uid" value="${uidSession }">
							<input type="text" name="uname" value="${unameSession }"></td>
							<th>비밀번호 </th>
							<td><div class="dFlex"><input type="text" size="4" name="qnapw" value="${qna.qnapw }">
							<span>글 잠금 기능</span></div></td>
						</tr>
						<tr>
							<th>제목</th>
							<td><input type="text" name="subject"></td>
						</tr>
						<tr>
							<th>내용</th>
							<td colspan="3"><textarea name="content" rows="20"></textarea></td>
						</tr>
						<tr>
							<th>파일</th>
							<td><input type="file" name="filename"></td>
						</tr>
					</tbody>
				</table>
				<div id="btnArea">
					<button>등록하기</button><button type="button" onclick="location.href='qna'">목록보기</button>
				</div>
			</form>
			</div>
			<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
		</div>
		<!-- div#wrap -->
	</body>
</html>