<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 체크</title>
<c:choose>
	<c:when test="${sessionScope.login_status == 'fail'}">
		<script type="text/javascript">
			alert("아이디 또는 비밀번호를 잘못 입력하셨습니다. 로그인에 실패했습니다 ")
			history.back();
		</script>
	</c:when>
		<c:otherwise>
		<script type="text/javascript">			
			alert("성공적으로 로그인되었습니다.");
			location.href="./"
		</script>
	</c:otherwise>
</c:choose>
</head>
<body>
</body>
</html>