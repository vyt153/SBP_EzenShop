<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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

			<div id="proArea">

				<div id="proHeader" class="dFlex jcsb">
					<span class="sub">상품목록</span> <span class="total">총 상품수 : (
						<b>${goodsTotal}</b> 개 )
					</span>
				</div>

				<div id="proTblArea">

					<div class="proTblHeader proTblList dFlex">

						<span> <input type="checkbox" id="chkAll">
						</span> <span>상품코드</span> <span>상품이름</span> <span>카테고리</span> <span>색상
							/ 사이즈</span> <span>가격</span> <span>판매상태</span> <span>판매등록</span>

					</div>

					<c:forEach var="goodsRegList" items="${goodsRegList}"
						begin="${paging.cntPerPage*(paging.nowPage-1)}"
						end="${(paging.nowPage*paging.cntPerPage)-1}" step="1"
						varStatus="status">


						<div class="proTblList dFlex">
							<span> <input type="checkbox" class="chk" name="delCode"
								value="${goodsRegList.goodsCode}" form="delFrm">
							</span> <span> <a class="goodsRegAtag"
								href="/goodsRegMod?goodsCode=${goodsRegList.goodsCode}">
									${goodsRegList.goodsCode} </a>
							</span> <span>${goodsRegList.goodsName}</span>
							<c:forEach var="goodsCateList" items="${goodsCateList}">
								<c:if
									test="${goodsCateList.goodsCode eq goodsRegList.goodsCode}">
									<span>${goodsCateList.goodsCategory}</span>
								</c:if>
							</c:forEach>
							<span> <c:forEach var="goodsColorList"
									items="${goodsColorList}">
									<c:if
										test="${goodsColorList.goodsCode eq goodsRegList.goodsCode}">
										<span class="dFlex"> <b>
												${goodsColorList.goodsColor} </b> <span> : <c:forEach
													var="goodsSizeList" items="${goodsSizeList}">
													<c:if
														test="${(goodsSizeList.goodsColor eq goodsColorList.goodsColor) and (goodsSizeList.goodsCode eq goodsColorList.goodsCode)}">
												  ${fn:toUpperCase(goodsSizeList.goodsSize)}
											</c:if>
												</c:forEach>
										</span> <br>
										</span>
									</c:if>
								</c:forEach>
							</span> <span>${goodsRegList.goodsPrice}</span> <span>${goodsRegList.goodsStatus}</span>
							<span>
								<button type="submit" id="saleRegBtn" data-link="${goodsRegList.goodsCode}">판매등록</button>
							</span>
							<form action="/goodsDetailReg" id="goodsDetailRegFrm">
								<input type="hidden" id="saleRegCode" name="goodsCode"
									value="${goodsRegList.goodsCode}">
							</form>
						</div>

					</c:forEach>

					<div class="proTblList dFlex">
						<span>
							<button type="button" id="delBtn">삭제</button>
						</span> <span></span> <span></span> <span></span> <span></span> <span></span>
						<span></span>
					</div>
					<form id="delFrm" action="/goodsDelProc"></form>

					<div class="paging-div">
						<ul class="pagination" id="pagination"></ul>
					</div>

					<div id="pagingTable">

						<table id="pTable">
							<tbody>
								<tr id="listPagingArea">
									<!-- 페이징 시작 -->
									<td colspan="5" id="pagingTd"><c:if
											test="${paging.startPage != 1 }">
											<a
												href="/goodsRegList?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>

										</c:if> <c:forEach begin="${paging.startPage }"
											end="${paging.endPage }" var="p">
											<c:choose>
												<c:when test="${p == paging.nowPage }">
													<b>&nbsp;&nbsp;${p}&nbsp;&nbsp;</b>
												</c:when>
												<c:when test="${p != paging.nowPage }">
													<a
														href="/goodsRegList?nowPage=${p}&cntPerPage=${paging.cntPerPage}">&nbsp;&nbsp;${p}&nbsp;&nbsp;</a>
												</c:when>
											</c:choose>
										</c:forEach> <c:if test="${paging.endPage != paging.lastPage}">
											<a
												href="/goodsRegList?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>

										</c:if></td>
								</tr>
							</tbody>
						</table>

					</div>

					<div id="srcArea" class="dFlex jcsb">

						<div class="src">

							<select name="keyWord" id="keyWord" form="grSrcFrm">
								<option value="goodsCode">상품코드</option>
								<option value="goodsName">상품이름</option>
								<option value="goodsCategory">카테고리</option>
							</select> <input type="text" name="goodsCode" placeholder="검색어를 입력하세요."
								form="grSrcFrm" />
							<button type="submit" id="srcBtn" form="grSrcFrm">검색</button>
							<form id="grSrcFrm" action="/goodsRegList"></form>

						</div>

						<div class="goRegList">
							<button type="button" onclick="location.href='/goodsReg'">상품등록</button>
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