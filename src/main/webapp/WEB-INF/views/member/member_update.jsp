<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<script type="text/javascript">
		alert("회원 정보가 성공적으로 수정되었습니다.");
		location.href="./MemberSelectDetail?member_number=${param.member_number}";
	</script>
	

</body>
</html>