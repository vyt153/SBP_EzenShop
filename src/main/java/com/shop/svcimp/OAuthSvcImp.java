package com.shop.svcimp;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.shop.dao.MemberDao;
import com.shop.dto.KakaoMember;
import com.shop.dto.MemberDto;
import com.shop.oauth.OAuthInfo;
import com.shop.oauth.OAuthProvider;
import com.shop.svc.OAuthSvc;
import com.shop.token.KakaoToken;

@Service
@Transactional
public class OAuthSvcImp implements OAuthSvc{
	
	private static final String GRANT_TYPE = "authorization_code";
	
	private static final String TARGET_ID_TYPE = "user_id";

	private RestTemplate restTemplate = new RestTemplate();
	
	// JSON Mapper
	private ObjectMapper objMapper = new ObjectMapper();
	
	private MemberDao memberDao;
	
	@Autowired
	public OAuthSvcImp(MemberDao memberDao) {
		this.memberDao = memberDao;
	}
	
	
	@Override
	public String getAccessToken(String code) {
		// HttpHeaders 오브젝트 생성
		HttpHeaders header = new HttpHeaders();
		header.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
		
		// HttpBody 오브젝트 생성
		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		params.add("grant_type", GRANT_TYPE);
		params.add("client_id", OAuthInfo.CLIENT_ID);
		params.add("redirect_uri", OAuthInfo.REDIRECT_URL);
		params.add("code", code);
		
		// HttpHeaders와 HttpBody를 하나의 오브젝트에 담기
		HttpEntity<MultiValueMap<String, String>> tokenRequest = 
				new HttpEntity<>(params, header); 
		
		// Http 요청하기 POST 방식으로 	그리고 response 객체로 응답 받음
		ResponseEntity<String> response = restTemplate.exchange(
				"https://kauth.kakao.com/oauth/token",
				HttpMethod.POST,
				tokenRequest,
				String.class
				);
		
		KakaoToken kakaoToken = null;
				try {
					kakaoToken = objMapper.readValue(response.getBody(), KakaoToken.class);
				} catch (JsonProcessingException e) {
					e.printStackTrace();
				}
						
		return kakaoToken.getAccess_token();
	}

	@Override
	public KakaoMember getClientInfo(String accessToken) {
		// HttpHeaders 오브젝트 생성
		HttpHeaders header = new HttpHeaders();
		header.add("Authorization", "Bearer "+accessToken);
		
		header.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
		
		// HttpHeaders와 HttpBody를 하나의 오브젝트에 담기
		HttpEntity<MultiValueMap<String, String>> profileRequest = 
				new HttpEntity<>(header); 
		
		// Http 요청하기 POST 방식으로 	그리고 response 객체로 응답 받음
		ResponseEntity<String> response = restTemplate.exchange(
				"https://kapi.kakao.com/v2/user/me",
				HttpMethod.POST,
				profileRequest,
				String.class
				);
		
		KakaoMember kakaoMember = null;
		try {
			kakaoMember = objMapper.readValue(response.getBody(), KakaoMember.class);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		join(kakaoMember);
		
		return kakaoMember;
	}
	
	@Override
	public boolean join(KakaoMember kakaoMember) {
		
		MemberDto originMember = memberDao.getMember(kakaoMember.getId()+"");
		
		if(originMember==null) {
			UUID garbagePW = UUID.randomUUID();
			
			Map<String, Object>map = new HashMap<>();
			map.put("p1", kakaoMember.getId()+"");
			map.put("p2", garbagePW.toString());
			map.put("p3", kakaoMember.properties.nickname);
			map.put("p4", kakaoMember.kakao_account.email);
			map.put("p5", OAuthProvider.KAKAO);
			map.put("p6", kakaoMember.kakao_account.gender);
			map.put("p7", kakaoMember.kakao_account.birthday);
			map.put("p8", "");
			map.put("p9", "");
			map.put("p10", "");
			
			if(memberDao.join(map)) return true;
		} else {
			if(memberDao.login(originMember.getUid(), originMember.getUpw())!=null)
				return true;
		}
		return false;
	}

	@Override
	public void logout(String accessToken, Long uid) {
		
		HttpHeaders header = new HttpHeaders();
		header.add("Authorization", "Bearer "+accessToken);
		
		MultiValueMap<String, Object> params = new LinkedMultiValueMap<>();
		params.add("target_id_type", TARGET_ID_TYPE);
		params.add("target_id", uid);
		
		HttpEntity<MultiValueMap<String, Object>> logoutRequest = new 
				HttpEntity<>(params, header);
		
		restTemplate.exchange(
				"https://kapi.kakao.com/v1/user/logout",
				HttpMethod.POST,
				logoutRequest,
				String.class
				);
	}

	@Override
	public void kakaoDelete(String accessToken, Long uid) {
		System.out.println(accessToken);
		HttpHeaders header = new HttpHeaders();
		header.add("Authorization", "Bearer "+ accessToken);
		
		MultiValueMap<String, Object> params = new LinkedMultiValueMap<>();
		params.add("target_id_type", TARGET_ID_TYPE);
		params.add("target_id", uid);
		
		HttpEntity<MultiValueMap<String, Object>> unlinkRequest = new
				HttpEntity<>(params, header);
		
		restTemplate.exchange(
				"https://kapi.kakao.com/v1/user/unlink",
				HttpMethod.POST,
				unlinkRequest,
				String.class
				);
		
		memberDao.kakaoDelete(String.valueOf(uid));
	}

}
