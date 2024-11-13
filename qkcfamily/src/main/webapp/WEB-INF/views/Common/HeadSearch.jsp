<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	 <%@ page isELIgnored="false"%> 
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>productSearch</title>
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
    min-height: 150vh; 
}


/* 제품 리스트 */
.products {
	display: grid;
	grid-template-columns: repeat(4, 1fr);
	gap: 20px;
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

	font-weight: bold;
	margin-top: 10px;
	font-size: 18px;
	
}

.product a {
	color: black;
	padding: 8px 16px;
	text-decoration: none;
	transition: background-color .3s;
}

.searchContents{
	display: inline-block;
	justify-items: center;
	width : 840px;
	margin-left: 25%;
	}

/* 반응형 디자인 */
@media ( max-width : 1200px) {
	.products {
		grid-template-columns: repeat(3, 1fr); /* 3열로 변경 */
	}
}

@media ( max-width : 768px) {
	.products {
		grid-template-columns: repeat(2, 1fr); /* 2열로 변경 */
	}
}

@media ( max-width : 480px) {
	.products {
		grid-template-columns: 1fr; /* 1열로 변경 */
	}
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
		

	
	<!-- 사이드 메뉴와 제품 리스트 -->
	<div class ="searchContents">
      <h2> <span style="color: blue;">${searchProduct}</span> <검색결과></h2>
      <br>
      <h3>총 <span style="color: blue;">${SearchCount}</span> 건의 검색결과가 있습니다.</h3>
      <div class="products">
         <c:forEach items="${SearchList}" var="search">
         <div class="product">
            <a href="${pageContext.request.contextPath}/Products/productDetail/${search.pd_idx}"> <img
                  src="${search.pd_img}" alt="제품이미지">
               </a> <a href="${pageContext.request.contextPath}/Products/productDetail/${search.pd_idx}">
                  <div class="product-name">${search.pd_name}</div>
               </a>
         </div>
         </c:forEach>
      </div>
   </div>



	<br>
		<jsp:include page="../Common/Footer.jsp" />
</body>
</html>
