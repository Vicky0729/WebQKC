<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>productMain</title>
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
	
}
/* products body */
.productBody {
	display: flex;
	min-height: 100vh; /* 최소 높이를 100vh로 설정 */
	margin-top: 10px;
}

/* 제품 리스트 */
.products {
	margin-left: 10%;
	display: grid;
	grid-template-columns: repeat(4, 1fr);
	gap: 80px;
	height : 300px;
}

.product {
	margin-top: 20px;
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
		<img width="100%" height="200px" alt="홍보용 이미지"
			src="../resources/imgs/productsM.jpg">
	</div>
	<br>
	<div class="productBody">
		<jsp:include page="../Products/SideMenu.jsp" />

		<div class="products">
			<div class="product">
				<a href="Mushroom"> <img
					src="https://static.megamart.com/product/image/0615/06151089/06151089_1_960.jpg"
					alt="버섯류">
					<div class="product-name">버섯류</div>
				</a>
			</div>
			<div class="product">
				<a href="Groceries"> <img
					src="https://www.dailypop.kr/news/photo/202002/43324_83040_2831.jpg"
					alt="식료품">
					<div class="product-name">식료품</div>
				</a>
			</div>
			<div class="product">
				<a href="Snack"> <img
					src="https://www.hotelrestaurant.co.kr/data/photos/20220104/art_16433321904149_6fa2b4.jpg"
					alt="제과류">
					<div class="product-name">제과류</div>
				</a>
			</div>
		</div>
	</div>


	<br>

	<jsp:include page="../Common/Footer.jsp" />

</body>
</html>
