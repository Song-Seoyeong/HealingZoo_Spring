package com.semiproject.healingzoo.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.semiproject.healingzoo.board.model.vo.Board;
import com.semiproject.healingzoo.board.model.vo.Image;
import com.semiproject.healingzoo.board.model.vo.PageInfo;

public interface BoardService {

	int getListCount(int i);

	ArrayList<Board> selectAllQueBookList(PageInfo pi, int i);

	int insertBoard(Board b);

	int insertImg(ArrayList<Image> list);

	int insertQuBo(Board b);

	Board selectBoard(int bId, Integer userNo);

	ArrayList<Image> selectImg(int bId);

	int deleteBoard(int boardNo);

	int updateImgStatus(int boardNo);

	int deleteImg(ArrayList<String> deleteImg);

	int updateBoard(Board b);

	int updateQuBo(Board b);
	
	ArrayList<Board> selectNoBoardList(PageInfo pi, int i);

	ArrayList<Board> selectReBoardList(PageInfo pi, int i);
	
	ArrayList<Board> selectBoardList(PageInfo pi, int i);

	Board selectReBoard(int bId, Integer userNo);
	
	Board selectNoBoard(int bId, Integer userNo);

	ArrayList<Board> selectQuBoardList(PageInfo pi, int i);

	ArrayList<Board> selectReMenuList(PageInfo pi, int i);

	int checkPwdBoard(Board b);

	ArrayList<Board> searchFilter(String noSubject, PageInfo pi);

	int listSubjectCount(String noSubject);

	int listSearchCount(HashMap<String, Object> map);
	
	ArrayList<Board> searchNoReBoard(HashMap<String, Object> map, PageInfo pi);

	int listSearchQuBoCount(HashMap<String, Object> map);

	ArrayList<Board> searchQuBoBoard(HashMap<String, Object> map, PageInfo pi);


}
