<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<meta charset="UTF-8">
<style>
@font-face {
    font-family: 'NanumSquareRound';
    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/NanumSquareRound.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

.form-check-input {
	transform: scale(0.5);
	accent-color: #65B741;
}
#delete_button {
	background-color: #DD5353;
	width: 80px;
	border: none;
}
#write_button {
	background-color: #65B741;
	width: 80px;
	border: none;
	margin-right: 5px;
}
.pagination-container {
	display: flex;
	justify-content: center;
}
.number-button-wrapper {
	padding: 10px;
}
tr {
	text-align: center;
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
		<h2 style="border-left: 5px solid #65B741; padding-left: 10px; display: inline-block; margin-bottom: 15px;">후기 리스트</h2>
		<table class="table">
			<thead>
				<tr>
					<th scope="col" style="width: 3%"></th>
					<th scope="col" style="width: 8%;">글 번호</th>
					<th scope="col" style="width: 50%;">글 제목</th>
					<th scope="col" style="width: 10%">작성자</th>
					<th scope="col" style="width: 13%;">작성일</th>
					<th scope="col" style="width: 8%">조회수</th>
				</tr>
			</thead>
			<tbody class="table-group-divider">
				<c:forEach items="${ list }" var="r">
					<tr> 
						<th><input class="form-check-input" type="checkbox" value="" id="flexCheckDefault"></th>
						<td scope="row">${ r.boardNo }</td>
						<td>${ r.boardTitle }</td>
						<td>${ r.boardWriterName }</td>
						<td>${ r.boardModifyDate }</td>
						<td>${ r.boardCount }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<!-- 글 목록 -->


		<!-- 버튼 -->
		<div class="d-grid gap-2 d-md-flex justify-content-md-end">
			<button class="btn btn-primary" type="button" id="delete_button">삭제</button>
		</div>
		<!-- 버튼 -->



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
				  <option value="content">내용</option>
				  <option value="writer">작성자</option>
				</select>
				&nbsp;&nbsp;
		    	<input type='text' name='search' size='30' placeholder='제목/내용/작성자로 검색 가능'/>
		    	&nbsp;&nbsp;
		    	<img src="resources/image/search.svg" id='searchIcon'>
		    </div>
		    <div class="col"></div>
		  </div>
		</div>
		<!-- 검색 -->


	</div>
	<!-- 하단 푸터 -->
	<%@ include file='../common/footer.jsp'%>
	<!-- 하단 푸터 -->



	<script>
	
		// 상세 글 보기 이동
		const tds = document.querySelectorAll('td');
		for(const td of tds){
			const parent = td.parentElement;
			
			td.addEventListener('click', ()=>{
				const boardNo = parent.children[1].innerText;
				location.href = '${contextPath}/boardView.admin?bId=' + boardNo + "&page=" + ${pi.currentPage} + "&category=102";
			});
		}
		
		
		// 검색창 검색
		document.getElementById('searchIcon').addEventListener('click', function(){
			const condition = this.parentElement.children[0].value;
			const search = this.parentElement.children[1].value;
			
			location.href = "${contextPath}/searchReview.admin?condition=" + condition + "&search=" + search + "&page=" + ${pi.currentPage};
		})
		
		
		// 엔터 키로 검색 실행
		  document.querySelector('input[name="search"]').addEventListener('keyup', function(event) {
		    if (event.key === 'Enter') {
		      const condition = this.parentElement.children[0].value;
		      const search = this.value;
		      location.href = "${contextPath}/searchReview.admin?condition=" + condition + "&search=" + search + "&page=" + ${pi.currentPage};
		    }
		  });
		
		
		
		
		
		
		
		
	</script>
	
	
	
	
	
	
	
</body>
</html>