<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>aboutM</title>
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
	min-height: 100vh;
    display: flex;
    flex-direction: column;
 
}

/* products body */
.productBody {
	display: flex;
	   min-height: 100vh; /* 최소 높이를 100vh로 설정 */
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
	height: 300px;
	
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
.innercontant {
	margin-left: 30px;
}

</style>
</head>
<body>
	
	<jsp:include page="../Common/Header2.jsp" />

	<!-- 홍보용 이미지 -->
	<div class="aboutPromotion" align="center">
		<img width="100%" height="200px" alt="홍보용 이미지" src="../resources/imgs/aboutus.png">
	</div>

		<br>
		<div class="productBody">
<!-- 사이드 메뉴와 제품 리스트 -->
		<div style="display: flex;">
			<div class="productsMenus">
				<div class="productsMenu">
					<a href="CEO">CEO 인사말</a>
				</div>
				<div class="productsMenu">
					<a href="OurBrand">회사소개</a>
				</div>
				<div class="productsMenu">
					<a href="CIBrand">CI & 브랜드소개</a>
				</div>
				<div class="productsMenu">
					<a href="Import">수입사업</a>
				</div>
			</div>
			
			
			
			<section>
			<br>
			<h1> [CI & Brand] </h1>
			<article class="wrap introWrap">

			<img  alt="ci" src="../resources/imgs/ci1.png">
			<img  alt="ci" src="../resources/imgs/ci2.png">
			<img  alt="ci" src="../resources/imgs/ci3.png">
			<img  alt="ci" src="../resources/imgs/ci4.png">
			</article>
			</section>
			
			</div>
		</div>

	<br>
	
	<jsp:include page="../Common/Footer.jsp" />
	
</body>
</html>
