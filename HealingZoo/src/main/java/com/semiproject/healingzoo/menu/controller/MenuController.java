package com.semiproject.healingzoo.menu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MenuController {
	// FAQ 이동
	@RequestMapping("FAQ.menu")
	public String FAQ() {
		return "FAQ";
	}
}
