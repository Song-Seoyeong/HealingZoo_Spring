<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<meta charset="UTF-8">
<style>
	input {
	  width: 100%;
	  border: 1px solid #bbb;
	  border-radius: 8px;
	  padding: 10px 12px;
	  font-size: 14px;
	}
	
	.form-check-input{
		transform : scale(0.5);
		accent-color: #65B741;
	}
	
	#insertOneEyeButton{ background-color: orange; width: 80px; border: none; margin-right: 5px;}
	#insertBannerButton{ background-color: orange; width: 80px; border: none; margin-right: 5px;}
	
	
	tr{text-align:center;}
	
	.img{width:200px;}
	.nav-item a:hover{
	font-weight: bold;
}
	#sideButton{color: #65B741; font-weight: bold;}
</style>
<title>메인 페이지</title>
</head>
<body>
	<%@ include file='../common/logoBar.jsp' %>
	<%@ include file='../common/mainCategoryBar.jsp' %>
	<%@ include file='../common/adminSidebar.jsp'%>
	
	<!-- 글 목록 -->
	<div class="container" style="width: 900px; margin-top: 100px;  ">
		  <h2 style="border-left: 10px solid #65B741; padding-left: 15px; display: inline-block; margin-bottom: 15px;">메인페이지</h2>

			<!-- 배너 관리 -->
			<form action="${ contextPath }/insertBanner.admin" enctype='multipart/form-data' method='post'>
			  <div id="banner" style="width:900px; height:50px; margin-top:25px" >
				 <h4 style="border-left: 5px solid #65B741; padding-left: 10px; display: inline-block; margin-bottom: 15px;">배너관리</h4>
				 <!-- 배너관리 -->
				 <table class="table text-center">
					  <thead>
					    <tr>
					      <th scope="col" style="width:50px;"><input class="form-check-input" type="checkbox" id='totalCheck1'></th>
					      <th scope="col">순서</th>
					      <th scope="col">링크</th>
					      <th scope="col">이미지 첨부</th>
					    </tr>
					  </thead>
					  <tbody class="table-group-divider">
					    <tr>
					    	<td><input class="form-check-input" name='checkBanner' type="checkbox" value="1" ></td>
							<td scope="row">
								1
							</td>
							<td>
								<select aria-label="말머리 선택" name='bannerLink' disabled style="border-style: none;  text-align: center; background-color: #fff; font-family: 'NanumSquareRound';">
									<option selected value=''>링크 선택</option>
									<option value='greeting'>인사말</option>
									<option value='way'>오시는 길</option>
									<option value='programInfo'>프로그램 소개</option>
									<option value='operating'>운영시간</option>
									<option value='notice'>공지사항</option>
									<option value='family'>가족 소개</option>
									<option value='mascot'>마스코트</option>
									<option value='review'>후기 게시판</option>
									<option value='book'>예약 게시판</option>
									<option value='FAQ'>자주 묻는 Q&A</option>
									<option value='question'>문의 게시판</option>
								</select>
							</td>
							<td><input type="file" accept="image/*" class="img" name="file" style="border:none;" disabled></td>
						</tr>
					    <tr>
					    	<td><input class="form-check-input" name='checkBanner' type="checkbox" value="2" ></td>
							<td scope="row">
								2
							</td>
							<td>
								<select aria-label="말머리 선택" name='bannerLink' disabled style="border-style: none;  text-align: center; background-color: #fff; font-family: 'NanumSquareRound';">
									<option selected value=''>링크 선택</option>
									<option value='greeting'>인사말</option>
									<option value='way'>오시는 길</option>
									<option value='programInfo'>프로그램 소개</option>
									<option value='operating'>운영시간</option>
									<option value='notice'>공지사항</option>
									<option value='family'>가족 소개</option>
									<option value='mascot'>마스코트</option>
									<option value='review'>후기 게시판</option>
									<option value='book'>예약 게시판</option>
									<option value='FAQ'>자주 묻는 Q&A</option>
									<option value='question'>문의 게시판</option>
								</select>
							</td>
							<td><input type="file" accept="image/*" class="img" name="file" style="border:none;" disabled></td>
						</tr>
						  <tr>
					    	<td><input class="form-check-input" name='checkBanner' type="checkbox" value="3"></td>
							<td scope="row">
								3
							</td>
							<td>
								<select aria-label="말머리 선택" name='bannerLink' disabled style="border-style: none;  text-align: center; background-color: #fff; font-family: 'NanumSquareRound';">
									<option selected value=''>링크 선택</option>
									<option value='greeting'>인사말</option>
									<option value='way'>오시는 길</option>
									<option value='programInfo'>프로그램 소개</option>
									<option value='operating'>운영시간</option>
									<option value='notice'>공지사항</option>
									<option value='family'>가족 소개</option>
									<option value='mascot'>마스코트</option>
									<option value='review'>후기 게시판</option>
									<option value='book'>예약 게시판</option>
									<option value='FAQ'>자주 묻는 Q&A</option>
									<option value='question'>문의 게시판</option>
								</select>
							</td>
							<td><input type="file" accept="image/*" class="img" name="file" style="border:none;" disabled></td>
						</tr>
					  </tbody>
				 </table>
				   <div class="revision">
						<div class="d-grid gap-2 d-md-flex justify-content-md-end">
							<button class="btn btn-primary"  id="insertBannerButton">수정</button>
						</div>
					</div>
			  </div>
		 </form>

			<!-- 한눈에 보기 -->
			<form action="${ contextPath }/insertOneEye.admin"enctype='multipart/form-data' method='post'>
			  <div id="oneEye" style="width:900px; height:50px; margin:300px 0px; " >
				 <h4 style="border-left: 5px solid #65B741; padding-left: 10px; display: inline-block; margin-bottom: 15px;">한눈에 보기</h4>
					  
					 <table class="table">
						  <thead>
						    <tr>
						      <th scope="col" style="width:50px;"><input class="form-check-input" type="checkbox" id='totalCheck2'></th>
						      <th scope="col">순서</th>
						      <th scope="col">링크</th>
						      <th scope="col">이미지 첨부</th>
						    </tr>
						  </thead>
						  <tbody class="table-group-divider">
						    <tr>
						    	<td><input class="form-check-input" type="checkbox" name='checkOneEye' value="1"></td>
								<td scope="row">1</td>
								<td>
									<select aria-label="말머리 선택" name='oneEyeLink' disabled style="border-style: none;  text-align: center; background-color: #fff; font-family: 'NanumSquareRound';">
										<option selected value=''>링크 선택</option>
										<option value='greeting'>인사말</option>
										<option value='way'>오시는 길</option>
										<option value='programInfo'>프로그램 소개</option>
										<option value='operating'>운영시간</option>
										<option value='notice'>공지사항</option>
										<option value='family'>가족 소개</option>
										<option value='mascot'>마스코트</option>
										<option value='review'>후기 게시판</option>
										<option value='book'>예약 게시판</option>
										<option value='FAQ'>자주 묻는 Q&A</option>
										<option value='question'>문의 게시판</option>
									</select>
								</td>
								<td><input type="file" name='file2' accept="image/*" disabled class="img" style="border:none;"></td>
							</tr>
						    <tr>
						    	<td><input class="form-check-input" type="checkbox" value="2" name='checkOneEye'></td>
								<td scope="row">2</td>
								<td>
									<select aria-label="말머리 선택" name='oneEyeLink' disabled style="border-style: none;  text-align: center; background-color: #fff; font-family: 'NanumSquareRound';">
										<option selected value=''>링크 선택</option>
										<option value='greeting'>인사말</option>
										<option value='way'>오시는 길</option>
										<option value='programInfo'>프로그램 소개</option>
										<option value='operating'>운영시간</option>
										<option value='notice'>공지사항</option>
										<option value='family'>가족 소개</option>
										<option value='mascot'>마스코트</option>
										<option value='review'>후기 게시판</option>
										<option value='book'>예약 게시판</option>
										<option value='FAQ'>자주 묻는 Q&A</option>
										<option value='question'>문의 게시판</option>
									</select>
								</td>
								<td><input type="file" name='file2' accept="image/*" disabled class="img" style="border:none;"></td>
							</tr>
						  </tbody>
					</table>
					
					 <div class="revision">
						<div class="d-grid gap-2 d-md-flex justify-content-md-end">
							<button class="btn btn-primary"  id="insertOneEyeButton">수정</button>
					 </div>
				 </div>
			 </div>
		</form> 
		<!-- -------- -->
		
	</div>
	
	<%@ include file='../common/footer.jsp' %>
	
	<script>
		// 여기부터
	
		// 배너 체크박스 요소
		const checkBoxes = document.getElementsByName('checkBanner');
	
		// 배너 체크 박스 클릭시 input 태그 활성화
	    for (let i = 0; i < checkBoxes.length; i++) {
	        if (i <= 2) {
	        	checkBoxes[i].addEventListener('change', () =>{
	            	// checkBoxes[i]의 tr
		            const parentTr = checkBoxes[i].parentElement.parentElement;
	
	                const inputBannerLink = parentTr.children[2].children[0];
	                const inputImg = parentTr.children[3].children[0];
	                if (checkBoxes[i].checked) {
	
	
		                inputBannerLink.disabled = false;
		                inputImg.disabled = false;
	                }else{
	                	inputBannerLink.disabled = true;
	                	inputImg.disabled = true;
	                }
				})
	    	}
	    }
		
		// 배너 체크 박스 전체 선택
		document.getElementById('totalCheck1').addEventListener('click', function(){
			
			for(const check of checkBoxes){
				// checkBoxes[i]의 tr
	            const parentTr = check.parentElement.parentElement;

                const inputBannerLink = parentTr.children[2].children[0];
                const inputImg = parentTr.children[3].children[0];
                
				if(this.checked){
					inputBannerLink.disabled = false;
	                inputImg.disabled = false;
					check.checked = true;
				}else{
					inputBannerLink.disabled = true;
                	inputImg.disabled = true;
					check.checked = false;
				}
			}
		})
		
		// 배너 수정시 체크박스 후 링크/이미지링크/이미지 넣지 않았을 경우 + 체크박스 선택하지 않고 submit 할 경우
		document.getElementById('insertBannerButton').addEventListener('click', e => {
		    let flag = true;
		    const checkBoxes = document.getElementsByName('checkBanner'); // checkbox 요소

		    for (let i = 0; i < checkBoxes.length; i++) {
		        if (i <= 2) {
		            // checkBoxes[i]의 tr
		            const parentTr = checkBoxes[i].parentElement.parentElement;

	                const inputBannerLink = parentTr.children[2].children[0];
	                const inputImg = parentTr.children[3].children[0];
	                
	                console.log(inputBannerLink)
	                console.log(inputImg)
	                
		            if (checkBoxes[i].checked) {
		                flag = false;


		                inputBannerLink.disabled = false;
		                inputImg.disabled = false;

		                if (inputBannerLink.value === '') {
		                    alert("링크를 선택해주세요");
		                    e.preventDefault();
		                    return;
		                } else if (inputImg.value === '') {
		                    alert("이미지를 넣어주세요");
		                    e.preventDefault();
		                    return;
		                }
		            } else {
		                inputBannerLink.disabled = true;
		                inputImg.disabled = true;
		            }
		        }
		    }

		    if (flag) {
		        alert("하나 이상의 체크박스를 선택해주세요");
		        e.preventDefault();
		    }
		});
		// 여기까지 배너
		
		// ------------------------------------------
		
		// 여기부터
		
		// 한눈에 보기 체크박스 요소
		const checkOneEyes = document.getElementsByName('checkOneEye');
	
		// 한눈에 보기 체크 박스 전체 선택
		document.getElementById('totalCheck2').addEventListener('click', function(){
			
			for(const check of checkOneEyes){
				// check의 tr
	            const parentTr = check.parentElement.parentElement;

                const inputBannerLink = parentTr.children[2].children[0];
                const inputImg = parentTr.children[3].children[0];
                
				if(this.checked){
					inputBannerLink.disabled = false;
	                inputImg.disabled = false;
					check.checked = true;
				}else{
					inputBannerLink.disabled = true;
                	inputImg.disabled = true;
					check.checked = false;
				}
			}
		})
		
		// 한눈에 보기 체크 박스 클릭시 input 태그 활성화
	    for (let i = 0; i < checkOneEyes.length; i++) {
	        if (i <= 2) {
	        	checkOneEyes[i].addEventListener('click', () =>{
	            	// checkBoxes[i]의 tr
		            const parentTr = checkOneEyes[i].parentElement.parentElement;
	
	                const inputBannerLink = parentTr.children[2].children[0];
	                const inputImg = parentTr.children[3].children[0];
	                
	                if (checkOneEyes[i].checked) {
	
		                inputBannerLink.disabled = false;
		                inputImg.disabled = false;
	                }else{
	                	inputBannerLink.disabled = true;
	                	inputImg.disabled = true;
	                }
				})
	    	}
	    }
		
		// 한눈에 보기 수정시 체크박스 후 링크/이미지 넣지 않았을 경우 + 체크박스 선택하지 않고 submit 할 경우
		document.getElementById('insertOneEyeButton').addEventListener('click', (e) => {
			
			for(const i in checkOneEyes){
				if(i <= 1){
					// checkOneEyes[i] Tr
					const parentTr = checkOneEyes[i].parentElement.parentElement;
					
					if(checkOneEyes[i].checked){
						if(parentTr.children[2].children[0].value == ''){
							alert("링크를 선택해주세요")
							 e.preventDefault();
						}else if(parentTr.children[3].children[0].value == ''){
							alert("이미지를 넣어주세요")
							 e.preventDefault();
						}
					}else{
					}
				}
			}
		})
		
		
		
		
		
		
		
		
		
		// 여기까지 한눈에 보기
	</script>
</body>
</html>