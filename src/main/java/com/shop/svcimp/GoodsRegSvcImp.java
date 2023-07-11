package com.shop.svcimp;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.ResourceUtils;
import org.springframework.web.multipart.MultipartFile;

import com.shop.dao.GoodsRegDao;
import com.shop.dto.GoodsRegDto;
import com.shop.svc.GoodsRegSvc;

@Service
public class GoodsRegSvcImp implements GoodsRegSvc {
	private static final int maxSize = 1024 * 1024 * 100;
	private static final String strPath = "classpath:static/uploadDir/";
	@Autowired
	GoodsRegDao goodsRegDao;

	@Override
	public List<GoodsRegDto> goodsModList(String goodsCode) {
		return goodsRegDao.goodsModList(goodsCode);
	}

	@Override
	public int goodsRegUpdate(String goodsCode, String goodsName, String goodsCategory, int goodsPrice,
			int goodsDiscount, int num) {
		return goodsRegDao.goodsRegUpdate(goodsCode, goodsName, goodsCategory, goodsPrice, goodsDiscount, num);
	}

	@Override
	public int goodsReg(String goodsCode, String goodsName, String goodsCategory, int goodsPrice, int goodsDiscount) {
		return goodsRegDao.goodsReg(goodsCode, goodsName, goodsCategory, goodsPrice, goodsDiscount);
	}

	@Override
	public GoodsRegDto productDetailDao(String goodsCode) {
		// TODO Auto-generated method stub
		return goodsRegDao.productDetailDao(goodsCode);
	}

	@Override
	public List<GoodsRegDto> goodsRegList() {
		return goodsRegDao.goodsRegList();
	}

	@Override
	public List<GoodsRegDto> goodsRegSrc(String keyWord, String goodsCode) {
		return goodsRegDao.goodsRegSrc(keyWord, goodsCode);
	}

	@Override
	public int goodsTotalCnt() {
		return goodsRegDao.goodsTotalCnt();
	}

	// 상품 상세 정보 불러오기- 지원
	@Override
	public GoodsRegDto goodsDetailInfo(String goodsCode) {
		// TODO Auto-generated method stub
		return goodsRegDao.goodsDetailInfo(goodsCode);
	}

	@Override
	public int goodsDel(String delCode) {
		return goodsRegDao.goodsDel(delCode);
	}

	// 상품 상세정보 및 추가 사진 입력 - 지원
	@Override
	public void goodsDetailRegProc(MultipartFile[] files, HttpServletRequest req)
			throws IllegalStateException, IOException {
		for (int i = 0; i < files.length; i++) {
			MultipartFile file = files[i];
			String path = ResourceUtils.getFile(strPath).toPath().toString();

			String originalFileName = file.getOriginalFilename();
			long fileSize = file.getSize();
			String goodsCode = req.getParameter("goodsCode");
			String goodsTXT = req.getParameter("goodsTXT");

			// 저장할 파일 이름 생성 규칙 적용 (예시: originalFileName_파일인덱스.확장자)
			String fileIndex = String.valueOf(i);
			String extension = originalFileName.substring(originalFileName.lastIndexOf("."));
			String fileName = originalFileName + "_" + fileIndex + extension;

			File saveFile = new File(path, fileName);
			file.transferTo(saveFile);
			Map<String, Object> map = new HashMap<>();
			map.put("goodsTXT", goodsTXT);
			map.put("filename", fileName);
			map.put("filesize", (int) fileSize);
			map.put("oriFilename", originalFileName);
			map.put("goodsCode", goodsCode);

			Map<String, Object> map2 = new HashMap<>();
			map2.put("goodsCode", goodsCode);
			map2.put("imgName", fileName);
			map2.put("oriFilename", originalFileName);
			map2.put("filesize", fileSize);

			if (i == 0) {
				try {
					goodsRegDao.goodsDetailRegProc(map);
					System.out.println("상품 상세정보 입력 성공!");
				} catch (Exception e) {
					System.out.println(e.getMessage());
					System.out.println("상품 상세정보 입력 실패");
				}
			} else {
				try {
					goodsRegDao.addDetailImg(map2);
					System.out.println("추가사진 업로드 성공!");
				} catch (Exception e) {
					System.out.println("추가사진 업로드 오류!");
					System.out.println(e.getMessage());
				}
			}
		}
	}

}
