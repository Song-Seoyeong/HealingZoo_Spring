<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
	.margin{width: 100%; height: 70px;}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 헤더 -->
	<%@ include file='../common/logoBar.jsp' %>
	<%@ include file='../common/mainCategoryBar.jsp' %>
		<!-- /헤더 -->
		<div class='margin'></div>

		<div class="container text-center">
			<div class="row">
				<div class="col"></div>
				<div class="col-8">
					<h1>이용해주셔서 감사합니다</h1>
					<br><br><br><br><br><br><br>
					<br><br><br><br><br><br><br>
					<a href="${ contextPath }" class="btn btn-lg fw-bold border-white bg-white">메인페이지</a>
				</div>
				<div class="col"></div>
			</div>
		</div>

		<div class='margin'></div>
	<!-- 푸터 -->
	<%@ include file='../common/footer.jsp' %>
	<!-- /푸터 -->
</body>
</html>