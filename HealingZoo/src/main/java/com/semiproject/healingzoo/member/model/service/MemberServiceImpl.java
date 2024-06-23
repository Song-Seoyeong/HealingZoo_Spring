package com.semiproject.healingzoo.member.model.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

}
