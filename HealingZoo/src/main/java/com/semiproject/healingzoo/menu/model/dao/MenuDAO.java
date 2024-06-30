package com.semiproject.healingzoo.menu.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.semiproject.healingzoo.board.model.vo.Board;
import com.semiproject.healingzoo.board.model.vo.PageInfo;

@Repository
public class MenuDAO {

	public ArrayList<Board> selectFAQ(SqlSession sqlSession) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectFAQ");
	}
	
	public ArrayList<Board> selectReviewList(SqlSession sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
        return (ArrayList)sqlSession.selectList("boardMapper.selectReviewList", null, rowBounds);
	}
}
