package com.shop.svc;

import javax.servlet.http.HttpServletRequest;

public interface GoodsDetailRegSvc {

	
	// 상품 상제정보 입력
	public boolean goodsDetailRegProc(HttpServletRequest req) throws Exception;
	
	// 상품 추가 이미지 입력
	public boolean addDetailImg(HttpServletRequest req) throws Exception;
	
}
