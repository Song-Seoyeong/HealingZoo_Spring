package com.semiproject.healingzoo.member.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.semiproject.healingzoo.board.model.vo.Board;
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
		System.out.println(bcrypt.encode("1111"));
		System.out.println(bcrypt.encode("2222"));
		System.out.println(bcrypt.encode("3333"));
		System.out.println(bcrypt.encode("4444"));
		System.out.println(bcrypt.encode("5555"));
		return "login";
	}

	// 로그인
	@RequestMapping("login.me")
	public ModelAndView login(Member m, ModelAndView mv) {
		Member loginUser = mService.login(m);

		if (loginUser != null) {
			if (bcrypt.matches(m.getMemPwd(), loginUser.getMemPwd())) {
				mv.addObject("loginUser", loginUser);
				if (loginUser.getMemGrade().equals("CONSUMER")) {
					mv.setViewName("redirect:/");
				} else {
					mv.setViewName("redirect:/notice.admin");
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

	@RequestMapping("myInfo.me")
	public String myInfoLogined() {
		return "myinfo";
	}

	// 마이페이지> 비밀번호 입력시 마이페이지이동
	@RequestMapping("myPageLogin.me")
	public String myPageLogin(HttpSession session, @RequestParam("mpPwd") String mpPwd, Model model) {
		String memPwd = ((Member) session.getAttribute("loginUser")).getMemPwd();
		String grade = ((Member) session.getAttribute("loginUser")).getMemGrade();

		if (bcrypt.matches(mpPwd, memPwd)) {
			model.addAttribute("grade", grade);
			model.addAttribute("currentPwd", memPwd);
			return "myinfo";
		} else {
			throw new MemberException("비밀번호를 확인해주세요");
		}
	}

	// 마이페이지>비밀번호 수정
	@RequestMapping("updateMember.me")
	public String updateMember(@RequestParam("newPwd") String newPwd, Model model, SessionStatus status) {
		Member m = (Member)model.getAttribute("loginUser");

		m.setMemId(m.getMemId());
		m.setMemPwd(bcrypt.encode(newPwd));

		int result = mService.updatePassword(m);
		
		if (result < 0) {
			throw new MemberException("정보수정에 실패하셨습니다.");
		} else {
			status.setComplete();
			return "redirect:/";
		}

	}

	// 마이페이지> 내 게시글 이동
	@RequestMapping("myBoard.me")
	public String myBoardList(@RequestParam(value = "page", defaultValue = "1") Integer currentPage,
			HttpSession session, Model model) {
		int memNo = ((Member) session.getAttribute("loginUser")).getMemNo();
		int listCount = mService.getListCount(memNo);
		// 회원번호로 쓴 글 봅기
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5);
		ArrayList<Board> list = mService.selectMyBoardList(pi, memNo);
		if (list != null) {
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
			return "myBoardList";
		} else {
			throw new MemberException("게시글조회를 실패하셨습니다");
		}

	}

	// 마이페이지> 내 답글 이동
	@RequestMapping("myComment.me")
	public String myComment(@RequestParam(value = "page", defaultValue = "1") Integer currentPage, HttpSession session,
			Model model) {
		int memNo = ((Member) session.getAttribute("loginUser")).getMemNo();
		int listCount = mService.getListCommentCount(memNo);

		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5);
		ArrayList<Reply> list = mService.selectMyComment(pi, memNo);// reply 생성자 생성해야되나?
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
