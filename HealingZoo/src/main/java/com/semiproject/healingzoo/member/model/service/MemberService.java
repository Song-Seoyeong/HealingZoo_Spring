package com.semiproject.healingzoo.member.model.service;

import com.semiproject.healingzoo.member.model.vo.Member;

public interface MemberService {

	Member login(Member m);

	int signUp(Member m);

	int checkId(String id);

}
