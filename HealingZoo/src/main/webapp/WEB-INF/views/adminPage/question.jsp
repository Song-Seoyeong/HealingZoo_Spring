<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<meta charset="UTF-8">
<title>문의사항(관리자)</title>
<style>


.form-check-input {
	transform: scale(1);
	accent-color: #65B741;
}

#deleteButton {
	background-color: #DD5353;
	width: 80px;
	border: none;
}

.pagination-container {
	display: flex;
	justify-content: center;
}

.number-button-wrapper {
	padding: 10px;
}

.complete {
	color: #65B741;
}

.Incomplete {
	color: #EA862A;
}
.nav-item a:hover{
	font-weight: bold;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<%@ include file='../common/logoBar.jsp' %>
	<%@ include file='../common/mainCategoryBar.jsp'%>
	<%@ include file='../common/adminSidebar.jsp'%>
	
	<!-- 글 목록 -->
	<div class="container" style="width: 900px; margin-top: 100px;">
		<h2 style="border-left: 5px solid #65B741; padding-left: 10px; display: inline-block; margin-bottom: 15px;">문의사항</h2>

		<table class="table table-hover text-center">
			<thead>
				<tr>
					<th scope="col" style="width: 3%;"><input class="form-check-input" type="checkbox" id="checkAll"></th>
					<th scope="col" style="width: 8%;">글 번호</th>
					<th scope="col" style="width: 50%;">글 제목</th>
					<th scope="col" style="width: 10%;">작성자</th>
					<th scope="col" style="width: 13%;">작성일</th>
					<th scope="col" style="width: 10%;">진행상태</th>
				</tr>
			</thead>
			<tbody class="table-group-divider">
				<c:forEach items="${ list }" var="q">
					<tr>
						<th><input class="form-check-input" type="checkbox" value="${ q.boardNo }" name="checked" id="flexCheckDefault"></th>
						<td scope="row">${ q.boardNo }</td>
						<td>${ q.boardTitle }</td>
						<td>${ q.boardWriterName }</td>
						<td>${ q.boardCreateDate }</td>
						<c:if test="${ q.quBoBoardStatus == 'N' }">
							<td style='color: red;'>미답변</td>
						</c:if>
						<c:if test="${ q.quBoBoardStatus == 'Y' }">
							<td style='color: green;'>답변</td>
						</c:if>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<div class="d-grid gap-2 d-md-flex justify-content-md-end">
			<button class="btn btn-primary" type="button" id="deleteButton">삭제</button>
		</div>
		
		<!-- 선택된 게시물의 상태 업데이트를 위한 숨은 폼 -->
		<form id="updateForm" action="${contextPath}/checkDelete.admin" method="post" style="display: none;">
		    <input type="hidden" name="updateBoardNos" id="updateBoardNos" />
		</form>
		
		
		<!-- 메시지 표시 -->
		<c:if test="${not empty message}">
		    <div class="alert alert-success" role="alert">
		        ${message}
		    </div>
		</c:if>
		<c:if test="${not empty error}">
		    <div class="alert alert-danger" role="alert">
		        ${error}
		    </div>
		</c:if>
		
		
		<!-- 페이지네이션 -->
		<%@ include file="../common/pagination.jsp" %>
		
		<!-- 페이지네이션 -->


		<!-- 검색 -->
         <div class="container text-center" style='margin: 1%; margin-bottom: 20%; '>
		  <div class="row">
		    <div class="col"></div>
		    <div class="col-8">
		    	<select name='searchOption'>
				  <option value="title" selected>제목</option>
				  <option value="writer">작성자</option>
				  <option value="phone">핸드폰 번호</option>
				</select>
				&nbsp;&nbsp;
		    	<input type='text' name='search' size='30' placeholder='제목/작성자/핸드폰 번호로 검색 가능'/>
		    	&nbsp;&nbsp;
		    	<img src="resources/image/search.svg" id='searchIcon'>
		    </div>
		    <div class="col"></div>
		  </div>
		</div>	
		<!-- 검색 -->
	</div>
	
	
	<script>
	
		// 상세 글 보기 이동
		const tds = document.querySelectorAll('td');
		for(const td of tds){
			const parent = td.parentElement;
			td.addEventListener('click', ()=>{
				const boardNo = parent.children[1].innerText;
				location.href = '${contextPath}/boardQuBoView.admin?bId=' + boardNo + "&page=" + ${pi.currentPage} + "&category=101";
			});
		}
		
		
		// 검색창 검색
		document.getElementById('searchIcon').addEventListener('click', function(){
			const condition = this.parentElement.children[0].value;
			const search = this.parentElement.children[1].value;
			
			location.href = "${contextPath}/searchQuestion.admin?condition=" + condition + "&search=" + search + "&page=" + ${pi.currentPage};
		});
		
		// 엔터 키로 검색 실행
		  document.querySelector('input[name="search"]').addEventListener('keyup', function(event) {
		    if (event.key === 'Enter') {
		      const condition = this.parentElement.children[0].value;
		      const search = this.value;
		      location.href = "${contextPath}/searchQuestion.admin?condition=" + condition + "&search=" + search + "&page=" + ${pi.currentPage};
		    }
		  });
		
		
		// 삭제 버튼 클릭 시 선택된 게시물 상태 업데이트
		document.getElementById('deleteButton').addEventListener('click', function() {	
		    const checkedBoxes = document.querySelectorAll('input[name="checked"]:checked');
		    const updateBoardNos = Array.from(checkedBoxes).map(cb => cb.value).join(',');

		    if (updateBoardNos.length === 0) {
		        alert('삭제할 게시물을 선택해주세요.');
		        return;
		    }

		    if (!confirm('게시글을 삭제 하시겠습니까?')) {
		        return;
		    }

		    // 숨은 폼 필드에 선택된 게시물 ID 할당
		    document.getElementById('updateBoardNos').value = updateBoardNos;

		    // 폼 제출
		    document.getElementById('updateForm').submit();
		});
		
	    // 체크박스 전체 선택
		document.querySelector('input[id="checkAll"]').addEventListener('change', function() {
			const checkboxes = document.querySelectorAll('input[type="checkbox"]');
				checkboxes.forEach(checkbox => {
				checkbox.checked = this.checked;
			});	
		});   
	    
		//해당 게시글 마우스오버시 포인터 변환
		for(const td of tds){
			td.addEventListener('mouseover',function() {
				this.style.cursor = 'pointer';
			})
		}	
		</script>


	<!-- 하단 푸터 -->
	<%@ include file='../common/footer.jsp'%>
	<!-- 하단 푸터 -->
</body>
</html>