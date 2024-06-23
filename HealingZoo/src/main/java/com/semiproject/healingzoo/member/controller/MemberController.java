package com.semiproject.healingzoo.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

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
	
	
	//회원가입 화면 이동
	@RequestMapping("signUpView.me")
	public String signUPView() {
		return "signUp";
	}
	
	//로그인 화면 이동
	@RequestMapping("loginView.me")
	public String loginView() {
		System.out.println(bcrypt.encode("1111"));
		System.out.println(bcrypt.encode("2222"));
		System.out.println(bcrypt.encode("3333"));
		System.out.println(bcrypt.encode("4444"));
		System.out.println(bcrypt.encode("5555"));
		return "login";
	}
	
	//로그인
	@RequestMapping("login.me")
	public ModelAndView login(Member m, ModelAndView mv) {
		Member loginUser = mService.login(m);
		
		if(loginUser != null) {
			if(bcrypt.matches(m.getMemPwd(), loginUser.getMemPwd())) {
				mv.addObject("loginUser", loginUser);
				if(loginUser.getMemGrade().equals("CONSUMER")) {
					mv.setViewName("redirect:/");
				}else {
					mv.setViewName("redirect:/notice.admin");
				}
			}else {
				throw new MemberException("아이디 또는 비밀번호가 존재하지않습니다 :(");
			}
			return mv;
		}else {
			throw new MemberException("아이디 또는 비밀번호가 존재하지않습니다 :(");
		}
	}
	
	// 로그아웃
	@RequestMapping("logout.me")
	public String logout(SessionStatus status) {
		status.setComplete();
		return "redirect:/";
	}
	
	//회원가입
	@RequestMapping("signUp.me")
	public String signUp(Member m, @RequestParam("memEmailId") String emailId, @RequestParam("emailDomain") String emailDomain) {
		String memEmail = emailId + "@" + emailDomain;
		m.setMemEmail(memEmail);
		m.setMemPwd(bcrypt.encode(m.getMemPwd()));
		
		int result = mService.signUp(m);
		if(result>0) {
			return "redirect:/";
		}else {
			throw new MemberException("회원가입에 실패했습니다");
		}
	}
	
	//아이디 중복 체크
	@RequestMapping("checkId.me")
	public @ResponseBody int checkId(@RequestParam("id") String id) {
		int result = mService.checkId(id);
		return result;
	}
	 // @ReponseBody
	 // 클라이언트에서 서버로 필요한 데이터를 전송하기 위해서 JSON이라는 데이터를 요청 본문에 담아서 서버로 보내면, 
	 // 서버에서는 @RequestBody 어노테이션을 사용하여 HTTP 요청 본문에 담긴 값들을 자바 객체로 변환 시켜, 객체에 저장시킵니다.
	 // 서버에서 클라이언트로 응답 데이터를 전송하기 위해서 @ResponseBody 를 사용하여 
	 // 자바 객체를 HTTP 응답 본문의 객체로 변환하여 클라이언트로 전송시키는 역할을 합니다.
	
	@RequestMapping("myPage.me")
	public String myInfo() {
		return "myinfo";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
