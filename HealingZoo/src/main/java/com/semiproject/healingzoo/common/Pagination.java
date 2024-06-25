package com.semiproject.healingzoo.common;

import com.semiproject.healingzoo.board.model.vo.PageInfo;

public class Pagination {												// 한 페이지에서 보이는 게시글 수
	public static PageInfo getPageInfo(int currentPage, int listCount, int boardLimit) {
		int pageLimit = 5; // 한 페이지에서 보이는 페이징의 수
		int maxPage; // 전체 페이징 중 가장 마지막 페이지
		int startPage; // 페이징 버튼의 시작
		int endPage; // 페이징 버튼의 끝
		
		maxPage = (int)Math.ceil((double)listCount/boardLimit);
					// Math.ceil : 소수값 올림
		startPage = (currentPage - 1)/pageLimit * pageLimit + 1;
		// 5n + 1 
		endPage = startPage + pageLimit -1;
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		return new PageInfo(currentPage, listCount, pageLimit, maxPage, startPage, endPage, boardLimit);
	}
}
