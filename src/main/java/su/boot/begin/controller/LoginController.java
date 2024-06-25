package su.boot.begin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import jakarta.inject.Inject;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import su.boot.begin.entity.Member;
import su.boot.begin.service.LoginService;
import su.boot.begin.vo.MemberVO;

@Controller
@RequiredArgsConstructor
public class LoginController {
	
	@Inject
	private final LoginService loginService;
	
	// 로그인 
	@GetMapping("/Login")
	public String login() {

		return "login/login_view";
	}
	
	@PostMapping("/Login")
	public String login(MemberVO memberVO, HttpSession httpSession, Model model) {
		
		Member member = loginService.login(memberVO.getMember_id(), memberVO.getMember_password());
		
		if (member != null) {
			httpSession.setAttribute("member_number", member.getMemberNumber());
			httpSession.setAttribute("member_id", member.getMemberId());
			httpSession.setAttribute("member_name", member.getMemberName());
			httpSession.setAttribute("login_status", "success");
			
		} else { // 로그인 실패
			httpSession.setAttribute("login_status", "fail");
		}
		
		
		return "login/login_check";
	}
	
	// 로그아웃
	@GetMapping("/Logout")
	public String logout(HttpSession httpSession) {
		
		httpSession.invalidate();
		
		return "login/logout";
	}
	
	// 아이디 찾기
	@GetMapping("/IdSearch")
	public String idSearch() {

		return "login/id_search_view";
	}
	
	@PostMapping("/IdSearch")
	public String idSearch(MemberVO memberVO, Model model) {
		
		Member member = loginService.searchId(memberVO.getMember_name(), memberVO.getMember_birth(), memberVO.getMember_phone());
		
		model.addAttribute("member", member);

		return "login/id_search";
	}
	
	// 비밀번호 찾기
	@GetMapping("/PasswordSearch")
	public String passwordSearch() {
		return "login/password_search_view";
	}
	
	@PostMapping("/PasswordSearch")
	public String passwordSearch(MemberVO memberVO, Model model) {
		
		Member member = loginService.searchPassword(memberVO.getMember_id(), memberVO.getMember_name(), memberVO.getMember_birth(), memberVO.getMember_phone());
		
		model.addAttribute("member", member);
		
		return "login/password_search";
	}
}
