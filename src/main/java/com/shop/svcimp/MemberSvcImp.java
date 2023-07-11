package com.shop.svcimp;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.dao.MemberDao;
import com.shop.dto.MemberDto;
import com.shop.oauth.OAuthProvider;
import com.shop.svc.MemberSvc;

@Service
public class MemberSvcImp implements MemberSvc {
	
	@Autowired
	MemberDao memberDao;
	
	//회원정보 리스트
	@Override
	public List<MemberDto> memberList() {
		return memberDao.memberList();
	}
	
	//회원정보상세보기
	@Override
	public MemberDto userView(int num) {
		return memberDao.userView(num);
	}
	
	//내정보
	@Override
	public MemberDto myInfo(int num) {
		return memberDao.myInfo(num);
	}

	// 유저정보 가져오기
	@Override
	public MemberDto getMember(String uid) {
		return memberDao.getMember(uid);
	}
	
	// 회원가입
	@Override
	public boolean join(HttpServletRequest req) {
		Map<String, Object>map = new HashMap<>();
		map.put("p1", req.getParameter("uid"));
		map.put("p2", req.getParameter("upw"));
		map.put("p3", req.getParameter("uname"));
		map.put("p4", req.getParameter("uemail"));
		map.put("p5", OAuthProvider.EZEN);
		map.put("p6", req.getParameter("gender"));
		map.put("p7", req.getParameter("ubirthday"));
		map.put("p8", req.getParameter("uzipCode"));
		map.put("p9", req.getParameter("uaddr"));
		map.put("p10", req.getParameter("phoneNum"));
		return memberDao.join(map);
	}
	
	// 로그인
	@Override
	public MemberDto login(String uid, String upw) {
		return memberDao.login(uid, upw);
	}

	@Override
	public boolean modMyInfo(HttpServletRequest req) {
		Map<String, Object>map = new HashMap<>();
		map.put("p1", req.getParameter("uid"));
		map.put("p2", req.getParameter("upw"));
		map.put("p3", req.getParameter("uname"));
		map.put("p4", req.getParameter("uemail"));
		map.put("p5", req.getParameter("gender"));
		map.put("p6", req.getParameter("ubirthday"));
		map.put("p7", req.getParameter("uzipCode"));
		map.put("p8", req.getParameter("uaddr"));
		map.put("p9", req.getParameter("phoneNum"));
		return memberDao.modMyInfo(map);
	}




}
