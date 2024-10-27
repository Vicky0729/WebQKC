<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 메인 페이지</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
        }

        .admin-container {
            display: grid;
            grid-template-columns: 200px 1fr 300px;
            grid-template-rows: auto 1fr;
            grid-template-areas: 
                "header header header"
                "sidebar main settings";
            height: 100vh;
        }

        /* 상단 헤더 */
        header {
            grid-area: header;
            display: flex;
            justify-content: flex-start;
            align-items: center;
            background-color: #f8f8f8;
            padding: 20px;
            border-bottom: 1px solid #ccc;
        }

        /* 회사 로고 이미지 */
        .logo img {
            width: 157px;
            height: 60px;
        }

        .company-name {
            font-size: 20px;
            margin-left: 10px;
        }

        /* 홈으로 가는 버튼 스타일 */
        .home-button {
            background-color: #555;
            color: white;
            border: none;
            padding: 5px 10px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 14px;
            border-radius: 5px;
            cursor: pointer;
            margin-left: 20px;
        }

        .home-button:hover {
            background-color: #444;
        }

        /* 좌측 사이드바 */
        .sidebar {
            grid-area: sidebar;
            background-color: #333;
            color: white;
            padding: 20px;
        }

        .sidebar ul {
            list-style: none;
        }

        .sidebar ul li {
            margin: 10px 0;
        }

        .sidebar ul li a {
            color: white;
            text-decoration: none;
        }

        .sidebar ul li a:hover {
            text-decoration: underline;
        }

        /* 메인 콘텐츠 */
        main {
            grid-area: main;
            padding: 20px;
        }

        .main-content {
            background-color: #f1f1f1;
            padding: 20px;
            border-radius: 8px;
            border: 1px solid #ccc;
            height: 100%;
            box-sizing: border-box;
        }

        iframe {
            width: 100%;
            height: 100%;
            border: none;
            border-radius: 8px;
        }

        /* 우측 설정 설명 */
        .settings {
            grid-area: settings;
            background-color: #fafafa;
            padding: 20px;
            border-left: 1px solid #ccc;
        }

        /* 회사 로고 변경 버튼 스타일 */
        .logo-button {
            display: inline-block;
            background-color: #007bff; /* 버튼 배경색 */
            color: white;
            padding: 10px 15px;
            text-align: center;
            text-decoration: none;
            border-radius: 5px;
            font-size: 14px;
            transition: background-color 0.3s ease; /* 호버 시 색 변경 효과 */
            border: 1px solid transparent; /* 보더 스타일 */
        }

        .logo-button:hover {
            background-color: #0056b3; /* 호버 시 버튼 배경색 변경 */
            border-color: #004085; /* 호버 시 보더 색상 */
        }
    </style>
</head>
<body>
    <div class="admin-container">
        <header>
            <div class="logo">
                <img src="../resources/imgs/logo.png" alt="회사로고">
            </div>
            <a href="${pageContext.request.contextPath}" class="home-button">변경 확인</a>
            <div class="company-name">QKC</div>
        </header>

        <nav class="sidebar">
            <ul>
                <li><a href="dashboard" target="contentFrame">대시보드</a></li>
                <li><a href="AdminList" target="contentFrame">사용자관리</a></li>
                <li><a href="Content" target="contentFrame">콘텐츠관리</a></li>
                <li><a href="PopupList" target="contentFrame">광고관리</a></li>
                <li><a href="#" target="contentFrame">홈페이지 수정</a></li>
            </ul>
        </nav>

        <main>
            <section class="main-content">
                <!-- Dashboard.jsp를 iframe으로 로드하여 기본 화면에 표시 -->
                <iframe src="dashboard" name="contentFrame"></iframe>
            </section>
        </main>

        <aside class="settings">
            <h3>설정</h3>
            <ul>
                <li><a href="#" class="logo-button">회사 로고 변경</a></li>
            </ul>
        </aside>
    </div>
</body>
</html>