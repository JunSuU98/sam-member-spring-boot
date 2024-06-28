package su.boot.begin.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import su.boot.begin.entity.Member;

public interface MemberRepository extends JpaRepository<Member, Integer>{
	
	// 아이디 중복 체크
	boolean existsByMemberId(String member_id);
	
	// ======= 검색 ====== //
	// 회원 아이디 검색
	Page<Member> findByMemberIdContaining(String member_id, Pageable pageable);
	
	// 회원 이름 검색 
	Page<Member> findByMemberNameContaining(String member_id, Pageable pageable);
	
	// 회원 전화번호 검색 
	Page<Member> findByMemberPhoneContaining(String member_id, Pageable pageable);
	
	// 회원 이메일 검색 
	Page<Member> findByMemberEmailContaining(String member_id, Pageable pageable);
	
	// 회원 생일 검색
	Page<Member> findByMemberBirthContaining(String member_id, Pageable pageable);
	
	// 회원 상태 검색 
	Page<Member> findByMemberStatusContaining(String member_id, Pageable pageable);
	
	// 회원 평점 검색 
	Page<Member> findByMemberRateContaining(String member_id, Pageable pageable);
	
	
}
