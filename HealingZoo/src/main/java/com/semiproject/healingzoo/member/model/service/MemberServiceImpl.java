package com.semiproject.healingzoo.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.semiproject.healingzoo.board.model.vo.Board;
import com.semiproject.healingzoo.board.model.vo.Image;
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
	public int updatePassword(HashMap<String, Object> map) {
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


	@Override
	public int getListSerachCount(HashMap<String, Object> map) {
		return mDAO.listSearchCount(sqlSession, map);
	}

	@Override
	public ArrayList<Board> selectSearchList(HashMap<String, Object> map, PageInfo pi) {
		return mDAO.listSelectSearchList(sqlSession, map, pi);
	}

	@Override
	public int delMem(int memNo) {
		return mDAO.delMem(sqlSession, memNo);
	}

	
	@Override
	public String searchId(Member m) {
		return mDAO.searchId(sqlSession, m);
	}

	@Override
	public int searchPwd(Member m) {
		return mDAO.searchPwd(sqlSession, m);
	}
	
	@Override
	public int updatePassword(Member m) {
		return mDAO.updatePassword(sqlSession, m);
	}

	@Override
	public int selDelBoard(String boNo) {
		return mDAO.selDelBoard(sqlSession, boNo);
	}

	@Override
	public int listSubjectCount(HashMap<String, Object> map) {
		return mDAO.lisSubjectCount(sqlSession, map);
	}

	@Override
	public ArrayList<Board> listSubject(PageInfo pi, HashMap<String, Object> map) {
		return mDAO.listSubject(sqlSession, pi, map);
	}

	@Override
	public Board selectedBoard(int bId) {
		return mDAO.selectedBoard(sqlSession, bId);
		
	}

	@Override
	public int selDelComment(String boNo) {
		return mDAO.selDelComment(sqlSession, boNo);
	}

	@Override
	public Board getBoard(int boNo) {
		return mDAO.getBoard(sqlSession, boNo);
	}

	@Override
	public int updateBoard(HashMap<String, Object> map) {
		return mDAO.updateBoard(sqlSession, map);
	}

	@Override
	public int updateInBo(HashMap<String, String> map1) {
		return mDAO.updateInBo(sqlSession, map1);
	}
	
	@Override
	public int deleteStaff(HashMap<String, Object> mapNo) {
		return mDAO.deleteStaff(sqlSession, mapNo);
	}
	
	@Override
	public int updateStaff(Image i) {
		return mDAO.updateStaff(sqlSession, i);
	}

	@Override
	public Image selectStaff(int memNo) {
		return mDAO.selectStaff(sqlSession, memNo);
	}

	@Override
	public int updateGreetingWrite(HashMap<String, Object> mapI) {
		return mDAO.updateGreetingWrite(sqlSession, mapI);
	}

	
	

}
