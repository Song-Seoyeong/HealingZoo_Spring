<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 비밀번호 확인</title>
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
</style>
</head>
<body>
	<!-- 헤더 -->
	<%@ include file='../common/logoBar.jsp' %>
	<%@ include file='../common/mainCategoryBar.jsp' %>
	<!-- /헤더 -->
	
	<!-- 여백용 -->
	<div style='margin: 3%'></div>
	<!-- 여백용 -->
	<div style='margin: 5%'></div>
	
	
	<div id='loginImg'>
		<br>
		<p>${ category == 103 ? '예약' : '문의'} 게시글 비밀번호 확인</p>
	</div>
	
	
	<!-- 비밀번호 확인 폼 -->
	<form action='${ contextPath }/checkPwd.bo' method='post' id='pwdForm'>
		<input type='hidden' name='boardNo' value='${ bId }'>
		<input type='hidden' name='page' value='${ page }'>
		<input type='hidden' name='cateNo' value='${ category }'/>
		<div class="container-fluid">
		  <div class="row">
		    <div class="col"></div>
		    <div class="col-5">
				<div style='margin: 3%'></div>
				<div class="row g-3 align-items-center">
				  <div class="col-3">
				    <label for="inputPassword" class="form-label loginName">비밀번호</label>
				  </div>
				  <div class="col-7">
				    <input type="password" id="pwd" class="form-control-lg" name='boPwd' aria-describedby="passwordHelpInline" placeholder="비밀번호를 입력하세요" size='30' required>
				  </div>
				  <div class="col-auto">
				  </div>
				</div>
				<div style='margin: 6%'></div>
				
				<div class="row g-3 align-items-center">
				  <div class="col-5">
				  </div>
				  <div class="col-2">
				  	<button type='button' id='pwdConfirm' class="btn" style='background: #60A869; color: white;'>확인</button>
				  </div>
				  <div class="col-5">
				  </div>
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
		document.getElementById("pwdConfirm").addEventListener("click", () =>{
			const pwd = document.getElementById('pwd');
			const pwdForm = document.getElementById('pwdForm');
			
			if(pwd.value == ''){
				alert('비밀번호를 확인해주세요');
				pwd.focus;	
			}else{
				pwdForm.submit();
			}
		})
	</script>
</body>
</html>