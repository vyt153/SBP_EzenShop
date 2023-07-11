package com.shop.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Update;

@Mapper
public interface GoodsDetailRegDao {

	

	@Update("update goods set " + 
			"goodsTXT = #{goodsTXT}, " +
			"filename = #{filename}, " + 
			"filesize = #{filesize}, " + 
			"oriFilename = #{oriFilename} " + 
			"where num = 1")
	public boolean goodsDetailRegProc(Map<String, Object> map) throws Exception;
	
	
	
	@Insert("insert into goodsDetailImg(imgName, oriFilename, filesize) "
			+ " values "
			+ "(#{imgName}, #{oriFilename}, #{filesize})")
	public boolean addDetailImg(Map<String, Object> map) throws Exception;
	
	

	
}
