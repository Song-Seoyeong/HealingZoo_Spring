package com.semiproject.healingzoo.menu.model.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.semiproject.healingzoo.board.model.vo.Board;
import com.semiproject.healingzoo.board.model.vo.Image;
import com.semiproject.healingzoo.board.model.vo.Link;
import com.semiproject.healingzoo.menu.model.dao.MenuDAO;

@Service
public class MenuServiceImpl implements MenuService{

	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private MenuDAO mDAO;
	
	@Override
	public ArrayList<Board> selectFAQ() {
		return mDAO.selectFAQ(sqlSession);
	}
	
	@Override
	public Image greeting() {
		return mDAO.greeting(sqlSession);
	}
	
	@Override
	public ArrayList<Image> greetingStaff() {
		return mDAO.greetingStaff(sqlSession);
	}
	
	@Override
	public ArrayList<String> greetingStaffWrite() {
		return mDAO.greetingStaffWrite(sqlSession);
	}
	
	@Override //오시는길 사진
	public Image way() {
		return mDAO.way(sqlSession);
	}
	
	@Override //오시는길 주소
	public Link getMapInfo() {
		return mDAO.getMapInfo(sqlSession);
	}
	
	
}
