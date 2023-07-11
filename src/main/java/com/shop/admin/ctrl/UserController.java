package com.shop.admin.ctrl;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shop.svc.MemberSvc;

@Controller
public class UserController {
	
	@Autowired
	private MemberSvc memberSvc;
	
	// 회원관리페이지
	@RequestMapping("/userList")
	public String userList(Model model) {
		
		model.addAttribute("userList", memberSvc.memberList());
		return "/admin/management/userList";
	}
	
	//회원정보 상세보기 
	@RequestMapping("/userView")
	public String userView(HttpServletRequest req, Model model) {
		try {
			
			int num = Integer.parseInt(req.getParameter("num"));
			System.out.println(num);
			model.addAttribute("userView", memberSvc.userView(num));
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "/admin/management/userView";
	}

}
