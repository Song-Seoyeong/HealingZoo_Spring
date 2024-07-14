<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<style>
#mainCategoryBar {
	height: 150px;
	border-radius: 0px 0px 20px 20px;
	background: #65B741;
	margin: 0px;
}

.mainCateName:hover {
	font-weight: bold;
}

.mainCateName {
	font-size: 25px;
	color: white;
	text-decoration: none;
}

.subCategory {
	background: white;
	border-radius: 20px;
	visibility: hidden;
	height: 40px;
	position: absolute;
}

.subCategory li {
	margin: 10px;
	display: inline-block;
}

.subCategory a {
	color: #65B741;
	font-size: 15px;
	text-decoration: none;
}

.subCategory a:hover {
	font-weight: bold;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container-fluid text-center">
		<div class="row" id='mainCategoryBar'>
		    <div class="col">
		    	<br><br>
		    	<a href='${ contextPath }/greeting.menu' class='mainCateName' id='zooInfo'>동물원 소개</a>
		    	<div class="subCategory" id='zooInfoSub'>
			    	<ul>
					  <li><a href='${ contextPath }/greeting.menu'>인사말</a></li>
					  <li><a href='${ contextPath }/way.menu'>오시는 길</a></li>
					  <li><a href='${ contextPath }/programInfo.menu'>프로그램 안내</a></li>
					  <li><a href='${ contextPath }/operating.menu'>운영시간 및 입장금액 안내</a></li>
					  <li style='width: 80px;'><a href='${ contextPath }/notice.menu'>공지사항</a></li>
					</ul>
				</div>
		    </div>
		    <div class="col  ">
		    	<br><br>
		    	<a href='${ contextPath }/family.menu' class='mainCateName' id='animalInfo'>동물 소개</a>
		    	<div class="subCategory justisfy-content-center" id='animalInfoSub'>
			    	<ul>
					  <li><a href='${ contextPath }/family.menu'>가족 소개</a></li>
					  <li style='width: 120px;'><a href='${ contextPath }/mascot.menu'>마스코트</a></li>
					</ul>
				</div>
		    </div>
		    <div class="col">
		    	<br><br>
				<a href='${ contextPath }/review.menu' class='mainCateName' id='community'>커뮤니티</a>
				<div class="subCategory" id='communitySub'>
				    <ul>
					  <li><a href='${ contextPath }/review.menu'>후기 게시판</a></li>
					  <li style='width: 120px;'><a href='${ contextPath }/book.menu'>예약 게시판</a></li>
					</ul>
				</div>
			</div>
		    <div class="col">
		    	<br><br>
				<a href='${ contextPath }/FAQ.menu' class='mainCateName' id='cs'>고객 센터</a>
				<div class="subCategory" id='csSub'>
			    	<ul>
					  <li style='width: 150px;'><a href='${ contextPath }/FAQ.menu'>자주 묻는 Q&A</a></li>
					  <li style='width: 120px;'><a href='${ contextPath }/question.menu'>문의 게시판</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<script>
		window.onload = () =>{
			const mainCateNames = document.getElementsByClassName('mainCateName');
			for(const mainCateName of mainCateNames){
				const subCategory = mainCateName.nextElementSibling;
				mainCateName.addEventListener('mouseenter', function(){
					subCategory.style.visibility = 'visible';
					
				})
				subCategory.addEventListener('mouseover', function(){
					subCategory.style.visibility = 'visible';
				})
				mainCateName.addEventListener('mouseout', () =>{
					subCategory.style.visibility = 'hidden';
					
				})
				subCategory.addEventListener('mouseout', function(){
					subCategory.style.visibility = 'hidden';
					
				})
			}
			
		}
	</script>
</body>
</html>