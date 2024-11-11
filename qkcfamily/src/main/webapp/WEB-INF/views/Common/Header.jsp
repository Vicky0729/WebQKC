<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>header</title>
    <style type="text/css">
        @font-face {
            font-family: 'Pretendard-Bold';
            src: url('https://fastly.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff')
            format('woff');
            font-weight: bold;
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
            background-color: white;
            color: black;
            z-index: 1000;
			padding-left: 200px;
			padding-right: 200px;
          
        }

       .navbar-logo img {
		     width : 157px;
   			 height: 60px;
		}

        .navbar-menu {
            list-style: none;
            display: flex;
       
        }

        .navbar-menu a {
            color: black;
            text-decoration: none;
            padding: 10px;
            white-space: nowrap;
            font-size: 18px;
        }

        .navbar-search input {
            width: 250px;
            padding: 10px;
            border-radius: 15px;
            border: 1px solid #ccc;
        }
        .navbar-menu :hover{
        color:red; 
        }


        @media (max-width: 768px) {
            .navbar {
                flex-direction: column;
            }
            .navbar-menu {
                flex-direction: column;
            }
        }
 .navbar-menu > li {
        position: relative;
        margin: 0 5px;
    }

    .navbar-menu > li > a {
        text-decoration: none;
        color: #333;
        font-size: 18px;
        padding: 10px;
        font-weight: bold;
        
    }

    /* 드롭다운 메뉴 스타일 */
    .dropdown-menu {
        display: none; /* 기본적으로 숨김 */
        position: absolute;
        top: 100%;
        left: 0;
        background-color: #fff;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        padding: 10px 0;
        list-style: none;
        min-width: 180px;
        z-index: 10;
    }

    .dropdown-menu li {
        padding: 8px 20px;
    }

    .dropdown-menu li a {
        text-decoration: none;
        color: #333;
        font-size: 16px;
    }

    .dropdown-menu li a:hover {
        color:red;
    }

    /* 마우스를 올렸을 때 드롭다운 메뉴 표시 */
    .navbar-menu > li:hover .dropdown-menu {
        display: block;
    }
        
/* 검색 스타일 */
.navbar-search {
	position: relative;
}

.navbar-search input {
	width: 250px;
	padding: 10px;
	border-radius: 15px;
	border: 1px solid #ccc;
}

.navbar-search button {
	position: absolute;
	right: 5px;
	top: 5px;
	bottom: 5px;
	background-color: white;
	border: none;
	cursor: pointer;
}

#search-img {
	width: 30px;
	height: 30px;
	margin-right: 5px;
	margin-bottom: 10px;
}



     
        
    </style>
</head>
<body>
    <header>
        <nav class="navbar">
            <div class="navbar-logo">
                <a href="${pageContext.request.contextPath}"><img src="resources/imgs/logo.png" alt="회사 로고" ></a>
            </div>
            <ul class="navbar-menu">
                <li class="dropdown"><a href="${pageContext.request.contextPath}/AboutUs/CEO">About Us</a>
                <ul class="dropdown-menu">
                    <li><a href="${pageContext.request.contextPath}/AboutUs/CEO">CEO 인사말</a></a></li>
                    <li><a href="${pageContext.request.contextPath}/AboutUs/OurBrand">회사소개</a></li>
                    <li><a href="${pageContext.request.contextPath}/AboutUs/CIBrand">CI & 브랜드소개</a></li>
                    <li><a href="${pageContext.request.contextPath}/AboutUs/Import">수입사업</a></li>
                </ul>
                </li>
                <li class="dropdown"><a href="${pageContext.request.contextPath}/Products/Main">Products</a>
                 <ul class="dropdown-menu">
                    <li><a href="${pageContext.request.contextPath}/Products/Mushroom">버섯류</a></li>
                    <li><a href="${pageContext.request.contextPath}/Products/Groceries">식료품</a></li>
                    <li><a href="${pageContext.request.contextPath}/Products/Snack">제과</a></li>
                    <li><a href="${pageContext.request.contextPath}/Products/Etc">기타</a></li>
                </ul>
                </li>
                <li class="dropdown"><a href="${pageContext.request.contextPath}/News/News">News</a>
                </li>
                <li class="dropdown"><a href="${pageContext.request.contextPath}/ImportBusiness/Product">Import Business</a>
                 <ul class="dropdown-menu">
                    <li><a href="ImportBusiness/Product">수입제품</a></li>
                </ul>
                </li>
                <li class="dropdown"><a href="${pageContext.request.contextPath}/ContactUs/contactUs">Contact Us</a></li>
            </ul>
            <div class="navbar-search">
                <form action="${pageContext.request.contextPath}/Common/HeadSearch" method="POST">
                    <input type="text" placeholder="검색어를 입력하세요" name="search_str">
                    <button type="submit">
                        <img src="resources/imgs/search-img.png" alt="돋보기" style="width: 30px; height: 30px;">
                    </button>
                </form>
            </div>
           
        </nav>
    </header>
</body>
</html>
