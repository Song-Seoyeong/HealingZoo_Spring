<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
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
	#searchPwd:hover{cursor:pointer}
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
		<p>아이디 찾기</p>
	</div>
	
	<!-- 여백용 -->
	<div style='margin: 5%'></div>
	
	<!-- 로그인폼 -->
	<form action='${ contextPath }/searchId.me' method='post' id='searchIdForm'>
		<div class="container-fluid">
		  <div class="row">
		    <div class="col"></div>
		    <div class="col-5">
		    	<div class="row g-3 align-items-center">
				  <div class="col-3">
				    <label for="name" class="form-label loginName">이름</label>
				  </div>
				  <div class="col-7">
				    <input type="text" class="form-control-lg" id="name" name='memName' placeholder="이름를 입력하세요" size='30' required>
				  </div>
				  <div class="col-auto">
				  </div>
				</div>
				<div style='margin: 3%'></div>
				<div class="row g-3 align-items-center">
				  <div class="col-3">
				    <label for="phone" class="form-label loginName">핸드폰 번호</label>
				  </div>
				  <div class="col-7">
				    <input type="text" class="form-control-lg" id="phone" name='memPhone' placeholder="핸드폰 번호를 입력하세요" size='30' required>
				  </div>
				  <div class="col-auto">
				  </div>
				</div>
				<div style='margin: 6%'></div>
				
				
				<div class="row g-3 align-items-center">
				  <div class="col-4"></div>
				  <div class="col-2">
				  	<button onclick='doLogin();' class="btn" style='background: #60A869; color: white;'>아이디 찾기</button>
				  </div>
				  <div class="col-3">
				  	<label id='searchPwd'>비밀번호 찾기</label>
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
		// 입력칸 빈칸 제출 확인
		const doLogin = ()=>{
			const name = document.getElementById('name');
			const phone = document.getElementById('phone');
			if(name.value.trim() == ''){
				alert('이름를 입력하세요.');
				name.focus();
			}else if(phone.value.trim() == ''){
				alert('핸드폰 번호를 입력하세요.');
				phone.focus();
			}else{
				document.getElementById('searchIdForm').submit();
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
		
		// 비밀번호 찾기 페이지 이동
		document.getElementById('searchPwd').addEventListener('click', () =>{
			location.href = '${contextPath}/searchPwdView.me';
		})
	</script>
</body>
</html>