<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
	.nav-item a:hover{
		font-weight: bold;
	}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<ul class="nav flex-column"
		style="float: left; margin-top: 100px; margin-left: 50px; background:white; padding:1.5%; border-radius: 10px;" >
		<li class="nav-item">
			<h2 style="border-bottom: 7px solid #65B741; padding-bottom: 10px;">관리자 페이지</h2>
		</li>
		<li class="nav-item">
       <a id="notice" class="nav-link" href="${ contextPath }/notice.admin" style="border-bottom: 1px solid #B9B9B9; color: black; ">공지사항</a>
     </li>
     <li class="nav-item">
       <a class="nav-link" href="${ contextPath }/question.admin" style="border-bottom: 1px solid #B9B9B9; color: black;">문의사항</a>
     </li>
     <li class="nav-item">
       <a class="nav-link" href="${ contextPath }/review.admin" style="border-bottom: 1px solid #B9B9B9; color: black;">후기 리스트</a>
     </li>
     <li class="nav-item">
       <a class="nav-link" href="${ contextPath }/book.admin" style="border-bottom: 1px solid #B9B9B9; color: black;">예약 리스트</a>
     </li>
     <li class="nav-item">
       <a class="nav-link" href="${ contextPath }/FAQ.admin" style="border-bottom: 1px solid #B9B9B9; color: black;">자주 묻는 Q&A</a>
     </li>
     <li class="nav-item">
       <a class="nav-link" href="${ contextPath }/member.admin" style="border-bottom: 1px solid #B9B9B9; color: black;">회원 관리</a>
     </li>
     <li class="nav-item" style="border-bottom:1px solid #B9B9B9;">
       <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0" data-bs-toggle="collapse" data-bs-target="#orders-collapse" aria-expanded="false">사이트관리</button>
        <div class="collapse" id="orders-collapse" style="margin-left:50px">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
            <li><a href="${ contextPath }/mainPage.admin" class="link-body-emphasis d-inline-flex text-decoration-none rounded">메인페이지</a></li>
            <li><a href="${ contextPath }/greeting.admin" class="link-body-emphasis d-inline-flex text-decoration-none rounded">인사말</a></li>
            <li><a href="${ contextPath }/way.admin" class="link-body-emphasis d-inline-flex text-decoration-none rounded">오시는길</a></li>
            <li><a href="${ contextPath }/show.admin" class="link-body-emphasis d-inline-flex text-decoration-none rounded">프로그램 안내</a></li>
            <li><a href="${ contextPath }/operating.admin" class="link-body-emphasis d-inline-flex text-decoration-none rounded">운영시간/이용요금</a></li>
            <li><a href="${ contextPath }/animal.admin" class="link-body-emphasis d-inline-flex text-decoration-none rounded">동물</a></li>
            <li><a href="${ contextPath }/mascot.admin" class="link-body-emphasis d-inline-flex text-decoration-none rounded">마스코트</a></li>
          </ul>
        </div>
     </li>
   </ul>
</body>
</html>