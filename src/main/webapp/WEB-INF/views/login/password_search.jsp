<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

	<main>

	<c:choose>
		<c:when test="${not empty member.memberId}">
		
			<div>
				<h2>${member.memberId} 님의 비밀번호입니다.</h2>
			</div>
			
			<div>
				<h2>${member.memberPassword}</h2>
			</div>

			<button type="button" class="btn btn-primary" onclick="location.href='./'">메인화면으로 돌아가기</button>
			<button type="button" class="btn btn-primary" onclick="location.href='./Login'">로그인하러 가기</button>

		</c:when>
	
		<c:otherwise>
			<h2>입력하신 정보와 일치하는 비밀번호를 찾지 못했습니다.</h2>	
			
			<button type="button" class="btn btn-primary" onclick="location.href='./'">메인화면으로 돌아가기</button>
		
		</c:otherwise>
	
	</c:choose>

	</main>

</body>
</html>