package org.kh.spring.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kh.spring.member.domain.Member;
import org.kh.spring.member.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MemberController {
	@Autowired
	private MemberService mService;
	
	// /member/list.do
	@RequestMapping(value="/member/list.do", method=RequestMethod.GET)
	public String printMembers(Model model) {
		try {
			List<Member> mList = mService.selectMembers();
			if(!mList.isEmpty()) {
				model.addAttribute("mList", mList);
				return "member/list";
			}else {
				model.addAttribute("msg", "데이터가 존재하지 않습니다.");
				return "common/error";
			}
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}
	
	// /member/detail.do
	@RequestMapping(value="/member/detail.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String selectOneById(HttpServletRequest request, Model model) {
			String memberId = request.getParameter("memberId");
			Member member = mService.selectOneById(memberId);
			if(member != null) {
				model.addAttribute("member", member);
				return "member/detail";
			}else {
				model.addAttribute("msg", "회원 조회 실패");
				return "common/error";
			}
	}

	// /member/login.do
	@RequestMapping(value="/member/login.do", method=RequestMethod.POST)
	public String memberLogin(HttpServletRequest request, Model model) {
		try {
			String memberId = request.getParameter("member-id");
			String memberPw = request.getParameter("member-pw");
			Member mParam = new Member(memberId, memberPw);
			Member member = mService.checkMemberLogin(mParam);
			if(member != null) {
				// 성공하면 세션에 정보 저장
				//request.setAttribute("msg", "성공!");
//			request.getRequestDispatcher("/WEB-INF/views/common/success.jsp");
				HttpSession session = request.getSession();
				session.setAttribute("loginUser", member);
				return "redirect:/home.do";
			}else {
				// 실패하면 에러페이지
				model.addAttribute("msg", "실패");
				return "common/error";
			}
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}
	
	@RequestMapping(value="/member/logout.do", method=RequestMethod.GET)
	public String memberLogout(HttpServletRequest request, HttpServletResponse response) {
		//response.sendRedirect("/index.jsp");
		HttpSession session = request.getSession();
		if(session != null) {
			session.invalidate();
		}
		return "redirect:/index.jsp";
	}
}






