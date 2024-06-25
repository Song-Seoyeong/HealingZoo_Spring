<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<style>

.accordion-item {
	margin-bottom: 10px;
}
</style>
<meta charset="UTF-8">
<title>자주 묻는 Q&A</title>
</head>
<body>
	<!-- 헤더 -->
	<%@ include file='../common/logoBar.jsp'%>
	<%@ include file='../common/mainCategoryBar.jsp'%>
	<!-- /헤더 -->
	<div class="row" style='margin: 120px;'>
		<div class="col"></div>
		<div class="col-7">
			<h2 style="border-left: 5px solid #65B741; padding-left: 10px; display: inline-block; margin-bottom: 15px;">자주 묻는 Q&A</h2>
			<!-- 아코디언 -->
			<div class="accordion" id="accordion">
			<c:set var='num' value='1'/>
			<c:forEach items='${ FAQList }' var='FAQ'>
				<div class="accordion-item">
					<h2 class="accordion-header">
						<button class="accordion-button" type="button"
							style="background: white; border: 2px solid #60A869;"
							data-bs-toggle="collapse" data-bs-target="#collapes${ FAQ.boardNo }"
							aria-expanded="false" aria-controls="collapes${ FAQ.boardNo }">
							<strong>Q. ${ FAQ.boardTitle }</strong>
						</button>
					</h2>
					<div id="collapes${ FAQ.boardNo }" class="accordion-collapse collapse"
						data-bs-parent="#accordion">
						<div class="accordion-body"
							style='background: #F3F3F3; border: 1px solid #60A869;'>
							A. ${ FAQ.boardContent }
						</div>
					</div>
				</div>
			</c:forEach>
			
			</div>
		</div>
		<div class="col"></div>
	</div>

	<!-- 푸터 -->
	<%@ include file='../common/footer.jsp'%>
	<!-- /푸터 -->
</body>
</html>