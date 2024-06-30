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
	
	
	#delete_button{ background-color: #DD5353; width: 80px; border: none;}
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
<title>Insert title here</title>
</head>
<body>
	<%@ include file='../common/logoBar.jsp' %>
	<%@ include file='../common/mainCategoryBar.jsp' %>
	<%@ include file='../common/memSidebar.jsp' %>
	
	<!-- 글 목록 -->
	<div class="container" style="width: 900px; margin-top: 100px;  ">
		  <h2 style="border-left: 5px solid #65B741; padding-left: 10px; display: inline-block; margin-bottom: 15px;">내 게시글 보기</h2>
		<table class="table">
		  <thead>
		    <tr>
		      <th scope="col" style="width:100px"><input class="form-check-input" type="checkbox" name="all" id="flexCheckDefault"></th>
		      <th scope="col" style="width:100px"><select name="header"style="border:none;">
		                        <option value="whole">전체</option>
		                      	<option value="review">후기</option>
		                      	<option value="book">예약</option>
		                      	<option value="inquiry">문의</option>
		                      </select>
		     </th>
		      <th scope="col">글 제목</th>
		      <th scope="col">작성자</th>
		      <th scope="col">작성일</th>
		    </tr>
		  </thead>
		
		  <tbody class="table-group-divider">
		  <c:forEach items="${ list }" var="b">
		  	
				  <tr>
				  	<td><input class="form-check-input" type="checkbox" name="one" id="flexCheckDefault"></td>
					<c:if test="${ b.cateNo == 100}">
						<td>공지</td>
					</c:if>
					<c:if test="${ b.cateNo == 101}">
						<td>문의사항</td>
					</c:if>
					<c:if test="${ b.cateNo == 102}">
						<td>후기</td>
					</c:if>
					<c:if test="${ b.cateNo == 103}">
						<td>예약</td>
					</c:if>
					<td>${ b.boardTitle }</td>
					<td>${ b.boardWriterName }</td>
					<td>${ b.boardCreateDate }</td>
				  </tr>
			  
		  </c:forEach>
		  </tbody>
		</table>
		<div class="d-grid gap-2 d-md-flex justify-content-md-end">
			<!-- 페이지네이션 -->
			<div class="container">
			   <nav aria-label="Standard pagination" >
	        	<ul class="pagination justify-content-center">
		            <li class="page-item" >
		            	<c:url var="goBack" value="${loc}">
		            		<c:param name="oage" value="${pi.currentPage - 1}"></c:param>
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
		
			<button class="btn btn-primary" type="button" id="delete_button">삭제</button>
		</div>
		
		
		<!-- 검색 -->
		<div class="row justify-content-center" style="margin-bottom: 100px;">
			<div class="col-4">
				<select class="form-select" aria-label="Default select example" 
				style="display:inline-block; float: right; width: 200px; margin-right: 20px; border: 1px solid #bbb;
				padding: 10px 12px;">
					<option selected>----</option>
					<option value="1">작성자</option>
					<option value="2">제목</option>
					<option value="3">글 번호</option>
				</select>
			</div>
			<div class="col-4">
				<div class="search">
					<input type="text" placeholder="검색어 입력">
					<img src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png" id="search">
				</div>
			</div>
		</div>
	</div>

	<script>
		const tds = document.querySelectorAll('td');
		for(const td of tds){
			const parent = td.parentElement;
			td.addEventListener('click', ()=>{
				location.href='${contextPath}/views/common/boardDetail.jsp';
			})
		}
			
	</script>	
	
	<%@ include file='../common/footer.jsp' %>
</body>
</html>