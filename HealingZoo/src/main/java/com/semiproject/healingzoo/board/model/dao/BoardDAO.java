package com.semiproject.healingzoo.board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.semiproject.healingzoo.board.model.vo.Board;
import com.semiproject.healingzoo.board.model.vo.Image;
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


	public int insertBoard(SqlSession sqlSession, Board b) {
		return sqlSession.insert("boardMapper.insertBoard", b);
	}


	public int insertImg(SqlSession sqlSession, ArrayList<Image> list) {
		return sqlSession.insert("boardMapper.insertImg", list);
	}


	public int insertQuBo(SqlSession sqlSession, Board b) {
		return sqlSession.insert("boardMapper.insertQuBo", b);
	}


	public Board seletBoard(SqlSession sqlSession, int bId) {
		return sqlSession.selectOne("boardMapper.selectBoard", bId);
	}


	public int updateCount(SqlSession sqlSession, int bId) {
		return sqlSession.update("boardMapper.updateCount", bId);
	}


	public ArrayList<Image> selectImg(SqlSession sqlSession, int bId) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectImg", bId);
	}


	public int deleteBaord(SqlSession sqlSession, int boardNo) {
		return sqlSession.update("boardMapper.deleteBoard", boardNo);
	}


	public int deleteImg(SqlSession sqlSession, int boardNo) {
		return sqlSession.update("boardMapper.deleteImg", boardNo);
	}

}
