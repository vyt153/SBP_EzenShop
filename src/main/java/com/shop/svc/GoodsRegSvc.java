package com.shop.svc;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.shop.dto.GoodsRegDto;

public interface GoodsRegSvc {

	// 재고 상세보기
	public List<GoodsRegDto> goodsModList(String goodsCode);

	// 재고 수정
	public int goodsRegUpdate(String goodsCode, String goodsName, String goodsCategory, int goodsPrice,
			int goodsDiscount, int num);

	// 재고목록1
	public List<GoodsRegDto> goodsRegList();

	// 재고등록
	public int goodsReg(String goodsCode, String goodsName, String goodsCategory, int goodsPrice, int goodsDiscount);

	// 재고검색
	public List<GoodsRegDto> goodsRegSrc(String keyWord, String goodsCode);

	// 재고개수
	public int goodsTotalCnt();

	// 상품 상세 정보 불러오기- 지원
	public GoodsRegDto goodsDetailInfo(String goodsCode);

	// 재고삭제
	public int goodsDel(String delCode);

	// 상품 상제정보 입력 - 지원
	public void goodsDetailRegProc(MultipartFile[] files, HttpServletRequest req) throws Exception;

	// 상품 상세보기
	public GoodsRegDto productDetailDao(String goodsCode);
}
