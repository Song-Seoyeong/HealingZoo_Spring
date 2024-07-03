<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<style>
	#loginImg{
		background: url(resources/image/loginImg.jpg) fixed;
		width: 100%;
		height: 300px;
		font: 60px bold;
		color: #60A869;
		text-align: center;
		text-shadow:1px 1px 1px #fff;
	}
	#searchPwd:hover{cursor:pointer}
	#login:hover{cursor:pointer}
</style>
</head>
<body>
	<!-- 헤더 -->
	<%@ include file='../common/logoBar.jsp' %>
	<%@ include file='../common/mainCategoryBar.jsp' %>
	<!-- /헤더 -->
	
	<!-- 여백용 -->
	<div style='margin: 3%'></div> 
	<div id='loginImg'>
		<br>
		<p>아이디 찾기</p>
	</div>
	
	<!-- 여백용 -->
	<div style='margin: 5%'></div>
	
	<!-- 로그인폼 -->
	<div class="container-fluid">
	  <div class="row">
	    <div class="col"></div>
	    <div class="col-5">
	    	<div class="row g-3 align-items-center">
			  <div class="col-2"></div>
			  <div class="col-8 text-center">
			  	<c:if test="${ !empty id }">
			  		<h3>${ memName }님의 아이디는 ${ id }입니다.</h3>
			  	</c:if>
			  	<c:if test="${ !empty m }">
			  		<h3>${ m.memName }님의 정보가 수정되었습니다.</h3>
			  	</c:if>
			  </div>
			  <div class="col-2"></div>
			</div>
			<div style='margin: 10% 0%'></div>
			<div class="row g-3 align-items-center">
			  <div class="col-3"></div>
			  <div class="col-3 text-center">
			  	<button id='login' class="btn" style='background: #60A869; color: white;'>로그인</button>
			  </div>
			  <div class="col-3 text-center">
			  	<c:if test="${ !empty id }">
			  		<label id='searchPwd'>비밀번호 찾기</label>
			  	</c:if>
			  </div>
			  <div class="col-3"></div>
			</div>
	    </div>
	    <div class="col"></div>
	  </div>
	</div>
	
	<div style='margin: 10%'></div>
	
	<!-- 푸터 -->
	<%@ include file='../common/footer.jsp' %>
	<!-- /푸터 -->	
	
	<script>
		// 로그인 페이지 이동
		document.getElementById('login').addEventListener('click', () =>{
			location.href = '${contextPath}/loginView.me';
		})
		
		// 비밀번호 찾기 페이지 이동
		if(document.getElementById('searchPwd') != null){
			document.getElementById('searchPwd').addEventListener('click', () =>{
				location.href = '${contextPath}/searchPwdView.me';
			})
		}
	</script>
</body>
</html>