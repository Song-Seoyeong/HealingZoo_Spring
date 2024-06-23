package com.semiproject.healingzoo.member.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

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

}
