<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style>
	.margin{width: 100%; height: 70px;}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:set var='contextPath' value='${ pageContext.servletContext.contextPath }' scope='application'/>
	<script>
		alert("현재 관리자입니다")
		location.href="${contextPath}/member.admin"
	</script>
</body>
</html>