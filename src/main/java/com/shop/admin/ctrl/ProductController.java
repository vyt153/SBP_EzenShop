package com.shop.admin.ctrl;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.support.TransactionTemplate;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.shop.svc.GoodsRegSvc;
import com.shop.svc.GoodsStockSvc;
import com.shop.util.PagingVO;

@Controller
public class ProductController {
	String strPath = "classpath:static/uploadDir/";

	@Autowired
	GoodsRegSvc goodsRegSvc;

	@Autowired
	GoodsStockSvc goodsStockSvc;

	@Autowired
	TransactionTemplate tranTemplate;

	// 재고 리스트 페이지
	@RequestMapping("/goodsRegList")
	public String proList(HttpServletRequest req, Model model, PagingVO vo,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {

		int total = goodsRegSvc.goodsTotalCnt();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "5";
		}
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", vo);

		model.addAttribute("goodsTotal", goodsRegSvc.goodsTotalCnt());

		String goodsCode = req.getParameter("goodsCode");
		String keyWord = req.getParameter("keyWord");

		if (goodsCode == null || goodsCode == "") {
			model.addAttribute("goodsRegList", goodsRegSvc.goodsRegList());
		} else {
			model.addAttribute("goodsRegList", goodsRegSvc.goodsRegSrc(keyWord, goodsCode));
		}

		model.addAttribute("goodsCateList", goodsStockSvc.goodsCateList());
		model.addAttribute("goodsColorList", goodsStockSvc.goodsColorList());
		model.addAttribute("goodsSizeList", goodsStockSvc.goodsSizeList());

		return "admin/management/productList";
	}

	// 재고 상세 보기 페이지
	@RequestMapping("/goodsRegMod")
	public String proRegMod(HttpServletRequest req, Model model) {

		String goodsCode = req.getParameter("goodsCode");

		model.addAttribute("goodsRegList", goodsRegSvc.goodsModList(goodsCode));
		model.addAttribute("goodsCateList", goodsStockSvc.goodsModCateList(goodsCode));
		model.addAttribute("goodsColorList", goodsStockSvc.goodsModColorList(goodsCode));
		model.addAttribute("goodsSizeList", goodsStockSvc.goodsModSizeList(goodsCode));
		model.addAttribute("goodsModCnt", goodsStockSvc.goodsModCnt(goodsCode));

		return "admin/management/productMod";
	}

	// 재고 등록페이지
	@RequestMapping("/goodsReg")
	public String proReg() {
		System.out.println("상품등록페이지");
		return "admin/management/productReg";
	}

	// 재고등록
	@RequestMapping("/goodsRegProc")
	public String goodsReg(HttpServletRequest req, Model model) {

		System.out.println("상품등록 실행");

		try {
			String goodsCode = req.getParameter("goodsCode");
			String goodsName = req.getParameter("goodsName");
			String goodsCategory = req.getParameter("goodsCategory");
			int goodsPrice = Integer.parseInt(req.getParameter("goodsPrice"));
			int goodsDiscount = Integer.parseInt(req.getParameter("goodsDiscount"));

			int res = goodsRegSvc.goodsReg(goodsCode, goodsName, goodsCategory, goodsPrice, goodsDiscount);

			if (res == 1) {

				String[] goodsColor = req.getParameterValues("goodsColor");
				String[] goodsSize = req.getParameterValues("goodsSize");
				String[] goodsStockSub = req.getParameterValues("sizeCnt");

				int colorlen = goodsColor.length;
				int sizelen = goodsSize.length;

				int[] goodsStock = new int[sizelen];

				for (int i = 0; i < sizelen; i++) {
					goodsStock[i] = Integer.parseInt(goodsStockSub[i]);
				}
				int seq = 0;
				for (int i = 0; i < colorlen; i++) {
					for (int j = seq; j < seq + 5; j++) {
						goodsStockSvc.goodsStock(goodsCode, goodsName, goodsCategory, goodsColor[i], goodsSize[j],
								goodsStock[j]);
					}
					seq = seq + 5;
				}

			}
			return "redirect:goodsRegList";

		} catch (Exception e) {
			System.out.println("error : " + e.getMessage());
			System.out.println("상품등록 실패");
			model.addAttribute("error", "중복된 상품코드입니다.");
			return "admin/management/productReg";
		}

	}

	// 재고수정
	@RequestMapping("/goodsModProc")
	public String goodsModProc(HttpServletRequest req) {
		try {
			req.setCharacterEncoding("UTF-8");
			String goodsCode = req.getParameter("goodsCode");
			int num = Integer.parseInt(req.getParameter("num"));
			String goodsName = req.getParameter("goodsName");
			String goodsCategory = req.getParameter("goodsCategory");
			int goodsPrice = Integer.parseInt(req.getParameter("goodsPrice"));
			int goodsDiscount = Integer.parseInt(req.getParameter("goodsDiscount"));

			goodsRegSvc.goodsRegUpdate(goodsCode, goodsName, goodsCategory, goodsPrice, goodsDiscount, num);

			String[] goodsColor = req.getParameterValues("goodsColor");
			String[] goodsSize = req.getParameterValues("goodsSize");
			String[] goodsStockSub = req.getParameterValues("sizeCnt");
			int orilen = goodsStockSvc.goodsOriLength(goodsCode);
			int oriClen = orilen / 5;
			int sizelen = goodsSize.length;
			int colorlen = goodsColor.length;

			System.out.println("Parameter List");
			System.out.println("-------------------------");
			System.out.println("orilen : " + orilen);

			int[] goodsStock = new int[sizelen];

			for (int i = 0; i < sizelen; i++) {
				goodsStock[i] = Integer.parseInt(goodsStockSub[i]);
			}
			int seq = 0;
			for (int i = 0; i < oriClen; i++) {
				for (int j = seq; j < seq + 5; j++) {
					goodsStockSvc.goodsStockMod(goodsCode, goodsCategory, goodsName, goodsSize[j], goodsColor[i],
							goodsStock[j], num);
				}
				seq = seq + 5;
			}

			int seq2 = 0;
			if (orilen != sizelen) {
				for (int i = oriClen; i < colorlen; i++) {
					for (int j = orilen + seq2; j < orilen + seq2 + 5; j++) {
						goodsStockSvc.goodsModMore(goodsCode, goodsName, goodsSize[j], goodsCategory, goodsColor[i],
								goodsStock[j]);
					}
					seq2 = seq2 + 5;
				}
			}

			System.out.println("상품수정성공");

			return "redirect:goodsRegMod" + "?goodsCode=" + goodsCode;
		} catch (Exception e) {
			System.out.println("상품등록실패");
			System.out.println("error : " + e.getMessage());
			return "redirect:goodsRegMod";
		}

	}

	// 재고삭제
	@RequestMapping("/goodsDelProc")
	public String goodsDel(HttpServletRequest req, Model model) {

		try {
			String delCode = req.getParameter("delCode");
			goodsRegSvc.goodsDel(delCode);
			goodsStockSvc.goodsStockDel(delCode);
			System.out.println("상품코드 : " + delCode + " '삭제 완료'");
		} catch (Exception e) {
			e.getMessage();
		}
		return "redirect:goodsRegList";

	}

	// 상품상세 등록 페이지 이동
	@RequestMapping("/goodsDetailReg")
	public String goodsDetailReg(Model model, HttpServletRequest req) {

		String goodsCode = req.getParameter("goodsCode");

		if (goodsCode == null || goodsCode.trim().isEmpty()) {
			return "redirect:errorPage";
		}
		model.addAttribute("goodsList", goodsRegSvc.goodsDetailInfo(goodsCode));
		return "/admin/management/goodsDetailReg";

	}

	// 상품상세 정보 입력 - 지원
	@RequestMapping("/goodsDetailRegProc")
	public String goodsDetailRegProc(@RequestParam("files") MultipartFile[] files, HttpServletRequest req)
			throws Exception {

		goodsRegSvc.goodsDetailRegProc(files, req);
		return "index";
	}

}
