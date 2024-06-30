<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
    .margin{width: 100%; height: 70px;}
    #searchIcon:hover{cursor: pointer;}
    #community{font-weight: bold;}
    #communitySub{visibility: visible;}
</style>
<title>후기 게시판</title>
</head>
<body>
    <!-- 헤더 -->
    <%@ include file='../common/logoBar.jsp' %>
    <%@ include file='../common/mainCategoryBar.jsp' %>
    <!-- /헤더 -->
    <div class='margin'></div>
    
    <div class="container text-center">
      <div class="row">
        <div class="col"></div>
        <div class="col-8 text-start">
             <h2 style="border-left: 5px solid #65B741; padding-left: 10px; display: inline-block; margin-bottom: 15px;">후기 게시판</h2>
        </div>
        <div class="col"></div>
      </div>
    </div>
    <div class="container text-center">
      <div class="row">
        <div class="col"></div>
        <div class="col-8">
            <table class="table table-hover">
              <thead>
                <tr>
                  <th scope="col" width='10%'>글 번호</th>
                  <th scope="col" width='50%'>글 제목</th>
                  <th scope="col" width='15%'>작성자</th>
                  <th scope="col" width='15%'>작성일</th>
                  <th scope="col" width='10%'>조회수</th>
                </tr>
              </thead>
              <tbody class='table-group-divider'>
                <c:forEach items="${ reList }" var="review">
                    <tr>
                        <td>${review.boardNo}</td>
                        <td>${review.boardTitle}</td>
                        <td>${review.boardWriterName}</td>
                        <td>${review.boardModifyDate}</td>
                        <td>${review.boardCount}</td>
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
                                        <c:url var='goBack' value="${contextPath}/reviewList.menu">
                                            <c:param name='page' value="${pi.currentPage -1}" />
                                        </c:url>
                                        <a class="page-link" href="${goBack}" aria-label="Previous">
                                            <span aria-hidden="true" style='color: black;'>&laquo;</span>
                                        </a>
                                    </li>
                                    <c:forEach begin="${pi.startPage}" end="${pi.endPage}" var="p">
                                        <c:url var='goNum' value='${contextPath}/reviewList.menu'>
                                            <c:param name="page" value="${p}" />
                                        </c:url>
                                        <li class="page-item">
                                            <a class="page-link" href="${goNum}" style='color: black;'>${p}</a>
                                        </li>
                                    </c:forEach>
                                    <li class="page-item">
                                        <c:url var='goNext' value='${contextPath}/reviewList.menu'>
                                            <c:param name="page" value="${pi.currentPage +1}" />
                                        </c:url>
                                        <a class="page-link" href="${goNext}" aria-label="Next">
                                            <span aria-hidden="true" style='color: black;'>&raquo;</span>
                                        </a>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                <div class="col-3 text-end">
                    <c:if test="${!empty loginUser}">
                        <button type="button" class="btn" style='background: #60A869; color: white'id='writeButton'>글쓰기</button>
                    </c:if>
                </div>
              </div>
            </div>
            <div class="container text-center" style='margin: 1%;'>
              <div class="row">
                <div class="col"></div>
                <div class="col-8">
                    <select name='searchOption'>
                      <option selected>-----</option>
                      <option value="title">제목</option>
                      <option value="writer">작성자</option>
                    </select>
                    &nbsp;&nbsp;
                    <input type='text' size='30' placeholder='제목/작성자로 검색이 가능합니다'/>
                    &nbsp;&nbsp;
                    <img src="${contextPath}/resources/image/search.svg" id='searchIcon'>
                </div>
                <div class="col"></div>
              </div>
            </div>
        </div>
        <div class="col"></div>
      </div>
    </div>
    
    <div class='margin'></div>
    <!-- 푸터 -->
    <%@ include file='../common/footer.jsp' %>
    <!-- /푸터 -->
    
    <script>
        // 상세 게시글 보기
        const tds = document.querySelectorAll('td');
        for(const td of tds){
            const parent = td.parentElement;
            
            td.addEventListener('click', ()=>{
            	const boardNo = parent.children[0].innerText;
				location.href = '${contextPath}/boardView.bo?bId=' + boardNo + "&page=" + ${pi.currentPage} + "&category=102";
            });
        }
        
        // 글쓰기 이동
        document.getElementById('writeButton').addEventListener('click', () =>{
        	location.href = '${contextPath}/writeView.bo?category=review';
        });
    </script>
</body>
</html>
