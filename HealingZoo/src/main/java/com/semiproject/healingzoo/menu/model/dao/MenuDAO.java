package com.semiproject.healingzoo.menu.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.semiproject.healingzoo.board.model.vo.Board;
import com.semiproject.healingzoo.board.model.vo.Image;
import com.semiproject.healingzoo.board.model.vo.Link;
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
	}//?
	
	public Image greeting(SqlSession sqlSession) {
		return sqlSession.selectOne("menuMapper.greeting");
	}

	public ArrayList<Image> greetingStaff(SqlSession sqlSession) {
		return (ArrayList)sqlSession.selectList("menuMapper.greetingStaff");
	}


	public ArrayList<String> greetingStaffWrite(SqlSession sqlSession) {
		return (ArrayList)sqlSession.selectList("menuMapper.greetingStaffWrite");
	}

	public Image way(SqlSession sqlSession) {//오시는길 사진
		return sqlSession.selectOne("menuMapper.way");
	}

	public Link getMapInfo(SqlSession sqlSession) { //오시는길 주소
		return sqlSession.selectOne("menuMapper.getMapInfo");
	}
}
