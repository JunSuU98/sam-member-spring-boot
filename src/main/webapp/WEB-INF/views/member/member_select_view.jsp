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
	
	
	<!-- 검색 폼-->
	<form action="/MemberSelect" method="get">
		<fieldset>
			<div class="input-group">
				<select name="searchFilter" class="form-control mr-sm-1">
					<option value="member_id" ${param.searchFilter == 'member_id' ? 'selected' : '' }>아이디</option>
					<option value="member_name" ${param.searchFilter == 'member_name' ? 'selected' : '' }>이름</option>
					<option value="member_phone" ${param.searchFilter == 'member_phone' ? 'selected' : '' }>전화번호</option>
					<option value="member_email" ${param.searchFilter == 'member_email' ? 'selected' : '' }>이메일</option>
					<option value="member_birth" ${param.searchFilter == 'member_birth' ? 'selected' : '' }>생일</option>
					<option value="member_status" ${param.searchFilter == 'member_status' ? 'selected' : '' }>상태</option>
					<option value="member_rate" ${param.searchFilter == 'member_rate' ? 'selected' : '' }>평점</option>
				</select>
				
				<input type="search" name="searchQuery" class="form-control mr-sm-1" placeholder="검색어 입력" value="${param.searchQuery}">
				<button type="submit" class="btn btn-outline-success">검색</button>
				<a href="/MemberSelect" class="btn btn-outline-info">목록 이동</a>
			</div>
		</fieldset>
	</form>
	
	
	
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
								
				<c:forEach var="arrayList" items="${arrayList.content}"> 
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

	 <nav aria-label="Page navigation">
			<ul class="pagination justify-content-center">
				<li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
					<c:if test="${currentPage > 1}">
						<a class="page-link" href="/MemberSelect?page=${currentPage - 1}&size=${arrayList.size}" aria-label="Previous">
							<span aria-hidden="true">&laquo;</span>
							<span class="sr-only">이전</span>
						</a>
					</c:if>
				</li>

				<c:forEach begin="1" end="${totalPages}" var="i">
					<li class="page-item ${currentPage == i ? 'active' : ''}">
						<a class="page-link" href="/MemberSelect?page=${i}&size=${arrayList.size}">${i}</a>
					</li>
				</c:forEach>

				<li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
					<c:if test="${currentPage < totalPages}">
						<a class="page-link" href="/MemberSelect?page=${currentPage + 1}&size=${arrayList.size}" aria-label="Next">
							<span aria-hidden="true">&raquo;</span>
							<span class="sr-only">다음</span>
						</a>
					</c:if>
				</li>
			</ul>
		</nav>


</body>
</html>