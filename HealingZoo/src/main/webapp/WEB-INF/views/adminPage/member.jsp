<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='fn' uri="http://java.sun.com/jsp/jstl/functions" %>
<meta charset="UTF-8">
<style>
	.form-check-input{
		transform : scale(1);
		accent-color: #65B741;
	}
	
	#delete_button {
		background-color: #DD5353;
		width: 80px;
		border: none;
	}

 	#init_button{
		background-color: #0D6EFD;
		width: 80px;
		border: none;
		margin-right: 5px;
	} 
	
	.pagination-container {
	  display: flex;
	  justify-content: center;
	}
	
	.number-button-wrapper {padding: 10px;}
	
	tr {text-align:center;}
	
	.nav-item a:hover{
		font-weight: bold;
	}
	#grade_button{
       background-color: #65B741;
      width: 80px;
      border: none;
      margin-right: 5px;
   }	
   .hover-input:hover{
   		font-weight: bold;
   		
   }
	
</style>
<title>회원 관리</title>
</head>
<body>
	<%@ include file='../common/logoBar.jsp' %>
	<%@ include file='../common/mainCategoryBar.jsp' %>
	<%@ include file='../common/adminSidebar.jsp'%>
	
	<!-- 글 목록 -->
	<div class="container" style="width: 900px; margin-top: 100px;  ">
		  <h2 style="border-left: 5px solid #65B741; padding-left: 10px; display: inline-block; margin-bottom: 15px;">회원관리</h2>
		<table class="table">
		  <thead>
		    <tr>
		      <th scope="col"></th>
		      <th scope="col">이름</th>
		      <th scope="col">아이디</th>
		      <th scope="col">연락처</th>
		      <th scope="col">
		      	  <select name="memGrade" id='memGrade' style="border:none;">
		      		  <option value="whole" ${param.memGrade == 'whole' ? 'selected' : ''}>전체</option>
			          <option value="CONSUMER" ${param.memGrade == 'CONSUMER' ? 'selected' : ''}>회원</option>
			          <option value="MANAGER" ${param.memGrade == 'MANAGER' ? 'selected' : ''}>관리자</option>
			          <option value="WORKER" ${param.memGrade == 'WORKER' ? 'selected' : ''}>직원</option>
		          </select>
		      </th>
		      <th scope="col">
		      	<c:if test="${ status == 'Y'}">
			      	<input onclick="notNormal()" type="button" class="hover-input" id="notNormal" value="N" style="border-style:none; background-color:white;">
		      	</c:if>
		      	<c:if test="${ status == 'N'}">
			      	<input onclick="normal()" type="button" class="hover-input" id="normal" value="Y" style="border-style:none; background-color:white; ">
		      	</c:if>
		      </th>
		    </tr>
		  </thead>
		  <tbody class="table-group-divider">
			  <c:forEach items="${ memberList }" var="m">
			    <tr>
			    	<td><input class="form-check-input" type="checkbox" value="${ m.memNo }" id="flexCheckDefault"></td>
					<td scope="row">${ m.memName }</td>
					<td>${ m.memId } </td>
					<td>${ m.memPhone }</td>
					<td>
						<c:if test="${ m.memGrade == 'CONSUMER' }">회원</c:if>
						<c:if test="${ m.memGrade == 'MANAGER' }">관리자</c:if>
						<c:if test="${ m.memGrade == 'WORKER' }">직원</c:if>
					</td>
					<td>
						<c:if test="${ fn:trim(m.memActive) == 'Y' }">정상</c:if>
						<c:if test="${ fn:trim(m.memActive) == 'N' }">탈퇴</c:if>
					</td>	
				</tr>
			   </c:forEach>
		  </tbody>
		</table>
		<div class="d-grid gap-2 d-md-flex justify-content-md-end">
            <c:if test="${ grade == 'MANAGER' }"><button class="btn btn-primary" type="button" id="grade_button" onclick="change()">직원</button></c:if>
            <button class="btn btn-primary" type="button" id="init_button">초기화</button>
            <button class="btn btn-primary" type="button" id="delete_button">탈퇴</button>
         </div>    
           
		<!-- 페이지네이션 -->
		<%@ include file="../common/pagination.jsp" %>
		<!-- 페이지네이션 -->
		
		<!-- 검색 -->
		<div class="row justify-content-center" style="margin-bottom: 100px;">
			<div class="container text-center" style='margin: 1%; margin-bottom: 20%; '>
			  <div class="row">
			    <div class="col"></div>
			      <div class="col-8">
			    	<select name='searchOption'>
					  <option value="memName" selected>이름</option>
					  <option value="memId">아이디</option>
					  <option value="memPhone">연락처</option>
					</select>
					&nbsp;&nbsp;
			    	<input type='text' name='search' size='30' placeholder='이름/아이디/연락처 검색 가능'/>
			    	&nbsp;&nbsp;
			    	<img src="resources/image/search.svg" id='searchIcon'>
			    </div>
			    <div class="col"></div>
			  </div>
			</div>
		</div>
	</div>
	
	<!-- 비밀번호 초기화가 성공했음을 알리는 알림창 -->
	<c:if test="${not empty sessionScope.initPwdSuccessMsg}">
        <script>
            alert("${sessionScope.initPwdSuccessMsg}");
        </script>
        <c:remove var="initPwdSuccessMsg" scope="session"/>
    </c:if>
    
    <!-- 회원 상태 변경 성공 시 알림창 -->
    <c:if test="${not empty sessionScope.statusChangeSuccess }">
    	<script>
    		alert("${sessionScope.statusChangeSuccess}");
    	</script>
    	<c:remove var="statusChangeSuccess" scope="session"/>
    </c:if>
	
	<%@ include file='../common/footer.jsp' %>
	
	<script>
	     // 회원 등급 말머리 검색
	    document.getElementById('memGrade').addEventListener('change', function(){
	        const memGrade = document.getElementById('memGrade').value;
	        var currentPage = ${pi.currentPage}; // 현재 페이지 번호를 자바스크립트 변수로 가져오기
	        var contextPath = '${contextPath}'; // contextPath를 자바스크립트 변수로 가져오기
	        
	        // 페이지 이동
	        location.href = contextPath + '/memGradeFilter.admin?memGrade=' + this.value + "&page=" + currentPage;
	        
	    }); 

	    
	 	// 초기화 버튼 클릭 시 비밀번호 초기화 요청
	    document.getElementById('init_button').addEventListener('click', function() {
	        var checkboxes = document.querySelectorAll('input[type="checkbox"]:checked');
	        var memberNos = Array.from(checkboxes).map(cb => cb.value);
	        
	        if (memberNos.length > 0) {
	            var queryString = memberNos.map(no => 'memberNo=' + no).join('&');
	            location.href = 'initPassword.admin?' + queryString;
	        } else {
	            alert('초기화할 회원을 선택하세요.');
	        }
	    });
	 	
	 	
	 	// 탈퇴 버튼 클릭 시 체크된 회원 상태 변경
	    document.getElementById('delete_button').addEventListener('click', function() {
	        var checkboxes = document.querySelectorAll('input[type="checkbox"]:checked');
	        var memberNos = Array.from(checkboxes).map(cb => cb.value);
	        
	        if (memberNos.length > 0) {
	        	if(confirm('탈퇴시키겠습니까?')){
		            var queryString = memberNos.map(no => 'memberNo=' + no).join('&');
		            location.href = 'statusChange.admin?' + queryString;
	        	}else{
	        		return
	        	}
	        } else {
	            alert('탈퇴할 회원을 선택하세요.');
	        }
	    });
	 	
	 	// 검색창 검색
		document.getElementById('searchIcon').addEventListener('click', function(){
			const condition = this.parentElement.children[0].value;
			const search = this.parentElement.children[1].value;
			
			location.href = "${contextPath}/searchMember.admin?condition=" + condition + "&search=" + search + "&page=" + ${pi.currentPage};
		})
		
		// 엔터 키로 검색 실행
		document.querySelector('input[name="search"]').addEventListener('keyup', function(event) {
		  if (event.key === 'Enter') {
		    const condition = this.parentElement.children[0].value;
		    const search = this.value;
		    location.href = "${contextPath}/searchMember.admin?condition=" + condition + "&search=" + search + "&page=" + ${pi.currentPage};
		  }
		});
	 	
		//관리자 버튼 클릭시 관리자로 전환 단, master계정일 때만 가능
		function change(){
			 let checkboxes = document.querySelectorAll('input[type="checkbox"]:checked');
	          const updateBoardNos = Array.from(checkboxes).map(cb => cb.value).join(',');
	          if(updateBoardNos == 0) {
	             alert("선택 사항을 확인해주세요")
	             return
	          }else{
	             let answer = confirm("등급전환을 하시겠습니까?");
	             if(answer){
	                for(const checkbox of checkboxes){
	                   let memNo = checkbox.value;
	                   location.href="${contextPath}/changeGrade.admin?memNo=" + memNo;
	                }
	             }else{
	               return;                   
	             }
	          }	
		}
       
       // N 버튼 클릭 시 탈퇴만 출력
       function notNormal(){
    	   const status = document.getElementById('notNormal').value
    	   let memGrade = document.getElementById('memGrade').value
    	   if(memGrade == 'whole'){
    	   	   location.href="${contextPath}/notNormalView.admin?status=" + status + '&memGrade=' + memGrade; 
    	   }else{
    		   location.href="${contextPath}/notNormalView.admin?status=" + status + '&memGrade=' + memGrade;
    	   }
       }
       
       // Y 버튼 클릭 시 정상 회원만 출력
      function normal(){
    	  const status = document.getElementById('normal').value
    	  let memGrade = document.getElementById('memGrade').value
    	  if(memGrade == 'whole'){
	    	  location.href="${contextPath}/normalView.admin?status=" + status + '&memGrade=' + memGrade;  
    	  }else{
	    	  location.href="${contextPath}/normalView.admin?status=" + status + '&memGrade=' + memGrade;  	    		  
    	  }
       }
	</script>
	
</body>
</html>