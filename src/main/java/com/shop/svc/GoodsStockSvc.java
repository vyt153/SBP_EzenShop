package com.shop.svc;

import java.util.List;

import com.shop.dto.GoodsCateDto;
import com.shop.dto.GoodsModDto;
import com.shop.dto.GoodsStockColorDto;
import com.shop.dto.GoodsStockDto;
import com.shop.dto.GoodsStockSizeDto;

public interface GoodsStockSvc {

	// 상품목록2
		public List<GoodsStockDto> goodsStockList();

		// 상품 재고 등록
		public int goodsStock(String goodsCode, String goodsName, String goodsCategory, String goodsColor, String goodsSize,
				int goodsStock);

		// 상품재고별 색
		public List<GoodsStockColorDto> goodsColorList();

		// 상품재고별 사이즈
		public List<GoodsStockSizeDto> goodsSizeList();

		// 상품재고별 카테고리
		public List<GoodsCateDto> goodsCateList();

		// 상품삭제
		public int goodsStockDel(String delCode);

		// 상품재고 상세보기
		// 상품재고별 색
		public List<GoodsStockColorDto> goodsModColorList(String goodsCode);

		// 상품재고별 사이즈
		public List<GoodsStockSizeDto> goodsModSizeList(String goodsCode);

		// 상품재고별 카테고리
		public List<GoodsCateDto> goodsModCateList(String goodsCode);

		// 상품재고수정시 사이즈 불러오기
		public List<GoodsModDto> goodsModCnt(String goodsCode);

		// 상품재고 업데이트
		public int goodsStockMod(String goodsCode, String goodsCategory, String goodsName, String goodsSize, String goodsColor, int goodsStock, int num);

		// 상품재고 추가 업데이트
		public int goodsModMore(String goodsCode, String goodsName, String goodsSize, String goodsCategory, String goodsColor, int goodsStock);

		// 상품재고 본크기
		public int goodsOriLength(String goodsCode);
}
