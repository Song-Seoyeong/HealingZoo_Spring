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
#address{ 
	resize: none;
	border: 1px solid #D9D9D9;
	border-radius: 10px;
}
#updateBtn{
	background-color: orange;
	width: 80px;
	border: none;
	margin-right: 5px;
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

#insert_button {
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

.nav-item a:hover {
	font-weight: bold;
}
.content{
		max-width: 200px; /* 원하는 최대 길이 설정 */
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
	}
</style>
<title>프로그램 목록</title>
</head>
<body>
	<%@ include file='../common/logoBar.jsp'%>
	<%@ include file='../common/mainCategoryBar.jsp'%>
	<%@ include file='../common/adminSidebar.jsp'%>
	
	<div class="container" style="width: 900px; margin-top: 100px; margin-bottom:150px;">
		<h2 style="border-left: 5px solid #65B741; padding-left: 10px; display: inline-block; margin-bottom: 15px;">프로그램 메인</h2>
		
		<form action="${contextPath}/insertProtitleImg.admin" method="post" enctype="multipart/form-data">
			<!-- 시작문구 -->
			<div class='row' style='margin-bottom:20px;'>
				<div class='col-1'></div>
				<div class='col-3'>
					<p class='inputTitleName'>메인문구 : </p>
				</div>
				<div class='col-7 text-center'>
					<input type="text" cols='48' rows='4' id='write' name='write'>
				</div>
				<div class='col-1'></div>
			</div>
			
			<!-- 문구 -->
			<div class='row' style='margin-bottom:30px;'>
				<div class='col-1'></div>
				<div class='col-3'>
					<p class='inputTitleName'>문구 : </p>
				</div>
				<div class='col-7 text-center'>
					<textArea cols='48' rows='4' id='swrite' name='swrite'></textArea>
				</div>
				<div class='col-1'></div>
			</div>
			
			<!-- 사진 -->
			<div class='row' style='margin-bottom:30px;'>
				<div class='col-1'></div>
				<div class='col-3'>
					<p class='inputTitleName'>메인사진 : </p>
				</div>
				<div class='col-7 text-center'>
					<input class="form-control" type="file" id="showImg" name='showImg' accept='image/*'>
				</div>
				<div class='col-1'></div>
			</div>
			
			<!-- 버튼 -->
		    <div class='text-end'>
		        <button class="btn btn-primary" type="submit" id="updateBtn">수정</button>
		    </div>
		 </form>
	</div>
	<!-- 글 목록 -->
	<div class="container" style="width: 900px; margin-top: 100px; margin-bottom:150px;">
		<h2 style="border-left: 5px solid #65B741; padding-left: 10px; display: inline-block; margin-bottom: 15px;">프로그램 목록</h2>
		<form action="${contextPath}/deleteShow.admin" id="deleteForm">
			<table class="table table-hover">
			  <thead>
			    <tr>
			      <th scope="col" width='8%'><input class="form-check-input" type="checkbox" id="selectAll"></th>
			      <th scope="col" width='8%'>번호</th>
			      <th scope="col" width='25%'>프로그램 이름</th>
			      <th scope="col" width='44%'>프로그램 내용</th>
			      <th scope="col" width='15%'>작성 일자</th>
			    </tr>
			  </thead>
			  <tbody class='table-group-divider'>
			  	<c:forEach items="${ showList }" var='show'>
				  	<tr>
				  	  <th><input class="form-check-input" type="checkbox" value="${ show.showNo }" id="flexCheckDefault" name='showNo' ></th>
				      <td>${ show.showNo }</td>
				      <td>${ show.showName }</td>
				      <td class='content'>${ show.showContent }</td>
				      <td>${ show.uploadDate }</td>
				    </tr>
			    </c:forEach>
			  </tbody>
			</table>
			<div class="container text-center">
			  <div class="row">
			    <div class="col-3"></div>
			    <div class="col-6">
					<nav aria-label="Standard pagination">
						<ul class="pagination justify-content-center">
							<li class="page-item">
								<c:url var='goBack' value="${ loc }">
									<c:param name='page' value="${ pi.currentPage -1 }" />
								</c:url>
								<a class="page-link" href="${ goBack }" aria-label="Previous">
									<span aria-hidden="true" style='color: black;'>&laquo;</span>
								</a>
							</li>
							
							<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
								<c:url var='goNum' value='${ loc }'>
									<c:param name="page" value="${ p }" />
								</c:url>
								<li class="page-item">
									<a class="page-link" href="${ goNum }" style='color: black;'>${ p }</a>
								</li>
							</c:forEach>
							<li class="page-item">
								<c:url var='goNext' value='${ loc }'>
									<c:param name="page" value="${ pi.currentPage +1 }" />
								</c:url>
								<a class="page-link" href="${ goNext }" aria-label="Next">
									<span aria-hidden="true" style='color: black;'>&raquo;</span>
								</a>
							</li>
						</ul>
					</nav>
				</div>
			    <div class="col-3 text-end">
			    	<button class="btn btn-primary" type="button" id="insert_button">추가</button> &nbsp;&nbsp;
					<!-- 삭제 버튼 type을 submit으로 변경 -->
					<button class="btn btn-primary" id="delete_button">삭제</button>
			    </div>
			  </div>
			</div>
		</form>
	</div>
	
	<div style='margin-bottom: 100px;'></div>
	<%@ include file='../common/footer.jsp'%>

	<script>
		//상세 게시글 보기
		const tds = document.querySelectorAll('td');
		for(const td of tds){
			const parent = td.parentElement;
			
			td.addEventListener('click', ()=>{
				const showNo = parent.children[1].innerText;
				location.href = '${contextPath}/showDetail.admin?showNo=' + showNo + "&page=" + ${pi.currentPage};
			})
		}
	
		//삭제 처리
		document.getElementById('delete_button').addEventListener('click', function(e) {
		    e.preventDefault(); // 기본 이벤트 방지
		
		    const checkboxes = document.querySelectorAll('input[name="showNo"]:checked');
		    
		    if (checkboxes.length === 0) {
		        alert('삭제할 항목을 선택해주세요.');
		        return;
		    }
		
		    if (confirm('선택한 ' + checkboxes.length + '개의 항목을 삭제하시겠습니까?')) {
		        document.getElementById('deleteForm').submit(); // 폼 제출
		    }
		});
	
		// 체크박스 모두 선택
		document.getElementById('selectAll').addEventListener('change', function() {
		    const checkboxes = document.querySelectorAll('input[name="aniNOs"]');
		    checkboxes.forEach(checkbox => {
		        checkbox.checked = this.checked;
		    });
		});
	
	
		// 추가 클릭시
		document.getElementById('insert_button').addEventListener('click', () => {
		    location.href = '${contextPath}/insertShowView.admin?page=' + ${pi.currentPage};
		});
		
		// 전체 선택
		document.getElementById('selectAll').addEventListener('change', function() {
	    const checkboxes = document.querySelectorAll('input[name="showNo"]');
	    checkboxes.forEach(checkbox => {
	        checkbox.checked = this.checked;
	    });
	});
	</script>
</body>
</html>