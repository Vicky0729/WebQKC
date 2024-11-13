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
	justify-content: center; /* 전체 div 중앙 정렬 */
	min-height: 150vh;
	width : 100%;
	margin: 0 auto;
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
    display: flex;
    flex-direction: column;
    align-items: center; /* 세로 방향으로 중앙 정렬 */
    width: 100%;
}

.introWrap {
    display: grid;
    grid-template-columns: repeat(2, 1fr); /* 2개의 열로 설정 */
    gap: 20px; /* 간격을 좀 더 넓힘 */
    width: 80%; /* 그리드 전체 너비를 조정 */
    margin: 0 auto;
    justify-items: center;
    align-items: center;
}

.ciImg {
    width: 100%; /* 그리드 셀의 너비에 맞춤 */
    height: auto;
    border: 2px solid black;
    aspect-ratio: 2 / 1; /* 이미지 비율 유지 */
}



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
		<div>
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
	<h1 align="center">[CI & Brand]</h1>
	<br>
	<div class="productBody">
		<section class="innercontant">
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
