<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EZENSHOP</title>
<link rel="stylesheet" href="/style/style.css" />
<link rel="stylesheet" href="/style/style_adminProduct.css" />
</head>
<body>

	<div id="wrap">

		<div id="innerWrap">

			<%@ include file="/WEB-INF/views/inc/headerGNB_admin.jsp"%>
			<%@ include file="/WEB-INF/views/inc/sitemap.jsp"%>

			<div id="proMod">

				<div id="proRegHeader">
					<h1>재고수정</h1>
				</div>

				<form id="goodsModFrm">

					<div id="proRegTblArea">

						<div id="proRegTbl">

							<c:forEach var="goodsRegList" items="${goodsRegList}">
								<div id="proRegInput">
									<input type="hidden" id="num" name="num" value="${goodsRegList.num}">
									<input type="hidden" id="oriCode" name="oriCode" value="${goodsRegList.goodsCode}">
									<div class="proRegTr dFlex">
										<span>상품코드</span> 
										<span>
											<input type="text" id="goodsCode" name="goodsCode"
											value="${goodsRegList.goodsCode}">
										</span>
									</div>
									<div class="proRegTr dFlex">
										<span>상품명</span> <span> <input type="text"
											id="goodsName" name="goodsName"
											value="${goodsRegList.goodsName}">
										</span>
									</div>
									<div class="proRegTr dFlex">
										<span>카테고리</span> <span class="cateSel dFlex"> <select
											id="cateBig">
												<option>TOP</option>
												<option>SHIRTS</option>
												<option>PANTS</option>
												<option>OUTER</option>
												<option>ETC</option>
												<option>ACC</option>
										</select> <select id="goodsCategory" name="goodsCategory">
												<option>맨투맨</option>
												<option>후드티</option>
												<option>니트</option>
												<option>긴팔티</option>
												<option>반팔티</option>
										</select> <input type="hidden" id="optionSel"
											value="${goodsRegList.goodsCategory}">
										</span>
									</div>
									<div class="proRegTr dFlex">
										<span>가격</span> <span> <input type="text"
											id="goodsPrice" name="goodsPrice"
											value="${goodsRegList.goodsPrice}">
										</span>
									</div>
									<div class="proRegTr dFlex">
										<span>할인율</span> <span> <input type="text"
											id="goodsDiscount" name="goodsDiscount"
											value="${goodsRegList.goodsDiscount}">
										</span>
									</div>
								</div>
								<!-- div#proReginput -->

							</c:forEach>

							<span id="csSub">색상 및 사이즈</span>
							<div id="colorSizeCntArea">
								<c:set var="sizeCntChk" value="${fn:length(goodsColorList)}" />
								<c:forEach var="goodsColorList" items="${goodsColorList}"
									varStatus="status">
									<div class="colorSizeCnt">

										<div class="colorSelect dFlex">
											<input type="text" name="goodsColor"
												value="${goodsColorList.goodsColor}">
											<button type="button" id="colorAddBtn">+</button>
											<button type="button" id="colorDelBtn">-</button>
										</div>

										<div class="sizeCnt">

											<c:set var="sizeStart" value="${5*(status.count-1)}" />
											<c:set var="sizeEnd" value="${(5*status.count)-1}" />

											<%-- <h2>sizeStart : ${sizeStart}</h2>
											<h2>sizeEnd : ${sizeEnd}</h2> --%>

											<c:forEach var="goodsModCnt" items="${goodsModCnt}"
												begin="${sizeStart}" end="${sizeEnd}" step="1">

												<div class="sizeCntList dFlex">
													<label class="sizeChk dFlex"> <input type="hidden"
														name="goodsSize" value="${goodsModCnt.goodsSize}">
														<span>${goodsModCnt.goodsSize}</span>
													</label> <input type="text" name="sizeCnt"
														value="${goodsModCnt.goodsStock}" /> <span>개</span>
												</div>

											</c:forEach>

										</div>

									</div>

								</c:forEach>
							</div>
							<!-- div#colorSizeCntArea -->

							<div id="proRegBtnArea" class="dFlex">

								<button type="button" id="goodsModBtn">수정하기</button>
								<button type="button" onclick="location.href='/goodsRegList'">목록으로</button>

							</div>



						</div>

					</div>

				</form>
			</div>
		</div>

		<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
	</div>
	<!-- div#wrap -->

	<script src="/script/jquery-3.6.4.min.js"></script>
	<script src="/script/script_ProReg.js"></script>

</body>
</html>