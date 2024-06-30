<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="container">
       	<ul class="pagination justify-content-center">
            <li class="page-item">
            	<c:url var="goBack" value="${ loc }">
            		<c:param name="page" value="${ pi.currentPage - 1 }"/>
            	</c:url>
            	<a class="page-link" href="${ goBack }" aria-label="Previous" style="border-style: none; color: black;">
            		<span aria-hidden="true" style="color: black;">&laquo;</span>
              	</a>
            </li>
            <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
            	<c:url var="goNum" value="${ loc }" >
            		<c:param name="page" value="${ p }"/>
            	</c:url>
            	<li class="page-item"><a class="page-link" href="${ goNum }" style="border-style: none; color: black;">${ p }</a></li>
            </c:forEach>
            <li class="page-item">
            	<c:url var="goNext" value="${ loc }">
            		<c:param name="page" value="${ pi.currentPage + 1 }"/>
            	</c:url>
            	<a class="page-link" href="${ goNext }" aria-label="Next" style="border-style: none; color: black;">
            		<span aria-hidden="true" style="color: black;">&raquo;</span>
            	</a>
            </li>
    	</ul>
	</div>
</body>
</html>