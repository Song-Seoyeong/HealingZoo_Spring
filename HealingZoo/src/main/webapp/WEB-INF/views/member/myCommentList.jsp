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
		<form action="${contextPath}/selDelComment.me" onsubmit="return check()">
		<table class="table table-hover">
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
						<th><input class="getDelete" type="checkbox"  id="boardNo" name='boNoList' value="${ list.reNo }" ></th>
						<td scope="row">${ list.reContent }</td>
						<td><input type="hidden" id="comBoNo" class="comBoNo" value="${ list.boardNo }">${ list.boardTitle }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="d-grid gap-2 d-md-flex justify-content-md-end" >
		<!-- 페이지네이션 -->
			<div class="container">
			   <input type='hidden' name='value' value='${ value }' id='searchValue'>
			   <nav aria-label="Standard pagination" >
	        	<ul class="pagination justify-content-center">
		            <li class="page-item" >
		          	  <c:if test="${ empty value  }">
			            	<c:url var="goBack" value="${loc}">
			            		<c:param name="page" value="${pi.currentPage - 1}"/>
			            	</c:url>
	            		</c:if>
		            	<c:if test="${ value != null }">
			            	<c:url var="goBack" value="/search.me">
			            		<c:param name="value" value="${ value }"/>
			            		<c:param name="page" value="${pi.currentPage - 1}"/>
			            	</c:url>
	            		</c:if>
		            	<a class="page-link" href="${goBack}" aria-label="Previous" style="color:black;">
		            		<span aria-hidden="true">&laquo;</span>
		              	</a>
		            </li>
		            
					<c:forEach begin="${pi.startPage}" end="${pi.endPage}" var="p">
						<c:if test="${ empty value  }">
			            	<c:url var="goNum" value="${ loc }">
			            		<c:param name="page" value="${p}"/>
			            	</c:url>
	            		</c:if>
		            	<c:if test="${ value != null }">
			            	<c:url var="goNum" value="/search.me">
		            			<c:param name="value" value="${ value }"/>
			            		<c:param name="page" value="${p}"/>
			            	</c:url>
	            		</c:if>
		            	<li class="page-item"><a class="page-link" href="${ goNum }" style="color:black;">${p}</a></li>
		            </c:forEach>
		            
		            <li class="page-item">
		            	<c:if test="${ empty value }">
			            	<c:url var="goNext" value="${loc}">
			            		<c:param name="page" value="${pi.currentPage + 1}"/>
			            	</c:url>
	            		</c:if>
		            	<c:if test="${ value != null }">
			            	<c:url var="goNext" value="/search.me">
		            			<c:param name="value" value="${ value }"/>
			            		<c:param name="page" value="${pi.currentPage + 1}"/>
			            	</c:url>
	            		</c:if>
		            	<a class="page-link" href="${ goNext }" aria-label="Next" style="color:black;">
		            		<span aria-hidden="true">&raquo;</span>
		            	</a>
		            </li>
		    	</ul>
	        	</nav>
			</div>	
			<!-- 페이지 네이션 -->	
		<button class="btn btn-primary"  id="delete_button">삭제</button>
		</div>
		</form>
	</div>
	<!-- 검색 -->
	<div class="row justify-content-center"style="margin-bottom: 110px;" id="searchArea">
		<input name="search" class="col-3" type="search" placeholder="제목/내용을 입력하세요">
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
		
		//선택시 원문 이동
		const tds = document.querySelectorAll('td')
		for(const td of tds){
			td.addEventListener('click', () => {
				const parent = td.parentElement
				const boardNo = parent.children[2].children[0].value
				const reNo = parent.children[0].children[0].value
				location.href="${contextPath}/originView.me?bId="+ boardNo + '&page=' + ${pi.currentPage};
			})
		}
		//해당 게시글 마우스오버시 색 변환
		for(const td of tds){
			td.addEventListener('mouseover',function() {
				this.style.cursor = 'pointer';
			})
		}
		
		
		//검색창
		document.getElementById('searchArea').querySelector('button').addEventListener('click', function(){
			doSearch(this);
		});
		
		const doSearch = (obj) =>{ //obj는 객체인 버튼을 의미
			const className = obj.className;
			let value = null; //초기화를 해주기 위함
			if(className == 'col-1'){ // button
				value = obj.previousElementSibling.value; //버튼을 클릭하면 search값을 받아옴
			} else { // enter
				value = obj.value; //엔터시 보내오는 값을 받아옴
			}
			location.href="${contextPath}/searchCom.me?value="+ value + '&page=' + ${pi.currentPage};	
		}
	
		
		//검색 창 엔터 검색
		const inputSearch = document.getElementsByTagName('input')
		for(const input of inputSearch){
			input.addEventListener('keyup', function(e){
				if(e.key.toLowerCase() == 'enter'){
					doSearch(this);
				}		
			})
		}
		
		//삭제 버튼 클릭시 알림 버튼
		function check(){
			const boNoLists = document.getElementsByName('boNoList')
			for(let i = 0; i < boNoLists.length; i++){ 
				const boNoList = boNoLists[i];
				if(boNoList.checked == false){
					alert('선택사항을 확인해주세요')
					return false; 
				}else{
					var confirmed = confirm('삭제하시겠습니까')
					return confirmed;
				}
			}
		}
		
		
	</script>
	<%@ include file='../common/footer.jsp' %>
</body>
</html>