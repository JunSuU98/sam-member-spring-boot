package su.boot.begin.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import jakarta.inject.Inject;
import lombok.RequiredArgsConstructor;
import su.boot.begin.entity.Member;
import su.boot.begin.repository.LoginRepository;
import su.boot.begin.repository.MemberRepository;

@Service
@RequiredArgsConstructor
public class LoginService {
	
	@Inject
	private final LoginRepository loginRepository;
	
	
	// 로그인 
	@Transactional(readOnly = true)
	public Member login(String member_id, String member_password) {
		return loginRepository.findByMemberIdAndMemberPassword(member_id, member_password);
	}
	
	
	// 아이디 찾기 (이름, 생년월일, 핸드폰 일치)
	@Transactional(readOnly = true)
	public Member searchId(String member_name, String member_birth, String member_phone) {
		
		return loginRepository.findByMemberNameAndMemberBirthAndMemberPhone(member_name, member_birth, member_phone);
	}
	
	
	// 비밀번호 찾기 (아이디, 이름, 생년월일, 핸드폰 일치)
	@Transactional(readOnly = true)
	public Member searchPassword(String member_id, String member_name, String member_birth, String member_phone) {
		return loginRepository.findByMemberIdAndMemberNameAndMemberBirthAndMemberPhone(member_id, member_name, member_birth, member_phone);
	}
	
}
