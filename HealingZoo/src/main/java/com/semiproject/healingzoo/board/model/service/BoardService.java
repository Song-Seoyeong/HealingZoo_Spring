package com.semiproject.healingzoo.board.model.service;

import java.util.ArrayList;

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

	int deleteImg(int boardNo);


}
