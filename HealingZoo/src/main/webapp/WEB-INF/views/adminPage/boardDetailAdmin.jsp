<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세 글페이지</title>
<style>
.margin {
	width: 100%;
	height: 70px;
}

.inputBoard {
	border-radius: 3px;
	border-shadow: none;
	border: 1px solid #fff;
}

#status {
	color: #65B741;
}

#replyContent {
	border-radius: 3px;
	border-shadow: none;
	border: 1px solid #B5B5B5;
}
#contentBox{
	border: 1px solid #B5B5B5;	
}
</style>
</head>
<body>
	<!-- 헤더 -->
	<%@ include file='../common/logoBar.jsp'%>

	<%@ include file='../common/mainCategoryBar.jsp'%>
	<!-- /헤더 -->

	<div class='margin'></div>

	<!-- 글 상세 페이지 폼 -->
		<div class="container text-center">
			<div class="row">
				<div class="col"></div>
					<div class="col-8 content-center" style='background: white; border-radius: 25px;'>
						<form action="${ contextPath }/updateView.admin" method='post'>
							<br>
							<input type='hidden' name='page' value='${ page }'>
							<input type='hidden' name='boardNo' value='${ b.boardNo }'>
							
							<c:if test="${ b.cateNo == 100 }">
								<input type='hidden' name='category' value='notice'>
							</c:if>
							<c:if test="${ b.cateNo == 101 }">
								<input type='hidden' name='category' value='question'>
							</c:if>
							<c:if test="${ b.cateNo == 102 }">
								<input type='hidden' name='category' value='review'>
							</c:if>
							<c:if test="${ b.cateNo == 103 }">
								<input type='hidden' name='category' value='book'>
							</c:if>
							
							<div class='text-start'>
								&nbsp;&nbsp;&nbsp;&nbsp;
								<h3 style="border-left: 5px solid #65B741; padding-left: 10px; display: inline-block; margin-bottom: 15px;">
									${ b.boardTitle }
								</h3>
							</div>
							
							<hr style='border: 2px solid'>
							<div class='text-end'>
								<input type='text' name=boardWriterName value='${ b.boardWriterName }' id='inputBoardWriter' size='10' class='inputBoard' readonly>
								&nbsp;&nbsp; 
								<input type='text' value='${ b.boardModifyDate }' size='10' class='inputBoard' readonly>
								&nbsp;&nbsp; 
								
								<!-- 문의 게시글 진행상태 -->
								<c:if test="${ b.cateNo == 101 }">
									<c:if test="${ b.quBoBoardStatus == 'Y' }">
										<input type='text' id='status' value='답변 완료' size='8' class='inputBoard' style='color: green;' readonly>
									</c:if>
									<c:if test="${ b.quBoBoardStatus == 'N' }">
										<input type='text' id='status' value='미답변' size='8' class='inputBoard' style='color: red;' readonly>
									</c:if>
								</c:if>
								<!-- 문의/예약 게시글 진행상태 -->
								
								<!-- 예약 게시글 진행상태 -->
								<c:if test="${ b.cateNo == 103 }">
									<c:if test="${ b.quBoBoardStatus == 'Y' }">
										<input type='text' id='status' value='예약 완료' size='8' class='inputBoard' style='color: green;' readonly>
									</c:if>
									<c:if test="${ b.quBoBoardStatus == 'N' }">
										<input type='text' id='status' value='확인중' size='8' class='inputBoard' style='color: red;' readonly>
									</c:if>
								</c:if>
								<!-- 문의/예약 게시글 진행상태 -->
								
							</div>
							<br>
							<div class='text-start' id='contentBox'>
								<textArea id='boardContent' name='boardContent' cols='70' rows="10" style="resize: none; board" class='inputBoard' readonly>${ b.boardContent }</textArea>
								<c:forEach items="${ imgList }" var='img'>
									<div style='margin: 15px 15px;'>
										<img alt="${ img.imgName }" src="${ contextPath }/resources/uploadImg/${img.imgRename}" width='60%'>
									</div>
								</c:forEach>
							</div>
							<div class='text-start'></div>
							<hr>
							<div class="text-center">
								<button type="button" class="btn" style='background: #60A869; color: white;' id='goToBack'>목록</button>
								
								<!-- 로그인유저와 글쓴이가 같을 거나, 예약/문의 게시글을 비번 입력 후 들어왔을 때 -->
<%-- 								<c:if test="${ (loginUser.memNo == b.boardWriterNo) || b.cateNo == 103 || b.cateNo == 101 || b.cateNo == 100 || b.cateNo == 102 }"> --%>
								<c:if test="${ (loginUser.memNo == b.boardWriterNo) }">
									&nbsp;&nbsp;&nbsp;
									<button class="btn" id='updateBoard' style='background: #EA862A; color: white;'>수정</button>
								</c:if>
								<c:if test="${ b.cateNo == 100 }">
									<button class="btn" id='updateBoard' style='background: #EA862A; color: white;'>수정</button>
								</c:if>
								<c:if test="${ (loginUser.memNo == b.boardWriterNo) || (loingUser.memGrade == MANAGER) }">
									&nbsp;&nbsp;&nbsp;
									<button type="button" class="btn" id='deleteBoard' style='background: #DD5353; color: white;'>삭제</button>
								</c:if>
								<!-- 로그인유저와 글쓴이가 같을 거나, 예약/문의 게시글을 비번 입력 후 들어왔을 때 -->
								
							</div>
						<hr>
					</form>
				</div>
				<div class="col"></div>
			</div>	
		</div>
				<!-- 댓글 폼 -->
		<div class="container text-center">
			<div class="row">
				<div class="col"></div>
				<div class="col-8 content-center" style='background: white; border-radius: 25px;'>
					<table class="table">
						<thead>
							<tr>
								<th scope="col" width='10%'>작성자</th>
								<th scope="col" width='65%'>댓글</th>
								<th scope="col" width='10%'>작성일</th>
								<th scope="col" width='15%'></th>
							</tr>
						</thead>
						<tbody class='table-group-divider'>
							<tr>
								<td scope="row">관리자</td>
								<td>예약 완료 되었습니다</td>
								<td>24/06/15</td>
								<td>
								<c:if test="${ loginUser.memNo == b.boardWriterNo }">
									<button type="button" class="btn btn-sm" id='updateReply'
										style='background: #EA862A; color: white;'>수정</button>&nbsp;
									<button type="button" class="btn btn-sm" id='deleteReply'
										style='background: #DD5353; color: white;'>삭제</button>
								</c:if>
								</td>
							</tr>
						
							<tr>
								<td scope="row" colspan='4'>댓글이 없습니다. 댓글을 입력해주세요 :)</td>
							</tr>
							
							<!-- 비회원 댓글 입력창 -->
							<c:if test="${ empty loginUser }">
								<tr>
									<td scope="row">댓글</td>
									<td colspan='2'><textarea rows="3" cols="60" id='replyContent' style='resize: none;' readonly placeholder='로그인 후 이용해주세요'></textarea></td>
									<td>
										<button type="button" class="btn btn-sm" id='insertReply' style='background: #60A869; color: white;'>등록</button>
										<br>
									</td>
								</tr>
							</c:if>
							<!-- 비회원 댓글 입력창 -->
							
							<!-- 회원 댓글 입력창 -->
							<c:if test="${ !empty loginUser }">
								<tr>
									<td scope="row">댓글</td>
									<td colspan='2'>
										<textarea rows="3" cols="60" id='replyContent' style='resize: none;' placeholder='댓글을 작성해주세요'></textarea>
										</td>
									<td>
										<button type="button" class="btn btn-sm" id='insertReply' style='background: #60A869; color: white;'>등록</button>
										<br>
									</td>
								</tr>
							</c:if>
							<!-- 비회원 댓글 입력창 -->
							
						</tbody>
					</table>
				</div>
				<div class="col"></div>
			</div>
		</div>
		<!-- 댓글 폼 -->
		
		<!-- 삭제 모달 -->
		<div class="modal fade" tabindex="-1" role="dialog" id="modalChoice">
			<div class="modal-dialog" role="document">
				<div class="modal-content rounded-3 shadow">
					<div class="modal-body p-4 text-center">
						<h3 class="mb-0">정말로 삭제하시겠습니까?</h3>
						<p class="mb-0">삭제 후 게시글은 복구할 수 없습니다.</p>
					</div>
					<div class="modal-footer flex-nowrap p-0">
						<button type="button"class="btn btn-lg btn-link fs-6 text-decoration-none col-6 m-0 rounded-0 border-end" id='delete'>
							<strong>네</strong>
						</button>
						<button type="button" class="btn btn-lg btn-link fs-6 text-decoration-none col-6 m-0 rounded-0" data-bs-dismiss="modal">아니오</button>
					</div>
				</div>
			</div>
		</div>
		<!-- 삭제 모달 -->

	<div class='margin'></div>
	<!-- 푸터 -->
	<%@ include file='../common/footer.jsp'%>
	<!-- /푸터 -->

	<script>
		// 삭제 버튼 클릭시
		document.getElementById('deleteBoard').addEventListener('click', ()=>{
			$('#modalChoice').modal('show');
		})
		
		// 목록 버튼 클릭시
		document.getElementById('goToBack').addEventListener('click', ()=>{
			if(${b.cateNo} == 100){
				location.href = '${contextPath}/notice.admin?page=' + ${ page };
			}else if(${b.cateNo} == 101){
				location.href = '${contextPath}/question.admin?page=' + ${ page };
			}else if(${b.cateNo} == 102){
				location.href = '${contextPath}/review.admin?page=' + ${ page };
			}else{
				location.href = '${contextPath}/book.admin?page=' + ${ page };
			}
		})
		
	
		// 삭제 버튼 '예'클릭시
		document.getElementById('delete').addEventListener('click', () =>{
			let category;
			if(${b.cateNo == 100}){
				category = 'notice';
			}else if(${b.cateNo == 101}){
				category = 'question';
			}else if(${b.cateNo == 102}){
				category = 'review';
			}else{
				category = 'book';
			}
			
			location.href = '${contextPath}/delete.admin?bId=' + ${ b.boardNo } + "&list=" + ${imgList.size()} + "&category=" + category;
		})
		
		
		
		
		
		
		
		
		
		
		
		
	</script>
</body>
</html>