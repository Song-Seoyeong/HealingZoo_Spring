<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>가족 소개</title>
<style>
    .nav {
        padding: 10px 0;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .nav ul {
        list-style-type: none;
        margin: 0;
        padding: 0;
        display: flex;
    }

    .nav ul li {
        margin: 0 20px;
    }

    .nav ul li a {
        text-decoration: none;
        color: black;
        font-size: 1.2em;
        padding-bottom: 5px;
        border-bottom: 2px solid green;
        transition: border-bottom 0.3s ease;
    }
    .prolinkbar{
    	display: flex;
	    justify-content: center;
	    margin-bottom: 20px;
    }
    .prolink{
    	color: black;
	    font-size: 3.0em; /* 자기화면에 글씨크기가 작다면 이녀석입니다. */
	    padding-bottom: 5px;
	    border-bottom: 2px solid black;
    }
    .animalcontainer {
        display: flex;
        flex-direction: column;
        align-items: center;
        padding: 20px;
    }

    .animal-card {
        background-color: white;
        border-radius: 10px;
        width: 1100px;
        height: auto;
        margin: 30px;
        overflow: hidden;
        display: flex;
    }

    .animal-card .image-container {
        width: 40%;
        height: auto;
        
    }

    .animal-card img { /* 사진의 세로길이가 적당하면 사이즈에 맞춰 작아지고 */
        width: 100%;	/* 300px보다 커질수 없게 해줬다.  */
        height: auto;
        max-height: 300px;
        object-fit: cover;
    }

    .animal-card .content {
        width: 60%;
        padding: 45px;
        display: flex;
        flex-direction: column;
        justify-content: center;
        
    }

    .animal-card .title {
        font-size: 1.5em;
        margin: 0;
        color: #333;
        letter-spacing: 5px; /* 호 랑 이 간격조절 */
    }

    .animal-card .description {
        color: gray;
        margin: 5px 0;
    }
    
</style>
</head>
<body>
    <%@ include file='../common/logoBar.jsp'%>
    
    <div id='background' class='container-fluid' style='background: white;'>
    
    <%@ include file='../common/mainCategoryBar.jsp'%>
	
	<br>
    <div class="nav">
        <ul>
            <li><a href="#포유류">포유류</a></li>
            <li><a href="#조류">조류</a></li>
            <li><a href="#파충류">파충류</a></li>
        </ul>
    </div>
    <br><br>
    
    <div class="prolinkbar" id="포유류">
        <div class="prolink">포유류</div>
    </div>
    <div class="animalcontainer">
        <c:forEach items="${mammals}" var="animal">
            <div class="animal-card">
                <div class="image-container">
                    <img src="${pageContext.request.contextPath}${animal.imagePath}" alt="${animal.animalName}">
                </div>
                <div class="content">
                    <h2 class="title">${animal.animalName}</h2><br>
                    <p class="description">분류: ${animal.animalFamily}</p>
                    <p class="description">멸종위기급수: ${animal.extinctGrade}</p>
                    <p class="description">입소 날짜: ${animal.enterDate}</p>
                </div>
            </div>
            <br>
        </c:forEach>
    </div>

    <div class="prolinkbar" id="조류">
        <div class="prolink">조류</div>
    </div>
    <div class="animalcontainer">
        <c:forEach items="${birds}" var="animal">
            <div class="animal-card">
                <div class="image-container">
                    <img src="${pageContext.request.contextPath}${animal.imagePath}" alt="${animal.animalName}">
                </div>
                <div class="content">
                    <h2 class="title">${animal.animalName}</h2><br>
                    <p class="description">분류: ${animal.animalFamily}</p>
                    <p class="description">멸종위기급수: ${animal.extinctGrade}</p>
                    <p class="description">입소 날짜: ${animal.enterDate}</p>
                </div>
            </div>
            <br>
        </c:forEach>
    </div>

    <div class="prolinkbar" id="파충류">
        <div class="prolink">파충류</div>
    </div>
    <div class="animalcontainer">
        <c:forEach items="${reptiles}" var="animal">
            <div class="animal-card">
                <div class="image-container">
                    <img src="${pageContext.request.contextPath}${animal.imagePath}" alt="${animal.animalName}">
                </div>
                <div class="content">
                    <h2 class="title">${animal.animalName}</h2><br>
                    <p class="description">분류: ${animal.animalFamily}</p>
                    <p class="description">멸종위기급수: ${animal.extinctGrade}</p>
                    <p class="description">입소 날짜: ${animal.enterDate}</p>
                </div>
            </div>
            <br>
        </c:forEach>
    </div>
    
    <%@ include file='../common/footer.jsp'%>
</body>
</html>
