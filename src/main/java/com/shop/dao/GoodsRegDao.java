package com.shop.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.shop.dto.GoodsRegDto;

@Mapper
public interface GoodsRegDao {

	// 재고목록1
	@Select("select * from goods order by num desc")
	public List<GoodsRegDto> goodsRegList();

	// 재고등록
	@Insert("insert into goods (goodsCode,goodsName,goodsCategory,goodsPrice,goodsDiscount) "
			+ "values (#{param1}, #{param2}, #{param3}, #{param4}, #{param5})")
	public int goodsReg(String goodsCode, String goodsName, String goodsCategory, int goodsPrice, int goodsDiscount);

	// 재고개수
	@Select("select count(*) from goods")
	public int goodsTotalCnt();

	// 재고삭제
	@Delete("delete from goods where goodsCode=#{param1}")
	public int goodsDel(String delCode);

	// 재고검색
	@Select("select * from goods where ${param1} like CONCAT('%',#{param2},'%')")
	public List<GoodsRegDto> goodsRegSrc(String keyWord, String goodsCode);

	// 재고 상세보기
	@Select("select * from goods where goodsCode=#{param1}")
	public List<GoodsRegDto> goodsModList(String goodsCode);

	// 재고수정
	@Update("update goods set goodsCode=#{param1}, goodsName=#{param2}, goodsCategory=#{param3}, goodsPrice=#{param4}, goodsDiscount=#{param5}"
			+ " where num=#{param6}")
	public int goodsRegUpdate(String goodsCode, String goodsName, String goodsCategory, int goodsPrice,
			int goodsDiscount, int num);

	// 상품 상세보기
	@Select("select * from goods where goodsCode = #{goodsCode}")
	public GoodsRegDto productDetailDao(String goodsCode);

	// 상품 상세 정보 불러오기- 지원
	@Select("select * from goods where goodsCode = #{param1}")
	public GoodsRegDto goodsDetailInfo(String goodsCode);

	// 상품 상제정보 입력
	@Update("update goods set goodsTXT = #{goodsTXT}, filename = #{filename}, filesize = #{filesize}, "
			+ "oriFilename = #{oriFilename} where goodsCode = #{goodsCode}")
	public void goodsDetailRegProc(Map<String, Object> map) throws Exception;

	// 상품 추가 이미지 입력
	@Insert("insert into goodsDetailImg(goodsCode, imgName, oriFilename, filesize) values "
			+ "(#{goodsCode}, #{imgName}, #{oriFilename}, #{filesize})")
	public void addDetailImg(Map<String, Object> map) throws Exception;

}
