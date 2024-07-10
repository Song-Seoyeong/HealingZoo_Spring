<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<style>
	.inputBoard{
		border-radius: 3px;
		border-shadow: none;
		border: 1px solid #B5B5B5;
		margin-bottom: 10px;
	}
</style>
</head>
<body>
	<!-- 헤더 -->
	<%@ include file='../common/logoBar.jsp' %>
	<%@ include file='../common/mainCategoryBar.jsp'%>
	<!-- /헤더 -->
		
		<!-- 글쓰기 폼 -->
		<form action='${ contextPath }/animalInsert' method='post' enctype='multipart/form-data'>
			<div class="container text-center" style='margin-top: 70px;'>
			  <div class="row">
			    <div class="col-1"></div>
			    <div class="col-10" style='background: white; border-radius: 25px;'>
			    	<br>
			    	
			    	<!-- 카테고리별 헤더 -->
				    	<div class='text-start'>
				    		<input type='hidden' value='10' name='cateNo'/>
				    		&nbsp;&nbsp;&nbsp;&nbsp;<h3 style="border-left: 5px solid #65B741; padding-left: 10px; display: inline-block; margin-bottom: 15px;"> 동물 추가하기</h3>
				    	</div>
			    	<!-- 카테고리별 헤더 -->
			    	
			    	<hr>
			    	<!-- 카테고리별 제목 입력창 -->
				    	<div class='row'>
				    		<div class='col-3'>
				    			<select name='animalClass' id='animalClass'>
				    				<option value='Class' selected>대분류</option>
				    				<option value='포유류' selected>포유류</option>
				    				<option value='조류'>조류</option>
				    				<option value='파충류'>파충류</option>
				    			</select>
				    		</div>
				    		<div class='col-1 row-3'>
				    			<select name='extinctGrade' id='extinctGrade'>
				    				<option value='EXTINCT' selected>절멸등급</option>
				    				<option value='EX'>EX</option>
				    				<option value='CR'>CR</option>
				    				<option value='EN'>EN</option>
				    				<option value='VU'>VU</option>
				    			</select>
				    		</div>
					    	<div  class='col-6 text-center'>
						    	<input type='text' name='AnimalFamily' placeholder='동물 소분류명을 입력해주세요' id='inputBoardTitle'size='50' class='inputBoard' autofocus>
						    </div>
						    <div class='col-2'>
						    	<input  type='text' name='AnimalName' placeholder='동물 이름을 입력해주세요' id='inputBoardWriter' size='20'  class='inputBoard' autofocus>
							</div>
							<div class='col-1'></div>
						</div>
					<!-- 카테고리별 제목 입력창 -->
					
					<br>
					<br>
					<!-- 파일 선택 칸 추가 0708 -->
					<div class='row' style='margin:5px;'>
						<div class='col-8 text-end' id='fileArea'>
							<div style='margin: 5px;'>
								<input class="form-control" type="file" name='file' accept='image/*'>
							</div>
						</div>
						<div class='col-1'></div>
					</div>
					<div class="text-end">
				    	<button id='insertBoard' class="btn" style='background: #60A869; color: white;'>완료</button>
				    	&nbsp;&nbsp;&nbsp;	
						<button type="button" class="btn" style='background: #DD5353; color: white;' onclick="javascript:history.back();">취소</button>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	
					</div>
					<br>
			   	 </div>
			    <div class="col-1"></div>
			  </div>
			</div>
			<br>
		</form>
			
		<div class='margin'></div>
	<!-- 푸터 -->
	<%@ include file='../common/footer.jsp' %>
	<!-- /푸터 -->
	
	<script>
		// 파일 여러 개 추가라 동물 소개에서는 제외(참고용)
		/* const fileArea = document.getElementById("fileArea");
		console.log(fileArea)
		document.getElementById('plusFile').addEventListener('click', ()=>{
			const newFileArea = document.createElement('div');
			newFileArea.innerHTML = "<input class='form-control' type='file' name='file'>";
			newFileArea.style.margin = '5px';
			
			fileArea.append(newFileArea);
		}) */
	</script>
</body>
</html>