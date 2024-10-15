<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>header</title>
    <style type="text/css">
        @font-face {
            font-family: 'Pretendard-Regular';
            src: url('https://fastly.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff')
            format('woff');
            font-weight: 400;
            font-style: normal;
        }

        html, body {
            width: 100%;
            font-family: Pretendard-Regular, Arial, sans-serif;
            font-size: 16px;
            line-height: 1.5;
            color: #333;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            height: 100px;
            padding-bottom: 10px; /* 푸터 높이만큼 아래쪽에 공간을 추가 */
            padding-top: 60px; /* 상단바 높이만큼 위쪽에 공간 추가 */
            display: flex;
            flex-direction: column; /* 수직 방향으로 정렬 */
        }

        .navbar {
            position: fixed;
            left: 0;
            top: 0;
            width: 100%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 20px;
            background-color: #8B0000;
            color: white;
            z-index: 1000;
            border-bottom: solid 3px #F5F5DC;
        }

        .navbar-logo img {
            height: 50px;
            width: 200px;
        }

        .navbar-menu {
            list-style: none;
            display: flex;
            gap: 20px;
        }

        .navbar-menu a {
            color: white;
            text-decoration: none;
            padding: 10px;
        }

        .navbar-search input {
            width: 250px;
            padding: 10px;
            border-radius: 15px;
            border: 1px solid #ccc;
        }

        .navbar-language select {
            padding: 5px;
            font-size: 14px;
            margin-left: 20px;
            border-radius: 5px;
        }

        @media (max-width: 768px) {
            .navbar {
                flex-direction: column;
            }
            .navbar-menu {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>
    <header>
        <nav class="navbar">
            <div class="navbar-logo">
                <a href="homeMain.do"><img src="resources/imgs/logo.png" alt="회사 로고"></a>
            </div>
            <ul class="navbar-menu">
                <li><a href="aboutM.do">About Us</a></li>
                <li><a href="productsM.do">Products</a></li>
                <li><a href="#.jsp">News</a></li>
                <li><a href="#.jsp">Business</a></li>
                <li><a href="contactUs.do">Contact Us</a></li>
            </ul>
            <div class="navbar-search">
                <form action="#" method="POST">
                    <input type="text" placeholder="검색어를 입력하세요" name="search_str">
                    <button type="submit">
                        <img src="resources/imgs/search-img.png" alt="돋보기" style="width: 30px; height: 30px;">
                    </button>
                </form>
            </div>
            <div class="navbar-language">
                <select name="language">
                    <option value="korean">Korean</option>
                    <option value="english">English</option>
                    <option value="chinese">Chinese</option>
                    <option value="japanese">Japanese</option>
                </select>
            </div>
        </nav>
    </header>
</body>
</html>