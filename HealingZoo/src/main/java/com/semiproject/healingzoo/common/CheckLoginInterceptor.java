package com.semiproject.healingzoo.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import com.semiproject.healingzoo.member.model.vo.Member;

public class CheckLoginInterceptor implements HandlerInterceptor{

	// 로그인 후 이용해야 하는 페이지
	// 마이페이지, 관리자페이지, 공지사항 글쓰기, 후기 글쓰기
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		if(loginUser == null) {
			
			String msg = "로그인 세션이 만료되어 로그인 화면으로 넘어갑니다";

			session.setAttribute("msg", msg);
			response.sendRedirect("loginView.me");
			return false;
		}
		
		return HandlerInterceptor.super.preHandle(request, response, handler);
	}
	
	
}
