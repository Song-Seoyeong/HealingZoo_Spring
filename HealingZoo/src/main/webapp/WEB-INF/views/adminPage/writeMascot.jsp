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
        border-shadow: none;
        border: 1px solid #B5B5B5;
        margin-bottom: 10px;
    }
</style>
</head>
<body>
    <!-- 헤더 -->
    <%@ include file='../common/logoBar.jsp' %>
    <%@ include file='../common/mainCategoryBar.jsp'%>
    <!-- /헤더 -->
        
    <!-- 글쓰기 폼 -->
    <form action='${contextPath}/insertGoods.admin' method='post'>
        <div class="container text-center" style='margin-top: 70px;'>
          <div class="row">
            <div class="col-1"></div>
            <div class="col-10" style='background: white; border-radius: 25px;'>
                <br>
                
                <!-- 카테고리별 헤더 -->
                <div class='text-start'>
                    <input type='hidden' value='102' name='cateNo'/>
                    &nbsp;&nbsp;&nbsp;&nbsp;<h3 style="border-left: 5px solid #65B741; padding-left: 10px; display: inline-block; margin-bottom: 15px;"> ${empty goods ? '상품 추가하기' : '상품 수정하기'}</h3>
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
                    <textarea id='inputBoardContent' name='goodsInfo' cols='80' rows="20" style="resize: none;" placeholder='상품 설명을 입력해주세요.' class='inputBoard' required>${goods.goodsInfo}</textarea>
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
    
	<!-- <script>
		// 파일 추가 로직
		const fileArea = document.getElementById("fileArea");
		console.log(fileArea)
		document.getElementById('plusFile').addEventListener('click', ()=>{
			const newFileArea = document.createElement('div');
			newFileArea.innerHTML = "<input class='form-control' type='file' name='file'>";
			newFileArea.style.margin = '5px';
			
			fileArea.append(newFileArea);
		})
	</script> -->
</body>
</html>