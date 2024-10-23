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
            width: 50px; /* 이미지 크기를 원하는 대로 조절 */
            height: auto;
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
            padding: 5px 10px; /* 버튼 크기 축소 */
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 14px; /* 작은 텍스트 */
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
        }

        /* 우측 설정 설명 */
        .settings {
            grid-area: settings;
            background-color: #fafafa;
            padding: 20px;
            border-left: 1px solid #ccc;
        }
    </style>
</head>
<body>
    <div class="admin-container">
        <header>
            <!-- 변경? 한 로고 확인 -->
            <div class="logo">
                <img src="resources/imgs/logo.png" alt="회사로고">
            </div>
            <a href="homeMain.do" class="home-button">변경 확인</a>
            <div class="company-name">회사이름</div>
        </header>

        <nav class="sidebar">
            <ul>
                <li><a href="dashboard.do">대시보드</a></li>
                <li><a href="AdminList">사용자관리</a></li>
                <li><a href="contentsManagement.do">콘텐츠관리</a></li>
                <li><a href="productManagement.do">제품관리</a></li>
                <li><a href="adManagement.do">광고관리</a></li>
                <li><a href="siteEdit.do">홈페이지 수정</a></li>
            </ul>
        </nav>

        <main>
            <h2>(최초 접속 시) 대쉬보드 페이지</h2>
            <section class="main-content">
                <h3>관리자 메인 페이지 콘텐츠</h3>
                <p>이곳에서 관리자 페이지의 메인 콘텐츠를 관리할 수 있습니다.</p>
            </section>
        </main>

        <aside class="settings">
            <h3>설정</h3>
            <ul>
                <li><a href="uploadLogo.do">회사 로고 변경</a></li> <!-- 로고 변경 페이지로 이동 -->
            </ul>
        </aside>
    </div>
</body>
</html>