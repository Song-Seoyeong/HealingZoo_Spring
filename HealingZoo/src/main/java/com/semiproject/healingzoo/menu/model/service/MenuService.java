package com.semiproject.healingzoo.menu.model.service;

import java.util.ArrayList;

import com.semiproject.healingzoo.board.model.vo.Board;
import com.semiproject.healingzoo.board.model.vo.Image;
import com.semiproject.healingzoo.board.model.vo.Link;

public interface MenuService {

	ArrayList<Board> selectFAQ();
	
	Image greeting();
	
	ArrayList<Image> greetingStaff();
	
	ArrayList<String> greetingStaffWrite();
	
	Image way(); //오시는길 사진
	
	Link getMapInfo(); //오시는길 주소
	
}
