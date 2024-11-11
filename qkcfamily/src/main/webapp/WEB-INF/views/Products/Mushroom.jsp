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
}

/* 10/21  products body */
.productBody {
	display: flex;
	justify-content: center; /* 전체 div 가운데 정렬 */
	min-height: 120vh;
	margin-top: 30px;
	margin-right: 50px;

}

/* 제품 리스트 */
.products {
	margin-left: 10%;
	display: grid;
	grid-template-columns: repeat(4, 1fr);
	gap: 20px;
	height: 300px;
}

.product {
	text-align: center;
	padding: 15px;
	transition: transform 0.3s;
}

.product:hover {
	transform: scale(1.05);
}

.product img {
	width: 200px;
	height: 200px;
	object-fit: cover;
}

.product-name {
	margin-top: 10px;
	font-weight: bold;
}

.pagination {
	display: flex;
	margin-top: 20px;
	justify-content: center;
}

.pagination a {
	color: black;
	float: left;
	padding: 8px 16px;
	text-decoration: none;
	transition: background-color .3s;
}

.pagination a.active {
	background-color: #8B0000;
	color: white;
	border-radius: 5px;
}

.pagination a:hover:not(.active) {
	background-color: #ddd;
	border-radius: 5px;
}

a {
	text-decoration: none; /* 기본 링크 밑줄 없애기 */
	color : black;
	}
	
/* 반응형 디자인 */
@media (max-width: 1200px) {
	.products {
		grid-template-columns: repeat(3, 1fr); /* 3열로 변경 */
	}
}

@media (max-width: 768px) {
	.products {
		grid-template-columns: repeat(2, 1fr); /* 2열로 변경 */
	}
}

@media (max-width: 480px) {
	.products {
		grid-template-columns: 1fr; /* 1열로 변경 */
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
	<br>
	<div class="productBody">
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



	<br>
	<jsp:include page="../Common/ScrollToTopBtn.jsp" />
	<jsp:include page="../Common/Footer.jsp" />

</body>
</html>
