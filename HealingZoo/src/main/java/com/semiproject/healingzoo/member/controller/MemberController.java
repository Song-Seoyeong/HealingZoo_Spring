package com.semiproject.healingzoo.member.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.semiproject.healingzoo.board.model.vo.Board;
import com.semiproject.healingzoo.board.model.vo.Image;
import com.semiproject.healingzoo.board.model.vo.PageInfo;
import com.semiproject.healingzoo.board.model.vo.Reply;
import com.semiproject.healingzoo.common.Pagination;
import com.semiproject.healingzoo.member.model.exception.MemberException;
import com.semiproject.healingzoo.member.model.service.MemberService;
import com.semiproject.healingzoo.member.model.vo.Member;

@Controller
@SessionAttributes("loginUser")
public class MemberController {

	@Autowired
	private MemberService mService;

	@Autowired
	private BCryptPasswordEncoder bcrypt;

	// 회원가입 화면 이동
	@RequestMapping("signUpView.me")
	public String signUPView() {
		return "signUp";
	}

	// 로그인 화면 이동
	@RequestMapping("loginView.me")
	public String loginView() {
		return "login";
	}

	// 로그인
	@RequestMapping("login.me")
	public ModelAndView login(Member m,
							  @RequestParam("beforeURL") String beforeURL,
							  ModelAndView mv) {
		Member loginUser = mService.login(m);

		if (loginUser != null) {
			if (bcrypt.matches(m.getMemPwd(), loginUser.getMemPwd())) {
				mv.addObject("loginUser", loginUser);
				
				if(beforeURL.equals("")) {
					if (loginUser.getMemGrade().equals("CONSUMER")) {
						mv.setViewName("redirect:/");
					} else {
						mv.setViewName("redirect:/notice.admin");
					}
				}else{
					mv.setViewName("redirect:" + beforeURL);
				}
			} else {
				throw new MemberException("아이디 또는 비밀번호가 존재하지않습니다 :(");
			}
			return mv;
		} else {
			throw new MemberException("아이디 또는 비밀번호가 존재하지않습니다 :(");
		}
	}

	// 로그아웃
	@RequestMapping("logout.me")
	public String logout(SessionStatus status) {
		status.setComplete();
		return "redirect:/";
	}

	// 회원가입
	@RequestMapping("signUp.me")
	public String signUp(Member m, @RequestParam("memEmailId") String emailId,
			@RequestParam("emailDomain") String emailDomain) {
		String memEmail = emailId + "@" + emailDomain;
		m.setMemEmail(memEmail);
		m.setMemPwd(bcrypt.encode(m.getMemPwd()));

		int result = mService.signUp(m);
		if (result > 0) {
			return "redirect:/";
		} else {
			throw new MemberException("회원가입에 실패했습니다");
		}
	}

	// 아이디 중복 체크
	@RequestMapping("checkId.me")
	@ResponseBody
	public void checkId(@RequestParam("id") String id, HttpServletResponse resp) {
		int result = mService.checkId(id);
		try {
			resp.getWriter().print(result);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	// @ReponseBody
	// 클라이언트에서 서버로 필요한 데이터를 전송하기 위해서 JSON이라는 데이터를 요청 본문에 담아서 서버로 보내면,
	// 서버에서는 @RequestBody 어노테이션을 사용하여 HTTP 요청 본문에 담긴 값들을 자바 객체로 변환 시켜, 객체에 저장시킵니다.
	// 서버에서 클라이언트로 응답 데이터를 전송하기 위해서 @ResponseBody 를 사용하여
	// 자바 객체를 HTTP 응답 본문의 객체로 변환하여 클라이언트로 전송시키는 역할을 합니다.

	// 마이페이지>마이페이지로그인 창 이동
			@RequestMapping("myPage.me")
			public String myInfo() {
				return "mpLogin";
			}
			
	//마이페이지> 비밀번호 입력시 마이페이지이동
	@RequestMapping("myPageLogin.me")
	public String myPageLogin(HttpSession session, @RequestParam("mpPwd") String mpPwd, Model model) {
		String memPwd = ((Member)session.getAttribute("loginUser")).getMemPwd();
		String memGrade = ((Member)session.getAttribute("loginUser")).getMemGrade();
		String memActive = ((Member)session.getAttribute("loginUser")).getMemActive();
		if(bcrypt.matches(mpPwd, memPwd)) {
			model.addAttribute("memPwd", memPwd);
			model.addAttribute("memGrade", memGrade);
			model.addAttribute("memActive", memActive);
			return "myinfo";
		}else {
			throw new MemberException("비밀번호를 확인해주세요");
		}
	}

	// 마이페이지>내정보수정
	@RequestMapping("updateMember.me")
	public String updateMember(@RequestParam("newPwd") String newPwd, @RequestParam("phoneNo") String phoneNo ,Model model, SessionStatus status,
			                   @RequestParam("greetingStaff") MultipartFile upload,HttpServletRequest request,
			                   @RequestParam(value="greetingWrite", defaultValue="") String greetingWrite) {
		Member m = (Member)model.getAttribute("loginUser");
		int memNo = m.getMemNo();
		
		//비밀번호 수정
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", m.getMemId());
		map.put("newPwd", bcrypt.encode(newPwd));
		map.put("memPhone", phoneNo);
		int result = mService.updatePassword(map);
		
		//관리자 로그인 시 프로필 수정
		int resultU = 0;
		Image i = new Image();
		if(upload != null && !upload.isEmpty()) {
			String[] returnArr = saveFile(upload, request);
			i.setImgRename(returnArr[1]);
			i.setImgName(upload.getOriginalFilename());
			i.setImgPath(returnArr[0]);
			i.setImgRefNum(memNo);
			i.setImgRefType("STAFF");
			i.setImgRename(returnArr[1]);

			Image img = mService.selectStaff(memNo);
			
			if(img != null) {
				HashMap<String, Object> mapNo = new HashMap<String, Object>();
				mapNo.put("ImgNo", img.getImgNo());
				mapNo.put("memNo", memNo);
				mService.deleteStaff(mapNo);
				resultU = mService.updateStaff(i);
				if(resultU > 0 ) {
					deleteFile(img.getImgRename(), request);
				}else{
					throw new MemberException("정보수정에 실패하셨습니다");
				}
			}else {
				mService.updateStaff(i);
			}
		}
		
		
		//관리자 로그인 시 소개글 수정
		int resultI = 0;
		if(greetingWrite != "") {
			HashMap<String, Object> mapI = new HashMap<String, Object>();
			mapI.put("greetingWrite", greetingWrite);
			mapI.put("memNo", memNo);
			resultI = mService.updateGreetingWrite(mapI);
		}
		
		if( result < 0 || resultU < 0 || resultI < 0) {
		  throw new MemberException("정보수정에 실패하셨습니다");	
		}else {
			status.setComplete();
			return "redirect:/";
			
		}
	}
	
	//저장위치가 없을시 저장경로 생성
	public String[] saveFile(MultipartFile upload, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources")+"/uploadImg";
		
		File folder = new File(root);
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		int ranNum = (int)(Math.random()*100000);
		String originFileName = upload.getOriginalFilename();
		String renameFileName = sdf.format(new Date()) + ranNum + originFileName.substring(originFileName.lastIndexOf("."));	
		
		String renamePath = folder + "/" + renameFileName;
		try {
			upload.transferTo(new File(renamePath));
		}  catch (Exception e) {
			System.out.println("파일 전송 에러 : " + e.getMessage());
		}
		
		String[] returnArr = new String[2];
		returnArr[0] = root; //이미지 저장 하는 루트
		returnArr[1] = renameFileName; // 복사한 이미지
		
		return returnArr;
	}
	
	//사진 데이터가 새로 들어오면 사진 삭제
	public void deleteFile(String fileName, HttpServletRequest request) {
		String savePath = request.getSession().getServletContext().getRealPath("resources") + "/uploadImg";
		File f = new File(savePath + "/" + fileName);
		if(f.exists()) {
			f.delete();
		}
	}
			
	// 마이페이지 > 회원탈퇴
	@RequestMapping("deleteMember.me")
	public String deleteMember(Model model, SessionStatus status) {
		int memNo = ((Member)model.getAttribute("loginUser")).getMemNo();
		int result = mService.delMem(memNo);
		if(result > 0) {
			status.setComplete();
			return "endPage";	
		}else {
			throw new MemberException("회원탈퇴에 실패하였습니다.");
		}
		
	}

	// 마이페이지> 내 게시글 이동
	@RequestMapping("myBoard.me")
	public String myBoardList(@RequestParam(value = "page", defaultValue = "1") Integer currentPage,
			HttpSession session, Model model) {
		int memNo = ((Member) session.getAttribute("loginUser")).getMemNo();
		int listCount = mService.getListCount(memNo);
		// 회원번호로 쓴 글 봅기
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10);
		ArrayList<Board> list = mService.selectMyBoardList(pi, memNo);
		if (list != null) {
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
			return "myBoardList";
		} else {
			throw new MemberException("게시글조회를 실패하셨습니다");
		}

	}
	
	// 마이페이지> 내 게시글> 검색
			@RequestMapping("search.me")
			public String searchMyList(@RequestParam(value="page", defaultValue="1")Integer currentPage, HttpServletRequest request, HttpSession session, Model model) {
				String value = request.getParameter("value");
				//String valVal = value.substring(0 ,value.indexOf("$"));
				int memNo = ((Member)session.getAttribute("loginUser")).getMemNo();
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("value", value);
				map.put("memNo", memNo);
				
				int listSearchCount = mService.getListSerachCount(map);
				PageInfo pi = Pagination.getPageInfo(currentPage, listSearchCount, 10);
				
				ArrayList<Board> list = mService.selectSearchList(map, pi);
				if(list != null) {
					model.addAttribute("value", value);
					model.addAttribute("list", list);
					model.addAttribute("pi", pi);
					return "myBoardList";
				}else {
					throw new MemberException("게시글 불러오기에 실패하였습니다");
				}
				
			}

	// 마이페이지> 내 답글 이동
	@RequestMapping("myComment.me")
	public String myComment(@RequestParam(value = "page", defaultValue = "1") Integer currentPage, HttpSession session,
			Model model) {
		int memNo = ((Member) session.getAttribute("loginUser")).getMemNo();
		int listCount = mService.getListCommentCount(memNo);

		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10);
		ArrayList<Reply> list = mService.selectMyComment(pi, memNo);
		if (list != null) {
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
			return "myCommentList";
		} else {
			throw new MemberException("댓글 불러오기에 실패하였습니다");
		}
	}

	// 아이디 찾기 페이지 이동
	@RequestMapping("searchIdView.me")
	public String searchIdView() {
		return "searchId";
	}
	
	// 비번 찾기 페이지 이동
	@RequestMapping("searchPwdView.me")
	public String searchPwdView() {
		return "searchPwd";
	}
	
	// 아이디 찾기
	@RequestMapping("searchId.me")
	public String searchId(@ModelAttribute Member m,
							Model model) {
		String searchId = mService.searchId(m);
		
		if(searchId != null) {
			String[] idArr = searchId.split("");
			String id = "";
			for(int i = 0; i < idArr.length; i++) {
				if(i >= 3) {
					idArr[i] = "*";
				}
				id += idArr[i];
			}
			
			model.addAttribute("id", id);
			model.addAttribute("memName", m.getMemName());

			return "searchResult";
		}else {
			throw new MemberException("아이디 찾기에 실패했습니다.");
		}
	}
	
	// 비밀번호 찾기 > 새 비밀번호 등록으로 이동
	@RequestMapping("searchPwd.me")
	public String searchPwd(@ModelAttribute Member m,
							Model model) {
		
		int result = mService.searchPwd(m);
		
		if(result > 0) {
			model.addAttribute("m", m);
			
			return "searchPwdResult";
		}else {
			throw new MemberException("비밀번호 찾기에 실패했습니다.");
		}
	}
	
	// 비밀번호 찾기 > 새 비밀번호 수정
	@RequestMapping("newPwd.me")
	public String newPwdUpdate(@ModelAttribute Member m,
								Model model) {
		
		m.setMemPwd(bcrypt.encode(m.getMemPwd()));
		
		int result = mService.updatePassword(m);
		
		if(result > 0) {
			model.addAttribute("m", m);
			
			return "searchResult";
		}else {
			throw new MemberException("정보 수정에 실패했습니다");
		}
	}
	
	// 마이페이지> 선택된 내 게시글 삭제
	@RequestMapping("selDelBoard.me")
	public String deleteBoard(@RequestParam("boNoList") ArrayList<String> boNoList) {
		int result = 0;
		for(int i = 0; i < boNoList.size(); i++ ) {
			String boNo =boNoList.get(i);
			result = mService.selDelBoard(boNo);
			}
		if(result > 0) {
			return "redirect:myBoard.me";
		}else {
			throw new MemberException("삭제에 실패하였습니다");
		}
		
	}

	// 마이페이지> 말머리 필터 검색
	@RequestMapping("searchFilter.me")
	public String searchFilter(@RequestParam("noSubject") String noSubject, @RequestParam(value="page", defaultValue="1") Integer currentPage, HttpServletRequest request, HttpSession session, Model model) {
		int memNo = ((Member)session.getAttribute("loginUser")).getMemNo();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memNo", memNo);
		map.put("noSubject", noSubject);
		int listCount = mService.listSubjectCount(map);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10);
		ArrayList<Board> list = mService.listSubject(pi, map);
		if (list != null) {
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
			return "myBoardList";
		} else {
			throw new MemberException("게시글조회를 실패하셨습니다");
		}
		
	}
	//마이페이지 > 선택된 리스트 상세보기 페이지로 이동
	@RequestMapping("boardView.me")
	public String pwdConfirmMyBo(HttpSession session, @RequestParam("bId") int bId, @RequestParam("cateNo") int cateNo, @RequestParam("page") int page, Model model) {
			Member loginUser = (Member)session.getAttribute("loginUser");
			
			Integer memNo = (Integer)loginUser.getMemNo();
			
			Board b = null;
			if(cateNo == 101) {
				b = mService.selectedBoard(bId);
			}else if(cateNo == 100){
				b = mService.selectedBoard(bId);
			}else if(cateNo == 102) {
				b = mService.selectedBoard(bId);
			}else {
				b = mService.selectedBoard(bId);
			}
			
			if(b != null) {
				model.addAttribute("b", b);
				model.addAttribute("page", page);
				model.addAttribute("memNo", memNo);
				
			}else {
				throw new MemberException("불러오는데 실패하였습니다");
			}
			
		return "memBoardDetail";
	}
	//마이페이지 > 선택한 댓글 삭제
	@RequestMapping("selDelComment.me")
	public String delComment(@RequestParam("boNoList") ArrayList<String> boNoList) {
		int result = 0;
		for(int i =0; i < boNoList.size(); i++) {
			String boNo =boNoList.get(i);
			result = mService.selDelComment(boNo);
		}
		return "redirect:myComment.me";
	}

	//마이페이지 > 상세게시글 수정 폼 이동
	@RequestMapping("updateView.me")
	public String updateBoard(@ModelAttribute Board b,
							  @RequestParam("category") int cateNo,	
							  @RequestParam("boardNo") int boNo, 
							  Model model) {
		b = mService.getBoard(boNo);
		model.addAttribute("b",b);
		model.addAttribute("cateNo", cateNo);
		model.addAttribute(boNo);
		return "memBoardUpdate";
	}
	
	//마이페이지 > 게시글 수정
	@RequestMapping("updateBoard.me")
	public String updateBoard(HttpServletRequest request, Model model) {
		String boardTitle = request.getParameter("boardTitle");
		String boPwd = request.getParameter("boPwd");
		String boardContent = request.getParameter("boardContent");
		String boardNo = request.getParameter("boardNo");
		String writerPhone = request.getParameter("writerPhone");
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("title", boardTitle);
		map.put("content", boardContent);
		map.put("boardNo", boardNo);
		
		HashMap<String, String> map1 = new HashMap<String, String>();
		map1.put("boPwd", boPwd);
		map1.put("writerPhone", writerPhone);
		map1.put("boardNo", boardNo);
		
		int result = mService.updateBoard(map);
		int resultInBo = mService.updateInBo(map1);
		
		if( result > 0 && resultInBo > 0) {
			return null;
		}
		throw new MemberException("수정에 실패하셨습니다");
	}
	
	
	
	
	
	
	
	
	
	
}
