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
	<form action="${ contextPath }/updateView.bo" method='post'>
		<div class="container text-center">
			<div class="row">
				<div class="col"></div>
					<div class="col-8 content-center" style='background: white; border-radius: 25px;'>
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
									<c:if test="${ b.noSubject == 'NEWS'}">[새소식] </c:if>
									<c:if test="${ b.noSubject == 'EVENT'}">[이벤트] </c:if>
									<c:if test="${ b.noSubject == 'NOTICE'}">[공지] </c:if>
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
								<!-- 문의 게시글 진행상태 -->
								
								<!-- 예약 게시글 진행상태 -->
								<c:if test="${ b.cateNo == 103 }">
									<c:if test="${ b.quBoBoardStatus == 'Y' }">
										<input type='text' id='status' value='예약 완료' size='8' class='inputBoard' style='color: green;' readonly>
									</c:if>
									<c:if test="${ b.quBoBoardStatus == 'N' }">
										<input type='text' id='status' value='확인중' size='8' class='inputBoard' style='color: red;' readonly>
									</c:if>
								</c:if>
								<!-- 문의 게시글 진행상태 -->
								
							</div>
							<br>
							<div class='text-start' id='contentBox'>
								<textArea id='boardContent' name='boardContent' cols='70' rows='20' style="resize: none; board" class='inputBoard' readonly>${ b.boardContent }</textArea>
								<c:forEach items="${ imgList }" var='img'>
									<div style='margin: 15px 15px;' class='text-center'>
										<img alt="${ img.imgName }" src="${ contextPath }/resources/uploadImg/${img.imgRename}" width='60%'>
									</div>
								</c:forEach>
							</div>
							<div class='text-start'></div>
							<hr>
							<div class="text-center">
								<button type="button" class="btn" style='background: #60A869; color: white;' id='goToBack'>목록</button>
								
								<!-- 로그인유저와 글쓴이가 같을 거나, 예약/문의 게시글을 비번 입력 후 들어왔을 때 -->
								<c:if test="${ (loginUser.memNo == b.boardWriterNo) || b.cateNo == 103 || b.cateNo == 101 }">
									&nbsp;&nbsp;&nbsp;
									<button class="btn" id='updateBoard' style='background: #EA862A; color: white;'>수정</button>
									&nbsp;&nbsp;&nbsp;
									<button type="button" class="btn" id='deleteBoard' style='background: #DD5353; color: white;'>삭제</button>
								</c:if>
								<!-- 로그인유저와 글쓴이가 같을 거나, 예약/문의 게시글을 비번 입력 후 들어왔을 때 -->
								
							</div>
						<hr>
				</div>
				<div class="col"></div>
			</div>	
		</div>
		
		<!-- 문의 답변 폼 -->
		<c:if test="${ b.cateNo == 101 or b.cateNo == 103 }">
			<div class="container" style='margin-bottom: 70px'>
				<div class="row" height='300px'>
					<div class="col"></div>
						<div class="col-8 content-center" style='background: white; border-radius: 25px;'>
							<h3 style="border-left: 5px solid #65B741; padding-left: 10px; display: inline-block; margin-bottom: 15px;"> 운영자 답변</h3>
							<c:if test='${ empty replyList }'>
								<div class='text-center'>아직 운영자가 답변을 남기지않았습니다. 조금만 기다려주세요.</div>
							</c:if>
							<c:if test='${ !empty replyList }'>
								<div class='text-start'><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${ replyList[0].reContent }</b></div>
							</c:if>
						</div>
					<div class="col"></div>
				</div>	
			</div>
		</c:if>
		
		<!-- 댓글 폼 -->
		<c:if test="${ b.cateNo != 101 and b.cateNo != 103 }">
			<div class="container text-center">
				<div class="row">
					<div class="col"></div>
					<div class="col-8 content-center" style='background: white; border-radius: 25px;'>
						<table class="table">
							<thead>
								<tr>
									<th scope="col" width='10%'>작성자</th>
									<th scope="col" width='60%'>댓글</th>
									<th scope="col" width='15%'>작성일</th>
									<th scope="col" width='15%'></th>
								</tr>
							</thead>
							<tbody class='table-group-divider'>
								<c:if test="${ !empty replyList }">
									<c:forEach items="${ replyList }" var='r'>
										<tr>
											<td scope="row">${ r.memName }</td>
											<td>${ r.reContent }</td>
											<td>${ r.modifyDate }</td>
											<td>
												<input type='hidden' value='${ r.reNo }' name='reNo'>
												<c:if test="${ r.memNo eq loginUser.memNo }">
													<span><button type="button" class="btn btn-sm" id='updateReply' style='background: #EA862A; color: white;'>수정</button></span>
													 <span><button type="button" class="btn btn-sm" id='deleteReply' style='background: #DD5353; color: white;'>삭제</button></span>
												</c:if>
												<input type='hidden' value='${ r.reContent }' name='reContent'>
											</td>
										</tr>
									</c:forEach>
								</c:if>
								<c:if test="${ empty replyList }">
									<tr>
										<td scope="row" colspan='4'>댓글이 없습니다. 댓글을 입력해주세요 :)</td>
									</tr>
								</c:if>
							</tbody>
						</table>
						<div id='paginaion'></div>
						<!-- 비회원 댓글 입력창 -->
						<c:if test="${ empty loginUser }">
							<div class="row">
								<div class="col-2">댓글</div>
								<div class="col-7 content-center" style='background: white; border-radius: 25px;'>
									<textarea rows="3" cols="50" style='resize: none;' readonly placeholder='로그인 후 이용해주세요'></textarea>
								</div>
								<div class="col-3 content-center">
									<button type="button" class="btn btn-sm" id='noLoginReply' style='background: #60A869; color: white;'>등록</button>
								</div>
							</div>
						</c:if>
						<!-- 비회원 댓글 입력창 -->
						
						<!-- 회원 댓글 입력창 -->
						<c:if test="${ !empty loginUser }">
							<div class="row">
								<div class="col-2">댓글</div>
								<div class="col-8 content-center" style='background: white; border-radius: 25px;'>
									<textarea rows="3" cols="50" style='resize: none;' id='replyContent' placeholder='댓글을 작성해주세요'></textarea>
								</div>
								<div class="col-2 content-center">
									<button type="button" class="btn btn-sm" id='insertReply' style='background: #60A869; color: white;'>등록</button>
								</div>
							</div>
						</c:if>
						<!-- 회원 댓글 입력창 -->
							
					</div>
					<div class="col"></div>
				</div>
			</div>
		</c:if>
		<!-- 댓글 폼 -->
	</form>
		
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
		
		<!-- 댓글 로그인 모달 -->
		<div class="modal fade" tabindex="-1" role="dialog" id="modalChoice2">
			<div class="modal-dialog" role="document">
				<div class="modal-content rounded-3 shadow">
					<div class="modal-body p-4 text-center">
						<h3 class="mb-0">로그인 후 이용해주세요</h3>
					</div>
					<div class="modal-footer flex-nowrap p-0">
						<button type="button"class="btn btn-lg btn-link fs-6 text-decoration-none col-6 m-0 rounded-0 border-end" id='loginView'>
							<strong>로그인</strong>
						</button>
						<button type="button" class="btn btn-lg btn-link fs-6 text-decoration-none col-6 m-0 rounded-0" data-bs-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</div>
		<!-- 댓글 로그인 모달 -->

	<div class='margin'></div>
	<!-- 푸터 -->
	<%@ include file='../common/footer.jsp'%>
	<!-- /푸터 -->



	<script>
		// 삭제 버튼 클릭시
		const deleteBoard = document.getElementById('deleteBoard');
		if(deleteBoard != null){
			deleteBoard.addEventListener('click', ()=>{
				$('#modalChoice').modal('show');
			})
		}
		
		// 목록 버튼 클릭시
		document.getElementById('goToBack').addEventListener('click', ()=>{
			if(${b.cateNo} == 100){
				location.href = '${contextPath}/notice.menu?page=' + ${ page };
			}else if(${b.cateNo} == 101){
				location.href = '${contextPath}/question.menu?page=' + ${ page };
			}else if(${b.cateNo} == 102){
				location.href = '${contextPath}/review.menu?page=' + ${ page };
			}else{
				location.href = '${contextPath}/book.menu?page=' + ${ page };
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
			
			location.href = '${contextPath}/delete.bo?bId=' + ${ b.boardNo } + "&list=" + ${imgList.size()} + "&category=" + category + '&relist=' + ${replyList.size()};
		})
		
		// 미로그인한 상태에서 댓글 등록 버튼 클릭시
		const noLoginReply = document.getElementById('noLoginReply');
		
		if(noLoginReply != null){
			noLoginReply.addEventListener('click', ()=>{
				$('#modalChoice2').modal('show');
			})
		}
		
		// 로그인하기 클릭시
		document.getElementById('loginView').addEventListener('click', () =>{
			location.href = '${contextPath}/loginView.me';
		})
		
		const tbody = document.querySelector('tbody');
		
		// 댓글 등록
		if(document.getElementById('insertReply') != null){
			document.getElementById('insertReply').addEventListener("click", () =>{
				$.ajax({
					url:"${contextPath}/insertReply.bo",
					data:{reContent:document.getElementById('replyContent').value, boardNo:${b.boardNo}, memNo:'${loginUser.memNo}'},
					dataType: 'json',
					success: data => {
						tbody.innerHTML = ""
						
						for(const reply of data){
							const tr = document.createElement("tr");
							
							const nameTd = document.createElement('td');
							nameTd.innerText = reply.memName;
							
							const contentTd = document.createElement('td');
							contentTd.innerHTML = reply.reContent;
							
							const dateTd = document.createElement('td');
							dateTd.innerText = reply.modifyDate.split(" ")[0];
							
							const buttonTd = document.createElement('td');
							if(reply.memNo == '${loginUser.memNo}'){
								buttonTd.innerHTML = "<input type='hidden' value='" + reply.reNo +"' name='reNo'><span><button type='button' class='btn btn-sm' id='updateReply' style='background: #EA862A; color: white;'>수정</button></span> <span><button type='button' class='btn btn-sm' id='deleteReply' style='background: #DD5353; color: white;'>삭제</button><span>" 
							}
							
							tr.append(nameTd);
							tr.append(contentTd);
							tr.append(dateTd);
							tr.append(buttonTd);
							
							tbody.append(tr);
							
							document.getElementById('replyContent').value = "";
						}
					},
					error: data => console.log(data)
				})
			})
		}
		
		// 댓글 수정 + 삭제
		tbody.addEventListener('click', e => {
			const eventTarget = e.target;
			const targetTagName = eventTarget.tagName.toLowerCase();
			
			
			let targetButton = null;
			if(targetTagName == 'button'){
				targetButton = eventTarget.parentElement;
			}else if(targetTagName == 'span'){
				targetButton = eventTarget;
			}
			
			// 댓글 수정
			if(targetButton != null){
				// 클릭한 버튼 td
				const clickTd = targetButton.parentElement;
				
				// reId
				const reId = clickTd.children[0].value;
				
				// content가 담긴 Td
				const contentTd = clickTd.parentElement.children[1];
				
				if(targetButton.children[0].id == 'updateReply'){
					
					// 다른 댓글 수정 버튼 클릭시
					if(document.getElementById('updateReplySubmit') != null){
						buttonChange();
					}
					
					
					contentTd.innerHTML = '<textarea rows="3" cols="50" style="resize: none;">' + contentTd.innerText +'</textarea>'
					
					// 수정 버튼 > 완료 버튼
					clickTd.children[1].innerHTML = '<button type="button" class="btn btn-sm" id="updateReplySubmit" style="background: #60A869	; color: white;">완료</button>&nbsp;'
					
					// 삭제 버튼 > 취소 버튼
					clickTd.children[2].innerHTML = '<button type="button" class="btn btn-sm" id="cancelUpdateReply" style="background: #DD5353; color: white;">취소</button>'
					
				// 댓글 삭제	
				}else if(targetButton.children[0].id == 'deleteReply'){
					if(confirm("정말 삭제하시겠습니까?")){
						$.ajax({
							url:'${contextPath}/deleteReply.bo',
							data:{reId:reId},
							success: data => {
								if(data == 'success'){
									clickTd.parentElement.remove();
								}else{
									alert("댓글 삭제에 실패했습니다.");
								}
							},
							error: data => console.log(data)
						})
					}
				}else if(targetButton.children[0].id = 'updateReplySubmit'){
				
					$.ajax({
						url:"${contextPath}/updateReply.bo",
						data:{reNo:reId, reContent:contentTd.children[0].value},
						success: data => {
							if(data == 'success'){
								buttonChange(contentTd.children[0].value);
							}else{
								alert("댓글 수정에 실패했습니다.");
							}
						},
						error: data => console.log(data)
					})
					
				}else if(targetButton.children[0].id = 'cancelUpdateReply'){
					buttonChange();
				}
				
			}
		})
		
		
		// 댓글 수정 삭제 버튼 변경 함수
		const buttonChange = (type) => {
			
			// 이전 완료 버튼
			const submitButton = document.getElementById('updateReplySubmit');
			
			// 이전 완료 버튼의 span
			const submitSpan = submitButton.parentElement;
			
			// 이전 취소 버튼의 span
			const cancelSpan = submitSpan.nextElementSibling;
			
			// 이전 완료/취소 버튼의 TD
			const beforeTd = submitSpan.parentElement;
			
			// reNo
			const reNoInput = beforeTd.children[0].value;
			
			
			// 수정 전 댓글 내용
			const beforeContentInput = beforeTd.children[1].value;
			
			// 내용 Td
			const contentTd = beforeTd.parentElement.children[1];
			
			//버튼 변경
			submitSpan.innerHTML = "<button type='button' class='btn btn-sm' id='updateReply' style='background: #EA862A; color: white;'>수정</button>&nbsp;";
			cancelSpan.innerHTML = "<button type='button' class='btn btn-sm' id='deleteReply' style='background: #DD5353; color: white;'>삭제</button>";
			
			if(type == undefined){
				contentTd.innerHTML = beforeContentInput
			}else{
				contentTd.innerHTML = type
				beforeTd.children[3].value = type
			}
		}
	</script>
</body>
</html>