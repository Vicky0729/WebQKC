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
	margin-left : 10%;
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 20px;
}

.product {
	margin-top : 20px;
	margin-left : 100px;
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





</style>
</head>
<body>
	
	 <jsp:include page="../Common/Header2.jsp" />

	<!-- 홍보용 이미지 -->
	<div class="aboutPromotion" align="center">
		<img width="100%" height="300px" alt="홍보용 이미지" src="resources/imgs/productsM.png">
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
		</div>

		<div class="products">
			<div class="product">
				<img
					src="https://static.megamart.com/product/image/0615/06151089/06151089_1_960.jpg"
					alt="새송이">
				<div class="product-name">버섯류</div>
			</div>
			<div class="product">
				<img
					src="https://oasisprodproduct.edge.naverncp.com/44210/detail/detail_44210_0_45595246-9e77-49da-97b8-7524b69ca371.jpg"
					alt="양송이">
				<div class="product-name">식료품</div>
			</div>
			<div class="product">
				<img
					src="https://oasisprodproduct.edge.naverncp.com/483/detail/detail_483_0_38056d92-3ac8-45d7-bcf8-4f39e70eb9f4.jpg"
					alt="팽이">
				<div class="product-name">제과류</div>
			</div>
			</div>
		</div>
	</div>
</div>


	<br>
	
	<jsp:include page="../Common/Footer.jsp" />
	
</body>
</html>
