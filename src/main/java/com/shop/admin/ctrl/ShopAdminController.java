package com.shop.admin.ctrl;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ShopAdminController {

	@RequestMapping("/admin")
	public String adminRoot() {
		return "admin/indexAdmin";
	}
	
}
