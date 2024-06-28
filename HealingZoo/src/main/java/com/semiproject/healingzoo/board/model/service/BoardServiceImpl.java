package com.semiproject.healingzoo.board.model.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.semiproject.healingzoo.board.model.dao.BoardDAO;
import com.semiproject.healingzoo.board.model.vo.Board;
import com.semiproject.healingzoo.board.model.vo.Image;
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

	@Override
	public int insertBoard(Board b) {
		return bDAO.insertBoard(sqlSession, b);
	}

	@Override
	public int insertImg(ArrayList<Image> list) {
		return bDAO.insertImg(sqlSession, list);
	}

	@Override
	public int insertQuBo(Board b) {
		return bDAO.insertQuBo(sqlSession, b);
	}

	@Override
	public Board selectBoard(int bId, Integer userNo) {
		Board b = bDAO.seletBoard(sqlSession, bId);
		
		if(b != null) {
			if(userNo != null && userNo != b.getBoardWriterNo()) {
				int result = bDAO.updateCount(sqlSession, bId);
				
				if(result >0) {
					b.setBoardCount(b.getBoardCount() + 1);
				}
			}
		}
		return b;
	}

	@Override
	public ArrayList<Image> selectImg(int bId) {
		return bDAO.selectImg(sqlSession, bId);
	}

	@Override
	public int deleteBoard(int boardNo) {
		return bDAO.deleteBaord(sqlSession, boardNo);
	}

	@Override
	public int deleteImg(int boardNo) {
		return bDAO.deleteImg(sqlSession, boardNo);
	}

}
