package com.shop.svcimp;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.ResourceUtils;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.shop.dao.GoodsDetailRegDao;
import com.shop.svc.GoodsDetailRegSvc;

@Service
public class GoodsDetailRegSvcImp implements GoodsDetailRegSvc {
	String uploadDir;
	private static final int maxSize = 1024 * 1024 * 100;
	private static final String strPath = "classpath:static/uploadDir/";

	@Autowired
	public GoodsDetailRegDao goodsDetailRegDao;

	@Override
	public boolean goodsDetailRegProc(HttpServletRequest req) throws Exception {
		// 상품 세부정보 등록

		String uploadPath = ResourceUtils.getFile(strPath).toPath().toString();
		System.out.println("\n파일 업로드 경로(uploadPath) : \n" + uploadPath);

		MultipartRequest multi = new MultipartRequest(req, uploadPath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
		String filename = multi.getOriginalFileName("filename");

		// 데이터베이스에 파일명 겹치지 않도록 랜덤값 적용

		String goodsTXT = multi.getParameter("goodsTXT");
		System.out.println(goodsTXT);
		System.out.println(filename);
		System.out.println(multi.getFile("filename").length());
		Map<String, Object> map = new HashMap<>();
		map.put("goodsTXT", goodsTXT);
		map.put("filename", filename);
		map.put("filesize", (int) multi.getFile("filename").length());
		map.put("oriFilename", multi.getOriginalFileName("filename"));

		return goodsDetailRegDao.goodsDetailRegProc(map);
	}

	@Override
	public boolean addDetailImg(HttpServletRequest req) throws Exception {
		boolean res = false;
		String uploadPath = ResourceUtils.getFile(strPath).toPath().toString();
		System.out.println("\n파일 업로드 경로(uploadPath) : \n" + uploadPath);

		MultipartRequest multi = new MultipartRequest(req, uploadPath, maxSize, "UTF-8", new DefaultFileRenamePolicy());

		Enumeration<String> files = multi.getFileNames();

		Map<String, Object> map = new HashMap<>();

		boolean isFirstFile = true; // Flag to skip the first file

		while (files.hasMoreElements()) {
			String name = files.nextElement();

			if (isFirstFile) {
				isFirstFile = false;
				continue; // Skip the first file and continue to the next iteration
			}
			System.out.println(multi.getFilesystemName(name));
			map.put("imgName", multi.getFilesystemName(name));
			map.put("oriFilename", multi.getOriginalFileName(name));
			map.put("filesize", (int) multi.getFile(name).length());
			goodsDetailRegDao.addDetailImg(map);
		}
		return res;

	}

}
