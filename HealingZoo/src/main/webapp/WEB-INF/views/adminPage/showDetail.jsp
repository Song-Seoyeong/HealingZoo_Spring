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
	
	#goToBack {
		background-color: #60A869;
		width: 80px;
		border: none;
		margin-right: 5px;
	}
	#delete_button {
		background-color: #DD5353;
		width: 80px;
		border: none;
	}
	#revision_button{
		background-color: orange;
		width: 80px;
		border: none;
		margin-right: 5px;
	}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file='../common/logoBar.jsp' %>
	<%@ include file='../common/mainCategoryBar.jsp'%>
	<%@ include file='../common/adminSidebar.jsp'%>
	
	
	<!-- input 영역 -->
	<div class="container" style="width: 900px; margin-top: 100px; margin-bottom: 100px;">
		<div  style='margin-bottom: 100px;'>
			<h2 style="border-left: 5px solid #65B741; padding-left: 10px; display: inline-block; margin-bottom: 30px;">프로그램 안내</h2>
			
			<!-- 프로그램명 -->
			<div class='row'>
				<div class='col-1'>
					<input type='hidden' value='${ page }' name='page'>
					<input type='hidden' value='${ show.showNo }'>
				</div>
				<div class='col-2'>
					<p class='inputTitleName'>프로그램명 : </p>
				</div>
				<div class='col-7'>
					${ show.showName }
				</div>
				<div class='col-2'></div>
			</div>
			
			<!-- 프로그램 설명 -->
			<div class='row' style='margin-bottom:30px;'>
				<div class='col-1'></div>
				<div class='col-2'>
					<p class='inputTitleName'>프로그램 설명 : </p>
				</div>
				<div class='col-7'>
					<textArea cols='48' rows='4' id='showContent' name='showContent' readonly style='resize: none;'>${ show.showContent }</textArea>
				</div>
				<div class='col-2'></div>
			</div>
			
			<!-- 사진 -->
			<div class='row' style='margin-bottom:30px;'>
				<div class='col-1'></div>
				<div class='col-2'>
					<p class='inputTitleName'>프로그램 사진 : </p>
				</div>
				<div class='col-7 text-center' >
					<img alt="${ mainImg.imgName }" src="${ contextPath }/resources/uploadImg/${ mainImg.imgRename }" width='300px'>
				</div>
				<div class='col-2'></div>
			</div>
			<div class='row' style='margin-bottom:30px;'>
				<div class='col-1'></div>
				<div class='col-2'>
					<p class='inputTitleName' style='font-size:20px;'>마우스 오버 사진 : </p>
				</div>
				<div class='col-7 text-center' width='300px'>
					<img alt="${ hoverImg.imgName }" src="${ contextPath }/resources/uploadImg/${ hoverImg.imgRename }" width='300px'>
				</div>
				<div class='col-2'></div>
			</div>
			<br><br>
			
			
			
			<!-- 버튼 -->
			<div class='text-end'>
				<button type="button" class="btn btn-primary" id='goToBack'>목록</button>
				<button class="btn btn-primary" type="button" id="revision_button">수정</button>
				<button class="btn btn-primary" type="button" id="delete_button">삭제</button>
			</div>
		</div>
	</div>
	
	<!-- 삭제 모달 -->
		<div class="modal fade" tabindex="-1" role="dialog" id="modalChoice">
			<div class="modal-dialog" role="document">
				<div class="modal-content rounded-3 shadow">
					<div class="modal-body p-4 text-center">
						<h3 class="mb-0">정말로 삭제하시겠습니까?</h3>
						<p class="mb-0">삭제 후 컨텐츠는 복구할 수 없습니다.</p>
					</div>
					<div class="modal-footer flex-nowrap p-0">
						<button type="button"class="btn btn-lg btn-link fs-6 text-decoration-none col-6 m-0 rounded-0 border-end" id='delete'>
							<strong>네</strong>
						</button>
						<button type="button" class="btn btn-lg btn-link fs-6 text-decoration-none col-6 m-0 rounded-0" data-bs-dismiss="modal">아니오</button>
					</div>
				</div>
			</div>
		</div>
		<!-- 삭제 모달 -->
	
	<!-- 하단 푸터 -->
	<%@ include file='../common/footer.jsp'%>
	<!-- 하단 푸터 -->
	
	<script>
	
	// 수정
	document.getElementById('revision_button').addEventListener('click', () =>{
		location.href= '${contextPath}/updateShowView.admin?showNo=' + ${show.showNo} + "&page=" + ${page};
	})
	
	// 삭제 버튼 클릭시
	document.getElementById('delete_button').addEventListener('click', () =>{
		$('#modalChoice').modal('show');
	})
	
	
	// 삭제
	document.getElementById('delete').addEventListener('click', () =>{
		location.href= '${contextPath}/deleteShow.admin?showNo=' + ${show.showNo};	
	})
	
	// 목록
	document.getElementById('goToBack').addEventListener('click', () =>{
		location.href = '${contextPath}/show.admin?page=' + ${page};
	})
	
	
	
	</script>
</body>
</html>