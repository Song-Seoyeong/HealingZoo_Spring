<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>오시는 길</title>
    <style>
        .bi bi-arrows{
           width: 150px;
           color: #65B741;
        }
        .waycontainer {
            width: 80%;
            margin: 20px auto;
            background-color: #fff;
            padding: 80px 130px;
        }

        .waypoint {
            text-align: center;
            margin: 0px;
        }

        .waycontent {
            display: flex;
            align-items: flex-start;
            justify-content: center;
            margin-top: 40px;
        }
        .waymap {
            margin-top: 20px;
            padding-right: 20px;
        }
        .waydirections {
            width: 580px;
            padding: 20px;
        }
        .waydirections img {
            width: 600px;
            height: auto;
            padding: 20px;
            margin: 25px;
        }

        .waysection {
            border: 2px solid #006400;
            border-radius: 15px;
            padding: 10px;
            margin-bottom: 20px;
            background-color: #f9f9f9;
        }

        .wayroute {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin: 10px 0;
        }

        .wayroute-box {
            background-color: #006400;
            color: white;
            padding: 10px;
            border-radius: 15px;
            text-align: center;
            width: 30%;
        }

        .waysection h3 {
            margin-top: 0;
            color: #333;
        }
        .way-bar {
            width: 1px;
            height: 550px;
            margin: 0 20px;
            box-sizing: border-box;
            background-color: #fff;
            border: 2px solid #ffffff;
        }
        .way-bar2 {
            width: 1px;
            height: 550px;
            margin: 0 20px;
            box-sizing: border-box;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border: 2px solid #006400;
            border-radius: 15px;
        }
        .waytext {
            color: gray;
        }
    </style>
</head>
<body>
    <%@ include file='../common/logoBar.jsp' %>
    <%@ include file='../common/mainCategoryBar.jsp' %>
    <!-- 디버그 정보 추가 -->
    <div class="waycontainer">
        <h2 class="waypoint">오시는 길</h2>
        <br><br><br>
        <div class="waycontent">
            <div class="waymap">
             ${mapInfo.linkUrl}
             <div>
                    <br>
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="#DD5353" class="bi bi-map-fill" viewBox="0 0 16 16">
                        <path fill-rule="evenodd" d="M16 .5a.5.5 0 0 0-.598-.49L10.5.99 5.598.01a.5.5 0 0 0-.196 0l-5 1A.5.5 0 0 0 0 1.5v14a.5.5 0 0 0 .598.49l4.902-.98 4.902.98a.5.5 0 0 0 .196 0l5-1A.5.5 0 0 0 16 14.5zM5 14.09V1.11l.5-.1.5.1v12.98l-.402-.08a.5.5 0 0 0-.196 0zm5 .8V1.91l.402.08a.5.5 0 0 0 .196 0L11 1.91v12.98l-.5.1z"/>
                    </svg>
                    동물원 주소 : <span class="waytext">${mapInfo.linkInfo}</span>
                </div>
            </div> 
            <div class="way-bar"></div> <!-- 가운데 바 위치 -->
            <div class="way-bar2"></div>
            <div class="waydirections">
                <img src="${contextPath }/resources/uploadImg/${image.imgRename}" alt="오는 지도">
            </div>
        </div>
    </div>
    <%@ include file='../common/footer.jsp' %>
</body>
</html>
