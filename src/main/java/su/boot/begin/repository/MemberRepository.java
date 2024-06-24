package su.boot.begin.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import su.boot.begin.entity.Member;

public interface MemberRepository extends JpaRepository<Member, Integer>{
	
	// 아이디 중복 체크
	boolean existsByMemberId(String member_id);
	
	
}
