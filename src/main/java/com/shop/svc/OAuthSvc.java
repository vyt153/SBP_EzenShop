package com.shop.svc;

import com.shop.dto.KakaoMember;

public interface OAuthSvc {
	
	// 카카오 회원 가입
	public boolean join(KakaoMember kakaoMember);

	// 토큰 받아오기
	public String getAccessToken(String code);
	
	// 회원 정보 받아오기
	public KakaoMember getClientInfo(String accessToken);
	
	public void logout(String accessToken, Long uid);

	public void kakaoDelete(String accessToken, Long uid);
}
