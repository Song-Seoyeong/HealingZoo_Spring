<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>


<!-- jQuerylib -->
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>

<meta charset="UTF-8">
<title>Insert title here</title>
<!-- **필수** 글꼴 : 나눔 스퀘어 라운드 **필수** -->
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-round.css" rel="stylesheet">

<style>
	.memberLink{color: black; text-decoration: none;}
	body{font-family: 'NanumSquareRound'; margin:0px;}
	#headerLogo{width: 134px; height: 43px;}
	#loginUserName{font-weight: bold; font-size: 1.3em;}
</style>

<!-- **필수** 부트스트랩 : 상단 태그 **필수** -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

</head>
<body>
	<!-- contextPath -->
	<c:set var='contextPath' value='${ pageContext.servletContext.contextPath }' scope='application'/>
	
	<div class="row container-fluid" style='margin: 20px 0px;'>
		  <div class="col-4 text-center"></div>
	      <div class="col-4 text-center">
        	<a href="${ contextPath }">
				<img alt="logo" src="resources/image/headerLogo.png" id='headerLogo'>
			</a>
		  </div>
		  
		  <!-- 로그인 유무에 따라 변경 -->
	      <div class="col-4 text-end">
	      	<c:if test="${ empty loginUser }">
		        <a href="${ contextPath }/signUpView.me" class="memberLink">회원가입</a>
		        &nbsp;&nbsp;|&nbsp;&nbsp;
				<a href="${ contextPath }/loginView.me" class="memberLink">로그인</a>&nbsp;&nbsp;&nbsp;&nbsp;
			</c:if>
			<c:if test="${ !empty loginUser }">
				<span id='loginUserName'>${ loginUser.memName }</span>님,반갑습니다! &nbsp;
		        <a href="${ contextPath }/myPage.me" class="memberLink">마이페이지</a>
		    	<c:if test="${ loginUser.memGrade == 'MANAGER' || loginUser.memGrade == 'WORKER'}">
		    		&nbsp;&nbsp;|&nbsp;&nbsp;
		        	<a href="${ contextPath }/notice.admin" class="memberLink">관리자페이지</a>
		    	</c:if>
		    	
		        &nbsp;&nbsp;|&nbsp;&nbsp;
				<a href="${ contextPath }/logout.me" class="memberLink">로그아웃</a>&nbsp;&nbsp;&nbsp;&nbsp;
			</c:if>
	     </div>
	</div>
</body>
</html>