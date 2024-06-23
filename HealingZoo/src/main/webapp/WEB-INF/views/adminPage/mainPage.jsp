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
		  <form id="bannerData">
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
							<td scope="row">1</td>
							<td><input type="text" value="https://" name="bLink1" style="border:none;" ></td>
							<td><input type="file" accept="image/*" name="bImg1" style="border:none;"></td>
						</tr>
					    <tr>
					    	<td><input class="form-check-input" type="checkbox" value="" id="flexCheckDefault"></td>
							<td scope="row">2</td>
							<td><input type="text" value="https://" name="bLink2" style="border:none;"></td>
							<td><input type="file" accept="image/*" name="bImg2" style="border:none;"></td>
						</tr>
						  <tr>
					    	<td><input class="form-check-input" type="checkbox" value="" id="flexCheckDefault"></td>
							<td scope="row">3</td>
							<td><input type="text" value="https://" name="bLink3" style="border:none;"></td>
							<td><input type="file" accept="image/*" name="bImg3" style="border:none;"></td>
						</tr>
					  </tbody>
				 </table>
				   <div class="revision">
						<div class="d-grid gap-2 d-md-flex justify-content-md-end">
							<button class="btn btn-primary" type="button" id="write_button" style="background-color:orange;">수정</button>
							<button class="btn btn-primary" type="button" id="delete_button" >삭제</button>
						</div>
					</div>
			  </div>
		  </form>
		  <form id="oneEyeData"> 
			  <div id="oneEye" style="width:900px; height:50px; margin-top:300px" >
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
								<td><input type="text" value="https://" class="link" style="border:none;"></td>
								<td><input type="file" accept="image/*" class="img" style="border:none;"></td>
							</tr>
						    <tr>
						    	<td><input class="form-check-input" type="checkbox" value="" id="flexCheckDefault"></td>
								<td scope="row">2</td>
								<td><input type="text" value="https://" class="link" style="border:none;"></td>
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
		  </form>
		<!-- -------- -->
		
		<div id=subCotainer style="margin-top:180px">
			<!-- 페이지네이션 -->
			<div class="container">
			    <div class="pagination-container" style="margin-bottom: 20px;">
			      <div class="prev-button" style="padding:10px;">&lt;</div>
			      <div class="number-button-wrapper"><span class="number-button">1</span></div>
			      <div class="number-button-wrapper"><span class="number-button">2</span></div>
			      <div class="number-button-wrapper"><span class="number-button">3</span></div>
			      <div class="number-button-wrapper"><span class="number-button">4</span></div>
			      <div class="number-button-wrapper"><span class="number-button">5</span></div>
			      <div class="next-button" style="padding:10px;">&gt;</div>
			    </div>
			</div>
			
			<!-- 검색 -->
		   
			<div class="row justify-content-center" style="margin-bottom: 100px;">
			</div>
		</div>
	</div>
	
	<%@ include file='../common/footer.jsp' %>
</body>
</html>