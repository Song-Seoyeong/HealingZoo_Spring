package com.semiproject.healingzoo.menu.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.semiproject.healingzoo.board.model.exception.BoardException;
import com.semiproject.healingzoo.board.model.service.BoardService;
import com.semiproject.healingzoo.board.model.vo.Board;
import com.semiproject.healingzoo.board.model.vo.PageInfo;
import com.semiproject.healingzoo.common.Pagination;
import com.semiproject.healingzoo.menu.model.service.MenuService;

@Controller
public class MenuController {

	@Autowired
	private MenuService mService;
	
	@Autowired
	private BoardService bService;

	// FAQ 이동
	@RequestMapping("FAQ.menu")
	public String selectFAQ(Model model) {
		ArrayList<Board> FAQList = mService.selectFAQ();

		if (FAQList != null) {
			model.addAttribute("FAQList", FAQList);
			return "FAQ";
		}else {
			throw new BoardException("FAQ 리스트를 불러올 수 없습니다.");
		}
	}
	
	// 문의게시판 이동
	@RequestMapping("question.menu")
	public String selectAllQuestionList(@RequestParam(value="page", defaultValue="1") Integer currentPage, Model model) {
	// 파라미터로 넘긴 현재 페이지, 처음 페이지로 진입시 값이 없기때문에 defaultValue를 넣어 1로 지정해줌
	// int가 아닌 Integer로 받는 이유 : 값이 들어오지않을 때 null값으로 비교하기 위해
		
		int listCount = bService.getListCount(101);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10);
		
		ArrayList<Board> questionList = bService.selectAllQueBookList(pi, 101);
		if(!questionList.isEmpty()) {
			
			// 작성자 이름 * 처리
			for(Board b : questionList) {
				String writerName = b.getBoardWriterName();
				writerName = writerName.charAt(0) + "*" + writerName.charAt(writerName.length() - 1);
				b.setBoardWriterName(writerName);
			}
			model.addAttribute("questionList", questionList);
			model.addAttribute("pi", pi);
			return "question";
		}else {
			throw new BoardException("게시글 리스트를 불러올 수 없습니다.");
		}
	}
	
	// 예약 게시판 이동
	@RequestMapping("book.menu")
	public String selectAllBookList(@RequestParam(value="page", defaultValue="1") Integer currentPage, Model model) {
		int listCount = bService.getListCount(103);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10);
		
		ArrayList<Board> bookList = bService.selectAllQueBookList(pi, 103);
		if(!bookList.isEmpty()) {
			for(Board b : bookList) {
				String writerName = b.getBoardWriterName();
				writerName = writerName.charAt(0) + "*" + writerName.charAt(writerName.length() - 1);
				b.setBoardWriterName(writerName);
			}
			model.addAttribute("bookList", bookList);
			model.addAttribute("pi", pi);
			
			return "book";
		}else {
			throw new BoardException("게시글 리스트를 불러올 수 없습니다.");
		}
	}
	
	// 공지사항 게시판 이동
	@RequestMapping("notice.menu")
	public String selectNoticeList(@RequestParam(value="page", defaultValue="1") Integer currentPage, Model model) {
		int listCount = bService.getListCount(100);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10);
		
		
		ArrayList<Board> noticeList = bService.selectNoBoardList(pi, 100);
		for(Board b : noticeList) {
			b.setBoardWriterName("관리자");
		}
		if(!noticeList.isEmpty()) {
			model.addAttribute("noList", noticeList);
			model.addAttribute("pi", pi);
			return "notice";
		}else {
			throw new BoardException("게시판 리스트를 불러오는데 실패했습니다.");
		}
	}
	
	// 후기 게시판 이동
		@RequestMapping("review.menu")
		public String selectReviewList(@RequestParam(value="page", defaultValue="1") Integer currentPage, Model model) {
			int listCount = bService.getListCount(102);
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10);
			
			
			ArrayList<Board> reviewList = bService.selectReBoardList(pi, 102);

			if(!reviewList.isEmpty()) {
				model.addAttribute("reList", reviewList);
				model.addAttribute("pi", pi);
				return "review";
			}else {
				throw new BoardException("게시판 리스트를 불러오는데 실패했습니다.");
			}
		}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
