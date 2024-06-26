<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.margin{width: 100%; height: 70px;}
	.inputBoard{
		border-radius: 3px;
		border-shadow: none;
		border: 1px solid #B5B5B5;
	}
</style>
</head>
<body>
	<!-- 헤더 -->
	<%@ include file='../common/logoBar.jsp' %>
	
	<%@ include file='../common/mainCategoryBar.jsp' %>
	<!-- /헤더 -->
		<div class='margin'></div>
		
		<!-- 글쓰기 폼 -->
		<form action='${ contextPath }/write.bo' method='post' >
			<input type='hidden' name='category' value='${ category }'>
			<div class="container text-center">
			  <div class="row">
			    <div class="col"></div>
			    <div class="col-8" style='background: white; border-radius: 25px;'>
			    	<br>
			    	
			    	<!-- 카테고리별 헤더 -->
			    	<c:if test="${ category == 'notice' }">
				    	<div class='text-start'>
				    		&nbsp;&nbsp;&nbsp;&nbsp;<h3 style="border-left: 5px solid #65B741; padding-left: 10px; display: inline-block; margin-bottom: 15px;"> 공지사항 남기기</h3>
				    	</div>
			    	</c:if>
			    	<c:if test="${ category == 'book' }">
				    	<div class='text-start'>
				    		&nbsp;&nbsp;&nbsp;&nbsp;<h3 style="border-left: 5px solid #65B741; padding-left: 10px; display: inline-block; margin-bottom: 15px;"> 예약글 남기기</h3>
				    	</div>
			    	</c:if>
			    	<c:if test="${ category == 'question' }">
				    	<div class='text-start'>
				    		&nbsp;&nbsp;&nbsp;&nbsp;<h3 style="border-left: 5px solid #65B741; padding-left: 10px; display: inline-block; margin-bottom: 15px;"> 문의사항 남기기</h3>
				    	</div>
			    	</c:if>
			    	<c:if test="${ category == 'review' }">
				    	<div class='text-start'>
				    		&nbsp;&nbsp;&nbsp;&nbsp;<h3 style="border-left: 5px solid #65B741; padding-left: 10px; display: inline-block; margin-bottom: 15px;"> 후기 남기기</h3>
				    	</div>
			    	</c:if>
			    	
			    	<hr>
			    	<div  class='text-center'>
				    	<input type='text' name='boardTitle' placeholder='제목을 입력해주세요' id='inputBoardTitle'size='50' class='inputBoard' style='margin-bottom: 15px;'>
				    	&nbsp;&nbsp;
				    	<input  type='text' name='boardWriterName' placeholder='이름을 입력해주세요' id='inputBoardWriter' size='20'  class='inputBoard' value='${ !empty loginUser ? loginUser.memName : "" }'>
					</div>
					<!-- 카테고리별 헤더 -->
					
					<!-- 문의/예약글쓰기일시 핸드폰 입력창 -->
					<c:if test="${ category == 'book' || category == 'question' }">
						<div class='row'>
							<div class='col-7 text-center'>
								<input type='text' name='writerPhone' placeholder='핸드폰 번호를 입력해주세요' id='writerPhone' class='inputBoard' value='${ !empty loginUser ? loginUser.memPhone : "" }' required>
							</div>
							<div class='col-5' id='phoneConfirm'>(-)를 제외하고 입력해주세요</div>
						</div>
						<div class='row'>
							<div class='col-7'>
								<input type='password' id='boPwd' name='boPwd' class='inputBoard form-control' placeholder='글 비밀번호를 입력해주세요' required/>
							</div>
							<div class='col-5' id='phoneConfirm'>비밀번호는 숫자 6자리로 입력해주세요</div>
						</div>
					</c:if>
					<!-- 문의/예약글쓰기일시 핸드폰 입력창 -->
					
					<br>
					<div  class='text-center'>
				    	<textArea id='inputBoardContent' name='boardContent' cols='70' rows="20" style="resize: none;"  class='inputBoard'></textArea>
					</div>
					<div class='row'>
						<div class='col-1'></div>
						
						<!-- 문의/예약글쓰기일시 비밀번호 입력창 -->
						<c:if test="${ category == 'book' || category == 'question' }">
							
						</c:if>
						<!-- 문의/예약글쓰기일시 비밀번호 입력창 -->
						
						<div class='col-5 text-end'>
							 <input class="form-control" width='100px' type="file" id="formFile" name='img'>
						</div>
						<div class='col-1'></div>
					</div>
					<br>
					<div class="text-end">
				    	<button id='insertBoard' class="btn" style='background: #60A869; color: white;'>완료</button>
				    	&nbsp;&nbsp;&nbsp;	
						<button type="button" class="btn" style='background: #DD5353; color: white;' onclick='location.href="javascript.history.back()"'>취소</button>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	
					</div>
					<br>
			   	 </div>
			    <div class="col"></div>
			  </div>
			</div>
			<br>
		</form>
			
		<div class='margin'></div>
	<!-- 푸터 -->
	<%@ include file='../common/footer.jsp' %>
	<!-- /푸터 -->
	
	<script>
		window.onload = () =>{
			document.getElementById('writerPhone').addEventListener('blur', function(){
				const reg = /^(010|011)\d{8}$/;
				if(!reg.test(this.value)){
					const phoneConfirm = document.getElementById('phoneConfirm');
					phoneConfirm.innerText = '핸드폰 번호를 정확히 입력해주세요';
					phoneConfirm.style.color = 'red';
					
					this.focus();
				}
			})
			
			document.getElementById('boPwd').addEventListener('', function()=>{
				const reg = /d{6}/;
				if(!reg.test(this.value)){
					
				}
			})
		}
	</script>
</body>
</html>