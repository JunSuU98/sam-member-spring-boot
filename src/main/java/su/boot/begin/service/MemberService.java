package su.boot.begin.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fasterxml.classmate.MemberResolver;

import jakarta.inject.Inject;
import su.boot.begin.entity.Member;
import su.boot.begin.repository.MemberRepository;


@Service
public class MemberService{
	
	@Inject
	MemberRepository memberRepository;
	
	// 전체 조회
	@Transactional(readOnly = true)
	public List<Member> findAllMember(){
		return memberRepository.findAll();
	}
	
	// 상세 조회
	@Transactional(readOnly = true)
	public Member findMemberById(Integer member_number) {
		return memberRepository.findById(member_number).orElse(null);
	}
	
	// 회원 입력, 수정
	@Transactional
	public Member saveMember(Member member) {
		return memberRepository.save(member);
	}
	
	// 회원 삭제 
	@Transactional
	public void deleteMember(Integer member_number) {
		memberRepository.deleteById(member_number);
	}

	
	// 아이디 체크
	@Transactional(readOnly = true)
	public boolean idCheck(String member_id) {
		
		return memberRepository.existsByMemberId(member_id);
	}
}
