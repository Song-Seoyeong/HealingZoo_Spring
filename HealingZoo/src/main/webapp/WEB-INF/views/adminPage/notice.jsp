<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항(관리자)</title>
<style>
@font-face {
	font-family: 'NanumSquareRound';
	src:
		url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/NanumSquareRound.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

.search {
	position: relative;
	width: 300px;
	display: inline-block;
	float: right;
	margin-bottom: 30px;
}

input {
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

#writeBoard {
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


</style>
<title>Insert title here</title>
</head>
<body>
	<%@ include file='../common/logoBar.jsp' %>
	<%@ include file='../common/mainCategoryBar.jsp'%>
	<%@ include file='../common/adminSidebar.jsp'%>
	
	<!-- 글 목록 -->
	<div class="container" style="width: 900px; margin-top: 100px;">
		<h2 style="border-left: 5px solid #65B741; padding-left: 10px; display: inline-block; margin-bottom: 15px;">공지사항</h2>
		<form id="filterForm" action="${ contextPath }/notice.admin/filter">
			<table class="table">
				<thead>
					<tr>
						<th scope="col" style="width: 3%"></th>
						<th scope="col" style="width: 10%;">글 번호</th>
						<th scope="col" style="width: 130px;">
							<select id="filterSelect" name="filter" aria-label="말머리 선택" 
									onchange="document.getElementById('filterForm').submit()" 
									style="border-style: none; text-align: center; background-color: #fff; font-family: 'NanumSquareRound';">
								<option value="" selected>말머리</option>
						        <option value="NEWS">새소식</option>
						        <option value="NOTICE">공지사항</option>
						        <option value="EVENT">이벤트</option>
							</select>
						</th>
						<th scope="col">글 제목</th>
						<th scope="col">작성자</th>
						<th scope="col" style="width: 120px;">작성일</th>
					</tr>
				</thead>
				<tbody class="table-group-divider">
					<c:forEach items="${ list }" var="n">
						<tr>
							<td><input class="form-check-input" type="checkbox" value="" id="flexCheckDefault"></td>
							<td scope="row">${ n.boardNo }</td>
							<c:if test="${ n.noSubject == 'NOTICE' }">
								<td>공지사항</td>
							</c:if>
							<c:if test="${ n.noSubject == 'EVENT' }">
								<td>이벤트</td>
							</c:if>
							<c:if test="${ n.noSubject == 'NEWS' }">
								<td>새소식</td>
							</c:if>
							<td>${ n.boardTitle }</td>
							<td>${ n.boardWriterName }</td>
							<td>${ n.boardCreateDate }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</form>
		<!-- 글 목록 -->


		<!-- 버튼 -->
		<div class="d-grid gap-2 d-md-flex justify-content-md-end">
			<button class="btn btn-primary" type="button" id="writeBoard">글쓰기</button>
			<button class="btn btn-primary" type="button" id="delete_button">삭제</button>
		</div>
		<!-- 버튼 -->



		<!-- 페이지네이션 -->
		<%@ include file="../common/pagination.jsp" %>
		<!-- 페이지네이션 -->



		<!-- 검색 -->
		<div class="row justify-content-center" style="margin-bottom: 100px;">
			<div class="col-4">
				<select class="form-select" aria-label="Default select example"
					style="display: inline-block; float: right; width: 200px; margin-right: 20px; border: 1px solid #bbb; padding: 10px 12px;">
					<option selected>----</option>
					<option value="1">작성자</option>
					<option value="2">제목</option>
					<option value="3">글 번호</option>
				</select>
			</div>
			<div class="col-4">
				<div class="search">
					<input type="text" placeholder="검색어 입력"> <img
						src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png"
						id="search">
				</div>
			</div>
		</div>
		<!-- 검색 -->


	</div>
	<!-- 하단 푸터 -->
	<%@ include file='../common/footer.jsp'%>
	<!-- 하단 푸터 -->



	<!-- 한 행 모두 클릭 가능하게 -->
	<script>

		const tds = document.querySelectorAll('td');
		for(const td of tds){
			const parent = td.parentElement;
			
			td.addEventListener('click', ()=>{
				const boardNo = parent.children[1].innerText;
				location.href = '${contextPath}/boardNoView.admin?bId=' + boardNo + "&page=" + ${pi.currentPage} + "&category=100";
			})
		}
		
		document.getElementById('writeBoard').addEventListener('click', () =>{
			location.href = '${contextPath}/writeView.bo?category=' + 'notice';
														//?category=question
		})
	</script>
	<!— 한 행 모두 클릭 가능하게 —>
</body>
</html>