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

.form-check-input {
	transform: scale(0.5);
	accent-color: #65B741;
}

#deleteButton {
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
							<select aria-label="말머리 선택" id='searchFilter' name='noSubject' style="border-style: none;  text-align: center; background-color: #fff; font-family: 'NanumSquareRound';">
								<option selected>말머리</option>
								<option value="전체">전체</option>
						        <option value="NEWS">새소식</option>
						        <option value="NOTICE">공지사항</option>
						        <option value="EVENT">이벤트</option>
							</select>
						</th>
						<th scope="col" width='43%'>글 제목</th>
					    <th scope="col" width='7%'>작성자</th>
					    <th scope="col" width='20%'>작성일</th>
					    <th scope="col" width='8%'>조회수</th>
					</tr>
				</thead>
				<tbody class="table-group-divider">
					<c:forEach items="${ list }" var="n">
						<tr>
							<th><input class="form-check-input" type="checkbox" value="" id="flexCheckDefault"></th>
							<td scope="row">${ n.boardNo }</td>
							<c:if test="${ n.noSubject == 'NOTICE' }">
								<td>공지</td>
							</c:if>
							<c:if test="${ n.noSubject == 'EVENT' }">
								<td>이벤트</td>
							</c:if>
							<c:if test="${ n.noSubject == 'NEWS' }">
								<td>새소식</td>
							</c:if>
							<td>${ n.boardTitle }</td>
							<td>${ n.boardWriterName }</td>
							<td>${ n.boardModifyDate }</td>
							<td>${ n.boardCount }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</form>
		<!-- 글 목록 -->

		<!-- form을 만들어서 hidden으로 숨겨놓기  -->

		<!-- 버튼 -->
		<div class="d-grid gap-2 d-md-flex justify-content-md-end">
			<button class="btn btn-primary" type="button" id="writeBoard">글쓰기</button>
			<button class="btn btn-primary" type="button" id="deleteButton">삭제</button>
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
					</select>
					&nbsp;&nbsp;
			    	<input type='text' name='search' size='30' placeholder='제목/내용으로 검색 가능'/>
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
				location.href = '${contextPath}/boardView.admin?bId=' + boardNo + "&page=" + ${pi.currentPage} + "&category=100";
			})
		}
		
		// 글쓰기 이동
		document.getElementById('writeBoard').addEventListener('click', () =>{
			location.href = '${contextPath}/writeView.bo?category=' + 'notice';
														//?category=question
		})
		
		
		// 말머리 검색
		document.getElementById('searchFilter').addEventListener('change', function(){
			location.href = '${contextPath}/searchFilter.admin?noSubject=' + this.value + "&page=" + ${pi.currentPage};
		})
		
		// 검색창 검색
		document.getElementById('searchIcon').addEventListener('click', function(){
			const condition = this.parentElement.children[0].value;
			const search = this.parentElement.children[1].value;
			
			location.href = "${contextPath}/searchNotice.admin?condition=" + condition + "&search=" + search + "&page=" + ${pi.currentPage};
		})
		
		// 엔터 키로 검색 실행
		document.querySelector('input[name="search"]').addEventListener('keyup', function(event) {
		  if (event.key === 'Enter') {
		    const condition = this.parentElement.children[0].value;
		    const search = this.value;
		    location.href = "${contextPath}/searchNotice.admin?condition=" + condition + "&search=" + search + "&page=" + ${pi.currentPage};
		  }
		});
		
		
		
	             
	             
	</script>
	<!-- 한 행 모두 클릭 가능하게 -->
</body>
</html>