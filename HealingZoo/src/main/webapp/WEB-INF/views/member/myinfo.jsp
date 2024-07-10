<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
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
	
	#delete{color: lightgray;}
	#delete:hover{color:gray; cursor: pointer;}
	#revision_button{ background-color: orange; width: 80px; border: none; margin-right: 5px;}
	
	.pagination-container {
	  display: flex;
	  justify-content: center;
	}
	
	.number-button-wrapper {
		padding: 10px;
	}
	.nav-item a:hover{
	font-weight:bold;}
	
	#staffDiv{
		visibility: none;
	}
	
</style>
<title>Insert title here</title>
</head>
<body>
	<%@ include file='../common/logoBar.jsp' %>
	<%@ include file='../common/mainCategoryBar.jsp' %>
	<%@ include file='../common/memSidebar.jsp' %>
	
	<!-- 글 목록 -->
	<div class="container" style="width: 900px; margin-top: 100px;">
		 <h2 style="border-left: 5px solid #65B741; padding-left: 10px; display: inline-block; margin-bottom: 15px;">내 정보 보기</h2>
			<hr style="border:0; height:5px; background:black"/>
			<form action='${contextPath}/updateMember.me' method="post" onsubmit="return check()" enctype="multipart/form-data">
				<label>이름</label>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="text" id="name" name="name" style="width:500px;" readonly value="${ loginUser.memName }">
				<hr>
				<label>아이디</label>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="text" name="id" style="width:500px;" readonly value="${ loginUser.memId }">
				<hr>
				<label>비밀번호</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="password" placeholder="비밀번호" id="newPwd" name="newPwd" style="width:500px">
				<hr>
				<label>비밀번호 확인</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="password" placeholder="비밀번호확인" id="pwdCheck" name="pwdCheck" style="width:500px">
				
					&nbsp;<button style="border:none; background:white;" title="비밀번호는 숫자, 영어, 특수문자 포함 8자 이상 15자 미만으로 생성해주세요" disabled><img src="${ contextPath }/resources/image/questCircle.svg" class="info">비밀번호 유의사항</button>
					<div class="col-9 text-end" id='pwdConfirmText' style='font:10px; color: black;'>
					  	비밀번호를 입력해주세요
					</div>
				<hr>
				<label>휴대폰 번호</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" id="phoneNo" name="phoneNo" placeholder="(-제외)" style="width:500px" value="${ loginUser.memPhone }">
				<hr>
				<div id='staffDiv'>
					<label>프로필</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input class='form-control' type="file" name="greetingStaff" style="width:500px; display:inline-block;" accept='image/*'>
					<hr>
					<label>소개글</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<textarea class='form-control'  name="greetingWrite"style="width:500px; height: 100px; display:inline-block; resize:none;">${ loginUser.memIntro}</textarea>
				</div>
					<hr>
				<div style="text-align:center;">
					<button class="btn btn-primary" id="revision_button">수정</button>
					
				</div>
			</form>
			<label id="delete">탈퇴</label>			
	</div>
	
	<div style="margin-bottom: 100px"></div>
	
	<%@ include file='../common/footer.jsp' %>
	
	<div class="modal fade" tabindex="-1" role="dialog" id="modalChoice">
		<div class="modal-dialog" role="document">
    		<div class="modal-content rounded-3 shadow">
      			<div class="modal-body p-4 text-center">
        			<h3 class="mb-0">정말로 탈퇴하시겠습니까?</h3>
        			<p class="mb-0">탈퇴 후 계정은 복구할 수 없습니다.</p>
      			</div>
      			<div class="modal-footer flex-nowrap p-0">
        			<button type="button" class="btn btn-lg btn-link fs-6 text-decoration-none col-6 m-0 rounded-0 border-end" onclick="location.href='${contextPath}/deleteMember.me'">
        				<strong>네</strong>
        			</button>
        			<button type="button" class="btn btn-lg btn-link fs-6 text-decoration-none col-6 m-0 rounded-0" data-bs-dismiss="modal">아니오</button>
      			</div>
    		</div>
  		</div>
	</div>
	
	<script>
		//비밀번호 입력 확인
		function check(){ 
			const newPwd = document.getElementById('newPwd');
			const reg = /^(?=.*[a-zA-Z])(?=.*[!@#$%^&*+=-])(?=.*[0-9]).{8,15}$/;
			if(newPwd.value == "" || !reg.test(newPwd.value)){
				alert("비밀번호를 확인하세요");
				newPwd.focus();
				return false;
			}
		}
		
		//비밀번호 일치 확인
		document.getElementById('pwdCheck').addEventListener('keyup', function(){
			const newPwd = document.getElementById('newPwd');
			const pwdConfirmText = document.getElementById('pwdConfirmText');
			if(this.value == ""){
				pwdConfirmText.innerText="비밀번호를 입력해주세요";
				pwdConfirmText.style.color = 'black';
			}else{
				if(this.value == newPwd.value){
					pwdConfirmText.innerHTML = "비밀번호가 일치합니다";
					pwdConfirmText.style.color = 'green';
				}else{
					pwdConfirmText.innerHTML = "비밀번호가 일치하지 않습니다";
					pwdConfirmText.style.color = 'red';
				}	
			}
				
			
		})
		//탈퇴하기 모달
		document.getElementById('delete').addEventListener('click', ()=>{
				$('#modalChoice').modal('show');	
			});
	</script>
</body>
</html>



