<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새 비밀번호 변경</title>
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
	.loginName{font: 20px bold;}
	#searchId:hover{cursor:pointer}
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
		<p>새 비밀번호 변경하기</p>
	</div>
	
	<!-- 여백용 -->
	<div style='margin: 5%'></div>
	
	<!-- 로그인폼 -->
	<form action='${ contextPath }/newPwd.me' method='post' id='searchPwdForm'>
		<input type='hidden' name='memId' value='${ m.memId }'>
		<input type='hidden' name='memName' value='${ m.memName }'>
		<div class="container-fluid">
		  <div class="row">
		    <div class="col"></div>
		    <div class="col-5">
		    
		    	<!-- 비번 -->
				<div class="row g-3 align-items-center">
				  <div class="col-3 text-end">
				    <label for="inputPassword" class="form-label loginName">새 비밀번호</label>
				  </div>
				  <div class="col-7">
				    <input type="password" id="pwd" name='memPwd' class="form-control form-control-lg" onchange='checkPwdReg()' aria-describedby="passwordHelpInline" required placeholder="비밀번호를 입력하세요" size='50'>
				  </div>
				  <div class="col-auto"></div>
				</div>
				<div class="row g-3 align-items-center">
				  <div class="col-3"></div>
				  <div class="col-9 text-start" style='font: 10px; color: #595959;'>
				  	비밀번호는 숫자, 영어, 특수문자 포함 8자 이상 15자 미만으로 생성해주세요
				  </div>
				  <div class="col"></div>
				</div>
				
				<!-- 비번확인 -->
				<div class="row g-3 align-items-center">
				  <div class="col-3 text-end">
				    <label for="inputPassword" class="form-label loginName">새 비밀번호 확인</label>
				  </div>
				  <div class="col-7">
				    <input type="password" id="pwdConfirm" class="form-control form-control-lg" aria-describedby="passwordHelpInline" required placeholder="비밀번호를 한번더 입력하세요" size='50'>
				    <div class="row g-3 align-items-center">
					  <div class="col-3"></div>
					  <div class="col-9 text-end" id='pwdConfirmText' style='font:10px; color: #BE1515;'>
					  	비밀번호를 확인해주세요
					  </div>
					</div>
				  </div>
				  <div class="col-auto">
				  </div>
				</div>
				
				
				<div class="row g-3 align-items-center">
				  <div class="col-3"></div>
				  <div class="col-3">
				  	<button onclick='doLogin();' class="btn" style='background: #60A869; color: white;'>비밀번호 변경</button>
				  </div>
				  <div class="col-3">
				  	<label id='searchId'>아이디 찾기</label>
				  </div>
				  <div class="col-3"></div>
				</div>
		    </div>
		    <div class="col"></div>
		  </div>
		</div>
	</form>
	
	<div style='margin: 10%'></div>
	
	<!-- 푸터 -->
	<%@ include file='../common/footer.jsp' %>
	<!-- /푸터 -->	
	
	<script>
		const pwd = document.getElementById('pwd');
		const pwdConfirm = document.getElementById('pwdConfirm');
		
		// 입력창 빈칸 제출 체크
		const doLogin = ()=>{
			if(pwd.value.trim() == ''){
				alert('비밀번호를 입력하세요.');
				pwd.focus();
			}else if(pwdConfirm.value.trim() == ''){
				alert('이름를 입력하세요.');
				pwdConfirm.focus();
			}else{
				document.getElementById('searchPwdForm').submit();
			}
		}	
		
		// 엔터 입력시 폼 제출
		const inputNamePhone = document.getElementsByTagName('input');
		for(const input of inputNamePhone){
			input.addEventListener('keyup', e =>{
				if(e.key == 'Enter'){
					doLogin();
				}
			})
		}
		
		// 아이디 찾기 페이지 이동
		document.getElementById('searchId').addEventListener('click', () =>{
			location.href = '${contextPath}/searchIdView.me';
		})
		
		// 비밀번호 정규화 체크
		function checkPwdReg(){
			const reg = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,15}$/;
			
			if(!reg.test(pwd.value)){
				alert("비밀번호는 숫자, 영어, 특수문자 포함 8자 이상 15자 미만으로 생성해주세요");
				pwd.focus();
			}
		}
		
		// 비밀번호 확인 일치 여부
		pwdConfirm.addEventListener('keyup', function(){
			const confirmText = document.getElementById('pwdConfirmText');

			if(this.value != pwd.value){
				confirmText.innerText = '비밀번호가 일치하지 않습니다'
				confirmText.style.color = 'red';
			}else if(this.value == pwd.value){
				confirmText.innerText = '확인되었습니다.';
				confirmText.style.color = 'green';
			}else{
				confirmText.innerText = '비밀번호를 확인하세요.';
				confirmText.style.color = 'black';
			}
		})
	</script>
</body>
</html>