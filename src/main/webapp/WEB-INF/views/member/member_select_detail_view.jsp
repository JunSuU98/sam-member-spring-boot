<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 상세 정보 페이지</title>
<link rel="stylesheet" type="text/css" href="./css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="./css/global.css">
<script src="./js/jquery-3.5.1.min.js" type="text/javascript"></script>
<script src="./js/bootstrap.min.js" type="text/javascript"></script>
</head>
<body>

	<header>
		<h1>회원 상세 정보</h1>
	</header>
	
	<main>

		<div>
			<h1>내 정보</h1>
			<ul class="list-group">
			  <li class="list-group-item">회원 이름: ${member.memberName}</li>
			  <li class="list-group-item">상태: ${member.memberStatus}</li>
			  <li class="list-group-item">아이디: ${member.memberId}</li>
			  <li class="list-group-item">이메일: ${member.memberEmail}</li>
			  <li class="list-group-item">핸드폰: ${member.memberPhone}</li>
			  <li class="list-group-item">생년월일: ${member.memberBirth}</li>
			  <li class="list-group-item">주소: ${member.memberAddress}</li>
			  <li class="list-group-item">매너온도: ${member.memberRate}</li>
			  <li class="list-group-item">가입일자: ${member.memberCreate.substring(0,10)}</li>
			</ul>
		</div>

		<div class="btn-group" role="group" aria-label="Basic example">
		  <button type="button" class="btn btn-secondary" onclick="location.href='./MemberSelect'">
			메인화면
		  </button>
		  <button type="button" class="btn btn-secondary" onclick="location.href='./MemberUpdate?member_number=${member.memberNumber}'">
		  	내 정보 수정
		  </button>
		  <button type="button" class="btn btn-secondary" onclick="location.href='./MemberDelete?member_number=${member.memberNumber}'">
		  	회원 탈퇴
		  </button>
		</div>	

	</main>

</body>
</html>