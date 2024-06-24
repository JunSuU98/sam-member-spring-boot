package su.boot.begin.entity;


import org.hibernate.annotations.DynamicUpdate;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.SequenceGenerator;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

//@DynamicUpdate
@NoArgsConstructor
@Entity
@Getter
@Setter
public class Member {
	@Id
	@SequenceGenerator(name = "number_gen", sequenceName = "number_seq", allocationSize = 1)
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "number_gen")
	@Column(name = "member_number")
	private Integer memberNumber;

	@Column(name = "member_create")
	private String memberCreate;
	
	@Column(name = "member_update")
	private String memberUpdate;
	
	@Column(name = "member_status")
	private String memberStatus;
	
	@Column(name = "member_id")
	private String memberId;
	
	@Column(name = "member_password")
	private String memberPassword;
	
	@Column(name = "member_name")
	private String memberName;
	
	@Column(name = "member_birth")
	private String memberBirth;
	
	@Column(name = "member_email")
	private String memberEmail;
	
	@Column(name = "member_phone")
	private String memberPhone;
	
	@Column(name = "member_rate")
	private Integer memberRate;
	
	@Column(name = "member_address")
	private String memberAddress;
}
