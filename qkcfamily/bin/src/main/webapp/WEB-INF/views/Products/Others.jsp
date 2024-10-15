<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>productsM</title>
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
     z-index: 10; /* 다른 요소 위에 보이도록 설정 */
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
.productsMenus {
    display: flex;
    flex-direction: column;
    background-color: #F5F5F5;
    border: 1px solid #D3D3D3;
    margin-right: 20px;
    padding: 10px;
    position: relative; /* 하위 메뉴의 위치를 올바르게 참조 */
    z-index: 0; /* 전체 레이아웃에서 기본 z-index */
}

.productsMenu {
    width: 150px; /* 상위 메뉴의 너비 */
    height: 50px;
    background-color: #FFFAF0;
    margin-bottom: 10px;
    display: flex;
    justify-content: center;
    align-items: center;
    transition: background-color 0.3s;
    border: 1px solid #D3D3D3;
    position: relative; /* 하위 메뉴가 이 요소를 기준으로 배치됨 */
    z-index: 1; /* 상위 메뉴와 하위 메뉴 간의 겹침 방지 */
}

.productsMenu a {
    text-decoration: none;
    color: #333;
    font-weight: bold;
}

.productsMenu:hover {
    background-color: #FAF0E6;
}

/* 하위 메뉴 */
.subcategory {
    display: none; /* 기본적으로 숨김 */
    position: absolute; /* 상위 메뉴를 기준으로 절대 위치 */
    top: 0; /* 상위 메뉴 바로 아래에 위치 */
    left: 100%; /* 상위 메뉴의 오른쪽으로 이동 */
    width: 150px; /* 하위 메뉴 너비를 상위 메뉴와 동일하게 설정 */
    background-color: #fff;
    list-style: none;
    padding-left: 0;
    margin: 0;
    border: 1px solid #D3D3D3;
    z-index: 10; /* 하위 메뉴가 상위 메뉴 위로 오도록 설정 */
     box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1); /* 그림자 추가 */
}

.productsMenu:hover .subcategory {
    display: block; /* 상위 항목에 마우스를 올렸을 때 하위 메뉴 표시 */
}

.subcategory li {
    margin: 0;
    padding: 5px 15px;
}

.subcategory li a {
    text-decoration: none;
    color: #555;
    display: block;
    padding: 10px;
}

.subcategory li a:hover {
    background-color: #f0f0f0; /* 하위 메뉴 항목에 마우스를 올렸을 때 배경색 변경 */
    color: #000; /* 하위 메뉴 항목에 마우스를 올렸을 때 색상 변경 */
}

/* 제품 리스트 */
.products {
	display: grid;
	grid-template-columns: repeat(4, 1fr);
	gap: 20px;
}

.product {
	text-align: center;
	border: 1px solid #ddd;
	padding: 15px;
	transition: transform 0.3s;
}

.product:hover {
	transform: scale(1.05);
}

.product img {
	width: 150px;
	height: 150px;
	object-fit: cover;
}

.product-name {
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
#123{
 width: 100%;
 height: 100%
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


	<!-- 홍보용 이미지 -->
	<div class="aboutPromotion" align="center">
		<img width="100%" height="300px" alt="홍보용 이미지" src="resources/imgs/productsM.png">
	</div>



	<!-- 중간 메뉴버튼 -->
	<div class="container">
		<div class="location">
			<ul class="wrap">
				<li><a href="homeMain.do" class="irCommon">Home</a></li>
				<li><a href="productsM.do">Products<i class="irCommon"></i></a>
					<ul>
					<li><a href="aboutM.do">About Us</a></li>
					<li><a href="productsM.do">Products</a></li>
					<li><a href="#.jsp">News</a></li>
					<li><a href="#.jsp">Business</a></li>
					<li><a href="contactUs.do">Contact Us</a></li>
					</ul>
				</li>


				<li ><a href="productsM.jsp">카테고리<i class="irCommon"></i></a>
					<ul>
						<li><a href="p_mushroom.do">버섯류</a></li>
						<li><a href="p_foodstuffs.do">식료품</a></li>
						<li><a href="p_snack.do">제과</a></li>
						<li><a href="p_etc.do">기타</a></li>
						<li><a href="p_importP.do">수입제품</a></li>

					</ul>
				</li>
			</ul>
		</div>

		<br>
		


	<!-- 사이드 메뉴와 제품 리스트 -->
	<div style="display: flex;">
		<div class="productsMenus">
			<div class="productsMenu">
				<a href="p_mushroom.do">버섯류</a>
			</div>
			<div class="productsMenu">
				<a href="p_foodstuffs.do">식료품</a>
				<ul class="subcategory">
                <li><a href="p_frozen.do">냉동/냉장</a></li>
                <li><a href="p_roomtemp.do">상온</a></li>
            	</ul>
			</div>
			<div class="productsMenu">
				<a href="p_snack.do">제과</a>
			</div>
			<div class="productsMenu">
				<a href="p_etc.do">기타</a>
			</div>
			<div class="productsMenu">
				<a href="p_importP.do">수입제품</a>
			</div>
		</div>

		<div class="products">
			<div class="product">
				<img
					src="https://static.megamart.com/product/image/0615/06151089/06151089_1_960.jpg"
					alt="새송이">
				<div class="product-name">새송이 버섯</div>
			</div>
			<div class="product">
				<img
					src="https://oasisprodproduct.edge.naverncp.com/44210/detail/detail_44210_0_45595246-9e77-49da-97b8-7524b69ca371.jpg"
					alt="양송이">
				<div class="product-name">양송이 버섯</div>
			</div>
			<div class="product">
				<img
					src="https://oasisprodproduct.edge.naverncp.com/483/detail/detail_483_0_38056d92-3ac8-45d7-bcf8-4f39e70eb9f4.jpg"
					alt="팽이">
				<div class="product-name">팽이 버섯</div>
			</div>
			<div class="product">
				<img
					src="https://img-cf.kurly.com/hdims/resize/%3E720x/quality/90/src/shop/data/goodsview/20220901/gv00000419017_1.jpg"
					alt="표고">
				<div class="product-name">표고 버섯</div>
			</div>
		</div>
	</div>
</div>


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