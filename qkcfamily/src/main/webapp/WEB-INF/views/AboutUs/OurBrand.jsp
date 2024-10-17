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
    display: flex;
    flex-direction: column;
    min-height: 100vh; /* 최소 높이를 100vh로 설정 */
}



/* 사이드 메뉴 */
.productsMenus {
	display: flex;
	flex-direction: column;
	background-color: #F5F5F5; /* 부드러운 연한 회색 */
	border: 1px solid #D3D3D3; /* 연한 회색 테두리 */
	margin-right: 20px;
	padding: 10px;
}

.productsMenu {
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

.productsMenu a {
	text-decoration: none;
	color: #333; /* 더 차분한 글자색 */
	font-weight: bold;
}

.productsMenu:hover {
	background-color: #FAF0E6; /* 좀 더 밝은 베이지색으로 변환 */
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

</style>
</head>
<body>
	 <jsp:include page="../Common/Header2.jsp" />

	<!-- 홍보용 이미지 -->
	<div class="aboutPromotion" align="center">
		<img width="100%" height="300px" alt="홍보용 이미지" src="resources/imgs/aboutus.png">
	</div>



		<br>
		
<!-- 사이드 메뉴와 제품 리스트 -->
		<div style="display: flex;">
			<div class="productsMenus">
				<div class="productsMenu">
					<a href="aboutM.do">회사소개</a>
				</div>
				<div class="productsMenu">
					<a href="aboutM_History.do">연혁</a>
				</div>
				<div class="productsMenu">
					<a href="aboutM_Export.do">수출사업</a>
				</div>
				<div class="productsMenu">
					<a href="aboutM_Import.do">수입사업</a>
				</div>
				<div class="productsMenu">
					<a href="aboutM_Im_pro.do">수입제품</a>
				</div>
				<div class="productsMenu">
					<a href="aboutM_OEM.do">OEM</a>
				</div>
				<div class="productsMenu">
					<a href="aboutM_O_brand.do">자사브랜드</a>
				</div>
		    </div>
			
			
			
			<section>
			<br>
			<h1> <자사브랜드> </h1>
			<article class="wrap introWrap">

					<img class="intro" alt="자사브랜드" src="resources/imgs/o_brand.png">
			</article>
			</section>
			
			</div>
		</div>




	<br>

	<jsp:include page="../Common/Footer.jsp" />

</body>
</html>
