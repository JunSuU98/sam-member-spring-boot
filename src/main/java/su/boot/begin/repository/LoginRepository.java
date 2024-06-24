package su.boot.begin.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import su.boot.begin.entity.Member;

public interface LoginRepository extends JpaRepository<Member, Integer>{
	
	// 로그인 
	Member findByMemberIdAndMemberPassword(String member_id, String member_password);
	
	// 아이디 찾기
	Member findByMemberNameAndMemberBirthAndMemberPhone(String member_name, String member_birth, String member_phone);
	
	// 비밀번호 찾기
	Member findByMemberIdAndMemberNameAndMemberBirthAndMemberPhone(String member_id, String member_name, String member_birth, String member_phone);


}
