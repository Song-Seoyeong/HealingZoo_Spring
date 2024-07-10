<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>운영시간 및 요금 안내</title>
	<style>
	.optabletitle {
		font-weight: bold;
	}
	
	.content-wrapper {
		padding: 20px;
		border-radius: 30px;
		width: 60%;
		max-width: 1200px;
		margin: 0 auto;
		box-sizing: border-box;
	}
	
	.opertitle, .opertitle2 {
		background-color: #fff;
		padding: 0;
		border-radius: 10px;
		overflow: hidden;
		display: flex;
		justify-content: center;
		align-items: center;
	}
	
	.opertitle {
		border-radius: 50px;
	}
	
	.opertitle img, .opertitle2 img {
		width: 800px;
		height: auto;
		display: block;
	}
	</style>
</head>
	<body>
		<%@ include file='../common/logoBar.jsp'%>
		<%@ include file='../common/mainCategoryBar.jsp'%>
		<br>
		<br>
		<div class="content-wrapper">
			<br>
			<h2 align="center" class="optabletitle">&lt;운영시간 및 입장요금 안내&gt;</h2>
			<br> <br>
			<br>
			<div class="opertitle">
				<img
					src="${pageContext.request.contextPath}${operatingImage.imgPath}/${operatingImage.imgRename}"
					alt="Operating Hours">
			</div>
			<br>
			<br>
			<h2 align="center" class="optabletitle">&lt;개인 및 단체 입장 요금 안내&gt;</h2>
			<br>
			<br>
			<div class="opertitle2">
				<img
					src="${pageContext.request.contextPath}${chargeImage.imgPath}/${chargeImage.imgRename}"
					alt="Entrance Fees">
			</div>
		</div>
		<%@ include file='../common/footer.jsp'%>
	</body>
</html>