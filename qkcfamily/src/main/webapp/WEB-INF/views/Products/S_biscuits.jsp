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
		<img width="90%" height="300px" alt="홍보용 이미지" src="img/productsM.png">
	</div>

		<br>
		

	<jsp:include page="SideMenu.jsp" />
	

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



	<br>
	
	<jsp:include page="../Common/Footer.jsp" />
	
</body>
</html>
