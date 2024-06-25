package com.semiproject.healingzoo.board.model.service;

import java.util.ArrayList;

import com.semiproject.healingzoo.board.model.vo.Board;
import com.semiproject.healingzoo.board.model.vo.PageInfo;

public interface BoardService {

	int getListCount(int i);

	ArrayList<Board> selectAllQueBookList(PageInfo pi, int i);


}
