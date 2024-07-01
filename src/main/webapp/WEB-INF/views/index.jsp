<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="./js/jquery-3.5.1.min.js" type="text/javascript"></script>

</head>
<body>
		
	<section>
		<c:choose>
			<c:when test="${not empty sessionScope.member_name}">
				<!-- 로그인 된 상태의 처리 -->
				<c:choose>
					<c:when test="${sessionScope.member_id eq 'admin'}">
						<!-- 관리자로 로그인한 상태의 처리 -->
						<h2>관리자 로그인 성공!!</h2>
						
						<button type="button" class="btn btn-primary" onclick="location.href='/MemberSelect'">
							전체회원조회
						</button>
						
						<button type="button" class="btn btn-primary" onclick="location.href='/ImgSelect'">
							전체 이미지 조회
						</button>

						<button type="button" class="btn btn-primary" onclick="location.href='/Logout'">
							로그아웃
						</button>

					</c:when>
					<c:otherwise>
						<!-- 일반 사용자로 로그인한 상태의 처리 -->
						<h2>안녕하세요 ${sessionScope.member_name} 님</h2>
						
						<button type="button" class="btn btn-primary" onclick="location.href='/MemberSelectDetail?member_number=${sessionScope.member_number}'">
							마이페이지
						</button>
						
						<button type="button" class="btn btn-primary" onclick="location.href='/Logout'">
							로그아웃
						</button>

					</c:otherwise>
				</c:choose>
			</c:when>
			<c:otherwise>
				<!-- 로그인 되지 않은 상태의 처리 -->
				<h2>로그인 되어있지 않습니다</h2>
				
				<button type="button" class="btn btn-primary" onclick="location.href='/MemberInsert'">
					회원가입
				</button>
				
				<button type="button" class="btn btn-primary" onclick="location.href='/Login'">
					로그인
				</button>

		
				<a href="./NaverLogin"><img height="50" src="http://static.nid.naver.com/oauth/small_g_in.PNG"/></a>	
			</c:otherwise>
		</c:choose>
	
	</section>
	
	<main>
	
  <!-- <a href="./NaverLogin"><img height="50" src="http://static.nid.naver.com/oauth/small_g_in.PNG"/></a> -->	
	  
	</main>
	
	
</body>
</html>