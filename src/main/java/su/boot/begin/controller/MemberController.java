package su.boot.begin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.inject.Inject;
import lombok.RequiredArgsConstructor;
import su.boot.begin.entity.Member;
import su.boot.begin.service.MemberService;
import su.boot.begin.vo.MemberVO;

@Controller
@RequiredArgsConstructor
public class MemberController {
	
	@Inject
	private final MemberService memberService;
	
	// 회원 전체 조회
	@GetMapping("/MemberSelect")
	public String memberSelect(Model model) {
		
		model.addAttribute("arrayList", memberService.findAllMember());
		
		return "member/member_select_view";
	}
	
	// 회원 상세 조회
	@GetMapping("/MemberSelectDetail")
	public String memberSelectDetail(@RequestParam("member_number") Integer member_number, Model model) {
		
		model.addAttribute("member", memberService.findMemberById(member_number));
		
		return "member/member_select_detail_view";
	}
	
	
	// 회원 입력
	@GetMapping("/MemberInsert")
	public String memberInsert() {
		
		return "member/member_insert_view";
	}
	
	@PostMapping("/MemberInsert")
	public String memberInsert(MemberVO memberVO) {
		
		if("1".equals(memberVO.getId_check())) { // 자바스크립트 비활성화 하고 submit 할 경우를 방지한다
			Member member = new Member();

			member.setMemberCreate(memberVO.getMember_create());
			member.setMemberUpdate(memberVO.getMember_update());
			member.setMemberStatus(memberVO.getMember_status());
			member.setMemberId(memberVO.getMember_id());
			member.setMemberPassword(memberVO.getMember_password());
			member.setMemberName(memberVO.getMember_name());
			member.setMemberBirth(memberVO.getMember_birth());
			member.setMemberEmail(memberVO.getMember_email());
			member.setMemberPhone(memberVO.getMember_phone());
			member.setMemberRate(memberVO.getMember_rate());
			member.setMemberAddress(memberVO.getMember_address());
			
			memberService.saveMember(member);

		}
		
		return "member/member_insert";
	}
	
	// 회원 수정
	@GetMapping("/MemberUpdate")
	public String memberUpdate(@RequestParam("member_number") Integer member_number, Model model) {
		
		model.addAttribute("member", memberService.findMemberById(member_number));
		
		return "member/member_update_view";
	}
	
	@PostMapping("/MemberUpdate")
	public String memberUpdate(MemberVO memberVO) {
		
		if("1".equals(memberVO.getId_check())) { // 자바스크립트 비활성화하고 submit 할 경우를 방지한다 

			Member exsistingMember = memberService.findMemberById(memberVO.getMember_number());
		
			if(exsistingMember != null) {
				exsistingMember.setMemberUpdate(memberVO.getMember_update());
				exsistingMember.setMemberId(memberVO.getMember_id());
				exsistingMember.setMemberPassword(memberVO.getMember_password());
				exsistingMember.setMemberName(memberVO.getMember_name());
				exsistingMember.setMemberBirth(memberVO.getMember_birth());
				exsistingMember.setMemberEmail(memberVO.getMember_email());
				exsistingMember.setMemberPhone(memberVO.getMember_phone());
				exsistingMember.setMemberAddress(memberVO.getMember_address());
						
				memberService.saveMember(exsistingMember);
			}
		}
		
		return "member/member_update";
	}
	
	// 회원 삭제
	@GetMapping("/MemberDelete")
	public String memberDelete() {
		
		return "member/member_delete_view";
	}
	
	@PostMapping("/MemberDelete")
	public String memberDelete(@RequestParam("member_number") Integer member_number) {
		
		memberService.deleteMember(member_number);
		
		return "/index";
	}

	// 아이디 중복 확인 
	@GetMapping("/IdCheck")
	@ResponseBody
	public String idCheck(@RequestParam("member_id") String member_id) {
		
		memberService.idCheck(member_id);
		
		int result = 0;
		
		if(memberService.idCheck(member_id) || member_id.isBlank()) { // 존재하는 아이디를 입력하거나, 빈 문자열을 입력했을 때
			result = 1;
		}

		return ""+result;
	}
}
