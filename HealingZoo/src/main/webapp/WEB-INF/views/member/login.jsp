<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
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
		<p>로그인</p>
	</div>
	
	<!-- 여백용 -->
	<div style='margin: 5%'></div>
	
	<!-- 로그인폼 -->
	<form action='${ contextPath }/login.me' method='post' id='loginForm'>
		<div class="container-fluid">
		  <div class="row">
		    <div class="col"></div>
		    <div class="col-5">
		    	<div class="row g-3 align-items-center">
				  <div class="col-3">
				    <label for="inputId" class="form-label loginName">아이디</label>
				  </div>
				  <div class="col-7">
				    <input type="text" class="form-control-lg" id="id" name='memId' placeholder="아이디를 입력하세요" size='30' required>
				  </div>
				  <div class="col-auto">
				  </div>
				</div>
				<div style='margin: 3%'></div>
				<div class="row g-3 align-items-center">
				  <div class="col-3">
				    <label for="inputPassword" class="form-label loginName">비밀번호</label>
				  </div>
				  <div class="col-7">
				    <input type="password" id="pwd" class="form-control-lg" name='memPwd' aria-describedby="passwordHelpInline" placeholder="비밀번호를 입력하세요" size='30' required>
				  </div>
				  <div class="col-auto">
				  </div>
				</div>
				<div style='margin: 6%'></div>
				
				
				<div class="row g-3 align-items-center">
				  <div class="col-4"></div>
				  <div class="col-2">
				  	<button onclick='doLogin();' class="btn" style='background: #60A869; color: white;'>로그인</button>
				  </div>
				  <div class="col-2">
				  	<label id='searchId'>아이디 찾기</label>
				  </div>
				  <div class="col-2">
				  	<label id='searchPwd'>비밀번호 찾기</label>
				  </div>
				  <div class="col-2"></div>
				</div>
		    </div>
		    <div class="col"><input type='hidden' name='beforeURL'></div>
		  </div>
		</div>
	</form>
	
	<div style='margin: 10%'></div>
	
	<!-- 푸터 -->
	<%@ include file='../common/footer.jsp' %>
	<!-- /푸터 -->	
	
	<script>
		
		// 로그인 인터셉트
		const msg = '${msg}';
		const beforeURL = document.referrer;
		
		if(msg != ''){
			alert(msg);
			document.getElementsByName('beforeURL')[0].value = beforeURL;
		}
	
		// 입력창 비었을 때 알림창
		const doLogin = ()=>{
			const id = document.getElementById('id');
			const pwd = document.getElementById('pwd');
			if(id.value.trim() == ''){
				alert('아이디를 입력하세요.');
				id.focus();
			}else if(pwd.value.trim() == ''){
				alert('비밀번호를 입력하세요.');
				pwd.focus();
			}else{
				document.getElementById('loginForm').submit();
			}
		}	
		
		// 엔터 입력시 폼 제출
		const inputIdPwd = document.getElementsByTagName('input');
		for(const input of inputIdPwd){
			input.addEventListener('keyup', e =>{
				if(e.key == 'Enter'){
					doLogin();
				}
			})
		}
		
		// 아이디 찾기 창 이동
		document.getElementById('searchId').addEventListener('click', () =>{
			location.href = '${contextPath}/searchIdView.me';
		})
		
		// 비밀번호 찾기 창 이동
		document.getElementById('searchPwd').addEventListener('click', () =>{
			location.href = '${contextPath}/searchPwdView.me';
		})
	</script>
	
	<% session.removeAttribute("msg"); %>
</body>
</html>