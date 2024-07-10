package com.semiproject.healingzoo.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.semiproject.healingzoo.board.model.vo.Board;
import com.semiproject.healingzoo.board.model.vo.Image;
import com.semiproject.healingzoo.board.model.vo.PageInfo;
import com.semiproject.healingzoo.board.model.vo.Reply;
import com.semiproject.healingzoo.member.model.vo.Member;

public interface MemberService {

	Member login(Member m);

	int signUp(Member m);

	int checkId(String id);

	int updatePassword(HashMap<String, Object> map);

	ArrayList<Board> selectBoard(int i);

	int getListCount(int memNo);

	ArrayList<Board> selectMyBoardList(PageInfo pi, int memNo);

	ArrayList<Reply> selectMyComment(PageInfo pi, int memNo);

	int getListCommentCount(int memNo);


	int getListSerachCount(HashMap<String, Object> map);

	ArrayList<Board> selectSearchList(HashMap<String, Object> map, PageInfo pi);

	int delMem(int memNo);

	String searchId(Member m);

	int searchPwd(Member m);
	
	int updatePassword(Member m);

	int selDelBoard(String boNo);

	int listSubjectCount(HashMap<String, Object> map);

	ArrayList<Board> listSubject(PageInfo pi, HashMap<String, Object> map);

	Board selectedBoard(int bId);

	int selDelComment(String boNo);

	Board getBoard(int boNo);

	int updateBoard(HashMap<String, Object> map);

	int updateInBo(HashMap<String, String> map1);

	int updateStaff(Image i);

	int deleteStaff(HashMap<String, Object> mapNo);

	Image selectStaff(int memNo);

	int updateGreetingWrite(HashMap<String, Object> mapI);

}
