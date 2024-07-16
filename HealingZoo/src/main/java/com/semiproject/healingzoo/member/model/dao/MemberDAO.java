package com.semiproject.healingzoo.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.semiproject.healingzoo.board.model.vo.Board;
import com.semiproject.healingzoo.board.model.vo.Image;
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

	public int updatePassword(SqlSession sqlSession, HashMap<String, Object> map) {
		return sqlSession.update("memberMapper.updatePwd", map);
	}
	
	public ArrayList<Board> selectBoard(SqlSession sqlSession, int i) {
		return sqlSession.selectOne("memberMapper.selectBoard", i);
	}

	public int getListCount(SqlSession sqlSession, int memNo) {
		return sqlSession.selectOne("memberMapper.getListCount", memNo);
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


	public int listSearchCount(SqlSession sqlSession, HashMap<String, Object> map) {
		return sqlSession.selectOne("memberMapper.listSearchCount", map);
	}

	public ArrayList<Board> listSelectSearchList(SqlSession sqlSession, HashMap<String, Object> map, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("memberMapper.selectSearchList", map, rowBounds);
	}

	public int delMem(SqlSession sqlSession, int memNo) {
		return sqlSession.update("memberMapper.deleteMember", memNo);
	}

	
	public String searchId(SqlSession sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.searchId", m);
	}

	public int searchPwd(SqlSession sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.searchPwd", m);
	}
	
	public int updatePassword(SqlSession sqlSession, Member m) {
		return sqlSession.update("memberMapper.updateSearchPwd", m);
	}

	public int selDelBoard(SqlSession sqlSession, String boNo) {
		return sqlSession.update("memberMapper.selDelBoard", boNo);
	}

	public int lisSubjectCount(SqlSession sqlSession, HashMap<String, Object> map) {
		return sqlSession.selectOne("memberMapper.listSubjectCount", map);
	}

	public ArrayList<Board> listSubject(SqlSession sqlSession, PageInfo pi, HashMap<String, Object> map) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("memberMapper.listSubject", map, rowBounds);
	}

	public Board selectedBoard(SqlSession sqlSession, int bId) {
		return sqlSession.selectOne("memberMapper.selectedBoard",bId);
	}

	public int selDelComment(SqlSession sqlSession, String boNo) {
		return sqlSession.update("memberMapper.selDelComment", boNo);
	}

	public Board getBoard(SqlSession sqlSession, int boNo) {
		return sqlSession.selectOne("memberMapper.getBoard", boNo);
	}

	public int updateBoard(SqlSession sqlSession, HashMap<String, Object> map) {
		return sqlSession.update("memberMapper.updateBoard", map);
	}

	public int updateInBo(SqlSession sqlSession, HashMap<String, String> map1) {
		return sqlSession.update("memberMapper.updateInBo", map1);
	}
	
	public Image selectStaff(SqlSession sqlSession, int memNo) {
		return sqlSession.selectOne("memberMapper.selectStaff", memNo);
	}
	
	public int deleteStaff(SqlSession sqlSession, HashMap<String, Object> mapNo) {
		return sqlSession.delete("memberMapper.deleteStaff", mapNo);
	}
	
	public int updateStaff(SqlSession sqlSession, Image i) {
		return sqlSession.update("memberMapper.updateStaff",i);
	}

	public int updateGreetingWrite(SqlSession sqlSession, HashMap<String, Object> mapI) {
		return sqlSession.update("memberMapper.updateGreetingWrite", mapI);
	}

	//07.11
	public ArrayList<Image> selecBoardImg(SqlSession sqlSession, String boardNo) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectBoardImg", boardNo);
	}
	//07.11
	public int deletBoardImg(SqlSession sqlSession, String boardNo) {
		return sqlSession.delete("memberMapper.deleteBoardImg", boardNo);
	}
	//07.11
	public int insertBoardImg(SqlSession sqlSession, ArrayList<Image> list) {
		return sqlSession.insert("memberMapper.insertBoardImg", list);
	}
	//07.12
	public Board selectOrigin(SqlSession sqlSession, String bId) {
		return sqlSession.selectOne("memberMapper.selOrigin", bId);
	}
	//07.12
	public ArrayList<Image> selectOriginImg(SqlSession sqlSession, String bId) {
		return (ArrayList)sqlSession.selectList("memberMapper.selOriginImg", bId);
	}
	//07.12
	public ArrayList<Reply> selectOriginReply(SqlSession sqlSession, String bId) {
		return (ArrayList)sqlSession.selectList("memberMapper.selOriginReply", bId);
	}
	//07.12
	public int getListCommentCount(SqlSession sqlSession, int memNo) {
		return sqlSession.selectOne("memberMapper.getListCommentCount", memNo);
	}
	//07.12
	public int deleteImg(SqlSession sqlSession, ArrayList<String> deleteImg) {
		return sqlSession.delete("memberMapper.deleteImg", deleteImg);
	}
	//07.13
	public int deleteInDetailView(SqlSession sqlSession, HashMap<String, Object> map) {
		return sqlSession.update("memberMapper.deleteInDetailView", map);
	}
	//07.13
	public int getListSerachComCount(SqlSession sqlSession, HashMap<String, Object> map) {
		return sqlSession.selectOne("memberMapper.getListSerachComCount", map);
	}
	//07.14
	public ArrayList<Reply> selectMySerachCom(SqlSession sqlSession, PageInfo pi, HashMap<String, Object> map) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("memberMapper.selectMySerachCom", map, rowBounds);
	}

	public Board selectedBoard(SqlSession sqlSession, String bId) {
		return sqlSession.selectOne("memberMapper.selectedBoard",bId);
	}
	
	public Board getBoard(SqlSession sqlSession, HashMap<String, Object> map) {
		return sqlSession.selectOne("memberMapper.getBoard", map);
	}


}
