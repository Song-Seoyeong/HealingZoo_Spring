package com.semiproject.healingzoo.admin.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.semiproject.healingzoo.admin.model.exception.AdminException;
import com.semiproject.healingzoo.admin.model.service.AdminService;
import com.semiproject.healingzoo.admin.model.vo.Show;
import com.semiproject.healingzoo.board.model.service.BoardService;
import com.semiproject.healingzoo.board.model.vo.Animal;
import com.semiproject.healingzoo.board.model.vo.Board;
import com.semiproject.healingzoo.board.model.vo.Goods;
import com.semiproject.healingzoo.board.model.vo.Image;
import com.semiproject.healingzoo.board.model.vo.Link;
import com.semiproject.healingzoo.board.model.vo.PageInfo;
import com.semiproject.healingzoo.common.Pagination;
import com.semiproject.healingzoo.member.model.vo.Member;

@Controller
@SessionAttributes("loginUser")
public class AdminController {

	@Autowired
	private BoardService bService;

	@Autowired
	private AdminService aService;

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
	public String showAdmin(@RequestParam(value="page", defaultValue="1") int page, Model model) {
		int listCount = aService.getShowListCount();
		PageInfo pi = Pagination.getPageInfo(page, listCount, 10);
		
		ArrayList<Show> showList = aService.getShowList(pi);
		if(showList != null) {
			model.addAttribute("showList", showList);
			model.addAttribute("pi", pi);
			return "show";
		}else {
			throw new AdminException("프로그램 리스트를 조회 중 오류가 발생했습니다");
		}
	}

	// 사이트관리 - 운영시간/이용요금 페이지 이동
	@RequestMapping("operating.admin")
	public String operatingAdmin() {
		return "operating";
	}

	//공지 게시판 게시글 목록 조회
	@RequestMapping("notice.admin")
	public String selectNoBoardList(@RequestParam(value="page", defaultValue="1") int currentPage, Model model) {
		
		int listCount = aService.getListCount(100);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10);
		ArrayList<Board> list = aService.selectNoBoardList(pi, 100);
		
		if(list != null) {
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
			
			return "notice";
		} else {
			throw new AdminException("게시글 조회를 실패하였습니다.");
		}
	}
	
	//문의사항 게시판 게시글 목록 조회
	@RequestMapping("question.admin")
	public String selectQuBoardList(@RequestParam(value="page", defaultValue="1") int currentPage, Model model) {
		
		int listCount = aService.getListCount(101);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10);
		ArrayList<Board> list = aService.selectQuBoardList(pi, 101);
		
		if(list != null) {
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
			
			return "question";
		} else {
			throw new AdminException("게시글 조회를 실패하였습니다.");
		}
	}


	//후기 게시판 게시글 목록 조회
	@RequestMapping("review.admin")
	public String selectReBoardList(@RequestParam(value="page", defaultValue="1") int currentPage, Model model) {
		
		int listCount = aService.getListCount(102);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10);
		ArrayList<Board> list = aService.selectReBoardList(pi, 102);
		
		if(list != null) {
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
			
			return "review";
		} else {
			throw new AdminException("게시글 조회를 실패하였습니다.");
		}
	}

	// 예약리스트 게시글 리스트 조회
	@RequestMapping("book.admin")
	public String selectBoBoardList(@RequestParam(value="page", defaultValue="1") int currentPage, Model model) {
		
		int listCount = aService.getListCount(103);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10);
		ArrayList<Board> list = aService.selectBoBoardList(pi, 103);
		
		if(list != null) {
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
			
			return "book";
		} else {
			throw new AdminException("게시글 조회를 실패하였습니다.");
		}
	}

	// 공지 게시글 상세 조회 (관리자용)
	@RequestMapping("boardNoView.admin")
	public String selectNoBoard(@RequestParam("bId") int bId, @RequestParam("page") int page, HttpSession session,
			Model model) {
		Member loginUser = (Member) session.getAttribute("loginUser");

		Integer userNo = null;
		if (loginUser != null) {
			userNo = (Integer) loginUser.getMemNo();
		}

		Board b = bService.selectNoBoard(bId, userNo);
		ArrayList<Image> imgList = bService.selectImg(bId);

		if (b.getCateNo() == 100) {
			b.setBoardWriterName("관리자");
		}

		if (b != null && imgList != null) {
			model.addAttribute("b", b);
			model.addAttribute("imgList", imgList);
			model.addAttribute("page", page);

			return "../board/boardDetailAdmin";
		} else {
			throw new AdminException("게시글을 불러 오는데 실패했습니다.");
		}
	}

	// 예약 게시글 상세 조회 (관리자용)
	@RequestMapping("boardReView.admin")
	public String selectReBoard(@RequestParam("bId") int bId, @RequestParam("page") int page, HttpSession session,
			Model model) {
		Member loginUser = (Member) session.getAttribute("loginUser");

		Integer userNo = null;
		if (loginUser != null) {
			userNo = (Integer) loginUser.getMemNo();
		}

		Board b = bService.selectReBoard(bId, userNo);
		ArrayList<Image> imgList = bService.selectImg(bId);

		if (b.getCateNo() == 100) {
			b.setBoardWriterName("관리자");
		}

		if (b != null && imgList != null) {
			model.addAttribute("b", b);
			model.addAttribute("imgList", imgList);
			model.addAttribute("page", page);

			return "../board/boardDetailAdmin";
		} else {
			throw new AdminException("게시글을 불러 오는데 실패했습니다.");
		}
	}

	// 메인 배너 링크 + 사진 추가/수정
	@RequestMapping("insertBanner.admin")
	public String insertBanner(@RequestParam("checkBanner") ArrayList<Integer> checkBanner,
							   @RequestParam("bannerLink") ArrayList<String> bannerLinks,
							   @RequestParam("file") ArrayList<MultipartFile> files,
							   HttpServletRequest request) {
		
		ArrayList<Image> list = new ArrayList<Image>();
		
		for(MultipartFile img : files) {
			if(img != null && !img.isEmpty()) {
				String[] returnArr = saveImg(img, request);
				
				Image newImg = new Image();
				newImg.setImgName(img.getOriginalFilename());
				newImg.setImgPath(returnArr[0]);
				newImg.setImgRename(returnArr[1]);
				newImg.setImgRefType("BANNER");
				list.add(newImg);
			}
		}
		int result = 0;
		
		Link link = new Link();
		link.setLinkRefType("BANNER");
		
		// 이전 배너 이미지 있으면 DB 업데이트+파일 이전 이미지 삭제 / 없으면 DB 추가
		for(int i = 0; i < checkBanner.size(); i++) {
			Image checkBannerResult = aService.checkBanner(checkBanner.get(i));
			
			list.get(i).setImgRefNum(checkBanner.get(i));
			
			link.setLinkRefNum(checkBanner.get(i));
			link.setLinkUrl(bannerLinks.get(i) + ".menu");
			
			if(checkBannerResult != null) {
				delete(checkBannerResult.getImgRename(), request);
				result += aService.updateMainImg(list.get(i));
				
			}else {
				result += aService.insertMainImg(list.get(i));
			}
			aService.updateMainLink(link);
		}
		
		if(result == checkBanner.size()) {
			return "redirect:mainPage.admin";
		}else {
			throw new AdminException("배너 이미지 저장에 실패했습니다");
		}
	}

	//한눈에보기 링크 + 사진 추가/수정
	@RequestMapping("insertOneEye.admin")
	public String insertOneEye(@RequestParam("checkOneEye") ArrayList<Integer> checkOneEye,
							   @RequestParam("oneEyeLink") ArrayList<String> oneEyeLink,
							   @RequestParam("file2") ArrayList<MultipartFile> files,
							   HttpServletRequest request) {
	
		ArrayList<Image> list = new ArrayList<Image>();
		
		for(MultipartFile img : files) {
			if(img != null && !img.isEmpty()) {
				String[] returnArr = saveImg(img, request);
				
				Image newImg = new Image();
				newImg.setImgName(img.getOriginalFilename());
				newImg.setImgPath(returnArr[0]);
				newImg.setImgRename(returnArr[1]);
				newImg.setImgRefType("ONEEYE");
				list.add(newImg);
			}
		}
		System.out.println(oneEyeLink);
		int result = 0;
		
		Link link = new Link();
		link.setLinkRefType("ONEEYE");
		
		// 이전 한눈에보기 이미지 있으면 DB 업데이트+파일 이전 이미지 삭제 / 없으면 DB 추가
		for(int i = 0; i < checkOneEye.size(); i++) {
			Image checkOneeyeResult = aService.checkOneeye(checkOneEye.get(i));
			
			list.get(i).setImgRefNum(checkOneEye.get(i));
			
			link.setLinkRefNum(checkOneEye.get(i));
			link.setLinkUrl(oneEyeLink.get(i) + ".menu");
			
			if(checkOneeyeResult != null) {
				delete(checkOneeyeResult.getImgRename(), request);
				result += aService.updateMainImg(list.get(i));
			}else {
				result += aService.insertMainImg(list.get(i));
			}
			aService.updateMainLink(link);
		}
		
		if(result == checkOneEye.size()) {
			return "redirect:mainPage.admin";
		}else {
			throw new AdminException("한눈에 보기 이미지 저장에 실패했습니다");
		}
	}

	// 상세 글 보기 + 조회수 증가
	@RequestMapping("boardView.admin")
	public String selectBoard(@RequestParam("bId") int bId,
			@RequestParam("page") int page,
			@RequestParam("category") int category,
			HttpSession session,
			Model model) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		Integer userNo = null;
		if(loginUser != null) {
			userNo = (Integer)loginUser.getMemNo();
		}
		
		// 카테고리별 상세 글 불러오는 메소드 나뉨
		Board b = null;
		
		if(category == 100) {	// 공지
			b = aService.selectNoBoard(bId, userNo);
		} else if(category == 101 || category == 103){ // 문의/예약
			b = aService.selectQuBoBoard(bId, userNo);
		} else {	// 후기
			b = aService.selectReBoard(bId, userNo);
		}
		
		ArrayList<Image> imgList = aService.selectImg(bId);
		
		if(b.getCateNo() == 100) {
			b.setBoardWriterName("관리자");
		}
		
		if(b != null && imgList != null) {
			model.addAttribute("b", b);
			model.addAttribute("imgList", imgList);
			model.addAttribute("page", page);
			
			return "boardDetailAdmin";
		}else {
			throw new AdminException("게시글을 불러 오는데 실패했습니다.");
		}
	}

	// 공지사항 말머리 검색 필터
	@RequestMapping("searchFilter.admin")
	public String searchFilter(@RequestParam("noSubject") String noSubject,
							   @RequestParam(value="page", defaultValue="1") Integer currentPage,
							   Model model) {
		
		if(noSubject.equals("전체")) {
			return "redirect:notice.admin";
		}
		
		// 말머리 필터 게시글 수 조회
		int listSubjectCount = aService.listSubjectCount(noSubject);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listSubjectCount, 10);
		
		
		// 말머리 필터 게시글 조회
		ArrayList<Board> list = aService.searchFilter(noSubject, pi);
		if(list != null) {
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
			
			return "notice";
		} else {
			throw new AdminException("말머리 검색 중 에러가 발생했습니다.");
		}
	}

	// 공지사항 검색어 리스트 검색
	@RequestMapping("searchNotice.admin")
	public String searchNotice(@RequestParam("condition") String condition,
			   					@RequestParam("search") String search,
							   @RequestParam(value="page", defaultValue="1") Integer currentPage, HttpServletRequest request,
							   Model model) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("condition", condition);
		map.put("search", search);
		map.put("cateNo", 100);
		
		// 검색어 게시글 수 조회
		int listSearchCount = aService.listSearchCount(map);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listSearchCount, 10);	
		
		ArrayList<Board> searchList = aService.searchNoBoard(map, pi);
			
		if(searchList != null) {
			model.addAttribute("list", searchList);
			model.addAttribute("pi", pi);
			model.addAttribute("condition", condition);
			model.addAttribute("search", search);
			
			return "notice";
		} else {
			throw new AdminException("검색에 실패했습니다.");
		}
	}

	// 후기 검색어 리스트 조회
	@RequestMapping("searchReview.admin")
	public String searchReview(@RequestParam("condition") String condition,
			   					@RequestParam("search") String search,
							   @RequestParam(value="page", defaultValue="1") Integer currentPage, HttpServletRequest request,
							   Model model) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("search", search);
		map.put("cateNo", 102);
		
		// 검색어 게시글 수 조회
		int listSearchCount = aService.listSearchCount(map);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listSearchCount, 10);	
		
		ArrayList<Board> searchList = aService.searchReBoard(map, pi);
		
		System.out.println(search);
		System.out.println(condition);
		
		if(searchList != null) {
			model.addAttribute("list", searchList);
			model.addAttribute("pi", pi);
			model.addAttribute("condition", condition);
			model.addAttribute("search", search);
			
			return "review";
		} else {
			throw new AdminException("검색에 실패했습니다.");
		}
	}	

	// 예약 검색어 리스트 조회
	@RequestMapping("searchBook.admin")
	public String searchBoBook(@RequestParam("condition") String condition,
			   				   @RequestParam("search") String search,
							   @RequestParam(value="page", defaultValue="1") Integer currentPage, HttpServletRequest request,
							   Model model) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("search", search);
		map.put("cateNo", 103);
		
		// 검색어 게시글 수 조회
		int listSearchCount = aService.listSearchCount(map);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listSearchCount, 10);	
		
		ArrayList<Board> searchList = aService.searchQuBoBoard(map, pi);
		
		if(searchList != null) {
			model.addAttribute("list", searchList);
			model.addAttribute("pi", pi);
			model.addAttribute("condition", condition);
			model.addAttribute("search", search);
			
			return "book";
		} else {
			throw new AdminException("검색에 실패했습니다.");
		}
	}	

	// 문의사항 검색어 리스트 조회
	@RequestMapping("searchQuestion.admin")
	public String searchQuBook(@RequestParam("condition") String condition,
							   @RequestParam("search") String search,
							   @RequestParam(value="page", defaultValue="1") Integer currentPage,
							   Model model) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("search", search);
		map.put("cateNo", 101);
		
		// 검색어 게시글 수 조회
		int listSearchCount = aService.listSearchCount(map);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listSearchCount, 10);	
		
		ArrayList<Board> searchList = aService.searchQuBoBoard(map, pi);
		
		if(searchList != null) {
			model.addAttribute("list", searchList);
			model.addAttribute("pi", pi);
			model.addAttribute("condition", condition);
			model.addAttribute("search", search);
			
			return "question";
		} else {
			throw new AdminException("검색에 실패했습니다.");
		}
	}

	// (상세 글 보기에서) 게시글 삭제
		@RequestMapping("delete.admin")
	public String deleteBoard(@RequestParam("bId") int boardNo,
							  @RequestParam("list") int listSize,
							  @RequestParam("category") String category) {
		int deleteBoardResult = aService.deleteBoard(boardNo);
		int deleteImgResult = aService.updateImgStatus(boardNo);
		
		if(deleteBoardResult + deleteImgResult == 1 + listSize) {
			return "redirect:" + category + ".admin";
		}else {
			throw new AdminException("게시글 삭제 중 에러 발생");
		}
	}

	// 이미지 삭제
	private void delete(String rename, HttpServletRequest request) {
		String savePath = request.getSession().getServletContext().getRealPath("resources") + "/uploadImg";
		File f = new File(savePath + "/" + rename);
		if (f.exists()) {
			f.delete();
		}
	}

	// 이미지 저장
	public String[] saveImg(MultipartFile img, HttpServletRequest request) {
		String savePath = request.getSession().getServletContext().getRealPath("resources") + "/uploadImg";

		File f = new File(savePath);
		if (!f.exists()) {
			f.mkdirs();
		}

		SimpleDateFormat sdf = new SimpleDateFormat("yyyymmddHHmmssSSS");
		int randomNum = (int) (Math.random() * 1000000);

		String originName = img.getOriginalFilename();
		String rename = sdf.format(new Date()) + randomNum + originName.substring(originName.indexOf("."));

		String renamePath = f + "/" + rename;

		try {
			img.transferTo(new File(renamePath));
		} catch (Exception e) {
			System.out.println("파일 전송 에러 : " + e.getMessage());
		}

		String[] returnArr = new String[2];
		returnArr[0] = savePath;
		returnArr[1] = rename;

		return returnArr;
	}

	// 게시글 수정 페이지 이동
	@RequestMapping("updateView.admin")
	public String updateView(@ModelAttribute Board b,
							  @RequestParam("page") int page,
							  Model model) {
		Board updateBoard = null;
		
		if(b.getCateNo() == 100) {
			updateBoard = aService.selectNoBoard(b.getBoardNo(), null);
		}else if(b.getCateNo() == 101 || b.getCateNo() == 103){
			updateBoard = aService.selectQuBoBoard(b.getBoardNo(), null);
		}else {
			updateBoard = aService.selectReBoard(b.getBoardNo(), null);
		}

		ArrayList<Image> imgList = aService.selectImg(b.getBoardNo());
		
		model.addAttribute("imgList", imgList);
		model.addAttribute("bId", b.getBoardNo());
		model.addAttribute("b", updateBoard);
		model.addAttribute("page", page);
		return "boardUpdateAdmin";
	}

	// 게시글 수정
	@RequestMapping("updateBoard.admin")
	public String updateBoard(@ModelAttribute Board b,
							  @RequestParam("checkDelete") ArrayList<String> checkDeletes,
							  @RequestParam("file") ArrayList<MultipartFile> imgs,
							  @RequestParam("page") int page,
							  @RequestParam("category") int category,
							  HttpServletRequest request,
							  Model model) {
		// 추가 이미지 등록
		ArrayList<Image> imgList = new ArrayList<Image>();
		
		for(MultipartFile img : imgs) {
			if(!img.isEmpty() && img != null) {
				String[] returnArr = saveImg(img, request);
				
				Image a = new Image();
				a.setImgName(img.getOriginalFilename());
				a.setImgRename(returnArr[1]);
				a.setImgPath(returnArr[1]);
				a.setImgRefType("BOARD");
				a.setImgRefNum(b.getBoardNo());
				
				imgList.add(a);
			}
		}
		
		
		// 기존 이미지 삭제
		ArrayList<String> deleteImg = new ArrayList<String>();
	
		if(checkDeletes != null) {
			for(String checkDelete : checkDeletes) {
				if(!checkDelete.equals("none")) {
					deleteImg.add(checkDelete);
				}
			}
		}
		
		int deleteImgResult = 0;
		if(!deleteImg.isEmpty()) {
			deleteImgResult = aService.deleteImg(deleteImg);
			
			if(deleteImgResult > 0) {
				for(String deleteImgRename : deleteImg) {
					delete(deleteImgRename, request);
				}
			}else {
				throw new AdminException("게시판 수정에 실패했습니다.");
				
			}
		}
		
		// 공지  문의/예약 글일 경우
		if(b.getCateNo() == 101 || b.getCateNo() == 103) {
			int quBoBoardResult = aService.updateQuBo(b);
			if(quBoBoardResult < 0) {
				throw new AdminException("게시판 수정에 실패했습니다.");
			}
		}else if(b.getCateNo() == 100) {
			int noResult = aService.updateNotice(b);
			if(noResult < 0) {
				throw new AdminException("게시판 수정에 실패했습니다.");
			}
		}
		
		
		int boardResult = aService.updateBoard(b);
		
		// 추가 이미지가 있을 때만
		int imgResult = 0;
		if(!imgList.isEmpty()) {
			imgResult = aService.insertImg(imgList);
		}
		if(boardResult + imgResult == 1 + imgList.size()) {
			model.addAttribute("bId", b.getBoardNo());
			model.addAttribute("page", page);
			model.addAttribute("category", category);
			
			return "redirect:boardView.admin";
		}else {
			throw new AdminException("게시판 수정에 실패했습니다.");
		}
	}
	
	// 게시글 삭제 처리
	@RequestMapping("/checkDelete.admin") 
	public String deleteCheckedPosts(@RequestParam("updateBoardNos") String boardNos) {
	    String[] boardNoArray = boardNos.split(",");
	    int checkDelete = 0;
	    int category = 0;
	    for (String boardNo : boardNoArray) {
	        int boardNoInt = Integer.parseInt(boardNo);
	        
	        // 각 게시글 번호에 해당하는 게시글을 삭제하는 로직
	        checkDelete = aService.checkDelete(boardNoInt);
	
	        // 게시글 번호에 해당하는 카테고리 번호를 가져오는 로직
	        category = aService.getCategoryByBoardNo(boardNoInt);
	
	    }
	    System.out.println(category);
	    
	    if(checkDelete == 1 && category == 100) {
	    	return "redirect:/notice.admin";
	    } else if (checkDelete == 1 && category == 101) {
	    	return "redirect:/question.admin";
	    } else if (checkDelete == 1 && category == 102) {
	    	return "redirect:/review.admin";
	    } else if (checkDelete == 1 && category == 103){
	    	return "redurect:/book.admin";
	    } else {
	    	throw new AdminException("게시글 삭제를 실패했습니다.");
	    }
		
	}
	
	
	// 글쓰기 페이지 이동 (카테고리 모두 동일)
	@RequestMapping("writeView.admin")
	public String writeBoardView(@RequestParam("category") String category, Model model) {
		model.addAttribute("category", category);
		return "writeBoardAdmin";
	}
	
	// 글쓰기 insert(카테고리 모두 동일)
	@RequestMapping("write.admin")
	public String writeBoard(@ModelAttribute Board b,
							 @RequestParam("file") ArrayList<MultipartFile> imgList,
							 HttpServletRequest request,
							 Model model) {
		ArrayList<Image> list = new ArrayList<Image>();
		
		for(MultipartFile img : imgList) {
			if(!img.isEmpty() && img != null) {
				String[] returnArr = saveImg(img, request);
				
				Image newImg = new Image();
				newImg.setImgName(img.getOriginalFilename());
				newImg.setImgPath(returnArr[0]);
				newImg.setImgRename(returnArr[1]);
				newImg.setImgRefType("BOARD");
				
				list.add(newImg);
			}
		}
		
		int resultBoard = 0;
		int resultImg = 0;
		
		//공지, 예약/문의 게시글 분리
		resultBoard = aService.insertBoard(b);
		if(b.getCateNo() == 100) {
			aService.insertNo(b);
		} else if(b.getCateNo() == 101 || b.getCateNo() == 103) {
			aService.insertQuBo(b);
		}
		
		//이미지가 있다면 DB 넣기
		if(!list.isEmpty()) {
			for(Image i : list) {
				i.setImgRefNum(b.getBoardNo());
			}
			resultImg = aService.insertImg(list);
		}
		
		
			
		if(resultBoard + resultImg == 1 + list.size()) {
			
			model.addAttribute("bId", b.getBoardNo());
			model.addAttribute("category", b.getCateNo());
			model.addAttribute("page", 1);
			return "redirect:boardView.admin";
		}else {
			for(Image a : list) {
				delete(a.getImgRename(), request);
			}
			throw new AdminException("게시글 등록에 실패 했습니다.");
		}
	}

	// 동물 목록 조회
	@RequestMapping("animal.admin")
	public String selectFamilyList(@RequestParam(value = "page", defaultValue = "1") int currentPage, Model model) {
		int listCount = aService.getAnimalCount();

		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5);

		ArrayList<Animal> anilist = aService.selectFamilyList(pi);

		if (anilist != null && !anilist.isEmpty()) {
			model.addAttribute("list", anilist);
			model.addAttribute("pi", pi);
			return "animal";
		} else {
			throw new AdminException("동물 목록 조회를 실패하였습니다.");
		}
	}

	// 동물 추가 페이지 이동
	@RequestMapping("writeAni.admin")
	public String wwMove() {
		return "writeAnimal";
	}

	@PostMapping("/animalInsert")
	public String insertAnimal(@RequestParam("animalClass") String animalClass,
	                           @RequestParam("extinctGrade") String extinctGrade,
	                           @ModelAttribute Animal animal,
	                           @RequestParam(value = "file", required = false) MultipartFile file,
	                           HttpServletRequest request,
	                           RedirectAttributes redirectAttributes) {
	    animal.setAnimalClass(animalClass);
	    animal.setExtinctGrade(extinctGrade);
	    
	    try {
	        // 동물 정보 삽입
	    	aService.insertAnimal(animal);
	        int aniNO = animal.getAniNO(); // 여기서 생성된 aniNO를 가져옵니다.
	        
	        System.out.println("Generated aniNO: " + aniNO);

	            String[] imgInfo = saveImg(file, request);
	            Image image = new Image();
	            image.setImgPath("/resources/uploadImg");
	            image.setImgName(file.getOriginalFilename());
	            image.setImgRename(imgInfo[1]);
	            image.setImgRefNum(aniNO);
	            image.setImgRefType("ANIMAL");
	            
	            aService.insertSingleImage(image);
	        
	    } catch (Exception e) {
	        redirectAttributes.addFlashAttribute("error", "동물 추가 중 오류가 발생했습니다: " + e.getMessage());
	        e.printStackTrace();
	    }
	    return "redirect:/animal.admin";
	}

	// 동물 수정 페이지로 이동 
	@GetMapping("updateAni.admin")
	public String animalUpdateForm(@RequestParam("aniNO") int aniNO, Model model) {
	    Animal animal = aService.selectAnimal(aniNO);
	    if (animal != null) {
	        Image image = aService.selectAnimalImage(aniNO);
	        model.addAttribute("animal", animal);
	        model.addAttribute("image", image);
	        return "animalUpdateForm";
	    } else {
	        return "redirect:/animal.admin";
	    }
	}

	// 동물 수정 처리
	@PostMapping("animalUpdate")
	public String animalUpdate(@ModelAttribute Animal animal,
	                           @RequestParam(value = "file", required = false) MultipartFile file,
	                           HttpServletRequest request,
	                           RedirectAttributes redirectAttributes) {
	    try {
	        int result = aService.updateAnimal(animal);
	        
	        	aService.deactivateOldAnimalImage(animal.getAniNO());
	            
	            String[] imgInfo = saveImg(file, request);
	            Image image = new Image();
	            image.setImgPath("/resources/uploadImg");
	            image.setImgName(file.getOriginalFilename());
	            image.setImgRename(imgInfo[1]);
	            image.setImgRefNum(animal.getAniNO());
	            image.setImgRefType("ANIMAL");
	            
	            aService.insertSingleImage(image);
	        
	        if(result > 0) {
	            redirectAttributes.addFlashAttribute("message", "동물 정보가 성공적으로 수정되었습니다.");
	        } else {
	            redirectAttributes.addFlashAttribute("error", "동물 정보 수정에 실패했습니다.");
	        }
	    } catch(Exception e) {
	        redirectAttributes.addFlashAttribute("error", "동물 정보 수정 중 오류가 발생했습니다: " + e.getMessage());
	        e.printStackTrace();
	    }
	    return "redirect:/animal.admin";
	}

	// 동물 삭제
	@RequestMapping("animalDelete")
	public String deleteAnimal(@RequestParam(value = "aniNOs", required = false) List<Integer> aniNOs,
			RedirectAttributes redirectAttributes) {
		if (aniNOs != null && !aniNOs.isEmpty()) {
			try {
				int deletedCount = aService.deleteAnimals(aniNOs);
				redirectAttributes.addFlashAttribute("message", deletedCount + "개의 동물이 삭제되었습니다.");
			} catch (Exception e) {
				redirectAttributes.addFlashAttribute("error", "동물 삭제 중 오류가 발생했습니다.");
				e.printStackTrace();
			}
		} else {
			redirectAttributes.addFlashAttribute("error", "삭제할 동물이 선택되지 않았습니다.");
		}
		return "redirect:/animal.admin";
	}

	// 마스코트 이동하면 DB데이터보이게
	@GetMapping("/mascot.admin")
	public String mascotAdmin(Model model) {
	    Image mascotImage = aService.getMascotImage();
	    Image goodsInfoImage = aService.getGoodsInfoImage();
	    ArrayList<Goods> goodsList = aService.selectMascotList();
	    
	    model.addAttribute("mascotImage", mascotImage);
	    model.addAttribute("goodsInfoImage", goodsInfoImage);
	    model.addAttribute("list", goodsList);
	    
	    return "mascot";
	}


	// 마스코트 수정 페이지 이동
	@GetMapping("updateGoods.admin")
	public String updateGoodsForm(@RequestParam("goodsNo") int goodsNo, Model model) {
		Goods goods = aService.selectGoods(goodsNo);
		model.addAttribute("goods", goods);
		return "updateGoodsForm";
	}

	// 마스코트 수정
	@PostMapping("updateGoods.admin")
	public String updateGoods(@ModelAttribute Goods goods, RedirectAttributes redirectAttributes) {
		aService.updateGoods(goods);
		redirectAttributes.addFlashAttribute("message", "상품이 성공적으로 업데이트되었습니다.");
		return "redirect:/mascot.admin";
	}

	// 마스코트 삭제
	@PostMapping("/deleteGoods.admin")
	public String deleteGoods(@RequestParam(value = "goodsNo", required = false) List<Integer> goodsNos,
			RedirectAttributes redirectAttributes) {
		if (goodsNos == null || goodsNos.isEmpty()) {
			redirectAttributes.addFlashAttribute("error", "삭제할 상품을 선택해주세요.");
			return "redirect:/mascot.admin";
		}

		try {
			for (int goodsNo : goodsNos) {
				aService.deleteGoods(goodsNo);
			}
			redirectAttributes.addFlashAttribute("message", goodsNos.size() + "개의 상품이 성공적으로 삭제되었습니다.");
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("error", "상품 삭제 중 오류가 발생했습니다.");
			e.printStackTrace();
		}
		return "redirect:/mascot.admin";
	}

	// 마스코트 추가 페이지 이동
	@RequestMapping("masInsert.admin")
	public String masMove(@RequestParam(required = false) Integer goodsNo, Model model) {
		if (goodsNo != null) {
			Goods goods = aService.selectGoods(goodsNo);
			model.addAttribute("goods", goods);
		}
		return "writeMascot";
	}

	//마스코트 상품 추가
	@PostMapping("/insertGoods.admin")
	public String insertOrUpdateGoods(@ModelAttribute Goods goods, 
	                                  @RequestParam(value = "file", required = false) MultipartFile file,
	                                  HttpServletRequest request,
	                                  RedirectAttributes redirectAttributes) {
	    try {
	        int goodsNo;
	        if (goods.getGoodsNo() == 0) {
	            // 새 상품 추가
	            goodsNo = aService.insertGoods(goods);
	        } else {
	            // 기존 상품 수정
	            goodsNo = goods.getGoodsNo();
	            aService.updateGoods(goods);

	            // 기존 이미지를 비활성화
	            aService.deactivateOldGoodsImage(goodsNo);
	        }

	        // 이미지 처리
	        if (file != null && !file.isEmpty()) {
	            String[] imgInfo = saveImg(file, request);
	            Image image = new Image();
	            image.setImgPath("/resources/uploadImg");
	            image.setImgName(file.getOriginalFilename());
	            image.setImgRename(imgInfo[1]);
	            image.setImgRefNum(goodsNo);
	            image.setImgRefType("GOODS");

	            System.out.println("Image Info: " + image);  // 디버깅 출력

	            aService.insertGoodsImage(image);
	        }

	        redirectAttributes.addFlashAttribute("message", goods.getGoodsNo() == 0 ? "새 상품이 성공적으로 추가되었습니다." : "상품이 성공적으로 수정되었습니다.");
	    } catch (Exception e) {
	        redirectAttributes.addFlashAttribute("error", "상품 처리 중 오류가 발생했습니다.");
	        e.printStackTrace();
	    }
	    return "redirect:/mascot.admin";
	}
	
	// 프로그램 추가 페이지 이동
	@RequestMapping("insertShowView.admin")
	public String insertShowview(@RequestParam("page") int page, Model model) {
		model.addAttribute("page", page);
		return "showInsert";
	}
	
	// 프로그램 추가
	@RequestMapping("insertShow.admin")
	public String insertShow(@ModelAttribute Show show,
							 @RequestParam("file") ArrayList<MultipartFile> files,
							 @RequestParam("page") int page,
							 HttpServletRequest request,
							 Model model) {
		// 프로그램 등록
		int result = aService.insertShow(show);
		
		Image proImg = new Image();
		Image hoverImg = new Image();
		
		// 프로그램 메인 사진
		if(files.get(0) != null && !files.get(0).isEmpty()) {
			String[] returnArr = saveImg(files.get(0), request);
			
			proImg.setImgName(files.get(0).getOriginalFilename());
			proImg.setImgPath(returnArr[0]);
			proImg.setImgRename(returnArr[1]);
			proImg.setImgRefType("SHOW");
			proImg.setImgRefNum(show.getShowNo());
			proImg.setImgRefHover(1);
		}
		
		// 프로그램 호버 사진
		if(files.get(1) != null && !files.get(1).isEmpty()) {
			String[] returnArr = saveImg(files.get(1), request);
			
			hoverImg.setImgName(files.get(1).getOriginalFilename());
			hoverImg.setImgPath(returnArr[0]);
			hoverImg.setImgRename(returnArr[1]);
			hoverImg.setImgRefType("SHOW");
			hoverImg.setImgRefNum(show.getShowNo());
			hoverImg.setImgRefHover(2);
		}
		
		int proImgResult = aService.insertMainImg(proImg);
		int hoverImgResult = aService.insertMainImg(hoverImg);
		
		if(result + proImgResult + hoverImgResult == 3) {
			model.addAttribute("page", page);
			return "redirect:show.admin";
		}else {
			throw new AdminException("프로그램 등록에 실패했습니다.");
		}
	}
	
	// 프로그램 상세 보기
	@RequestMapping("showDetail.admin")
	public String showDetail(@RequestParam("showNo") int showNo,
							 @RequestParam("page") int page,
							 Model model) {
		
		Show show = aService.getShow(showNo);
		
		// 메인 이미지
		Image mainImg = new Image();
		mainImg.setImgRefNum(showNo);
		mainImg.setImgRefHover(1);
		mainImg.setImgRefType("SHOW");
		
		mainImg = aService.getImg(mainImg);
		
		// 호버 이미지
		Image hoverImg = new Image();
		hoverImg.setImgRefNum(showNo);
		hoverImg.setImgRefHover(2);
		hoverImg.setImgRefType("SHOW");
		
		hoverImg = aService.getImg(hoverImg);
		
		if(show != null && mainImg != null && hoverImg != null) {
			model.addAttribute("show", show);
			model.addAttribute("mainImg", mainImg);
			model.addAttribute("hoverImg", hoverImg);
			model.addAttribute("page", page);
			
			return "showDetail";
		}else {
			throw new AdminException("프로그램 상세 조회에 실패했습니다.");
		}
	}
	
	// 프로그램 삭제
	@RequestMapping("deleteShow.admin")
	public String deleteShow(@RequestParam("showNo") ArrayList<Integer> showNos,
							 HttpServletRequest request) {
		int result = 0;
		
		for(int showNo : showNos) {
			result += aService.deleteShow(showNo);
			aService.deleteShowImg(showNo);
			
			// 파일에 저장된 이미지삭제
			ArrayList<Image> imgList = aService.getImgList(showNo);
			for(Image img:imgList) {
				delete(img.getImgRename(), request);
			}
		}
		
		if(result == showNos.size()) {
			return "redirect:show.admin";
		}else {
			throw new AdminException("프로그램 삭제에 실패 했습니다.");
		}
	}
	
	// 프로그램 수정 페이지 이동
	@RequestMapping("updateShowView.admin")
	public String updateShowView(@RequestParam("showNo") int showNo,
								 @RequestParam("page") int page,
								 Model model) {
		
		Show show = aService.getShow(showNo);
		
		// 메인 이미지
		Image mainImg = new Image();
		mainImg.setImgRefNum(showNo);
		mainImg.setImgRefHover(1);
		mainImg.setImgRefType("SHOW");
		
		mainImg = aService.getImg(mainImg);
		
		// 호버 이미지
		Image hoverImg = new Image();
		hoverImg.setImgRefNum(showNo);
		hoverImg.setImgRefHover(2);
		hoverImg.setImgRefType("SHOW");
		
		hoverImg = aService.getImg(hoverImg);
		
		model.addAttribute("show", show);
		model.addAttribute("mainImg", mainImg);
		model.addAttribute("hoverImg", hoverImg);
		model.addAttribute("page", page);
		
		return "showUpdate";
	}
	
	// 프로그램 수정
	@RequestMapping("updateShow.admin")
	public String updateShow(@ModelAttribute Show show,
							 @RequestParam("checkDelete") ArrayList<String> checkDeletes,
							 @RequestParam(value="file", defaultValue="") ArrayList<MultipartFile> files,
							 @RequestParam("page") int page,
							 HttpServletRequest request,
							 Model model){
		
		int updateResult = aService.updateShow(show);
		
		// 추가 이미지 등록
		ArrayList<Image> imgList = new ArrayList<Image>();

		for (MultipartFile img : files) {
			if (!img.isEmpty() && img != null) {
				String[] returnArr = saveImg(img, request);
				
				Image a = new Image();
				a.setImgName(img.getOriginalFilename());
				a.setImgRename(returnArr[1]);
				a.setImgPath(returnArr[1]);
				a.setImgRefType("SHOW");
				a.setImgRefNum(show.getShowNo());

				imgList.add(a);
			}
		}
		
		// 기존 이미지 삭제
		ArrayList<String> deleteImg = new ArrayList<String>();

		if (checkDeletes != null) {
			for (String checkDelete : checkDeletes) {
				if (!checkDelete.equals("none")) {
					deleteImg.add(checkDelete);
				}
			}
		}
		
		int updateImgResult = 0;
		if (!deleteImg.isEmpty()) {
			// 이미지 수정
			for(int i = 0; i < deleteImg.size() ; i++) {
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("image", imgList.get(i));
				map.put("deleteImg", deleteImg.get(i));
				updateImgResult += aService.updateShowImg(map);
			}

			if (updateImgResult > 0) {
				// 기존 이미지 파일 삭제
				for (String deleteImgRename : deleteImg) {
					delete(deleteImgRename, request);
				}
			} else {
				throw new AdminException("프로그램 수정에 실패했습니다.");

			}
		}
		
		if(updateResult + updateImgResult == 1 + deleteImg.size()) {
			model.addAttribute("showNo", show.getShowNo());
			model.addAttribute("page", page);
			
			return "redirect:showDetail.admin";
		}else {
			throw new AdminException("프로그램 수정에 실패했습니다.");
		}
	}
	
	// 운영시간 페이지 이동
	@GetMapping("/operating.admin")
	public String operatingAdmin(Model model) {
	    Image operatingImage = aService.getOperatingImage();
	    Image chargeImage = aService.getChargeImage();
	    
	    model.addAttribute("operatingImage", operatingImage);
	    model.addAttribute("chargeImage", chargeImage);
	    
	    return "operating";
	}

	// 운영시간 이미지 수정
	@PostMapping("/updateOperatingImage.admin")
	public String updateOperatingImage(@RequestParam("operImg") MultipartFile file,
	                                   HttpServletRequest request,
	                                   RedirectAttributes redirectAttributes) {
	    try {
	        if (!file.isEmpty()) {
	            String[] imgInfo = saveImg(file, request);
	            Image image = new Image();
	            image.setImgPath("/resources/uploadImg");
	            image.setImgName(file.getOriginalFilename());
	            image.setImgRename(imgInfo[1]);
	            image.setImgRefType("OPERATING");
	            
	            aService.updateOperatingImage(image);
	            redirectAttributes.addFlashAttribute("message", "운영시간 이미지가 성공적으로 업데이트되었습니다.");
	        }
	    } catch (Exception e) {
	        redirectAttributes.addFlashAttribute("error", "운영시간 이미지 업데이트 중 오류가 발생했습니다.");
	        e.printStackTrace();
	    }
	    return "redirect:/operating.admin";
	}

	// 이용요금 이미지 수정
	@PostMapping("/updateChargeImage.admin")
	public String updateChargeImage(@RequestParam("charge") MultipartFile file,
	                                HttpServletRequest request,
	                                RedirectAttributes redirectAttributes) {
	    try {
	        if (!file.isEmpty()) {
	            String[] imgInfo = saveImg(file, request);
	            Image image = new Image();
	            image.setImgPath("/resources/uploadImg");
	            image.setImgName(file.getOriginalFilename());
	            image.setImgRename(imgInfo[1]);
	            image.setImgRefType("CHARGE");
	            
	            aService.updateChargeImage(image);
	            redirectAttributes.addFlashAttribute("message", "이용요금 이미지가 성공적으로 업데이트되었습니다.");
	        }
	    } catch (Exception e) {
	        redirectAttributes.addFlashAttribute("error", "이용요금 이미지 업데이트 중 오류가 발생했습니다.");
	        e.printStackTrace();
	    }
	    return "redirect:/operating.admin";
	}
	
	// 마스코트 이미지 상세
	@PostMapping("/updateMascotImage.admin")
	public String updateMascotImage(@RequestParam("mascotImg") MultipartFile file,
	                                HttpServletRequest request,
	                                RedirectAttributes redirectAttributes) {
	    try {
	        if (!file.isEmpty()) {
	            String[] imgInfo = saveImg(file, request);
	            Image image = new Image();
	            image.setImgPath("/resources/uploadImg"); // 여기가 이미지 경로예요.
	            image.setImgName(file.getOriginalFilename());
	            image.setImgRename(imgInfo[1]);
	            image.setImgRefType("MASCOT");
	            
	            aService.updateMascotImage(image);
	            redirectAttributes.addFlashAttribute("message", "마스코트 이미지가 성공적으로 업데이트되었습니다.");
	        }
	    } catch (Exception e) {
	        redirectAttributes.addFlashAttribute("error", "마스코트 이미지 업데이트 중 오류가 발생했습니다.");
	        e.printStackTrace();
	    }
	    return "redirect:/mascot.admin";
	}
	
	// 마스코트 상품 이미지 수정
	@PostMapping("/updateGoodsInfoImage.admin") 
	public String updateGoodsInfoImage(@RequestParam("goodsInfoImg") MultipartFile file,
	                                   HttpServletRequest request,
	                                   RedirectAttributes redirectAttributes) {
	    try {
	        if (!file.isEmpty()) {
	            String[] imgInfo = saveImg(file, request);
	            Image image = new Image();
	            image.setImgPath("/resources/uploadImg");
	            image.setImgName(file.getOriginalFilename());
	            image.setImgRename(imgInfo[1]);
	            image.setImgRefType("GOODS_INFO");
	            
	            aService.updateGoodsInfoImage(image);
	            redirectAttributes.addFlashAttribute("message", "상품 안내 이미지가 성공적으로 업데이트되었습니다.");
	        }
	    } catch (Exception e) {
	        redirectAttributes.addFlashAttribute("error", "상품 안내 이미지 업데이트 중 오류가 발생했습니다.");
	        e.printStackTrace();
	    }
	    return "redirect:/mascot.admin";
	}

	
	
	
	
	
	
	
	
}
