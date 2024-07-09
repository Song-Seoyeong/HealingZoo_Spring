<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
	.inputTitleName{
		font-size: 23px;
	}
	
	#sideButton{color: #65B741; font-weight: bold;}
	
	#revision_button{
		background-color: orange;
		width: 80px;
		border: none;
		margin-right: 5px;
	}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file='../common/logoBar.jsp' %>
	<%@ include file='../common/mainCategoryBar.jsp'%>
	<%@ include file='../common/adminSidebar.jsp'%>
	
	<!-- input 영역 -->
	<div class="container" style="width: 900px; margin-top: 100px; margin-bottom: 30%;">
		<!-- 운영시간 이미지 -->
		<div style='margin-bottom: 140px;'>
			<h2 style="border-left: 5px solid #65B741; padding-left: 10px; display: inline-block; margin-bottom: 15px;">운영시간</h2>
			<div class='row'>
				<div class='col-2 text-center'>
					<p class='inputTitleName'>이미지 : </p>
				</div>
				<div class='col-7'>
					<input class="form-control" width='100px' type="file" id="operImg" name='operImg' accept='image/*'>
				</div>
				<div class='col-3'>
					<button class="btn btn-primary" type="button" id="revision_button">수정</button>
				</div>
			</div>
		</div>
		
		
		<!-- 이용요금 이미지 -->
		<div  style='margin-bottom: 100px;'>
			<h2 style="border-left: 5px solid #65B741; padding-left: 10px; display: inline-block; margin-bottom: 15px;">이용 요금</h2>
			<div class='row'>
				<div class='col-2 text-center'>
					<p class='inputTitleName'>이미지 : </p>
				</div>
				<div class='col-7'>
					<input class="form-control" width='100px' type="file" id="charge" name='charge' accept='image/*'>
				</div>
				<div class='col-3'>
					<button class="btn btn-primary" type="button" id="revision_button">수정</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 하단 푸터 -->
	<%@ include file='../common/footer.jsp'%>
	<!-- 하단 푸터 -->
	
</body>
</html>