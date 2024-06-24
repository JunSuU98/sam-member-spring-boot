<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link rel="stylesheet" type="text/css" href="./css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="./css/global.css">
<script src="./js/jquery-3.5.1.min.js" type="text/javascript"></script>
<script src="./js/bootstrap.min.js" type="text/javascript"></script>
</head>
<body>

	<header>
		<h2>비밀번호 찾기</h2>
	</header>
	
	<main>
	
		<form action="./PasswordSearch" method="post">

		  <div class="form-group">
			<label for="member_id">아이디</label>
			<input type="text" class="form-control" id="member_id" name="member_id">
		  </div>	
		  
		  <div class="form-group">
			<label for="member_name">이름</label>
			<input type="text" class="form-control" id="member_name" name="member_name">
		  </div>
		  
		  <div class="form-group">
			<label for="member_birth">생년월일</label>
			<input type="date" class="form-control" id="member_birth" name="member_birth">
		  </div>
		  
		  <div class="form-group">
			<label for="member_phone">핸드폰</label>
			<input type="text" class="form-control" id="member_phone" name="member_phone">
		  </div>
		  
		  <button type="submit" class="btn btn-primary">확인</button>
		  <button type="reset" class="btn btn-danger" onclick="window.history.back()">취소</button>


		</form>
	
	</main>

</body>
</html>