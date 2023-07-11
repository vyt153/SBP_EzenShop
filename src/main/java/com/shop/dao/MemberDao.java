package com.shop.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.shop.dto.MemberDto;


@Mapper
public interface MemberDao {
	
	//회원정보 리스트
	public List<MemberDto> memberList();
	
	//회원정보 상세보기 
	public MemberDto userView(int num);

	//내정보 페이지
	public MemberDto myInfo(int num);

	// 회원 찾기
	@Select("select * from member where uid = #{uid}")
	public MemberDto getMember(String uid);
	
	@Insert("insert into member (uid, upw, uname, uemail, oauth, gender, ubirthday"
			+ ", uzipCode, uaddr, phoneNum) values(#{p1}, #{p2}, #{p3}, #{p4}, #{p5}, #{p6}"
			+ ", #{p7}, #{p8}, #{p9}, #{p10})")
	public boolean join(Map<String, Object> map);
	
	@Select("select * from member where uid=#{param1} and upw=#{param2}")
	public MemberDto login(String uid, String upw);
	
	@Select("select oauth from member where uid=#{uid}")
	public String getOAuth(String uid);
	
	@Update("update member set upw = #{p2}, uname = #{p3}, uemail = #{p4}, gender = #{p5},"
			+ "ubirthday = #{p6}, uzipCode = #{p7}, uaddr = #{p8}, phoneNum = #{p9} where uid=#{p1}")
	public boolean modMyInfo(Map<String, Object> map);
	
	@Delete("delete from member where uid= #{uid}")
	public boolean kakaoDelete(String uid);

}

	 
	

