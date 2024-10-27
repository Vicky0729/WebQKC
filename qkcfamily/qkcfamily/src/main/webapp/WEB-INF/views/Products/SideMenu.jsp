<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>side Menu bar</title>
<style type="text/css">
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

}

/* 사이드 메뉴 */
.productsMenus {
	display: flex;
	flex-direction: column;
	background-color: #F5F5DC;
	margin-right: 20px;
	margin-left : 5px;	
	padding: 3px;
	position: relative; /* 하위 메뉴의 위치를 올바르게 참조 */
	z-index: 0; /* 전체 레이아웃에서 기본 z-index */
	height: 200px;
	
}

.productsMenu {
	width: 150px; /* 상위 메뉴의 너비 */
	height: 50px;
	background-color: #8B0000;
	margin-bottom: 3px;
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
	font-weight: bold;
	color: white;
}

.productsMenu:hover {
	background-color: #F5F5DC;
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
</style>
</head>
<body>
	<!-- 사이드 메뉴와 제품 리스트 -->
	<div style="display: flex;">
		<div class="productsMenus">
			<div class="productsMenu">
				<a href="Mushroom">버섯류</a>
			</div>
			<div class="productsMenu">
				<a href="Groceries">식료품</a>
				<ul class="subcategory">
					<li><a href="G_frozen">냉동</a></li>
					<li><a href="G_fresh">냉장</a></li>
					<li><a href="G_ambient">상온</a></li>
				</ul>
			</div>
			<div class="productsMenu">
				<a href="Snack">제과</a>
				<ul class="subcategory">
					<li><a href="S_cookies">쿠키류</a></li>
					<li><a href="S_snacks">스낵류</a></li>
					<li><a href="S_biscuits">비스켓류</a></li>
				</ul>
			</div>
			<div class="productsMenu">
				<a href="Etc">기타</a>
			</div>
		
		</div>
	</div>
</body>
</html>