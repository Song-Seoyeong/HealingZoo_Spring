<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>
<!DOCTYPE html>
<html>
<head>
    <title>프로그램 안내</title>
    <style>
        @charset "UTF-8";

        /* 기본 스타일 */
        .protitle {
            width: 100%;
            padding: 20px;
            border-radius: 10px;
        }

        .prointro {
            height: 250px;
            padding: 20px;
            border-radius: 10px;
            text-align: center;
            color: black;
            position: relative; /* 이거 없으면 검정색이 덮임 */
            background-image: url("${contextPath}/image/test2.jpg"); /* 배경 이미지 설정 */
            background-size: cover;
            background-position: center;
        }

        .prointro::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5); /* 반투명 배경 색상 */
            z-index: 0; /* 배경 색상이 텍스트 뒤에 오도록 설정 안보이는 오류는 여길 지웠다가 다시 넣기*/
            border-radius: 10px;
        }

        .op_title1, .op_text {
            color: white; /* 사진에 비해 글씨색이 안보이므로 임시 조치 */
            position: relative;
            z-index: 1; /* 텍스트가 배경 이미지 위에 오도록 설정 */
        }

        .op_title1 {
            width: 700px;
            opacity: 0.8;
            display: inline-block;
            padding: 10px 20px;
            background-color: green; /* 초록색 배경 */
            color: black;
            font-weight: bold;
            border: 2px solid green; /* 초록색 보더 */
            border-radius: 10px;
        }

        .proboard {
            display: flex;
            flex-direction: column;
            gap: 20px;
            margin-top: 20px;
            align-items: center;
        }
        
        .procard {
            display: grid;
            grid-template-columns: 40% 60%;
            align-items: center;
            background-color: #B5B5B5;
            border-radius: 30px;
            overflow: hidden;
            transition: transform 0.3s ease;
            width: 900px;
            height: 250px;
        }

        .procard.right-image {
            grid-template-columns: 60% 40%;
        }

        .image-container {
            position: relative;
            width: 100%;
            height: 100%;
            overflow: hidden;
        }

        .image-container img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: opacity 0.3s ease;
        }

        .image-container img.hover {
            position: absolute;
            top: 0;
            left: 0;
            opacity: 0;
        }

        .image-container:hover img.hover {
            opacity: 1;
        }

        .image-container:hover img.original {
            opacity: 0;
        }

        .procard .text {
            padding: 20px;
            text-align: center;
        }

        .prosubtitle {
            font-weight: bold;
            font-size: 30px;
        }

        .prosubcontent {
            font-size: 17px;
        }

        @media (max-width: 768px) {
            .procard {
                grid-template-columns: 1fr;
                text-align: center;
            }

            .procard.right-image {
                grid-template-columns: 1fr;
            }

            .image-container {
                width: 100%;
                height: 100%;
            }

            .procard .text {
                padding: 10px;
            }
            .op_text {
			    white-space: pre-wrap;
			    word-wrap: break-word;
			}
        }
    </style>
</head>
<body>
    <%@ include file='../common/logoBar.jsp' %>
    <%@ include file='../common/mainCategoryBar.jsp' %>

        <div class="protitle">
		    <div class="prointro" style="background-image: url('${contextPath}/resources/uploadImg/${proMainImg.imgRename}');">
				<h2 class="op_title1">${showLink.linkUrl}</h2>
				<p class="op_text">${fn:replace(showLink.linkInfo, newLineChar, '<br>')}</p>
			</div>
		</div>
            <br><br>
            <div class="proboard">
			    <c:forEach items="${showList}" var="show" varStatus="status">
			        <div class="procard ${status.index % 2 == 1 ? 'right-image' : ''}">
			            <c:if test="${status.index % 2 == 0}">
			                <div class="image-container">
			                    <img src="${contextPath}/resources/uploadImg/${showImages[show.showNo]['mainImage'].imgRename}" alt="프로그램 사진" class="original">
			                    <img src="${contextPath}/resources/uploadImg/${showImages[show.showNo]['hoverImage'].imgRename}" alt="프로그램 사진 - Hover" class="hover">
			                </div>
			            </c:if>
			            <div class="text">
			                <p class="prosubtitle">${show.showName}<br></p>
			                <p class="prosubcontent">${show.showContent}</p>
			            </div>
			            <c:if test="${status.index % 2 == 1}">
			                <div class="image-container">
			                    <img src="${contextPath}/resources/uploadImg/${showImages[show.showNo]['mainImage'].imgRename}" alt="프로그램 사진" class="original">
			                    <img src="${contextPath}/resources/uploadImg/${showImages[show.showNo]['hoverImage'].imgRename}" alt="프로그램 사진 - Hover" class="hover">
			                </div>
			            </c:if>
			        </div>
			        <br><br>
			    </c:forEach>
			</div>
        </div>

    <%@ include file='../common/footer.jsp' %>
</body>
</html>
