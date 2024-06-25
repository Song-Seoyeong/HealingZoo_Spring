package com.semiproject.healingzoo.board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.semiproject.healingzoo.board.model.vo.Board;
import com.semiproject.healingzoo.board.model.vo.PageInfo;

@Repository
public class BoardDAO {

	// 페이지네이션용
	public int getListCount(SqlSession sqlSession, int i) {
		return sqlSession.selectOne("boardMapper.getListCount", i);
	}

	
	// 문의/예약 게시글 리스트 조회
	public ArrayList<Board> selectAllQueBookList(SqlSession sqlSession, PageInfo pi, int i) {
	int offset = (pi.getCurrentPage() - 1)*pi.getBoardLimit();
	RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
									// 건너뛸 게시글 수, 선택할 게시글 수
		return (ArrayList)sqlSession.selectList("boardMapper.selectAllQueBookList", i, rowBounds);
	}

}
