<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
/* products body */
.productBody {
	display: flex;
	justify-content: center; /* 전체 div 가운데 정렬 */
	min-height: 160vh;
	margin-top: 30px;
}

/* 제품 리스트 */
.products {
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
	color: black;
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
			<c:forEach var="product" items="${snackList}">
				<div class="product">
					<a href="productDetail/${product.pd_idx}"> <img
						src="${product.pd_img}" alt="제품이미지">
					</a> <a href="productDetail/${product.pd_idx}">
						<div class="product-name">${product.pd_name}</div>
					</a>
				</div>
			</c:forEach>

		</div>
	</div>

	<!-- Pagination -->
	<div class="pagination">
		<c:if test="${currentPage > 1}">
			<a href="?page=${currentPage - 1}">&laquo; Prev</a>
		</c:if>
		<c:forEach begin="1" end="${totalPages}" var="pageNum">
			<a href="?page=${pageNum}"
				class="${pageNum == currentPage ? 'active' : ''}">${pageNum}</a>
		</c:forEach>
		<c:if test="${currentPage < totalPages}">
			<a href="?page=${currentPage + 1}">Next &raquo;</a>
		</c:if>
	</div>


	<br>
	<jsp:include page="../Common/ScrollToTopBtn.jsp" />
	<jsp:include page="../Common/Footer.jsp" />

</body>
</html>
