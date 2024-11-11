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

/* 가로 정렬을 위한 수정 */
.productsMenus-container {
    display: flex;
    justify-content: center; /* 전체 div 가운데 정렬 */
    margin-left: 20px;
}

.productsMenus {
    display: flex;
    flex-direction: row; /* 가로로 정렬 */
    padding: 5px;
    position: relative;
    z-index: 1;
    justify-content: center; /* 가운데 정렬 (필요에 따라 변경 가능) */
    height : 60px;
}

.productsMenu {
    width: 150px;
    height: 50px;
    background-color: #8B0000;
    display: flex;
    justify-content: center;
    align-items: center;
    transition: background-color 0.3s;
    border: 1px solid white;
    position: relative;
    z-index: 1;
}

.productsMenu a {
    text-decoration: none;
    font-weight: bold;
    color: white;
}

.productsMenu:hover {
    background-color: #d80000;
}

/* 하위 메뉴 */
.subcategory {
    display: none;
    position: absolute;
    top: 100%; /* 상위 메뉴 바로 아래에 위치 */
    left: 0;
    width: 150px;
    background-color: #fff;
    list-style: none;
    padding-left: 0;
    margin: 0;
    border: 1px solid #D3D3D3;
    z-index: 10;
    box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
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
    background-color: #f0f0f0;
    color: #000;
}
</style>
</head>
<body>
	<!-- 사이드 메뉴와 제품 리스트 -->
	<div class="productsMenus-container">
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