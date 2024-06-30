package com.semiproject.healingzoo.admin.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.semiproject.healingzoo.board.model.exception.BoardException;
import com.semiproject.healingzoo.board.model.service.BoardService;
import com.semiproject.healingzoo.board.model.vo.Board;
import com.semiproject.healingzoo.board.model.vo.Image;
import com.semiproject.healingzoo.board.model.vo.PageInfo;
import com.semiproject.healingzoo.common.Pagination;
import com.semiproject.healingzoo.member.model.vo.Member;

@Controller
@SessionAttributes("loginUser")
public class AdminController {
	
	@Autowired
	private BoardService bService;
	
	
	// 사이트관리 - 메인 페이지 이동
	@RequestMapping("mainPage.admin")
	public String mainPageAdmin() {
		return "mainPage";
	}
	
	// 사이트관리 - 인사말 페이지 이동
	@RequestMapping("greeting.admin")
	public String greetingAdmin() {
		return "greeting";
	}
	
	// 사이트관리 - 오시는길 페이지 이동
	@RequestMapping("way.admin")
	public String wayAdmin() {
		return "way";
	}
	
	// 사이트관리 - 프로그램 안내 페이지 이동
	@RequestMapping("show.admin")
	public String showAdmin() {
		return "show";
	}
	
	// 사이트관리 - 운영시간/이용요금 페이지 이동
	@RequestMapping("operating.admin")
	public String operatingAdmin() {
		return "operating";
	}
	
	// 사이트관리 - 동물 페이지 이동
	@RequestMapping("animal.admin")
	public String animalAdmin() {
		return "animal";
	}
	
	
	// 사이트관리 - 마스코트 페이지 이동
	@RequestMapping("mascot.admin")
	public String mascotAdmin() {
		return "mascot";
	}
	
	
	//공지 게시판 게시글 조회
	@RequestMapping("notice.admin")
	public String selectNoBoardList(@RequestParam(value="page", defaultValue="1") int currentPage, Model model) {
		
		int listCount = bService.getListCount(100);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10);
		ArrayList<Board> list = bService.selectNoBoardList(pi, 100);
		
		if(list != null) {
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
			
			return "notice";
		} else {
			throw new BoardException("게시글 조회를 실패하였습니다.");
		}
	}
	
	
	//공지 게시판 게시글 조회
	@RequestMapping("question.admin")
	public String selectQuBoardList(@RequestParam(value="page", defaultValue="1") int currentPage, Model model) {
		
		int listCount = bService.getListCount(101);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10);
		ArrayList<Board> list = bService.selectQuBoardList(pi, 101);
		
		if(list != null) {
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
			
			return "question";
		} else {
			throw new BoardException("게시글 조회를 실패하였습니다.");
		}
	}

	
	//후기 게시판 게시글 조회
	@RequestMapping("review.admin")
	public String selectAllQueBookList(@RequestParam(value="page", defaultValue="1") int currentPage, Model model) {
		
		int listCount = bService.getListCount(102);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10);
		ArrayList<Board> list = bService.selectReBoardList(pi, 102);
		
		if(list != null) {
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
			
			return "review";
		} else {
			throw new BoardException("게시글 조회를 실패하였습니다.");
		}
	}
	
	
	//예약 게시판 게시글 조회
	@RequestMapping("book.admin")
	public String selectBoBoardList(@RequestParam(value="page", defaultValue="1") int currentPage, Model model) {
		
		int listCount = bService.getListCount(103);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10);
		ArrayList<Board> list = bService.selectBoardList(pi, 103);
		
		if(list != null) {
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
			
			return "book";
		} else {
			throw new BoardException("게시글 조회를 실패하였습니다.");
		}
	}
	
	
	// 공지 게시글 상세 조회 (관리자용)
	@RequestMapping("boardNoView.admin")
	public String selectNoBoard(@RequestParam("bId") int bId,
							  @RequestParam("page") int page,
							  HttpSession session,
							  Model model) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		Integer userNo = null;
		if(loginUser != null) {
			userNo = (Integer)loginUser.getMemNo();
		}
		
		Board b = bService.selectNoBoard(bId, userNo);
		ArrayList<Image> imgList = bService.selectImg(bId);
		
		if(b.getCateNo() == 100) {
			b.setBoardWriterName("관리자");
		}
		
		if(b != null && imgList != null) {
			model.addAttribute("b", b);
			model.addAttribute("imgList", imgList);
			model.addAttribute("page", page);
			
			return "../board/boardDetailAdmin";
		}else {
			throw new BoardException("게시글을 불러 오는데 실패했습니다.");
		}
	}
	
	// 공지 게시글 상세 조회 (관리자용)
		@RequestMapping("boardReView.admin")
		public String selectReBoard(@RequestParam("bId") int bId,
								  @RequestParam("page") int page,
								  HttpSession session,
								  Model model) {
			Member loginUser = (Member)session.getAttribute("loginUser");
			
			Integer userNo = null;
			if(loginUser != null) {
				userNo = (Integer)loginUser.getMemNo();
			}
			
			Board b = bService.selectReBoard(bId, userNo);
			ArrayList<Image> imgList = bService.selectImg(bId);
			
			if(b.getCateNo() == 100) {
				b.setBoardWriterName("관리자");
			}
			
			if(b != null && imgList != null) {
				model.addAttribute("b", b);
				model.addAttribute("imgList", imgList);
				model.addAttribute("page", page);
				
				return "../board/boardDetailAdmin";
			}else {
				throw new BoardException("게시글을 불러 오는데 실패했습니다.");
			}
		}
}
