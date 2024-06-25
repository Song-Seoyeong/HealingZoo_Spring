package com.semiproject.healingzoo.board.model.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.semiproject.healingzoo.board.model.dao.BoardDAO;
import com.semiproject.healingzoo.board.model.vo.Board;
import com.semiproject.healingzoo.board.model.vo.PageInfo;

@Controller
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private BoardDAO bDAO;

	@Override
	public int getListCount(int i) {
		return bDAO.getListCount(sqlSession, i);
	}

	@Override
	public ArrayList<Board> selectAllQueBookList(PageInfo pi, int i) {
		return bDAO.selectAllQueBookList(sqlSession, pi, i);
	}

}
