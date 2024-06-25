package com.semiproject.healingzoo.menu.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.semiproject.healingzoo.board.model.vo.Board;

@Repository
public class MenuDAO {

	public ArrayList<Board> selectFAQ(SqlSession sqlSession) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectFAQ");
	}

}
