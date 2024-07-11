<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동물 정보 수정</title>
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
    
    <!-- 수정 폼 -->
    <form action='${contextPath}/animalUpdate' method='post' enctype="multipart/form-data">
        <div class="container text-center" style='margin-top: 70px;'>
            <div class="row">
                <div class="col-1"></div>
                <div class="col-10" style='background: white; border-radius: 25px;'>
                    <br>
                    
                    <!-- 카테고리별 헤더 -->
                    <div class='text-start'>
                        <input type='hidden' name='aniNO' value='${animal.aniNO}'/>
                        &nbsp;&nbsp;&nbsp;&nbsp;<h3 style="border-left: 5px solid #65B741; padding-left: 10px; display: inline-block; margin-bottom: 15px;"> 동물 정보 수정</h3>
                    </div>
                    <!-- 카테고리별 헤더 -->
                    
                    <hr>
                    <!-- 카테고리별 제목 입력창 -->
                    <div class='row'>
                        <div class='col-3'>
                            <select name='animalClass' id='animalClass'>
                                <option value='Class' ${animal.animalClass == 'Class' ? 'selected' : ''}>대분류</option>
                                <option value='포유류' ${animal.animalClass == '포유류' ? 'selected' : ''}>포유류</option>
                                <option value='조류' ${animal.animalClass == '조류' ? 'selected' : ''}>조류</option>
                                <option value='파충류' ${animal.animalClass == '파충류' ? 'selected' : ''}>파충류</option>
                            </select>
                        </div>
                        <div class='col-1 row-3'>
                            <select name='extinctGrade' id='extinctGrade'>
                                <option value='EXTINCT' ${animal.extinctGrade == 'EXTINCT' ? 'selected' : ''}>절멸등급</option>
                                <option value='EX' ${animal.extinctGrade == 'EX' ? 'selected' : ''}>EX</option>
                                <option value='CR' ${animal.extinctGrade == 'CR' ? 'selected' : ''}>CR</option>
                                <option value='EN' ${animal.extinctGrade == 'EN' ? 'selected' : ''}>EN</option>
                                <option value='VU' ${animal.extinctGrade == 'VU' ? 'selected' : ''}>VU</option>
                            </select>
                        </div>
                        <div  class='col-6 text-center'>
                        <p>소분류명</p>
                            <input type='text' name='animalFamily' value='${animal.animalFamily}' placeholder='동물 소분류명을 입력해주세요' id='inputBoardTitle' size='50' class='inputBoard' autofocus>
                        </div>
                        <div class='col-2'>
                        <p>동물 이름</p>
                            <input  type='text' name='animalName' value='${animal.animalName}' placeholder='동물 이름을 입력해주세요' id='inputBoardWriter' size='20'  class='inputBoard' autofocus>
                        </div>
                        <div class='col-1'></div>
                    </div>
                    <!-- 카테고리별 제목 입력창 -->
                    
                    <!-- 파일 선택 칸 추가 0708 -->
					<div class='row' style='margin:5px;'>
					    <div class='col-4'>
					        <c:if test="${not empty image}">
					            <img src="${pageContext.request.contextPath}${image.imgPath}/${image.imgRename}" alt="Current Animal Image" class="current-image" style="max-width: 100%; height: auto;">
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
                        <button type="submit" class="btn" style='background: #60A869; color: white;'>수정 완료</button>
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