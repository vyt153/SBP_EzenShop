package com.shop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.shop.dto.GoodsCateDto;
import com.shop.dto.GoodsModDto;
import com.shop.dto.GoodsStockColorDto;
import com.shop.dto.GoodsStockDto;
import com.shop.dto.GoodsStockSizeDto;

@Mapper
public interface GoodsStockDao {

	// 재고목록2
		@Select("select * from goodsStock order by num desc")
		public List<GoodsStockDto> goodsStockList();

		// 재고별 색
		@Select("select distinct goodsCode,goodsColor from goodsStock")
		public List<GoodsStockColorDto> goodsColorList();

		// 재고별 사이즈
		@Select("select distinct goodsCode,goodsColor,goodsSize from goodsStock where goodsStock != 0")
		public List<GoodsStockSizeDto> goodsSizeList();

		// 재고별 카테고리
		@Select("select distinct goodsCode,goodsCategory from goodsStock")
		public List<GoodsCateDto> goodsCateList();

		// 재고 등록
		@Insert("insert into goodsStock (goodsCode, goodsName, goodsCategory, goodsColor, goodsSize, goodsStock) values "
				+ "(#{param1}, #{param2}, #{param3}, #{param4}, #{param5}, #{param6})")
		public int goodsStock(String goodsCode, String goodsName, String goodsCategory, String goodsColor, String goodsSize,
				int goodsStock);

		// 재고삭제
		@Delete("delete from goodsStock where goodsCode=#{param1}")
		public int goodsStockDel(String delCode);

		// 재고 상세보기
		// 재고별 색
		@Select("select distinct goodsCode,goodsColor from goodsStock where goodsCode = #{param1} ")
		public List<GoodsStockColorDto> goodsModColorList(String goodsCode);

		// 재고별 사이즈
		@Select("select distinct goodsCode,goodsColor,goodsSize,goodsStock from goodsStock where goodsStock != 0 and goodsCode = #{param1} ")
		public List<GoodsStockSizeDto> goodsModSizeList(String goodsCode);

		// 재고별 카테고리
		@Select("select distinct goodsCode,goodsCategory from goodsStock where goodsCode = #{param1} ")
		public List<GoodsCateDto> goodsModCateList(String goodsCode);
		
		
		// 재고수정시 사이즈 불러오기
		@Select("select distinct goodsCode,goodsColor,goodsSize,goodsStock from goodsStock where goodsCode = #{param1}")
		public List<GoodsModDto> goodsModCnt(String goodsCode);
		
		// 재고 업데이트
		@Update("update goodsStock set goodsCode=#{param1}, goodsCategory=#{param2}, goodsName=#{param3}, goodsSize=#{param4}, goodsColor=#{param5}, goodsStock=#{param6} where num=#{param7}")
		public int goodsStockMod(String goodsCode, String goodsCategory, String goodsName, String goodsSize, String goodsColor, int goodsStock, int num);
		
		// 재고 본크기
		@Select("select count(goodsSize) from goodsStock where goodsCode=#{param1}")
		public int goodsOriLength(String goodsCode);
		
		// 재고 추가 업데이트
		@Insert("insert into goodsStock (goodsCode,goodsName,goodsSize,goodsCategory,goodsColor,goodsStock)"
				+" values (#{param1}, #{param2}, #{param3}, #{param4}, #{param5}, #{param6})")
		public int goodsModMore(String goodsCode, String goodsName, String goodsSize, String goodsCategory, String goodsColor, int goodsStock);
		
}
