<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" type="text/css" href="./css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="./css/global.css">
<script src="./js/jquery-3.5.1.min.js" type="text/javascript"></script>
<script src="./js/bootstrap.min.js" type="text/javascript"></script>
</head>
<body>

	<header>
		<h2>로그인</h2>
	</header>
	
	<main>
	
		<form action="./Login" method="post">

			<label for="member_id" class="form-label">아이디</label>
			<input type="text" id="member_id" name="member_id" class="form-control">
				
			<label for="member_password" class="form-label">Password</label>
			<input type="password" id="member_password" name="member_password" class="form-control">
				
			<button type="submit" class="btn btn-primary">로그인</button>
			<button type="reset" class="btn btn-danger" onclick="window.history.back()">취소</button>
			
		</form>
	
	
		<div class="btn-group" role="group" aria-label="Basic example">
		  <button type="button" class="btn btn-secondary" onclick="location.href='./MemberInsert'">
			회원가입
		  </button>
		  <button type="button" class="btn btn-secondary" onclick="location.href='./IdSearch'">
			아이디 찾기
		  </button>
		  <button type="button" class="btn btn-secondary" onclick="location.href='./PasswordSearch'">
			비밀번호 찾기		  
		  </button>
		</div>
	
	</main>

</body>
</html>