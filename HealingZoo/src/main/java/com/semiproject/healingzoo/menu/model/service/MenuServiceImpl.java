package com.semiproject.healingzoo.menu.model.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.semiproject.healingzoo.board.model.vo.Board;
import com.semiproject.healingzoo.board.model.vo.PageInfo;
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
	
	
	
}
