<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 수정 페이지</title>
<style>
	.inputBoard{
		border-radius: 3px;
		border-shadow: none;
		border: 1px solid #B5B5B5;
		margin-bottom: 10px;
	}
	#boardContent{
		border-radius: 3px;
		border-shadow: none;
		margin-bottom: 10px;
		resize: none;
		border: 1px solid white;
	}
</style>
</head>
<body>
	<!-- 헤더 -->
	<%@ include file='../common/logoBar.jsp' %>
	<%@ include file='../common/mainCategoryBar.jsp'%>
	<!-- /헤더 -->
		
		<!-- 글쓰기 폼 -->
		<form action='${ contextPath }/updateBoard.admin' method='post' enctype='multipart/form-data'>
			<input type='hidden' name='boardNo' value='${ b.boardNo }'>
			<input type='hidden' name='page' value='${ page }'>
			<div class="container text-center" style='margin-top: 70px;'>
			  <div class="row">
			    <div class="col"></div>
			    <div class="col-8" style='background: white; border-radius: 25px;'>
			    	<br>
			    	
			    	<!-- 카테고리별 헤더 -->
			    	<c:if test="${ b.cateNo == 100 }">
				    	<div class='text-start'>
				    		<input type='hidden' value='100' name='cateNo'/>
				    		<input type='hidden' value='100' name='category'/>
				    		&nbsp;&nbsp;&nbsp;&nbsp;<h3 style="border-left: 5px solid #65B741; padding-left: 10px; display: inline-block; margin-bottom: 15px;"> 공지사항 수정하기</h3>
				    	</div>
			    	</c:if>
			    	<c:if test="${ b.cateNo == 103 }">
				    	<div class='text-start'>
				    		<input type='hidden' value='103' name='cateNo'/>
				    		<input type='hidden' value='103' name='category'/>
				    		&nbsp;&nbsp;&nbsp;&nbsp;<h3 style="border-left: 5px solid #65B741; padding-left: 10px; display: inline-block; margin-bottom: 15px;"> 예약글 수정하기</h3>
				    	</div>
			    	</c:if>
			    	<c:if test="${ b.cateNo == 101 }">
				    	<div class='text-start'>
				    		<input type='hidden' value='101' name='cateNo'/>
				    		<input type='hidden' value='101' name='category'/>
				    		&nbsp;&nbsp;&nbsp;&nbsp;<h3 style="border-left: 5px solid #65B741; padding-left: 10px; display: inline-block; margin-bottom: 15px;"> 문의사항 수정하기</h3>
				    	</div>
			    	</c:if>
			    	<c:if test="${ b.cateNo == 102 }">
				    	<div class='text-start'>
				    		<input type='hidden' value='102' name='cateNo'/>
				    		<input type='hidden' value='102' name='category'/>
				    		&nbsp;&nbsp;&nbsp;&nbsp;<h3 style="border-left: 5px solid #65B741; padding-left: 10px; display: inline-block; margin-bottom: 15px;"> 후기 수정하기</h3>
				    	</div>
			    	</c:if>
			    	<!-- 카테고리별 헤더 -->
			    	
			    	<hr>
			    	<div class='row'>
			    		<div class='col-1' style="margin-right: 5%;">
			    			<c:if test="${ b.cateNo == 100 }">
		    					<select name='noSubject'>
				    				<option value='NEWS' ${ b.cateNo} ${ b.noSubject == 'NEWS' ? "selected" :""}>새소식</option>
				    				<option value='EVENT' ${ b.noSubject == 'EVENT' ? "selected" :""}>이벤트</option>
				    				<option value='NOTICE' ${ b.noSubject == 'NOTICE' ? "selected" :""}>공지</option>
				    			</select>
						    </c:if>
			    		</div>
				    	<div  class='col-7 text-center'>
					    	<input type='text' name='boardTitle' placeholder='제목을 입력해주세요' id='inputBoardTitle' size='50' class='inputBoard' autofocus value='${ b.boardTitle }'>
					    </div>
					    <div class='col-3'>
					    	<input  type='text' name='boardWriterName' placeholder='이름을 입력해주세요' id='inputBoardWriter' size='20'  class='inputBoard' value='${ b.boardWriterName }'>
						</div>
						<div class='col-1'></div>
					</div>
					<!-- 카테고리별 헤더 -->
					
					<!-- 문의/예약글쓰기일시 핸드폰 입력창 -->
					<c:if test="${ b.cateNo == 103 || b.cateNo == 101 }">
						<div class='row'>
							<div class='col-1'></div>
							<div class='col-5 text-start'>
								<input type='text' name='writerPhone' placeholder='핸드폰 번호를 입력해주세요' id='writerPhone' size='30' class='inputBoard' onchange='checkPhoneReg()' value='${ b.writerPhone }' required>
							</div>
							<div class='col-6 text-start' id='phoneConfirm'>(-)를 제외하고 입력해주세요</div>
						</div>
						<div class='row'>
							<div class='col-1'></div>
							<div class='col-5 text-start'>
								<input type='password' id='boPwd' name='boPwd' class='inputBoard contain-fluid' size='30' placeholder='글 비밀번호를 입력해주세요' onchange='checkPwdReg()' required/>
							</div>
							<div class='col-6 text-start' id='pwdConfirm'>비밀번호는 숫자 6자리로 입력해주세요</div>
						</div>
					</c:if>
					<!-- 문의/예약글쓰기일시 핸드폰 입력창 -->
					
					<br>
					<div  class='text-center' style='border: 1px solid #B5B5B5;'>
				    	<textArea id='boardContent' name='boardContent' cols='70' rows="10">${ b.boardContent }</textArea>
				    	
				    	<!-- 기존 사진 영역 -->
				    	<c:forEach items="${ imgList }" var='img'>
							<div style='margin: 15px 15px;'>
								<img alt="${ img.imgName }" src="${ contextPath }/resources/uploadImg/${img.imgRename}" width='60%'>
								<input type='hidden' name='checkDelete' value='none'/>
								<button type="button" class="btn btn-sm deleteImg" style='background: #DD5353; color: white;' id='img-${ img.imgRename }'>삭제</button>
							</div>
						</c:forEach>
						<!-- 기존 사진 영역 -->
						
					</div>
					
					<div class='row' style='margin:5px;'>
						<div class='col-3'>
							<button type='button' id='plusFile' class='btn btn-primary'>+ 파일 추가</button>
						</div>
						<div class='col-8 text-end' id='fileArea'>
							<div style='margin: 5px;'>
								<input class="form-control" type="file" name='file' accept='image/*'>
							</div>
						</div>
						<div class='col-1'></div>
					</div>
					<br>
					<div class="text-end">
				    	<button id='insertBoard' class="btn" style='background: #60A869; color: white;'>완료</button>
				    	&nbsp;&nbsp;&nbsp;	
						<button type="button" class="btn" style='background: #DD5353; color: white;' onclick="javascript:history.back();">취소</button>
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
		// 핸드폰 번호 입력확인
		function checkPhoneReg(){
			const reg = /^(010|011)\d{8}$/;
			const phone = document.getElementById('writerPhone');
			const phoneConfirm = document.getElementById('phoneConfirm');
			
			if(!reg.test(phone.value)){
				phoneConfirm.innerText = '핸드폰 번호를 정확히 입력해주세요';
				phoneConfirm.style.color = 'red';
				
				phone.focus();
			}else{
				phoneConfirm.innerText = '';
			}
		
		}
		
		// 비밀번호 확인
		function checkPwdReg(){
			const reg = /^\d{6}$/;
			const pwd = document.getElementById('boPwd');
			const pwdConfirm = document.getElementById('pwdConfirm');
			if(!reg.test(pwd.value)){
				pwdConfirm.innerText = '비밀번호는 숫자 6자리로 입력해주세요';
				pwdConfirm.style.color = 'red';
			}else{
				pwdConfirm.innerText = '';
			}
			
		}
		
		// 파일 추가 로직
		const fileArea = document.getElementById("fileArea");
		console.log(fileArea)
		document.getElementById('plusFile').addEventListener('click', ()=>{
			const newFileArea = document.createElement('div');
			newFileArea.innerHTML = "<input class='form-control' type='file' name='file'>";
			newFileArea.style.margin = '5px';
			
			fileArea.append(newFileArea);
		})
		
		// 기존 이미지 삭제 버튼
		const btns = document.getElementsByClassName('deleteImg');
		for(btn of btns){
			btn.addEventListener('click', function(){
				const hidden = this.previousElementSibling;
				const img = hidden.previousElementSibling;
				
				if(hidden.value == 'none'){
					this.innerText = '취소';
					this.style.background = '#60A869';
					hidden.value = this.id.split('-')[1];
					img.style.opacity = '0.5'
				}else{
					this.innerText = '삭제';
					this.style.background = '#DD5353';
					hidden.value = 'none';
					img.style.opacity = '1';
				}
			})
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	</script>
</body>
</html>