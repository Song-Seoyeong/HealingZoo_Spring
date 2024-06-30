package com.semiproject.healingzoo.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.semiproject.healingzoo.board.model.vo.Board;
import com.semiproject.healingzoo.board.model.vo.PageInfo;
import com.semiproject.healingzoo.board.model.vo.Reply;
import com.semiproject.healingzoo.member.model.vo.Member;

public interface MemberService {

	Member login(Member m);

	int signUp(Member m);

	int checkId(String id);
	
	int updatePassword(HashMap<String, String> map);

	ArrayList<Board> selectBoard(int i);

	int getListCount(int memNo);

	ArrayList<Board> selectMyBoardList(PageInfo pi, int memNo);

	ArrayList<Reply> selectMyComment(PageInfo pi, int memNo);

	int getListCommentCount(int memNo);
}
