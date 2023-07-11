package com.shop.svc;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import com.oreilly.servlet.MultipartRequest;
import com.shop.dto.ReviewDto;
import com.shop.dto.ReviewImgDto;

public interface ReviewSvc {

	// 리뷰등록 (사진제외)
	public int reviewAdd(HttpServletRequest req);
	
	// 리뷰사진등록
	public void reviewImgAdd(
			MultipartFile[] files,HttpServletRequest req,int ref);
	
	// 리뷰 사진 가져오기
	public List<ReviewImgDto> callImg(String goodsCode);
	
	// 리뷰 전체 리스트 출력
	public List<ReviewDto> reviewListAll();
	
	// 특정 상품 리뷰 리스트 출력
	public List<ReviewDto> reviewList(String goodsCode);
	
	// 리뷰 삭제
	
}
