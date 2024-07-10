<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
	.inputTitleName{
		font-size: 23px;
	}
	.goodsInfo{
		overflow: hidden;
		text-overflow: ellipsis;
		white-space: nowrap;
		width: 400px;
	}
	.table td:hover{cursor: pointer;}
	.nav-item a:hover{
	font-weight: bold;
	}
	#sideButton{color: #65B741; font-weight: bold;}
	
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
	#revision_button,#update_button,#mascot_update_button,#goods_info_update_button{
		background-color: orange;
		width: 80px;
		border: none;
		margin-right: 5px;
	}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file='../common/logoBar.jsp' %>
	<!-- 마스코트 페이지 관리 -->
	<%@ include file='../common/mainCategoryBar.jsp'%>
	<%@ include file='../common/adminSidebar.jsp'%>
	
	<!-- input 영역 -->
	<div class="container" style="width: 900px; margin-top: 100px; margin-bottom: 100px;">
		<!-- 마스코트 이미지 -->
		<div style='margin-bottom: 70px;'>
		    <h2 style="border-left: 5px solid #65B741; padding-left: 10px; display: inline-block; margin-bottom: 15px;">마스코트 이미지</h2>
		    <form action="${contextPath}/updateMascotImage.admin" method="post" enctype="multipart/form-data">
		        <div class='row'>
		            <div class='col-2 text-center'>
		                <p class='inputTitleName'>이미지 : </p>
		            </div>
		            <div class='col-7'>
		                <input class="form-control" width='100px' type="file" id="mascotImg" name='mascotImg' accept='image/*'>
		            </div>
		            <div class='col-3'>
		                <button class="btn btn-primary" type="submit" id="mascot_update_button">수정</button>
		            </div>
		        </div>
		    </form>
		    <c:if test="${not empty mascotImage}">
		        <img src="${pageContext.request.contextPath}${mascotImage.imgPath}/${mascotImage.imgRename}" alt="마스코트 이미지" style="max-width: 300px; margin-top: 10px;">
		    </c:if>
		</div>
		
		<!-- 상품 안내 이미지 -->
		<div style='margin-bottom: 100px;'>
		    <h2 style="border-left: 5px solid #65B741; padding-left: 10px; display: inline-block; margin-bottom: 15px;">상품 안내 이미지</h2>
		    <form action="${contextPath}/updateGoodsInfoImage.admin" method="post" enctype="multipart/form-data">
		        <div class='row'>
		            <div class='col-2 text-center'>
		                <p class='inputTitleName'>이미지 : </p>
		            </div>
		            <div class='col-7'>
		                <input class="form-control" width='100px' type="file" id="goodsInfoImg" name='goodsInfoImg' accept='image/*'>
		            </div>
		            <div class='col-3'>
		                <button class="btn btn-primary" type="submit" id="goods_info_update_button">수정</button>
		            </div>
		        </div>
		    </form>
		    <c:if test="${not empty goodsInfoImage}">
		        <img src="${pageContext.request.contextPath}${goodsInfoImage.imgPath}/${goodsInfoImage.imgRename}" alt="상품 안내 이미지" style="max-width: 300px; margin-top: 10px;">
		    </c:if>
		</div>
		
		<!-- 상품 리스트 -->
		<div>
			<h2 style="border-left: 5px solid #65B741; padding-left: 10px; display: inline-block; margin-bottom: 15px;">상품 리스트</h2>
			<form action="${contextPath}/deleteGoods.admin" method="post" id="deleteForm">
				<table class="table text-center">
					<thead>
						<tr>
							<th scope="col" style="width: 50px;"><input class="form-check-input" type="checkbox" name="selectAll" id="selectAll"></th>
							<th scope="col" style="width: 100px;">상품 번호</th>
							<th scope="col" style="width: 200px;">상품명</th>
							<th scope="col" style="width: 100px;">가격</th>
							<th scope="col">설명</th>
						</tr>
					</thead>
					<tbody class="table-group-divider">
						<c:forEach items="${list}" var="m">
							<tr>
								<td>
									<input class="form-check-input" type="checkbox" name="goodsNo" value="${m.goodsNo}">
								</td>
								<td scope="row">${m.goodsNo }</td>
								<td>${m.goodsName }</td>
								<td>${m.goodsPrice }</td>
								<td>
									<div class='goodsInfo'>${m.goodsInfo }</div>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="d-grid gap-2 d-md-flex justify-content-md-end">
					<a href='${contextPath}/masInsert.admin'><button class="btn btn-primary" type="button" id="write_button" style="background-color: green;">추가</button></a>
					<button class="btn btn-primary" type="button" id="update_button" style="background-color: orange;">수정</button>
					<button class="btn btn-primary" type="submit" id="delete_button">삭제</button>
				</div>
			</form>
		</div>
		
		<!-- 페이지네이션 -->
		<%@ include file="../common/pagination.jsp" %>
		<!-- 페이지네이션 -->
		
	</div>
	
	<!-- 하단 푸터 -->
	<%@ include file='../common/footer.jsp'%>
	<!-- 하단 푸터 -->
	
	<script>
		// 수정 처리
		document.getElementById('update_button').addEventListener('click', function() {
		    const checkboxes = document.querySelectorAll('input[name="goodsNo"]:checked');
		    if (checkboxes.length !== 1) {
		        alert('수정할 항목을 하나만 선택해주세요.');
		        return;
		    }
		    const goodsNo = checkboxes[0].value;
		    location.href = '${contextPath}/masInsert.admin?goodsNo=' + goodsNo;
		});

		// 삭제 처리
		document.getElementById('delete_button').addEventListener('click', function(e) {
			e.preventDefault(); // 기본 이벤트 방지

			const checkboxes = document.querySelectorAll('input[name="goodsNo"]:checked');
			
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
			const checkboxes = document.querySelectorAll('input[name="goodsNo"]');
			checkboxes.forEach(checkbox => {
				checkbox.checked = this.checked;
			});
		});
	</script>
</body>
</html>
