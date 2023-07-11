package com.shop.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.shop.dto.QnADto;

@Mapper
public interface QnADao {
	
	@Select("select * from qna order by ref desc, pos asc")
	List<QnADto> qnaList();
	
	@Select("select * from qna where num=#{num}")
	QnADto read(int num);
	
	@Select("select max(num) from qna")
	int getRef();
	
	@Insert("insert into qna (uid, qnapw, uname, subject, content, filename,"
			+ " oriFilename, filesize, ref, pos) "
			+ "values(#{p1}, #{p2}, #{p3}, #{p4}, #{p5}, #{p6}, #{p7}, #{p8}, #{p9}, #{p10})")
	boolean write(Map<String, Object> map);
	
	@Select("select filename from qna where num = #{num}")
	String getFileName(int num);
	
	@Update("update qna set subject=#{p2}, content=#{p3}, "
			+"filename=#{p4}, filesize=#{p5}, oriFilename=#{p6} where num=#{p1}")
	boolean modify(Map<String, Object> map);
	
	@Delete("delete from qna where num = #{num}")
	void delete(int num);
	
}
