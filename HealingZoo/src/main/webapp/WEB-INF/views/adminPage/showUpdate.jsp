<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
	.inputTitleName{
		font-size: 23px;
		white-space: nowrap;
	}
	#showContent{
		resize: none;
		border: 1px solid #D9D9D9;
		border-radius: 10px;
	}
	.nav-item a:hover{
	font-weight: bold;
	}
	#sideButton{color: #65B741; font-weight: bold;}
	
	#delete_button {
		background-color: #DD5353;
		width: 80px;
		border: none;
	}
	#write_button {
		background-color: #60A869;
		width: 80px;
		border: none;
		margin-right: 5px;
	}
	
</style>
<meta charset="UTF-8">
<title>프로그램 안내 관리</title>
</head>
<body>
	<%@ include file='../common/logoBar.jsp' %>
	<%@ include file='../common/mainCategoryBar.jsp'%>
	<%@ include file='../common/adminSidebar.jsp'%>
	
	
	<!-- input 영역 -->
	<form action="${ contextPath }/updateShow.admin" method="post" enctype='multipart/form-data'>
	<div class="container" style="width: 900px; margin-top: 100px; margin-bottom: 100px;">
		<div  style='margin-bottom: 100px;'>
			<h2 style="border-left: 5px solid #65B741; padding-left: 10px; display: inline-block; margin-bottom: 30px;">프로그램 안내</h2>
			
			<!-- 프로그램명 -->
			<div class='row'>
				<div class='col-1'>
					<input type='hidden' name='showNo' value='${ show.showNo }'>
					<input type='hidden' name='page' value='${ page }'>
				</div>
				<div class='col-2'>
					<p class='inputTitleName'>프로그램명 : </p>
				</div>
				<div class='col-7 text-center'>
					<input class="form-control" type="text" id="showName" name='showName' value='${ show.showName }'>
				</div>
				<div class='col-2'></div>
			</div>
			
			<!-- 프로그램 설명 -->
			<div class='row' style='margin-bottom:30px;'>
				<div class='col-1'></div>
				<div class='col-2'>
					<p class='inputTitleName'>프로그램 설명 : </p>
				</div>
				<div class='col-7 text-center'>
					<textArea cols='48' rows='4' id='showContent' name='showContent' style='resize: none;'>${ show.showContent }</textArea>
				</div>
				<div class='col-2'></div>
			</div>
			
			<!-- 사진 -->
			<div class='row' style='margin-bottom:30px;'>
				<div class='col-1'></div>
				<div class='col-2'>
					<p class='inputTitleName'>프로그램 사진 : </p>
				</div>
				<div class='col-7 text-center'>
					<img alt="${ mainImg.imgName }" src="${ contextPath }/resources/uploadImg/${ mainImg.imgRename }" width='300px'>
					<input type='hidden' name='checkDelete' value='none'/>
					<button type="button" class="btn btn-sm deleteImg" style='background: #DD5353; color: white;' id='img-${ mainImg.imgRename }'>삭제</button>
					
					<div id='inputFile' style='margin-top:50px;'></div>
				</div>
				<div class='col-2'></div>
			</div>
			<div class='row' style='margin-bottom:30px;'>
				<div class='col-1'></div>
				<div class='col-2'>
					<p class='inputTitleName' style='font-size:20px;'>마우스 오버 사진 : </p>
				</div>
				<div class='col-7 text-center'>
					<img alt="${ hoverImg.imgName }" src="${ contextPath }/resources/uploadImg/${ hoverImg.imgRename }" width='300px'>
					<input type='hidden' name='checkDelete' value='none'/>
					<button type="button" class="btn btn-sm deleteImg" style='background: #DD5353; color: white;' id='img-${ hoverImg.imgRename }'>삭제</button>
					<div id='inputFile' style='margin-top:50px;'></div>
				</div>
				<div class='col-2'></div>
			</div>
			<br><br>
			
			
			
			<!-- 버튼 -->
			<div class='text-end'>
				<button class="btn btn-primary" id="write_button">확인</button>
				<button class="btn btn-primary" type="button" id="delete_button" onclick='location.href="${contextPath}/show.admin"'>취소</button>
			</div>
		</div>
	</div>
	</form>
	
	<!-- 하단 푸터 -->
	<%@ include file='../common/footer.jsp'%>
	<!-- 하단 푸터 -->
	
	<script>
		document.getElementById('write_button').addEventListener('click', e =>{
			const name = document.getElementById('showName');
            const content = document.getElementById('showContent');
            const files = document.getElementsByName('file')[0];
            const fileHover = document.getElementsByName('file')[1];
            
            if (name.value.trim() === "") {
                alert("프로그램 이름을 입력해주세요");
                e.preventDefault();
            } else if (content.value.trim() === "") {
                alert("프로그램 내용을 입력해주세요");
                e.preventDefault();
            } else if (files[0].value.trim() === "") {
                alert("사진을 등록 해주세요");
                e.preventDefault();
            } else if (fileHover.value.trim() === "") {
                alert("마우스 오버 사진을 등록 해주세요");
                e.preventDefault();
            }
		})	
		
		// 기존 이미지 삭제 버튼
		const btns = document.getElementsByClassName('deleteImg');
		for(btn of btns){
			btn.addEventListener('click', function(){
				const hidden = this.previousElementSibling;
				const img = hidden.previousElementSibling;
				const inputFile = this.nextElementSibling;
				
				if(hidden.value == 'none'){
					this.innerText = '취소';
					this.style.background = '#60A869';
					hidden.value = this.id.split('-')[1];
					img.style.opacity = '0.5'
					inputFile.innerHTML = "<input class='form-control' type='file' name='file' accept='image/*'>";
				}else{
					this.innerText = '삭제';
					this.style.background = '#DD5353';
					hidden.value = 'none';
					img.style.opacity = '1';
					inputFile.innerHTML = "";
				}
			})
		}
	
	
	
	</script>
	
	
	
	
	
</body>
</html>