<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 회원 전체 조회 페이지 </title>
<link rel="stylesheet" type="text/css" href="./css/bootstrap.min.css">
<script src="./js/jquery-3.5.1.min.js" type="text/javascript"></script>
<script src="./js/bootstrap.min.js" type="text/javascript"></script>
</head>
<body>

	<header>
		<h2> 전체 회원 조회 </h2>
	</header>

	<main>
		<table class="table">
			 <thead class="thead-light">
				<tr>
				  <th scope="col">#</th>
				  <th scope="col">회원 이름</th>
				  <th scope="col">회원 상태</th>
				  <th scope="col">아이디</th>
				  <th scope="col">비밀번호</th>
				  <th scope="col">이메일</th>
				  <th scope="col">핸드폰 번호</th>
				  <th scope="col">생년월일</th>
				  <th scope="col">주소</th>
				  <th scope="col">매너온도</th>
				  <th scope="col">가입일자</th>
				  <th scope="col">업데이트 일자</th>
				</tr>
			  </thead>
			  <tbody>
								
				<c:forEach var="arrayList" items="${arrayList}"> 
					<tr>
					  <th scope="row">${arrayList.memberNumber}</th>
					  <td>${arrayList.memberName}</td>
					  <td>${arrayList.memberStatus}</td>
					  <td>${arrayList.memberId}</td>
					  <td>${arrayList.memberPassword}</td>
					  <td>${arrayList.memberEmail}</td>
					  <td>${arrayList.memberPhone}</td>
					  <td>${arrayList.memberBirth}</td>
					  <td>${arrayList.memberAddress}</td>
					  <td>${arrayList.memberRate}</td>
					  <td>${arrayList.memberCreate}</td>
					  <td>${arrayList.memberUpdate}</td>

					  <td>
					  	<a href="./MemberSelectDetail?member_number=${arrayList.memberNumber}">상세 보기</a>
					  </td>
					</tr>
				</c:forEach>
				
			  </tbody>
		</table>
		
		<button type="button" class="btn btn-primary mb-3" onclick="location.href='./'">메인 화면으로</button>
	</main>

</body>
</html>