<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>productMain</title>
<style>
/* 전체 적용 CSS  */
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


/* products body */
.productBody {
	display: flex;
	min-height: 100vh; /* 최소 높이를 100vh로 설정 */
	margin-top: 30px;
	margin-left : 13%;
}

/* 제품 리스트 */
.products {
	margin-left: 10%;
	height: 300px;
	display : flex;
	gap: 80px;
}

.product {
	margin-top: 2px;
	text-align: center;
	padding: 15px;
	transition: transform 0.3s;
	position: relative; /* position relative 추가 */
}

.product img {
	width: 200px;
	height: 200px;
	object-fit: cover;
}

.product-name {
	margin-top: 10px;
	font-weight: bold;
	display: flex;
	justify-content: center;
	color: black; /* 기본 색상 */
	transition: color 0.3s ease; /* 색상 변화에 부드러운 전환 효과 추가 */
}

/* a 태그 버튼 방식 수정 11/3 */
a {
	text-decoration: none; /* 기본 링크 밑줄 없애기 */
	display: inline-block;
	position: relative;
	overflow: hidden; /* overflow hidden 추가 */
}

/* 링크에 마우스를 올렸을 때 */
.product:hover .product-name {
	color: #d80000; /* 제목 색상 변경 */
}

/* 테두리 애니메이션 */
.products a {
	display: inline-block;
	position: relative;
}

.products a:before,
.products a:after,
.product-name:before,
.product-name:after {
	content: "";
	background: #d80000;
	position: absolute;
	transition: all 0.3s ease;
	z-index: 0;
}

.products a:before {
	width: 100%;
	height: 2px;
	top: 0; /* 상단 */
	left: 0; /* 왼쪽 */
	transform: translateX(-100%);
}

.products a:after {
	width: 2px;
	height: 90%;
	right: 0; /* 오른쪽 */
	top: 0; /* 상단 */
	transform: translateY(-100%);
}

.product-name:before {
	width: 100%;
	height: 2px;
	bottom: 0; /* 하단 */
	left: 0; /* 왼쪽 */
	transform: translateX(100%);
}

.product-name:after {
	width: 2px;
	height: 100%;
	left: 0; /* 왼쪽 */
	bottom: 0; /* 하단 */
	transform: translateY(110%);
}

.products a:hover:before,
.products a:hover:after,
.product:hover .product-name:before,
.product:hover .product-name:after {
	transform: translate(0, 0);
}

.products a:hover:before {
	transition-delay: 0s; /* 처음에 바로 나타남 */
}

.products a:hover:after {
	transition-delay: 0.3s; /* 오른쪽 애니메이션 지연 */
}

.product:hover .product-name:before {
	transition-delay: 0.6s; /* 아래쪽 애니메이션 지연 */
}

.product:hover .product-name:after {
	transition-delay: 0.9s; /* 왼쪽 애니메이션 지연 */
}
</style>
</head>
<body>

	<jsp:include page="../Common/Header2.jsp" />

	<!-- 홍보용 이미지 -->
	<div class="aboutPromotion" align="center">
		<img width="100%" height="200px" alt="홍보용 이미지"
			src="../resources/imgs/productsM.png">
	</div>
	<br>


		<jsp:include page="../Products/SideMenu.jsp" />

		
	<div class="productBody">
		<div class="products">
			<a href="Mushroom">
				<p class="product">
					<img src="https://static.megamart.com/product/image/0615/06151089/06151089_1_960.jpg" alt="버섯류">
					<span class="product-name">버섯류</span>
				</p>
			</a>
			<a href="Groceries">
				<p class="product">
					<img src="https://www.dailypop.kr/news/photo/202002/43324_83040_2831.jpg" alt="식료품">
					<span class="product-name">식료품</span>
				</p>
			</a>
			<a href="Snack">
				<p class="product">
					<img src="https://www.hotelrestaurant.co.kr/data/photos/20220104/art_16433321904149_6fa2b4.jpg" alt="제과류">
					<span class="product-name">제과류</span>
				</p>
			</a>
		</div>
	</div>

	<jsp:include page="../Common/ScrollToTopBtn.jsp" />
	<br>

	<jsp:include page="../Common/Footer.jsp" />

</body>
</html>
