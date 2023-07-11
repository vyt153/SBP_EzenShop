package com.shop.ctrl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.shop.dao.GoodsRegDao;
import com.shop.svc.GoodsRegSvc;
import com.shop.svc.ReviewSvc;

@Controller
public class ShopController {

	@Autowired
	GoodsRegDao goodsRegDao;

	@Autowired
	GoodsRegSvc goodsRegSvc;

	@Autowired
	ReviewSvc reviewSvc;

	@RequestMapping("/")
	public String root(@SessionAttribute(name = "unameSession", required = false) String unameSession, Model model) {

		model.addAttribute("unameSession", unameSession);

		// 메인페이지 등록된 정보 불러오기
		model.addAttribute("goodsInfo", goodsRegDao.goodsRegList());

		return "index";
	}

	// 상품상세보기 페이지
	@RequestMapping("/productDetail")
	public String productDetail(HttpServletRequest req, Model model, HttpSession ses) {
		String goodsCode = req.getParameter("goodsCode");
		System.out.println(goodsCode);
		model.addAttribute("productDetail", goodsRegDao.productDetailDao(goodsCode));
		ses.setAttribute("goodsCode", goodsCode);
		// 리뷰리스트 출력
		model.addAttribute("reviewList", reviewSvc.reviewList(goodsCode));
		model.addAttribute("imgList", reviewSvc.callImg(goodsCode));

		return "shop/productDetail";
	}

	// 카테고리 상세보기 페이지
	@RequestMapping("/categoryDetail")
	public String categotyDetail() {
		return "shop/categoryDetail";
	}

	// 상품리뷰작성페이지
	@RequestMapping("/goodsReviewReg")
	public String goodsReviewReg(HttpServletRequest req, Model model, HttpSession ses) {

		String goodsCode = req.getParameter("goodsCode");
		System.out.println(goodsCode);
		model.addAttribute("unameSession", ses.getAttribute("unameSession"));
		model.addAttribute("goodsList", goodsRegSvc.goodsModList(goodsCode));

		return "/shop/productReviewReg";

	}

	// 상품리뷰등록
	@RequestMapping("/goodsReviewRegProc")
	public String goodsReviewRegProc(@RequestParam("files") MultipartFile[] files, HttpServletRequest req) {
		int ref = reviewSvc.reviewAdd(req);
		reviewSvc.reviewImgAdd(files, req, ref);

		return "redirect:productDetail?goodsCode=" + req.getParameter("goodsCode");

	}

	// 주문 페이지
	@RequestMapping("/orderPage")
	public String orderPage() {
		return "shop/order";
	}

}
