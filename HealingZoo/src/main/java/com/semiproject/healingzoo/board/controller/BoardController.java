package com.semiproject.healingzoo.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.semiproject.healingzoo.board.model.service.BoardService;
import com.semiproject.healingzoo.board.model.vo.Board;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService bService;
	
	
	@RequestMapping("writeView.bo")
	public String writeBoardView(@RequestParam("category") String category, Model model) {
		model.addAttribute("category", category);
		return "writeBoard";
	}
	
	@RequestMapping("write.bo")
	public String writeBoard(Board b ) {
		
		return null;
	}
}
