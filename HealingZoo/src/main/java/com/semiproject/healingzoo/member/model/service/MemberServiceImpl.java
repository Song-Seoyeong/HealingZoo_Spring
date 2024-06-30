package com.semiproject.healingzoo.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.semiproject.healingzoo.board.model.vo.Board;
import com.semiproject.healingzoo.board.model.vo.PageInfo;
import com.semiproject.healingzoo.board.model.vo.Reply;
import com.semiproject.healingzoo.member.model.dao.MemberDAO;
import com.semiproject.healingzoo.member.model.vo.Member;

@Service("mService")
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private MemberDAO mDAO;

	@Override
	public Member login(Member m) {
		return mDAO.login(sqlSession, m);
	}

	@Override
	public int signUp(Member m) {
		return mDAO.signUp(sqlSession, m);
	}

	@Override
	public int checkId(String id) {
		return mDAO.checkID(sqlSession, id);
	}
	
	@Override
	public int updatePassword(HashMap<String, String> map) {
		return mDAO.updatePassword(sqlSession, map);
	}

	@Override
	public ArrayList<Board> selectBoard(int i) {
		return mDAO.selectBoard(sqlSession, i);
	}

	@Override
	public int getListCount(int memNo) {
		return mDAO.getListCount(sqlSession, memNo);
	}
	
	@Override
	public int getListCommentCount(int memNo) {
		return mDAO.getListCommentCount(sqlSession, memNo);
	}

	@Override
	public ArrayList<Board> selectMyBoardList(PageInfo pi, int memNo) {
		return mDAO.selectMyBoardList(sqlSession, pi, memNo);
	}

	@Override
	public ArrayList<Reply> selectMyComment(PageInfo pi, int memNo) {
		return mDAO.selectMyComment(sqlSession, pi, memNo);
	}
	
}
