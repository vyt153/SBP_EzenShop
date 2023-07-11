package com.shop.svc;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.shop.dto.MemberDto;

public interface MemberSvc {

	//회원정보 내역 
	public List<MemberDto> memberList();
	
	//회원정보 상세보기 
	public MemberDto userView(int num);

	//내정보
	public MemberDto myInfo(int num);
	
	// 회원 찾기
	public MemberDto getMember(String uid);
	
	// 회원 가입
	public boolean join(HttpServletRequest req);
	
	// 로그인
	public MemberDto login(String uid, String upw);
	
	public boolean modMyInfo(HttpServletRequest req);

}


