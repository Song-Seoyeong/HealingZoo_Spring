<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<meta charset="UTF-8">
<style>
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
	  position : absolute;
	  width: 17px;
	  top: 14px;
	  right: 12px;
	  margin: 0;
	}
	
	.form-check-input{
		transform : scale(0.5);
		accent-color: #65B741;
	}
	
	
	#delete_button{ background-color: #DD5353; width: 80px; height:35px; border: none;}
	#write_button{ background-color: #65B741; width: 80px; border: none; margin-right: 5px;}
	
	.pagination-container {
	  display: flex;
	  justify-content: center;
	}
	
	.number-button-wrapper {
		padding: 10px;
	}
	
	tr{text-align:center;}
	.nav-item a:hover{
	font-weight:bold;}
</style>
<title>내 답변 보기</title>
</head>
<body>
	<%@ include file='../common/logoBar.jsp' %>
	<%@ include file='../common/mainCategoryBar.jsp' %>
	<%@ include file='../common/memSidebar.jsp' %>
	
	<!-- 글 목록 -->
	<div class="container" style="width: 900px; margin-top: 100px;">
		<h2 style="border-left: 5px solid #65B741; padding-left: 10px; display: inline-block; margin-bottom: 15px;">내 댓글 보기</h2>
		<form action="${contextPath}/selDelComment.me">
		<table class="table">
			<thead>
				<tr>
					<th scope="col" style="width:100px;"><input type="checkbox" id="checkAll" style="cursor:pointer;"></th>
					<th scope="col">내용</th>
					<th scope="col">원문</th>
				</tr>
			</thead>
			<tbody class="table-group-divider">
				<c:forEach items="${ list }" var="list">
					<tr>
						<td><input class="getDelete" type="checkbox"  id="boardNo" name='boNoList' value="${ list.reNo }" style="cursor:pointer;"></td>
						<td scope="row">${ list.reContent }</td>
						<td>${ list.boardTitle }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="d-grid gap-2 d-md-flex justify-content-md-end" >
		<!-- 페이지네이션 -->
		<div class="container">
			<nav aria-label="Standard pagination" >
			    <ul class="pagination justify-content-center">
					<li class="page-item" >
						<c:url var="goBack" value="${loc}">
							<c:param name="page" value="${pi.currentPage - 1}"></c:param>
						</c:url> <!-- loc : 현재 url -->
						<a class="page-link" href="${goBack}" aria-label="Previous" style="color:black;">
						<span aria-hidden="true">&laquo;</span>
						</a>
					</li>
					<c:forEach begin="${pi.startPage}" end="${pi.endPage}" var="p">
						<c:url var="goNum" value="${loc}">
							<c:param name="page" value="${p}"/>
						</c:url>	            
					<li class="page-item"><a class="page-link" href="${ goNum }" style="color:black;">${p}</a></li>
					</c:forEach>
					<li class="page-item">
						<c:url var="goNext" value="${loc}">
							<c:param name="page" value="${pi.currentPage + 1}"/>
						</c:url>
						<a class="page-link" href="${ goNext }" aria-label="Next" style="color:black;">
						<span aria-hidden="true">&raquo;</span>
					</a>
					</li>
				</ul>
		    </nav>	
		</div>	
		<button class="btn btn-primary"  id="delete_button">삭제</button>
		</div>
		</form>
	</div>
	<!-- 검색 -->
	<div class="row justify-content-center"style="margin-bottom: 110px;" id="searchArea">
		<input name="search" class="col-2" type="search" placeholder="제목/내용을 입력하세요">
		<button class="col-1" style="background:white; border:none;"><img src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png" style="height:25px;" onclick="doSearch()"></button>
	</div>
	
	<script>
		// 체크박스모두 선택
	    document.querySelector('input[id="checkAll"]').addEventListener('change', function() {
	        const checkboxes = document.querySelectorAll('input[type="checkbox"]');
	        checkboxes.forEach(checkbox => {
	            checkbox.checked = this.checked;
	        });
	    });
	</script>
	<%@ include file='../common/footer.jsp' %>
</body>
</html>