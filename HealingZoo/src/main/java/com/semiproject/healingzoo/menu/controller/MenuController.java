package com.semiproject.healingzoo.menu.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.semiproject.healingzoo.admin.model.service.AdminService;
import com.semiproject.healingzoo.admin.model.vo.Show;
import com.semiproject.healingzoo.board.model.exception.BoardException;
import com.semiproject.healingzoo.board.model.service.BoardService;
import com.semiproject.healingzoo.board.model.vo.Animal;
import com.semiproject.healingzoo.board.model.vo.Board;
import com.semiproject.healingzoo.board.model.vo.Goods;
import com.semiproject.healingzoo.board.model.vo.Image;
import com.semiproject.healingzoo.board.model.vo.Link;
import com.semiproject.healingzoo.board.model.vo.PageInfo;
import com.semiproject.healingzoo.common.Pagination;
import com.semiproject.healingzoo.menu.model.service.MenuService;

@Controller
public class MenuController {

	@Autowired
	private MenuService mService;
	
	@Autowired
	private AdminService aService;
	
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
		if(questionList != null) {
			
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
		if(bookList != null) {
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
		if(noticeList != null) {
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

		if(reviewList != null) {
			model.addAttribute("reList", reviewList);
			model.addAttribute("pi", pi);
			return "review";
		}else {
			throw new BoardException("게시판 리스트를 불러오는데 실패했습니다.");
		}
	}

	 // 공지사항 말머리 검색 필터
	@RequestMapping("searchFilter.menu")
	public String searchFilter(@RequestParam("noSubject") String noSubject,
							   @RequestParam(value="page", defaultValue="1") Integer currentPage,
							   Model model) {
		
		if(noSubject.equals("전체")) {
			return "redirect:notice.menu";
		}
		
		// 말머리 필터 게시글 수 조회
		int listSubjectCount = bService.listSubjectCount(noSubject);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listSubjectCount, 10);
		
		
		// 말머리 필터 게시글 조회
		ArrayList<Board> noList = bService.searchFilter(noSubject, pi);
		
		for(Board b : noList) {
			b.setBoardWriterName("관리자");
		}
		if(noList != null) {
			model.addAttribute("noList", noList);
			model.addAttribute("pi", pi);
			model.addAttribute("noSubject", noSubject);
			
			return "notice";
		}else {
			throw new BoardException("말머리 검색 중 에러가 발생했습니다.");
		}
	}
	
	// 공지사항 검색어 리스트 검색
	@RequestMapping("searchNotice.menu")
	public String searchNotice(@RequestParam("condition") String condition,
							   @RequestParam("search") String search,
							   @RequestParam(value="page", defaultValue="1") Integer currentPage,
							   Model model) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("search", search);
		map.put("cateNo", 100);
		
		// 검색어 게시글 수 조회
		int listSearchCount = bService.listSearchCount(map);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listSearchCount, 10);	
		
		ArrayList<Board> searchList = bService.searchNoReBoard(map, pi);
		
		for(Board b : searchList) {
			b.setBoardWriterName("관리자");
		}
		
		if(searchList != null) {
			model.addAttribute("noList", searchList);
			model.addAttribute("pi", pi);
			model.addAttribute("condition", condition);
			model.addAttribute("search", search);
			
			return "notice";
		}else {
			throw new BoardException("검색에 실패했습니다.");
		}
	}
	
	// 후기 게시판 검색어 리스트 조회
	@RequestMapping("searchReview.menu")
	public String searchReview(@RequestParam("condition") String condition,
							   @RequestParam("search") String search,
							   @RequestParam(value="page", defaultValue="1") Integer currentPage,
							   Model model) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("search", search);
		map.put("cateNo", 102);
		
		// 검색어 게시글 수 조회
		int listSubjectCount = bService.listSearchCount(map);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listSubjectCount, 10);	
		
		ArrayList<Board> searchList = bService.searchNoReBoard(map, pi);

		if(searchList != null) {
			model.addAttribute("reList", searchList);
			model.addAttribute("pi", pi);
			model.addAttribute("condition", condition);
			model.addAttribute("search", search);
			
			return "review";
		}else {
			throw new BoardException("검색에 실패했습니다.");
		}
	}
	
	// 예약 게시판 검색어 리스트 조회
	@RequestMapping("searchBook.menu")
	public String searchBook(@RequestParam("condition") String condition,
						     @RequestParam("search") String search,
						     @RequestParam(value="page", defaultValue="1") Integer currentPage,
						     Model model) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("search", search);
		map.put("cateNo", 103);
		

		// 검색어 게시글 수 조회 (예약/문의)
		int listSearchQuBoCount = bService.listSearchQuBoCount(map);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listSearchQuBoCount, 10);

		ArrayList<Board> searchList = bService.searchQuBoBoard(map, pi);
		
		if(searchList != null) {
			// 작성자 이름 * 처리
			for(Board b : searchList) {
				String writerName = b.getBoardWriterName();
				writerName = writerName.charAt(0) + "*" + writerName.charAt(writerName.length() - 1);
				b.setBoardWriterName(writerName);
			}
			
			model.addAttribute("bookList", searchList);
			model.addAttribute("pi", pi);
			model.addAttribute("condition", condition);
			model.addAttribute("search", search);
			
			return "book";
		}else {
			throw new BoardException("검색에 실패했습니다.");
		}
	}
	
	// 문의 게시판 검색어 리스트 조회
	@RequestMapping("searchQuestion.menu")
	public String searchQuestion(@RequestParam("condition") String condition,
						     @RequestParam("search") String search,
						     @RequestParam(value="page", defaultValue="1") Integer currentPage,
						     Model model) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("search", search);
		map.put("cateNo", 101);
		

		// 검색어 게시글 수 조회 (예약/문의)
		int listSearchQuBoCount = bService.listSearchQuBoCount(map);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listSearchQuBoCount, 10);

		ArrayList<Board> searchList = bService.searchQuBoBoard(map, pi);
		
		if(searchList != null) {
			// 작성자 이름 * 처리
			for(Board b : searchList) {
				String writerName = b.getBoardWriterName();
				writerName = writerName.charAt(0) + "*" + writerName.charAt(writerName.length() - 1);
				b.setBoardWriterName(writerName);
			}
			
			model.addAttribute("questionList", searchList);
			model.addAttribute("pi", pi);
			model.addAttribute("condition", condition);
			model.addAttribute("search", search);
			
			return "question";
		}else {
			throw new BoardException("검색에 실패했습니다.");
		}
	}
	
	// 마스코트 이동
	@RequestMapping("mascot.menu")
	public String mascotMove(Model model) {
	    List<Goods> goodsList = aService.getMascotGoodsWithImages();
	    model.addAttribute("goodsList", goodsList);
	    
	    // 마스코트 이미지와 상품 안내 이미지 가져오기
	    Image mascotImage = aService.getMascotImage();
	    Image goodsInfoImage = aService.getGoodsInfoImage();
	    model.addAttribute("mascotImage", mascotImage);
	    model.addAttribute("goodsInfoImage", goodsInfoImage);
	    
	    return "mascot";
	}
	
	// failmy 내용 띄우기 import시 오류 해결
	@GetMapping("family.menu")
	public String familyPage(Model model) {
	    List<Animal> mammals = aService.getAnimalsByClass("포유류");
	    List<Animal> birds = aService.getAnimalsByClass("조류");
	    List<Animal> reptiles = aService.getAnimalsByClass("파충류");
	    
	 // 디버깅 출력 -> 잘되는거 확인했음 혹시 안되면 켜볼것.
//			    for (Animal animal : mammals) {
//			        System.out.println("Mammal: " + animal.getAnimalName() + 
//			                           ", Image path: " + animal.getImagePath() + 
//			                           ", ANI_NO: " + animal.getAniNO());
//			    }
	    
	    model.addAttribute("mammals", mammals);
	    model.addAttribute("birds", birds);
	    model.addAttribute("reptiles", reptiles);

	    return "family";
	}
	
	// 운영시간 메뉴 이동
	@GetMapping("/operating.menu")
	public String operatingAdmin(Model model) {
	    Image operatingImage = bService.getOperatingImage();
	    Image chargeImage = bService.getChargeImage();
	    
	    model.addAttribute("operatingImage", operatingImage);
	    model.addAttribute("chargeImage", chargeImage);
	    
	    return "operating";
	}
	
	//인사말페이지 이동
	@RequestMapping("greeting.menu")
	public String moveToGreeting(Model model) {
		// service -> dao -> DB
		// 인삿말 *select* result set -> view
		//	greeting사진, 각 멤버에 대한 프로필 사진, 문구 가지고와
		Image result = mService.greeting();
		ArrayList<Image> list = mService.greetingStaff();
		ArrayList<String> staff = mService.greetingStaffWrite();
		//		Model, ModelAndView
		// 글 상세보기, 내 정보 보기
        model.addAttribute("image", result);
        model.addAttribute("list", list);
		model.addAttribute("staff", staff);
		
		
		
		return "greeting";
	}
	
	
	//오시는길 이동
	@RequestMapping("way.menu")
	public String moveToWay(Model model) {
		Image result = mService.way();
		Link mapInfo = mService.getMapInfo();
		
		model.addAttribute("image", result);
		model.addAttribute("mapInfo", mapInfo);
		
		return "way";
	}

	// 프로그램 목록 이동 menuController 0713
	@RequestMapping("programInfo.menu")
	public String showProgramInfo(Model model) {
		Link showLink = aService.getShowLink();
	    model.addAttribute("showLink", showLink);
	    
	    // 이미지 정보 가져오기
	    Image showImage = bService.getShowImageByRefType(showLink.getLinkRefType());
	    if (showImage != null) {
	        model.addAttribute("showImage", showImage);
	    }
	    
	    // 값 들어오는지 확인용 디버깅이라해야하나
	    //System.out.println("Controller - showLink: " + showLink);
	    //System.out.println("Controller - showImage: " + showImage);

	    // 프로그램 리스트 가져오기
	    ArrayList<Show> showList = bService.getAllShows();
	    
	    // 이미지 정보 가져오기
	    Map<Integer, Map<String, Image>> showImages = new HashMap<>();
	    for (Show show : showList) {
	        Map<String, Image> images = new HashMap<>();
	        images.put("mainImage", bService.getShowImage(show.getShowNo(), 1));
	        images.put("hoverImage", bService.getShowImage(show.getShowNo(), 2));
	        showImages.put(show.getShowNo(), images);
	    }
	    model.addAttribute("showList", showList);
	    model.addAttribute("showImages", showImages);
	    return "programInfo";
	}
	
	
	
	
	
}
