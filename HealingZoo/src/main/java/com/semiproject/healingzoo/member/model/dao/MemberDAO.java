package com.semiproject.healingzoo.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.semiproject.healingzoo.board.model.vo.Board;
import com.semiproject.healingzoo.board.model.vo.PageInfo;
import com.semiproject.healingzoo.board.model.vo.Reply;
import com.semiproject.healingzoo.member.model.vo.Member;

@Repository("mDAO")
public class MemberDAO {

	public Member login(SqlSession sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.login", m);
	}

	public int signUp(SqlSession sqlSession, Member m) {
		return sqlSession.insert("memberMapper.signUp", m);
	}

	public int checkID(SqlSession sqlSession, String id) {
		return sqlSession.selectOne("memberMapper.checkId", id);
	}
	
	public int updatePassword(SqlSession sqlSession, HashMap<String, String> map) {
		return sqlSession.update("memberMapper.updatePwd", map);
	}

	public ArrayList<Board> selectBoard(SqlSession sqlSession, int i) {
		return sqlSession.selectOne("memberMapper.selectBoard", i);
	}

	public int getListCount(SqlSession sqlSession, int memNo) {
		return sqlSession.selectOne("memberMapper.getListCount", memNo);
	}
	
	public int getListCommentCount(SqlSession sqlSession, int memNo) {
		return sqlSession.selectOne("memberMapper.getListCommentCount", memNo);
	}

	public ArrayList<Board> selectMyBoardList(SqlSession sqlSession, PageInfo pi, int memNo) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("memberMapper.myBoardList", memNo, rowBounds);
	}

	public ArrayList<Reply> selectMyComment(SqlSession sqlSession, PageInfo pi, int memNo) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("memberMapper.myCommentList",memNo, rowBounds);
	}

	public String searchId(SqlSession sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.searchId", m);
	}
	
}
