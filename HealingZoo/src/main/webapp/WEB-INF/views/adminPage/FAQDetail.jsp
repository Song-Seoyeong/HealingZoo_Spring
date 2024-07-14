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
	#faqContent{
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
<title>자주 묻는 Q&A 관리</title>
</head>
<body>
	<%@ include file='../common/logoBar.jsp' %>
	<%@ include file='../common/mainCategoryBar.jsp'%>
	<%@ include file='../common/adminSidebar.jsp'%>
	
	
	<!-- input 영역 -->
	<div class="container" style="width: 900px; margin-top: 100px; margin-bottom: 100px;">
		<form action="${ contextPath }/insertShow.admin" method='post' enctype='multipart/form-data'>
			<div  style='margin-bottom: 100px;'>
				<h2 style="border-left: 5px solid #65B741; padding-left: 10px; display: inline-block; margin-bottom: 30px;">자주 묻는 Q&A 추가</h2>
				
				<!-- 질문 -->
				<div class='row'>
					<div class='col-1'>
						<input type='hidden' value='${ page }' name='page'>
						<input type='hidden' value='${ faq.boardNo }' name='boardNo'>
					</div>
					<div class='col-2'>
						<p class='inputTitleName'>질문 : </p>
					</div>
					<div class='col-7 text-start'>
						<h3>${ faq.boardTitle }</h3>
					</div>
					<div class='col-2'></div>
				</div>
				
				<!-- 답변 -->
				<div class='row' style='margin-bottom:30px;'>
					<div class='col-1'></div>
					<div class='col-2'>
						<p class='inputTitleName'>답변 : </p>
					</div>
					<div class='col-7 text-center'>
						<textArea cols='50' rows='15' id='faqContent' name='boardContent' readonly>${ faq.boardContent }</textArea>
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
		</form>
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
			location.href= '${contextPath}/updateFAQView.admin?FAQNo=' + ${faq.boardNo} + "&page=" + ${page};
		})
		
		// 삭제 버튼 클릭시
		document.getElementById('delete_button').addEventListener('click', () =>{
			$('#modalChoice').modal('show');
		})
		
		
		// 삭제
		document.getElementById('delete').addEventListener('click', () =>{
			location.href= '${contextPath}/deleteFAQ.admin?FAQNo=' + ${faq.boardNo};	
		})
		
		// 목록
		document.getElementById('goToBack').addEventListener('click', () =>{
			location.href = '${contextPath}/FAQ.admin?page=' + ${page};
		})
	
	
	
	</script>
	
	
	
	
</body>
</html>