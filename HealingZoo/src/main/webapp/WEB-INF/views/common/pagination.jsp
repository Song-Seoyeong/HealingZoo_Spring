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
	<div class="container" style='margin-top: 30px;'>
    <div class="row">
        <div class="col-3"></div>
        <div class="col-6">
            <nav aria-label="Standard pagination">
                <ul class="pagination justify-content-center">

                    <!-- 이전 페이지 링크 -->
                    <li class="page-item">
                        <c:url var="goBack" value="${ loc }">
                        	<c:if test="${ empty search }">
                        		<c:param name="page" value="${ pi.currentPage - 1 }" />
                        	</c:if>
                        	<c:if test="${ !empty search }">
	                            <c:param name="page" value="${ pi.currentPage - 1 }" />
	                            <c:param name="search" value="${ search }" />
	                            <c:param name="condition" value="${ condition }" />
                            </c:if>
                        </c:url>
                        <a class="page-link" href="${ goBack }" aria-label="Previous">
                            <span aria-hidden="true" style='color: black;'>&laquo;</span>
                        </a>
                    </li>

                    <!-- 페이지 번호 링크 -->
                    <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
                        <c:set var="goNum">
                            <c:url value="${ loc }">
                            	<c:if test="${ empty search }">
                            		<c:param name="page" value="${ p }" />
                            	</c:if>
                            	<c:if test="${ !empty search }">
	                                <c:param name="page" value="${ p }" />
	                                <c:param name="search" value="${ search }" />
	                                <c:param name="condition" value="${ condition }" />
                            	</c:if>
                            </c:url>
                        </c:set>
                        <li class="page-item">
                            <a class="page-link" href="${ goNum }" style='color: black;'>${ p }</a>
                        </li>
                    </c:forEach>

                    <!-- 다음 페이지 링크 -->
                    <li class="page-item">
                        <c:url var="goNext" value="${ loc }">
                        	<c:if test="${ empty search }">
                        		<c:param name="page" value="${ pi.currentPage + 1 }" />
                        	</c:if>
                        	<c:if test="${ !empty search }">
	                            <c:param name="page" value="${ pi.currentPage + 1 }" />
	                            <c:param name="search" value="${ search }" />
	                            <c:param name="condition" value="${ condition }" />
                            </c:if>
                        </c:url>
                        <a class="page-link" href="${ goNext }" aria-label="Next">
                            <span aria-hidden="true" style='color: black;'>&raquo;</span>
                        </a>
                    </li>
                    
                </ul>
            </nav>
        </div>
    </div>
</div>

	
</body>
</html>