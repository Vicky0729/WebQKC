<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
 <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>contactUs</title>
<style>
/* 전체 적용 CSS */
html, body {
	width: 100%;
	font-family: Pretendard-Regular, Arial, sans-serif;
	font-size: 16px;
	line-height: 1.5;
	color: #333;
}

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}
body {
    display: flex;
    flex-direction: column;
    min-height: 100vh; /* 최소 높이를 100vh로 설정 */
}


/* Header 부분 CSS */
.navbar {
	display: flex;
	left: 0;
	top: 0;
	width: 100%;
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 10px 20px;
	background-color: #8B0000;
	color: white;
	transition: top 0.3s ease; /* 부드러운 애니메이션 */
	z-index: 1000; /* 다른 요소보다 위에 위치 */
	border-bottom: solid 3px #F5F5DC;
}

.navbar-logo img {
	height: 50px;
	width: 200px;
}

.navbar-actions {
	display: flex;
	align-items: center;
}

.navbar-menu {
	list-style: none;
	display: flex;
	gap: 20px;
	margin-right: 20px;
}

.navbar-menu li {
	margin-right: 20px;
}

.navbar-menu a {
	color: white;
	text-decoration: none;
	font-size: 16px;
	padding: 10px;
	transition: background-color 0.3s;
}

.navbar-menu a:hover {
	background-color: #CD5C5C; /* 밝은 붉은색 */
	border-radius: 5px;
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


/* 언어 선택 스타일 */
.navbar-language select {
	padding: 5px;
	font-size: 14px;
	margin-left: 20px;
	border-radius: 5px;
}

/* 중간 메뉴 쿼리 */
@media only screen and (max-width: 1499px) {
    .location .wrap {
        width: auto;
        padding: 0;
    }

    .wrap, .orgaWrap .wrap {
        width: 100%;
        padding: 60px 80px 120px;
        box-sizing: border-box;
    }
}
/* 하위에 숨겨져 있다가 나오게*/
.location ul ul {
    display: none;
    position: absolute;
    top: 100%;
    left: 0;
    background: #fff;
    padding: 10px;
    border: 1px solid #e9e9e9;
    width :120px;
    list-style: none;
}

.location ul li:hover > ul {
    display: block;
}

/*메뉴 버튼 스타일*/
.location > ul > li {
	list-style: none;
    position: relative;
    display: inline-block;
    padding: 10px 15px;
    width : 120px;
    background-color: #f6f6f6;
    border-bottom: solid 3px #8B0000;
    border-right: solid 0.5px #8B0000;

}
.location> ul > li:hover {
    background: #eb1c24; /* 마우스 오버 시 배경색 변경 */
}


.location > ul > li a {
	display: flex;
	justify-content :center;
    color: #282828;
    font-size: 16px;
    text-decoration: none;
}

.location > ul > li:after {
	
    position: absolute;
    top: 0;
    right: 0;
    display: block;
    content: '';
    height: 50px;
    width: 1px;
    background: #e9e9e9;
}
/* 미디어 쿼리*/
@media only screen and (max-width: 768px) {
    .location ul {
        flex-direction: column;
        width: 100%;
    }

    .location > ul > li {
        display: block;
        width: 100%;
    }
}


/* 사이드 메뉴 */
.contactMenus {
	display: flex;
	flex-direction: column;
	background-color: #F5F5F5; /* 부드러운 연한 회색 */
	border: 1px solid #D3D3D3; /* 연한 회색 테두리 */
	margin-right: 20px;
	padding: 10px;
}

.contactMenu {
	width: 150px;
	height: 50px;
	background-color: #FFFAF0; /* 약간 따뜻한 베이지색 */
	margin-bottom: 10px;
	display: flex;
	justify-content: center;
	align-items: center;
	transition: background-color 0.3s;
	border: 1px solid #D3D3D3; /* 연한 회색 테두리 */
}

.contactMenu a {
	text-decoration: none;
	color: #333; /* 더 차분한 글자색 */
	font-weight: bold;
}

.contactMenu:hover {
	background-color: #FAF0E6; /* 좀 더 밝은 베이지색으로 변환 */
}

/* 제품 리스트 */
.contact {
	display: grid;
	grid-template-columns: repeat(4, 1fr);
	gap: 20px;
}

.contact {
	text-align: center;
	border: 1px solid #ddd;
	padding: 15px;
	transition: transform 0.3s;
}

.contact:hover {
	transform: scale(1.05);
}

.contact img {
	width: 150px;
	height: 150px;
	object-fit: cover;
}

.contact-name {
	margin-top: 10px;
	font-weight: bold;
}
/* Footer 부분 CSS */
footer {
	background-color: #8B0000; /* 진한 붉은색 */
	padding: 20px;
	text-align: center;
	color: white;
	border-top: solid 3px #F5F5DC; /* 푸터 상단 테두리 */

}

.footer-content {
	padding: 20px; /* 내부 여백 */
	bottom: 0; /* 하단에 고정 */
	left: 0; /* 좌측 정렬 */
	width: 100%; /* 전체 너비 */
	x
}

#footer-content p {
	margin: 10px 0;
	font-size: 14px;
}
.coninfo{
 width: 100%;
 height: 100%
}

/*구글 맵 CSS  */
      /* 전체 페이지 스타일 */
      body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        height: 100vh;
        background-color: #f4f4f9;
      }
      h1 {
        color: #333;
        margin-bottom: 20px;
        font-size: 24px;
      }
      /* 맵 크기 및 박스 스타일 */
      #map {
        height: 60vh;
        width: 90%;
        max-width: 1000px;
        border: 2px solid #ccc;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        border-radius: 8px;
      }
      /* 주소 스타일 */
      .address {
        margin: 20px;
        font-size: 18px;
        color: #555;
      }



</style>
</head>
<body>
	<header>
		<nav class="navbar">
			<div class="navbar-logo">
				<a href="homeMain.do"><img src="resources/imgs/logo.png" alt="회사 로고"></a>
			</div>
			<div class="navbar-actions">
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
							<img src="resources/imgs/search-img.png" alt="돋보기" id="search-img">
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
			</div>
		</nav>
	</header>


	<!-- 컨택 info-->
	<div class="aboutPromotion" align="center">
		<img width="100%" height="300px" alt="홍보용 이미지" src="resources/imgs/aboutus.png">
	</div>

	<!--구글 지도-->

 <h1>회사 찾아오시는 길</h1>
    <div class="address">
      서울특별시 성동구 아차산로15길 52
    </div>
    <!-- 맵이 표시될 div -->
    <div id="map"></div>

    <script>
      // 지도 초기화 함수
      function initMap() {
        // 지정된 좌표 (서울특별시 성동구 아차산로15길 52)
        const location = { lat: 37.548339, lng: 127.064182 };
        // 지도 객체 생성
        const map = new google.maps.Map(document.getElementById("map"), {
          zoom: 16,
          center: location,
        });
        // 마커 이미지 경로 (원하는 이미지 URL 또는 파일 경로로 대체)
        const image = "";
        	/*  {
          url: "img/logo.png", // 이미지 경로
          scaledSize: new google.maps.Size(50, 50), // 이미지 크기 (가로, 세로)
        }; */

        // 마커 표시 (사용자 지정 이미지)
        const marker = new google.maps.Marker({
          position: location,
          map: map,
          icon: image, // 사용자 정의 이미지 설정
        });
      }
    </script>

    <!-- Google Maps JavaScript API 로드 -->
    <script
      async
      defer
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCkMKSuFICn4ZYgCu-u50vBYzXmLSj8Tuo&callback=initMap">
    </script>



	<br>
	<footer>
		<div class="footer-content">
			<p>㈜큐케이씨 | 서울특별시 성동구 아차산로 15길 52 삼환디지털벤처타워 905호</p>
			<p>대표 : 김새한 | Tel: 070-4352-2800 | Fax: 070-8673-2808</p>
			<p>사업자등록번호: 214-87-64337 | COPYRIGHTⓒQuali Korea Corp. ALL RIGHTS
				RESERVED.</p>
		</div>
	</footer>
</body>
</html>