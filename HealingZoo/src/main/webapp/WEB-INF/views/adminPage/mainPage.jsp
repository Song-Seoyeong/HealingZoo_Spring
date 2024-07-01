<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<meta charset="UTF-8">
<style>
	.search {
	  position: relative;
	  width: 300px;
	  display: inline-block;
	  float: right;
	  margin-bottom: 30px;
	}
	
	input {
	  width: 100%;
	  border: 1px solid #bbb;
	  border-radius: 8px;
	  padding: 10px 12px;
	  font-size: 14px;
	}
	
	#search {
	  position : absolute;
	  width: 17px;
	  top: 14px;
	  right: 12px;
	  margin: 0;
	}
	
	.form-check-input{
		transform : scale(0.5);
		accent-color: #65B741;
	}
	
	
	#delete_button{ background-color: #DD5353; width: 80px; border: none;}
	#write_button{ background-color: #65B741; width: 80px; border: none; margin-right: 5px;}
	
	.pagination-container {
	  display: flex;
	  justify-content: center;
	}
	
	.number-button-wrapper {
		padding: 10px;
	}
	tr{text-align:center;}
	
	.img{width:200px;}
	.nav-item a:hover{
	font-weight: bold;
}
	#sideButton{color: #65B741; font-weight: bold;}
</style>
<title>Insert title here</title>
</head>
<body>
	<%@ include file='../common/logoBar.jsp' %>
	<%@ include file='../common/mainCategoryBar.jsp' %>
	<%@ include file='../common/adminSidebar.jsp'%>
	
	<!-- 글 목록 -->
	<div class="container" style="width: 900px; margin-top: 100px;  ">
		  <h2 style="border-left: 10px solid #65B741; padding-left: 15px; display: inline-block; margin-bottom: 15px;">메인페이지</h2>
		  <form id="bannerData" action='insertBanner.admin'>
			  <div id="banner" style="width:900px; height:50px; margin-top:25px" >
				 <h4 style="border-left: 5px solid #65B741; padding-left: 10px; display: inline-block; margin-bottom: 15px;">배너관리</h4>
				 <!-- 배너관리 -->
				 <table class="table">
					  <thead>
					    <tr>
					      <th scope="col" style="width:50px;"><input class="form-check-input" type="checkbox" value="" id="flexCheckDefault"></th>
					      <th scope="col">순서</th>
					      <th scope="col">링크</th>
					      <th scope="col">이미지 첨부</th>
					    </tr>
					  </thead>
					  <tbody class="table-group-divider">
					    <tr>
					    	<td><input class="form-check-input" type="checkbox" value="" id="flexCheckDefault"></td>
							<td scope="row">
								1
							</td>
							<td>
								<select aria-label="말머리 선택" name='bannerLink'id='bannerLink1' style="border-style: none;  text-align: center; background-color: #fff; font-family: 'NanumSquareRound';">
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
							<td><input type="file" accept="image/*" name="file" style="border:none;"></td>
						</tr>
					    <tr>
					    	<td><input class="form-check-input" type="checkbox" value="" id="flexCheckDefault"></td>
							<td scope="row">
								2
							</td>
							<td>
								<select aria-label="말머리 선택" name='bannerLink' id='bannerLink2' style="border-style: none;  text-align: center; background-color: #fff; font-family: 'NanumSquareRound';">
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
							<td><input type="file" accept="image/*" name="file" style="border:none;"></td>
						</tr>
						  <tr>
					    	<td><input class="form-check-input" type="checkbox" value="" id="flexCheckDefault"></td>
							<td scope="row">
								3
							</td>
							<td>
								<select aria-label="말머리 선택" name='bannerLink' id='bannerLink3' style="border-style: none;  text-align: center; background-color: #fff; font-family: 'NanumSquareRound';">
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
							<td><input type="file" accept="image/*" name="file" style="border:none;"></td>
						</tr>
					  </tbody>
				 </table>
				   <div class="revision">
						<div class="d-grid gap-2 d-md-flex justify-content-md-end">
							<button class="btn btn-primary" id="insertBannerbutton" style="background-color:orange;">수정</button>
							<button class="btn btn-primary" type="button" id="delete_button" >삭제</button>
						</div>
					</div>
			  </div>
		  </form>
			  <div id="oneEye" style="width:900px; height:50px; margin:300px 0px; " >
				 <h4 style="border-left: 5px solid #65B741; padding-left: 10px; display: inline-block; margin-bottom: 15px;">한눈에 보기</h4>
					  <!-- 한눈에 보기 -->
					 <table class="table">
						  <thead>
						    <tr>
						      <th scope="col" style="width:50px;"><input class="form-check-input" type="checkbox" value="" id="flexCheckDefault"></th>
						      <th scope="col">순서</th>
						      <th scope="col">링크</th>
						      <th scope="col">이미지 첨부</th>
						    </tr>
						  </thead>
						  <tbody class="table-group-divider">
						    <tr>
						    	<td><input class="form-check-input" type="checkbox" value="" id="flexCheckDefault"></td>
								<td scope="row">1</td>
								<td>
									<select aria-label="말머리 선택" id='oneEyeLink1' style="border-style: none;  text-align: center; background-color: #fff; font-family: 'NanumSquareRound';">
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
								<td><input type="file" accept="image/*" class="img" style="border:none;"></td>
							</tr>
						    <tr>
						    	<td><input class="form-check-input" type="checkbox" value="" id="flexCheckDefault"></td>
								<td scope="row">2</td>
								<td>
									<select aria-label="말머리 선택" id='oneEyeLink2' style="border-style: none;  text-align: center; background-color: #fff; font-family: 'NanumSquareRound';">
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
								<td><input type="file" accept="image/*" class="img" style="border:none;"></td>
							</tr>
						  </tbody>
					</table>
					
					 <div class="revision">
						<div class="d-grid gap-2 d-md-flex justify-content-md-end">
							<button class="btn btn-primary" type="button" id="write_button" style="background-color:orange;">수정</button>
							<button class="btn btn-primary" type="button" id="delete_button">삭제</button>
					 </div>
				 </div>
			 </div>
			 
		<!-- -------- -->
		
	</div>
	
	<%@ include file='../common/footer.jsp' %>
	
	<script>
	
	
	
	
	</script>
</body>
</html>