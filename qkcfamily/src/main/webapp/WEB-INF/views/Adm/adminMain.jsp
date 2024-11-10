<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 메인 페이지</title>
    <style>
        /* 기본 스타일 초기화 */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
            background-color: #f0f2f5;
            color: #333;
        }

        /* 전체 레이아웃 그리드 */
        .admin-container {
            display: grid;
            grid-template-columns: 250px 1fr;
            grid-template-rows: auto 1fr;
            grid-template-areas: 
                "header header"
                "sidebar main";
            height: 100vh;
        }

        /* 상단 헤더 스타일 */
        header {
            grid-area: header;
            display: flex;
            align-items: center;
            background-color: #ffffff;
            padding: 20px;
            border-bottom: 1px solid #ddd;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        /* 로고 스타일 */
        .logo img {
            width: 150px;
            height: auto;
            cursor: pointer;
        }

        /* 회사 이름 스타일 */
        .company-name {
            font-size: 24px;
            margin-left: 15px;
            font-weight: bold;
            color: #black;
        }

        /* 좌측 사이드바 스타일 */
        .sidebar {
            grid-area: sidebar;
            background-color: #333;
            padding: 20px;
            color: #ffffff;
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        .sidebar ul {
            list-style: none;
            padding-left: 0;
        }

        .sidebar ul li {
            margin: 20px 0;
        }

        .sidebar ul li a {
            color: #ddd;
            text-decoration: none;
            font-size: 18px;
            display: flex;
            align-items: center;
            padding: 10px;
            border-radius: 8px;
            transition: background-color 0.3s ease;
        }

        .sidebar ul li a:hover {
            background-color: #4CAF50;
            color: #ffffff;
        }

        .sidebar ul li a svg {
            margin-right: 8px;
        }

        /* 메인 콘텐츠 영역 스타일 */
        main {
            grid-area: main;
            padding: 20px;
            background-color: #f9f9f9;
        }

        .main-content {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            border: 1px solid #ddd;
            height: 100%;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            box-sizing: border-box;
        }

        iframe {
            width: 100%;
            height: 100%;
            border: none;
            border-radius: 8px;
        }
    </style>
</head>
<body>
    <div class="admin-container">
        <!-- 상단 헤더 -->
        <header>
            <div class="logo">
                <!-- 로고에 홈페이지 링크 연결 -->
                <a href="${pageContext.request.contextPath}">
                    <img src="../resources/imgs/logo.png" alt="회사로고">
                </a>
            </div>
            <div class="company-name">관리자페이지</div>
        </header>

        <!-- 좌측 사이드바 -->
        <nav class="sidebar">
            <ul>
                <li><a href="dashboard" target="contentFrame">🏠 대시보드</a></li>
                <li><a href="AdminList" target="contentFrame">👥 사용자 관리</a></li>
                <li><a href="Content" target="contentFrame">📄 콘텐츠 관리</a></li>
                <li><a href="PopupList" target="contentFrame">📢 팝업 관리</a></li>
                <li><a href="NavBar" target="contentFrame">✒️ 상단바 관리</a></li>
            </ul>
        </nav>

        <!-- 메인 콘텐츠 -->
        <main>
            <section class="main-content">
                <!-- 기본 화면에 Dashboard.jsp를 iframe으로 로드 -->
                <iframe src="dashboard" name="contentFrame"></iframe>
            </section>
        </main>
    </div>
</body>
</html>
