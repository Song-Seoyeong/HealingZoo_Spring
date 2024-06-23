package com.semiproject.healingzoo.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes("loginUser")
public class AdminController {
	
	//관리자 페이지 이동
	@RequestMapping("notice.admin")
	public String adminView() {
		System.out.println(12);
		return "notice";
	}
}
