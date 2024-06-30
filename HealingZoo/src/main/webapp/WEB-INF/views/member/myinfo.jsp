<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<meta charset="UTF-8">
<style>
	.search {
	  position: relative;
	  width: 300px;
	  display: inline-block;
	  float: right;
	  margin-bottom: 30px;
	}
	
	input {
	  width: 100%;
	  border: 1px solid #bbb;
	  border-radius: 8px;
	  padding: 10px 12px;
	  font-size: 14px;
	}
	
	#search {
	  position : absolute;
	  width: 17px;
	  top: 14px;
	  right: 12px;
	  margin: 0;
	}
	
	.form-check-input{
		transform : scale(0.5);
		accent-color: #65B741;
	}
	
	
	#delete_button{ background-color: #DD5353; width: 80px; border: none;}
	#write_button{ background-color: #65B741; width: 80px; border: none; margin-right: 5px;}
	
	.pagination-container {
	  display: flex;
	  justify-content: center;
	}
	
	.number-button-wrapper {
		padding: 10px;
	}
	.nav-item a:hover{
	font-weight:bold;}
	
	
</style>
<title>Insert title here</title>
</head>
<body>
	<%@ include file='../common/logoBar.jsp' %>
	<%@ include file='../common/mainCategoryBar.jsp' %>
	<%@ include file='../common/memSidebar.jsp' %>
	
	<!-- 글 목록 -->
	<div class="container" style="width: 900px; margin-top: 100px;  ">
		 <h2 style="border-left: 5px solid #65B741; padding-left: 10px; display: inline-block; margin-bottom: 15px;">내 정보 보기</h2>
			<hr style="border:0; height:5px; background:black"/>
			<c:set var="currentPwd" value="${ currentPwd }" scope='session'/>
			<form action="${contextPath}/updateMember.me" method="post" id="myInfoForm">
				<label>이름</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="name" style="width:500px;" readonly value="${ loginUser.memName }">
				<hr>
				<label>아이디</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="id" style="width:500px;" readonly value="${ loginUser.memId }">
				<hr>
				<label>비밀번호</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="password" placeholder="비밀번호" id="newPwd" name="newPwd" style="width:500px">
				<hr>
				<label>비밀번호 확인</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="password" placeholder="비밀번호확인" id="pwdCheck" name="pwdCheck" style="width:500px">
				
					&nbsp;<button style="border:none; background:white;" title="비밀번호는 숫자, 영어, 특수문자 포함 8자 이상 15자 미만으로 생성해주세요" disabled><img src="${ contextPath }/resources/image/questionMark.svg" class="info">비밀번호 유의사항</button>
					<div class="col-9 text-end" id='pwdConfirmText' style='font:10px; color: black;'>
					  	비밀번호를 확인해주세요
					</div>
				<hr>
				<label>휴대폰 번호</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="phoneNo" placeholder="(-제외)" style="width:500px" value="${ loginUser.memPhone }">
				<hr>
				<c:if test="${ grade == 'MANAGER' || grade == 'WORKER' }">
					<label>프로필</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class='form-control' type="file" placeholder="아이디고정" name="id" style="width:500px; display:inline-block;" accept='image/*'>
					<hr>
					<label>소개글</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<textarea class='form-control' style="width:500px; height: 100px; display:inline-block; resize:none;"></textarea>
					<hr>
				</c:if>
				<div style="text-align:center;">
					<button class="btn btn-primary" id="write_button" style="background:orange;">수정</button>
					<button class="btn btn-primary" id="delete_button">탈퇴</button>
				</div>
			</form>		
	</div>
	
	<div style="margin-bottom: 100px"></div>
	
	<%@ include file='../common/footer.jsp' %>
	
	
	
	
	
	
	
	
	<script>
		// 수정확인 버튼
		revBtn.addEventListener('click', function(){
			const newPwd = document.getElementById('newPwd');
			const reg = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,15}$/;
			confirm("수정하시겠습니까")
			if(true && (newPwd==pwdCheck) && (pwdCheck==reg) ){
				action = '${contextPath}/updateMember.me';
				newPwd.submit();	
			}else if(true && newPwd != reg){
				alert("비밀번호는 숫자, 영어, 특수문자 포함 8자 이상 15자 미만으로 생성해주세요");
				newPwd.focus();
			}else if(false){
				
			}
		}) 
			
		// 비밀번호 확인 일치 여부
		document.getElementById('pwdCheck').addEventListener('keyup', function(){
			const confirmText = document.getElementById('pwdConfirmText');
			const pwdCheck = document.getElementById('pwdCheck')
			console.log(12)
			if(this.value != newPwd.value){
				confirmText.innerText = '비밀번호가 일치하지 않습니다';
				confirmText.style.color = 'red';
			}else{
				if(this.value != ''){
					confirmText.innerText = '확인되었습니다.';
					confirmText.style.color = 'green';
				}
			}
		})
				
	</script>
</body>
</html>



