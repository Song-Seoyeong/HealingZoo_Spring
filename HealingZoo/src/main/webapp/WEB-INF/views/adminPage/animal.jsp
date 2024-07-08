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

.nav-item a:hover {
	font-weight: bold;
}
</style>
<title>동물 목록</title>
</head>
<body>
	<%@ include file='../common/logoBar.jsp'%>
	<%@ include file='../common/mainCategoryBar.jsp'%>
	<%@ include file='../common/adminSidebar.jsp'%>

	<!-- 글 목록 -->
	<div class="container" style="width: 900px; margin-top: 100px;">
		<h2
			style="border-left: 5px solid #65B741; padding-left: 10px; display: inline-block; margin-bottom: 15px;">동물
			목록</h2>
		<form action="${contextPath}/animalDelete" method="post"
			id="deleteForm">
			<table class="table">
				<thead>
					<tr>
						<!-- name id +수정+ -->
						<th scope="col"><input class="form-check-input"
							type="checkbox" name="selectAll" id="selectAll"></th>
						<th scope="col">번호</th>
						<th scope="col"><select id="animalClassFilter"
							style="width: 60px; border: none;">
								<option value="ALL" selected>전체</option>
								<option value="포유류">포유류</option>
								<option value="조류">조류</option>
								<option value="파충류">파충류</option>
						</select></th>
						<th scope="col">소분류</th>
						<th scope="col">동물 이름</th>
						<th scope="col"><select id="extinctGradeFilter"
							style="width: 60px; border: none;">
								<option value="ALL" selected>전체</option>
								<option value="EX">절멸</option>
								<option value="CR">위급</option>
								<option value="EN">위기</option>
								<option value="VU">취약</option>
						</select></th>
						<th scope="col">입소날짜</th>
					</tr>
				</thead>
				<tbody class="table-group-divider">
					<c:forEach items="${list}" var="f">
						<tr>
							<td><input class="form-check-input" type="checkbox"
								name="aniNOs" value="${f.aniNO}" id="flexCheckDefault"></td>
							<td scope="row">${f.aniNO}</td>
							<td>${f.animalClass}</td>
							<td>${f.animalFamily}</td>
							<td>${f.animalName}</td>
							<td>${f.extinctGrade}</td>
							<td>${f.enterDate}</td>
						</tr>
					</c:forEach>
			</table>
			<div class="d-grid gap-2 d-md-flex justify-content-md-end">
				<button class="btn btn-primary" type="button" id="write_button1"style="background-color: green;">추가</button>
				<!-- 수정 버튼 이벤트 리스너 추가 -->
				<button class="btn btn-primary" type="button" id="update_button" style="background-color: orange;">수정</button>
				<!-- 삭제 버튼 type을 submit으로 변경 +수정+-->
				<button class="btn btn-primary" type="submit" id="delete_button">삭제</button>
			</div>
		</form>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<%@ include file='../common/footer.jsp'%>

	<script>
	// 수정 처리
    // 수정 버튼 클릭 시
    document.getElementById('update_button').addEventListener('click', function() {
        const checkboxes = document.querySelectorAll('input[name="aniNOs"]:checked');
        
        if (checkboxes.length !== 1) {
            alert('수정할 항목을 하나만 선택해주세요.');
            return;
        }

        const aniNO = checkboxes[0].value;
        location.href = '${contextPath}/updateAni.admin?aniNO=' + aniNO;
    });
	
	//삭제 처리
	document.getElementById('delete_button').addEventListener('click', function(e) {
	    e.preventDefault(); // 기본 이벤트 방지
	
	    const checkboxes = document.querySelectorAll('input[name="aniNOs"]:checked');
	    
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

	document.addEventListener('DOMContentLoaded', function() {
	    const animalClassFilter = document.getElementById('animalClassFilter');
	    const extinctGradeFilter = document.getElementById('extinctGradeFilter');
	    const tableRows = document.querySelectorAll('tbody tr');
	
	    function filterTable() {
	        const selectedClass = animalClassFilter.value;
	        const selectedGrade = extinctGradeFilter.value;
	
	        tableRows.forEach((row) => {
	            const rowClass = row.children[2].textContent.trim();
	            const rowGrade = row.children[5].textContent.trim();
	            
	            const classMatch = selectedClass === 'ALL' || rowClass.indexOf(selectedClass) !== -1;
	            const gradeMatch = selectedGrade === 'ALL' || rowGrade === selectedGrade;
	
	            if (classMatch && gradeMatch) {
	                row.style.display = '';
	            } else {
	                row.style.display = 'none';
	            }
	        });
	    }

    animalClassFilter.addEventListener('change', filterTable);
    extinctGradeFilter.addEventListener('change', filterTable);

    // 초기 필터링 실행
    filterTable();
	});

	// 추가 클릭시
	document.getElementById('write_button1').addEventListener('click', () => {
	    location.href = '${contextPath}/writeAni.admin?category=' +'animal';
	});
</script>
</body>
</html>