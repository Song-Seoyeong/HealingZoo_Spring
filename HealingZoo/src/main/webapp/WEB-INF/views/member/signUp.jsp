<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
	#loginDiv{
		width: 100%;
		height: 200px;
		text-align: center;
	}
	.loginName{font: 20px bold;}
	#memIntro{
		resize: none;
		border: 1px solid #D9D9D9;
		border-radius: 10px;
	}
</style>
</head>
<body>
	<!-- 헤더 -->
	<%@ include file='../common/logoBar.jsp' %>
	<%@ include file='../common/mainCategoryBar.jsp' %>
	<!-- /헤더 -->
	
	<!-- 여백용 -->
	<div style='margin: 3%'></div> 
	<div id='loginDiv'>
		<p style='font: 60px bold; text-shadow:1px 1px 1px #595959;'>회원가입</p>
		<p style='font-size: 20px; color:#595959;'>힐링 동물원의 가족이 되어 멸종 위기에 처한 동물 친구과 함께해요</p>
	</div>
	
	<!-- 여백용 -->
	<div style='margin: 2%'></div>
	
	<!-- 회원가입폼 -->
	<form action='${ contextPath }/signUp.me' method='post' id='signUpFrom'>
		<div class="container">
		  <div class="row">
		    <div class="col-2"></div>
		    <div class="col-8">
		    	<!-- 이름 -->
		    	<div class="row g-3 align-items-center marginDiv">
				  <div class="col-3 text-end">
				    <label for="inputId" class="form-label loginName">이름 <span style='font-size:0.8rem; color: red;'> *필수*</span></label>
				  </div>
				  <div class="col-5">
				    <input type="text" class="form-control form-control-lg" id="name" name='memName' placeholder="이름를 입력하세요" required>
				  </div>
				  <div class="col-7"></div>
				</div>
				
		    	<!-- 아이디 -->
		    	<div class="row g-3 align-items-center marginDiv">
				  <div class="col-3 text-end">
				    <label for="inputId" class="form-label loginName">아이디 <span style='font-size:0.8rem; color: red;'> *필수*</span></label>
				  </div>
				  <div class="col-5">
				    <input type="text" class="form-control form-control-lg" id="id" name='memId' placeholder="아이디를 입력하세요" onchange='checkIdReg();' required>
				  </div>
				  <div class="col-7"></div>
				</div>
				<div class="row g-3 align-items-center">
				  <div class="col-3"></div>
				  <div class="col-9 text-start" id='idConfirmText' style='font: 10px; color: #595959;'>
				  	아이디를 영문/숫자 조합으로 입력하세요
				  </div>
				  <div class="col"></div>
				</div>
				
				<!-- 이메일 -->
				<div class="row g-3 align-items-center marginDiv" style='margin-bottom:2%;'>
				  <div class="col-3 text-end">
				    <label for="inputEmail" class="form-label loginName">이메일 <span style='font-size:0.8rem; color: red;'> *필수*</span></label>
				  </div>
				  <div class="col-9" style='width: 500px; '>
			   		 <input type="text" class="form-control form-control-lg" id="email" name="memEmailId" style='width: 200px; display: inline-block;' required>
					 <span class="input-group-text" style='width:50px; display: inline-block;'>@</span>
					 <select name="emailDomain" class="form-control form-control-lg" style='width: 200px; display: inline-block;' required>
						<option>naver.com</option>
						<option>gmail.com</option>
						<option>nate.com</option>
						<option>hanmail.net</option>
					 </select>
				  </div>
				</div>
				
				<!-- 비번 -->
				<div class="row g-3 align-items-center">
				  <div class="col-3 text-end">
				    <label for="inputPassword" class="form-label loginName">비밀번호 <span style='font-size:0.8rem; color: red;'> *필수*</span></label>
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
				    <label for="inputPassword" class="form-label loginName">비밀번호 확인 <span style='font-size:0.8rem; color: red;'> *필수*</span></label>
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
				
				
				<!-- 핸드폰 -->
				<div class="row g-3 align-items-center">
				  <div class="col-3 text-end">
				    <label for="inputPhone" class="form-label loginName">핸드폰 번호 <span style='font-size:0.8rem; color: red;'> *필수*</span></label>
				  </div>
				  <div class="col-7">
				    <input type='text' class="form-control form-control-lg" onchange='checkPhoneRef()' id="phone" name='memPhone' placeholder='핸드폰 번호를 입력하세요' required size='10'>
				  </div>
				  <div class="col-auto">
				  </div>
				</div>
				<div class="row g-3 align-items-center">
				  <div class="col-3"></div>
				  <div class="col-9 text-start" style='font: 10px; color: #595959;'>
				  	(-)를 제외하고 입력해주세요
				  </div>
				  <div class="col"></div>
				</div>
				
				
				<!-- 버튼 -->
				<div class="row g-3">
				  <div class="col-5">
				  </div>
				  <div class="col-2 text-center">
				  	<button class="btn" onclick='doSignUp();' style='background: #60A869; color: white;'>회원가입</button>
				  </div>
				  <div class="col-5">
				  </div>
				</div>
		    </div>
		    <div class="col-2"></div>
		  </div>
		</div>
	</form>
	
	<div style='margin: 10%'></div>
	
	<!-- 푸터 -->
	<%@ include file='../common/footer.jsp' %>
	<!-- /푸터 -->	
	
	
	
	<script>
		const id = document.getElementById('id');
		const pwd = document.getElementById('pwd');
		const phone = document.getElementById('phone');
			
		// 필수 항목 빈칸 제출시 알림창
		const doSignUp = () =>{
			const name = document.getElementById('name');
			const email = document.getElementById('email');
			const pwdComfirm = document.getElementById('pwdComfirm');
			
			if(name.value.trim() == ''){
				alert('이름를 입력하세요.');
				name.focus();
			}else if(id.value.trim() == ''){
				alert('아이디를 입력하세요.');
				id.focus();
			}else if(pwd.value.trim() == ''){
				alert('비밀번호를 입력하세요.');
				pwd.focus();
			}else if(email.value.trim() == ''){
				alert('이메일를 입력하세요.');
				email.focus();
			}else if(pwdComfirm.value.trim() == ''){
				alert('비밀번호를 확인하세요.');
				pwdComfirm.focus();
			}else if(phone.value.trim() == ''){
				alert('핸드폰 번호를 입력하세요.');
				phone.focus();
			}else{
				document.getElementById('signUpFrom').submit();
			}
		}
		
		// 비밀번호 정규화 체크
		function checkPwdReg(){
			const reg = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,15}$/;
			
			if(!reg.test(pwd.value)){
				alert("비밀번호는 숫자, 영어, 특수문자 포함 8자 이상 15자 미만으로 생성해주세요");
				pwd.focus();
			}
		}
		
		// 핸드폰 번호 정규화 체크
		function checkPhoneRef(){
			const reg = /^(010|011)\d{8}$/;
			
			if(!reg.test(phone.value)){
				alert("핸드폰 번호를 정확히 입력해주세요");
				phone.focus();
			}
		}
		
		// 아이디 정규화 체크
		function checkIdReg(){
			const reg = /^[a-zA-Z0-9]{6,}$/;
			console.log(reg.test(id.value));
			if(!reg.test(id.value)){
				alert("아이디는 영문/숫자 조합으로 입력해주세요");
				id.focus();
			}else{
				// 아이디 중복 체크(비동기 방식 통신 : 페이지 이동없이 실시간)
				const inputId = id.value;
				const idConfirmText = document.getElementById("idConfirmText");
				$.ajax({ 
					type: "post",
					url: '${contextPath}/checkId.me',
					data: {'id':inputId},  
					success:function(data){ 
						const result = data.result;
						if(data == 0){
							idConfirmText.innerText = '사용 가능한 아이디 입니다.';
							idConfirmText.style.color = 'green';
						}else{
							idConfirmText.innerText = '중복된 아이디 입니다.';
							idConfirmText.style.color = 'red';
						}
					},
					error: data =>console.log("에러")	
				});
			}
		}
		
		// 비밀번호 확인 일치 여부
		document.getElementById('pwdConfirm').addEventListener('keyup', function(){
			const pwd = document.getElementById('pwd');
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
			
		// 엔터 입력시 폼 제출
		const inputIdPwd = document.getElementsByTagName('input');
		for(const input of inputIdPwd){
			input.addEventListener('keyup', e =>{
				if(e.key == 'Enter'){
					doSignUp();
				}
			})
		}
		
		
		
		
	</script>
	
</body>
</html>