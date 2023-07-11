package com.shop.svcimp;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.ResourceUtils;
import org.springframework.web.multipart.MultipartFile;

import com.oreilly.servlet.MultipartRequest;
import com.shop.dao.ReviewDao;
import com.shop.dto.ReviewDto;
import com.shop.dto.ReviewImgDto;
import com.shop.svc.ReviewSvc;

@Service
public class ReviewSvcImp implements ReviewSvc {

	@Autowired
	ReviewDao reviewDao;

	@Override
	public List<ReviewDto> reviewListAll() {
		return reviewDao.reviewListAll();
	}

	@Override
	public List<ReviewDto> reviewList(String goodsCode) {
		return reviewDao.reviewList(goodsCode);
	}
	
	@Override
	public int reviewAdd(HttpServletRequest req){
		
		int ref = reviewDao.refIniSet() + 1;
		Map<String, Object> map = new HashMap<>();
		map.put("_goodsCode", req.getParameter("goodsCode"));
		map.put("_goodsName", req.getParameter("goodsName"));
		map.put("_reStar", Integer.parseInt(req.getParameter("reStar")));
		map.put("_uname", req.getParameter("uname"));
		map.put("_weight", req.getParameter("weight"));
		map.put("_height", req.getParameter("height"));
		map.put("_goodsSize", req.getParameter("goodsSize"));
		map.put("_goodsColor", req.getParameter("goodsColor"));
		map.put("_reContent", req.getParameter("reContent"));
		map.put("_ref", ref);
		
		reviewDao.reviewAdd(map);
		
		return ref;
	}

	@Override
	public void reviewImgAdd(
			MultipartFile[] files, 
			HttpServletRequest req,int ref) {
		
		String strPath = "classpath:static/reviewDir/";
			try {
			
			for(int i=0; i<files.length;i++) {
				MultipartFile file = files[i];
				String path = ResourceUtils.getFile(strPath).toPath().toString();
				
				String oriFilename = file.getOriginalFilename();
				long fileSize = file.getSize();
				
				String fileIndex = String.valueOf(i);
				String extension = oriFilename.substring(oriFilename.lastIndexOf("."));
				String filename = oriFilename + "_" + fileIndex + extension;
				
				System.out.println("oriFilename" + oriFilename);
				System.out.println("extension : " + extension);
				System.out.println("filename : " + filename);
				
				File saveFile = new File(path, filename);
				file.transferTo(saveFile);
				
				System.out.println("check goodsCode : " + req.getParameter("goodsCode"));
				Map<String,Object> map2 = new HashMap<>();
				map2.put("goodsCode", req.getParameter("goodsCode"));
				map2.put("uname", req.getParameter("uname"));
				map2.put("filename", filename);
				map2.put("filesize", (int) fileSize);
				map2.put("oriFilename", oriFilename);
				map2.put("ref", ref);
				
				reviewDao.reviewImgAdd(map2);
			}
			
		} catch (Exception e) {
			System.out.println("파일업로드 오류");
			System.out.println("error : " + e.getMessage());
		}
		
	}

	@Override
	public List<ReviewImgDto> callImg(String goodsCode) {
		return reviewDao.callImg(goodsCode);
	}
	
	/*
	 * 
	 * */
	
	
}
