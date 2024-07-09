package com.semiproject.healingzoo;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.semiproject.healingzoo.admin.model.service.AdminService;
import com.semiproject.healingzoo.board.model.vo.Image;
import com.semiproject.healingzoo.board.model.vo.Link;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private AdminService aService;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping("/")
	public String home(Model model) {
		ArrayList<Image> bannerList = aService.getBannerImg();
		ArrayList<Link> bannerLinkList = aService.getBannerLink();
		
		ArrayList<Image> oneeyeList = aService.getOneeyeImg();
		ArrayList<Link> oneeyeLinkList = aService.getOneeyeLink();
		
		if(bannerList != null && oneeyeList != null) {
			model.addAttribute("bannerList", bannerList);
			model.addAttribute("bannerLinkList", bannerLinkList);
			model.addAttribute("oneeyeList", oneeyeList);
			model.addAttribute("oneeyeLinkList", oneeyeLinkList);
		}
		return "home";
	}
	
}
