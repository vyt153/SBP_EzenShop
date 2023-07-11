<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

			<div id="proRegArea">

				<div id="proRegHeader">
					<h1>상품등록</h1>
				</div>

				<div id="proRegTblArea">

					<div id="proRegTbl">

						<div id="proRegInput">
							<div class="proRegTr dFlex">
								<span>상품코드</span> <span> <input type="text"
									id="goodsCode" name="goodsCode" form="goodsStockFrm"
									placeholder="상품코드">
								</span>
							</div>
							<b>${error}</b>
							<div class="proRegTr dFlex">
								<span>상품명</span> <span> <input type="text" id="goodsName"
									name="goodsName" form="goodsStockFrm" placeholder="상품명">
								</span>
							</div>
							<div class="proRegTr dFlex">
								<span>카테고리</span> 
								<span class="cateSel dFlex"> 
									<select id="cateBig">
										<option>TOP</option>
										<option>SHIRTS</option>
										<option>PANTS</option>
										<option>OUTER</option>
										<option>ETC</option>
										<option>ACC</option>
									</select> 
								<select id="goodsCategory" name="goodsCategory" form="goodsStockFrm">
										<option>맨투맨</option>
										<option>후드티</option>
										<option>니트</option>
										<option>긴팔티</option>
										<option>반팔티</option>
								</select>

								</span>
							</div>
							<div class="proRegTr dFlex">
								<span>가격</span> <span> <input type="text" id="goodsPrice"
									name="goodsPrice" placeholder="가격" form="goodsStockFrm">
								</span>
							</div>
							<div class="proRegTr dFlex">
								<span>할인율</span> <span> <input type="text"
									id="goodsDiscount" name="goodsDiscount" placeholder="할인율"
									form="goodsStockFrm">
								</span>
							</div>

						</div>
						<!-- div#proReginput -->

						<span id="csSub">색상 및 사이즈</span>
						<form id="goodsStockFrm" action="/goodsRegProc">
							<div id="colorSizeCntArea">
								<div class="colorSizeCnt">

									<div class="colorSelect dFlex">
										<input type="text" name="goodsColor" placeholder="색상">
										<button type="button" id="colorAddBtn">+</button>
										<button type="button" id="colorDelBtn">-</button>
									</div>

									<div class="sizeCnt">
										<div class="sizeCntList dFlex">
											<label class="sizeChk dFlex"> <input type="hidden"
												name="goodsSize" value="s"><span>S</span>
											</label> <input type="text" name="sizeCnt" value="0" /><span>개</span>
										</div>
										<div class="sizeCntList dFlex">
											<label class="sizeChk dFlex"> <input type="hidden"
												name="goodsSize" value="m"><span>M</span>
											</label> <input type="text" name="sizeCnt" value="0" /><span>개</span>
										</div>
										<div class="sizeCntList dFlex">
											<label class="sizeChk dFlex"> <input type="hidden"
												name="goodsSize" value="l"><span>L</span>
											</label> <input type="text" name="sizeCnt" value="0" /><span>개</span>
										</div>
										<div class="sizeCntList dFlex">
											<label class="sizeChk dFlex"> <input type="hidden"
												name="goodsSize" value="xl"><span>XL</span>
											</label> <input type="text" name="sizeCnt" value="0" /><span>개</span>
										</div>
										<div class="sizeCntList dFlex">
											<label class="sizeChk dFlex"> <input type="hidden"
												name="goodsSize" value="xxl"><span>XXL</span>
											</label> <input type="text" name="sizeCnt" value="0" /><span>개</span>
										</div>
									</div>

								</div>
							</div>
							<!-- div#colorSizeCntArea -->
						</form>

						<div id="proRegBtnArea" class="dFlex">

							<button type="button" id="goodsStockBtn">등록하기</button>
							<button type="button" onclick="location.href='/goodsRegList'">목록으로</button>

						</div>

					</div>

				</div>

			</div>

		</div>

		<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
	</div>
	<!-- div#wrap -->

	<script src="/script/jquery-3.6.4.min.js"></script>
	<script src="/script/script_ProReg.js"></script>

</body>
</html>