<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cl&Brand</title>
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

/* 가로 정렬을 위한 수정 */
.productsMenus-container {
	display: flex;
	justify-content: center; /* 전체 div 가운데 정렬 */
	margin-left: 20px;
}

/* products body */
.productBody {
	display: flex;
	min-height: 150vh;
	margin-left: 80px;
	margin-right: 50px;
}

/* 사이드 메뉴 */
.productsMenus {
	display: flex;
	flex-direction: row; /* 가로로 정렬 */
	padding: 5px;
	position: relative;
	z-index: 1;
	justify-content: center; /* 가운데 정렬 (필요에 따라 변경 가능) */
	height: 60px;
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

.innercontant {
	margin-left: 30px;
}

.introWrap {
	display: grid;
	grid-template-columns: repeat(2, 1fr); /* 2개의 열로 설정 */
	gap: 10px;  
	max-width: 600px; /* 그리드의 최대 너비 */
	margin: 0 auto; /* 가운데 정렬 */
}

.ciImg {
	width: 100%;
	min-width: 598px;
	min-height: 240px;
	border : 2px solid black;
</style>
</head>
<body>
	<jsp:include page="../Common/Header2.jsp" />


	<!-- 홍보용 이미지 -->
	<div class="aboutPromotion" align="center">
		<img width="100%" height="200px" alt="홍보용 이미지"
			src="../resources/imgs/aboutus.jpg">
	</div>

	<br>

	<!-- 사이드 메뉴와 제품 리스트 -->
	<div class="productsMenus-container">
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
		</div>
	</div>


	<br>

	<div class="productBody">



		<section class="innercontant">
			<br>
			<h1>[CI & Brand]</h1>
			<br>
			<article class="introWrap">

				<img class="ciImg" alt="ci" src="../resources/imgs/ci1.png"> <img
					class="ciImg" alt="ci" src="../resources/imgs/ci2.png"> <img
					class="ciImg" alt="ci" src="../resources/imgs/ci3.png"> <img
					class="ciImg" alt="ci" src="../resources/imgs/ci4.png">
			</article>
		</section>

	</div>


	<br>
	<jsp:include page="../Common/ScrollToTopBtn.jsp" />
	<jsp:include page="../Common/Footer.jsp" />

</body>
</html>
