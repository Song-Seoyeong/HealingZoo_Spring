<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<meta charset="UTF-8">
<style>
.search {
	position: relative;
	width: 300px;
}

#searchText {
	width: 100%;
	border: 1px solid #bbb;
	border-radius: 8px;
	padding: 10px 12px;
	font-size: 14px;
}

#search {
	position: absolute;
	width: 17px;
	top: 14px;
	right: 12px;
	margin: 0;
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
		<h2
			style="border-left: 5px solid #65B741; padding-left: 10px; display: inline-block; margin-bottom: 15px;">문의사항</h2>

		<table class="table text-center">
			<thead>
				<tr>
					<th scope="col" style="width: 3%;"></th>
					<th scope="col">글 번호</th>
					<th scope="col">글 제목</th>
					<th scope="col">작성자</th>
					<th scope="col">작성일</th>
					<th scope="col">진행상태</th>
				</tr>
			</thead>
			<tbody class="table-group-divider">
				<c:forEach items="${ list }" var="q">
					<tr>
						<td><input class="form-check-input" type="checkbox" value="" id="flexCheckDefault"></td>
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
			<button class="btn btn-primary" type="button" id="write_button">글쓰기</button>
			<button class="btn btn-primary" type="button" id="delete_button">삭제</button>
		</div>
		
		
		<!-- 페이지네이션 -->
		<%@ include file="../common/pagination.jsp" %>
		<!-- 페이지네이션 -->


		<!-- 검색 -->
		<div class="row justify-content-center" style="margin-bottom: 100px;">
			<div class="col-4">
				<select class="form-select" aria-label="Default select example"
					style="display: inline-block; float: right; width: 200px;">
					<option selected>----</option>
					<option value="1">작성자</option>
					<option value="2">제목</option>
					<option value="3">글 번호</option>
				</select>
			</div>
			<div class="col-4">
				<div class="search">
					<input id="searchText" type="text" placeholder="검색어 입력"> 
					<img src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png" id="search">
				</div>
			</div>
		</div>
	</div>
	<!-- 검색 -->


	<!-- 한 행 모두 클릭 가능하게 -->
	<script>
		const tds = document.querySelectorAll('td');
		for(const td of tds){
			const parent = td.parentElement;
			td.addEventListener('click', ()=>{
				const boardNo = parent.children[1].innerText;
				location.href = '${contextPath}/views/adminPage/noticeAdminBoardWrite.jsp';
			})
		}
	</script>
	<!-- 한 행 모두 클릭 가능하게 -->


	<!-- 하단 푸터 -->
	<%@ include file='../common/footer.jsp'%>
	<!-- 하단 푸터 -->
</body>
</html>