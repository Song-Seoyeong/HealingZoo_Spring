<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>힐링 동물원 마스코트 라쿠니</title>
    <style>
        * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
	}
	.mascot-section {
	    text-align: center;
	}
	.mascot-section h2 {
	    font-size: 2rem;
	    margin-bottom: 1rem;
	}
	.mascot-section .mascot-image img {
	    width: 100%;
	    max-width: 600px;
	}
	.mascot-section .mascot-description {
	    background-color: #e7ffe6;
	    padding: 1rem;
	    margin: 1rem 0;
	}
	.mascot-section .raccoon-image img {
	    width: 100%;
	    max-width: 600px;
	}
	.store-btn {
	    background-color: #4CAF50;
	    color: white;
	    padding: 1rem 2rem;
	    border: none;
	    border-radius: 5px;
	    cursor: pointer;
	}
	.product-section {
	    margin: 0 auto;
	    max-width: 1200px;
	    padding: 20px;
	}
	.product-list {
	    display: flex;
	    flex-wrap: wrap;
	    justify-content: space-around;
	    text-align: left;
	}
	.product-item {
	    border-radius: 5px;
	    padding: 20px;
	    margin: 10px;
	    width: calc(33.333% - 20px); /* 3 items per row */
	    box-sizing: border-box;
	}
	.product-item img {
	    width: 100%;
	    height: 200px;
	    object-fit: cover;
	    margin-bottom: 0.5rem;
	}
	.product-item p {
	    width: 100%;
	}
	.mascoetTitle {
	    font-weight: bold;
	}
	.product-subtext {
	    opacity: 0.5;
	}
	.proprice {
	    font-weight: bold;
	    font-size: 20px;
	}
	.prosubtitle {
	    text-align: center;
	    opacity: 0.5;
	}
	@media (max-width: 768px) {
	    .product-item {
	        width: calc(50% - 20px); /* 2 items per row on smaller screens */
	    }
	}
	@media (max-width: 480px) {
	    .product-item {
	        width: 100%; /* 1 item per row on very small screens */
	    }
	}

    </style>
</head>
<body>
    <%@ include file='../common/logoBar.jsp' %>
    <%@ include file='../common/mainCategoryBar.jsp' %>
    <main>
        <div class="mascot-section">
            <br><br>
            <h2 align="center" class="mascoetTitle">&lt;힐링 동물원 마스코트 라꾸니&gt;</h2>
            <br><br>
            <div class="mascot-image">
                <img src="${pageContext.request.contextPath}${mascotImage.imgPath}/${mascotImage.imgRename}" alt="라꾸니 이미지와 설명">
            </div>
            <br><br><br><br>
            <div class="raccoon-image">
                <img src="${pageContext.request.contextPath}${goodsInfoImage.imgPath}/${goodsInfoImage.imgRename}" alt="작은 라꾸니 이미지와 상품소개">
            </div>   
        </div>
        <br>
        <div class="prosubtitle">※ 라꾸니 상점의 모든 상품들은 동물보호단체에 기부되며, 현장 구매만 가능합니다.</div>
        <br>
        <div class="product-section">
            <div class="product-list">
                <c:forEach items="${goodsList}" var="goods">
                    <div class="product-item">
                        <c:choose>
                            <c:when test="${not empty goods.imagePath}">
                                <img src="${pageContext.request.contextPath}${goods.imagePath}/${goods.imageRename}" alt="${goods.goodsName}">
                            </c:when>
                            <c:otherwise>
                                <img src="${pageContext.request.contextPath}/resources/images/default_product.jpg" alt="${goods.goodsName}">
                            </c:otherwise>
                        </c:choose>
                        <p>${goods.goodsName}</p>
                        <p class="product-subtext">${goods.goodsInfo}</p>
                        <p class="proprice">₩<fmt:formatNumber value="${goods.goodsPrice}" pattern="#,###" /></p>
                    </div>
                </c:forEach>
             </div>
             <br>
        </div>
        <br><br><br>
    </main>
    <%@ include file='../common/footer.jsp' %>
</body>
</html>