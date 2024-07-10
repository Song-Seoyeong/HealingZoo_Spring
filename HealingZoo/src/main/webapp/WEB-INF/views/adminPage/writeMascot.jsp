<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${empty goods ? '상품 추가' : '상품 수정'}</title>
<style>
    .inputBoard{
        border-radius: 3px;
        box-shadow: none;
        border: 1px solid #B5B5B5;
        margin-bottom: 10px;
        padding: 5px;
    }
    .form-control {
        width: 100%;
    }
    .btn {
        padding: 10px 20px;
        border: none;
        border-radius: 3px;
    }
</style>
</head>
<body>
    <!-- 헤더 -->
    <%@ include file='../common/logoBar.jsp' %>
    <%@ include file='../common/mainCategoryBar.jsp'%>
    <!-- /헤더 -->

    <!-- 글쓰기 폼 -->
    <form action='${pageContext.request.contextPath}/${empty goods ? "insertGoods.admin" : "insertGoods.admin"}' method='post' enctype="multipart/form-data">
        <div class="container text-center" style='margin-top: 70px;'>
            <div class="row">
                <div class="col-1"></div>
                <div class="col-10" style='background: white; border-radius: 25px;'>
                    <br>
                    
                    <!-- 카테고리별 헤더 -->
                    <div class='text-start'>
                        <input type='hidden' value='102' name='cateNo'/>
                        <h3 style="border-left: 5px solid #65B741; padding-left: 10px; display: inline-block; margin-bottom: 15px;">${empty goods ? '상품 추가하기' : '상품 수정하기'}</h3>
                    </div>
                    <!-- 카테고리별 헤더 -->
                    
                    <hr>
                    <!-- 카테고리별 제목 입력창 -->
                    <div class='row'>
                        <c:if test="${not empty goods}">
                            <input type="hidden" name="goodsNo" value="${goods.goodsNo}">
                        </c:if>
                        <div class='col-6 text-center'>
                            <input type='text' name='goodsName' placeholder='상품명을 입력해주세요' id='inputBoardTitle' size='40' class='inputBoard' value="${goods.goodsName}" autofocus required>
                        </div>
                        <div class='col-2'>
                            <input type='number' name='goodsPrice' placeholder='상품가격을 입력해주세요' id='inputBoardWriter' size='40' class='inputBoard' value="${goods.goodsPrice}" required>
                        </div>
                        <div class='col-1'></div>
                    </div>
                    <!-- 카테고리별 제목 입력창 -->
                    
                    <br>
                    <div class='text-center'>
                        <textarea id='inputBoardContent' name='goodsInfo' cols='80' rows="5" style="resize: none;" placeholder='상품 설명을 입력해주세요.' class='inputBoard' required>${goods.goodsInfo}</textarea>
                    </div>
                    
                    <!-- 이미지 업로드 부분 추가 -->
                    <div class='row' style='margin:5px;'>
                        <div class='col-4'>
                            <c:if test="${not empty image}">
                                <img src="${pageContext.request.contextPath}${image.imgPath}/${image.imgRename}" 
                                     alt="Current Goods Image" class="current-image" 
                                     style="max-width: 300px; margin-top: 10px;">
                                <p>현재 이미지: ${image.imgName}</p>
                            </c:if>
                        </div>
                        <div class='col-8 text-end' id='fileArea'>
                            <div style='margin: 5px;'>
                                <input class="form-control" type="file" name='file' accept='image/*'>
                            </div>
                        </div>
                    </div>
                    
                    <br>
                    <div class="text-end">
                        <button type='submit' id='insertBoard' class="btn" style='background: #60A869; color: white;'>${empty goods ? '추가' : '수정'}</button>
                        &nbsp;&nbsp;&nbsp;    
                        <button type="button" class="btn" style='background: #DD5353; color: white;' onclick="javascript:history.back();">취소</button>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    
                    </div>
                    <br>
                </div>
                <div class="col-1"></div>
            </div>
        </div>
        <br>
    </form>

    <div class='margin'></div>
    
    <!-- 푸터 -->
    <%@ include file='../common/footer.jsp' %>
    <!-- /푸터 -->
</body>
</html>
