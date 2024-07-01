<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome to Healing Zoo</title>
<style>
	a{color: red; text-decoration: none;}
	.card-img{
		border-radius: 10px;
		height: 330px;
		opacity:50%;
	}
</style>
</head>
<body>
	<%@ include file='common/logoBar.jsp' %>
	<%@ include file='common/mainCategoryBar.jsp' %>

	<!-- 아직 메인 카테고리바가 완성되지않아서 인덱스로 각 카테고리별로 넘어갈 수 있게 할게요 -->
	<!-- 로고이미지 클릭시 메인페이지로 돌아옵니다 -->
	<!-- 모든 사진은 image에 복사저장해주세요 -->
	<!-- 각 카테고리별 화면용 폴더네임 : zooInfo(동물원소개) / animalInfo(동물소개) / community(커뮤니티) / cs(고객센터) / myPage(마이페이지) / adminPage(관리자페이지) -->
	<!-- 헤더+메인카테고리바/푸터는 항상 바디 첫부분 끝부분에 넣어주세요 (FAQ 파일참고)-->
	<!-- 헤더에 공통으로 들어가는 정보 : 폰트 / jQuery 라이브러리 / 부트스트랩 링크 -->
	<!-- 푸터에 공통으로 들어가는 정보 : top 버튼 / 부트스트랩 링크 -->
	<br>
	
	<!-- 배너 영역 -->
	<div class="row">
		<div class="col">
	    </div>
	    <div class="col-10">
	    	<div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
				<div class="carousel-inner">
					<div class="carousel-item active" data-bs-interval="2000">
						<a href='views/zooInfo/programInfo.jsp'>
							<img src="resources/image/banner01.png" class="d-block w-100" alt="배너01" id='banner1'>
						</a>
					</div>
					<div class="carousel-item" data-bs-interval="2000">
						<a href='views/animalInfo/family.jsp'>
							<img src="resources/image/banner02.png" class="d-block w-100" alt="배너02" id='banner2'>
						</a>
					</div>
					<div class="carousel-item">
						<a href='views/animalInfo/mascot.jsp'>
							<img src="resources/image/banner03.png" class="d-block w-100" alt="배너03" id='banner3'>
						</a>
					</div>
				</div>
				<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
				    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
				    <span class="visually-hidden">Previous</span>
			 	</button>
			 	<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="next">
				    <span class="carousel-control-next-icon" aria-hidden="true"></span>
				    <span class="visually-hidden">Next</span>
				</button>
			</div>
	    </div>
	    <div class="col">
		</div>
	</div>
  
	<div style='margin: 3%'></div>
	
	<!-- 한눈에 보기 영역 -->
	<div class="row text-center">
	    <div class="col"></div>
	    <div class="col-4">
	    	<div style='height: 330px; width: 550px;'>
	    		<a href="views/community/book.jsp">
			 		<img src="resources/image/animalCare1.jpg" class="card-img" alt="예약게시판" name='glanceImg1' id='glanceImg1'>
			 	</a>
			</div>
	    </div>
	    <div class="col-4">
	    	<div style='height: 330px; width: 550px;'>
	    		<a href="views/animalInfo/family.jsp">
			 		<img src="resources/image/ferret.jpg" class="card-img" alt="가족소개" name='glanceImg2' id='glanceImg2'>
			 	</a>
			</div>
	    </div>
	    <div class="col"></div>
    </div>
    
    
	<div style='margin: 10%'></div>


	
	<%@ include file='common/footer.jsp' %>
</body>
</html>