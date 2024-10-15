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



/* 중간 메뉴 쿼리 */
@media only screen and (max-width: 1499px) {
    .location .wrap {
        width: auto;
        padding: 0;
    }

    .wrap, .orgaWrap .wrap {
        width: 100%;
        padding: 60px 80px 120px;
        box-sizing: border-box;
    }
}
/* 하위에 숨겨져 있다가 나오게*/
.location ul ul {
    display: none;
    position: absolute;
    top: 100%;
    left: 0;
    background: #fff;
    padding: 10px;
    border: 1px solid #e9e9e9;
    width :120px;
    list-style: none;
    z-index: 10; /* 다른 요소 위에 보이도록 설정 */
}

.location ul li:hover > ul {
    display: block;
}

/*메뉴 버튼 스타일*/
.location > ul > li {
	list-style: none;
    position: relative;
    display: inline-block;
    padding: 10px 15px;
    width : 120px;
    background-color: #f6f6f6;
    border-bottom: solid 3px #8B0000;
    border-right: solid 0.5px #8B0000;

}
.location> ul > li:hover {
    background: #eb1c24; /* 마우스 오버 시 배경색 변경 */
}


.location > ul > li a {
	display: flex;
	justify-content :center;
    color: #282828;
    font-size: 16px;
    text-decoration: none;
}

.location > ul > li:after {
	
    position: absolute;
    top: 0;
    right: 0;
    display: block;
    content: '';
    height: 50px;
    width: 1px;
    background: #e9e9e9;
}
/* 미디어 쿼리*/
@media only screen and (max-width: 768px) {
    .location ul {
        flex-direction: column;
        width: 100%;
    }

    .location > ul > li {
        display: block;
        width: 100%;
    }
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


#123{
 width: 100%;
 height: 100%
}




</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/Common/Header.jsp" />

	<!-- 홍보용 이미지 -->
	<div class="aboutPromotion" align="center">
		<img width="90%" height="300px" alt="홍보용 이미지" src="img/productsM.png">
	</div>



	<!-- 중간 메뉴버튼 -->
	<div class="container">
		<div class="location">
			<ul class="wrap">
				<li><a href="homeMain.jsp" class="irCommon">Home</a></li>
				<li><a href="productsM.jsp">Products<i class="irCommon"></i></a>
					<ul>
					<li><a href="aboutM.jsp">About Us</a></li>
					<li><a href="productsM.jsp">Products</a></li>
					<li><a href="News.jsp">News</a></li>
					<li><a href="Business.jsp">Business</a></li>
					<li><a href="contactUs.jsp">Contact Us</a></li>
					</ul>
				</li>


				<li ><a href="productsM.jsp">카테고리<i class="irCommon"></i></a>
					<ul>
						<li><a href="p_mushroom.jsp">버섯류</a></li>
						<li><a href="p_foodstuffs.jsp">식료품</a></li>
						<li><a href="p_snack.jsp">제과</a></li>
						<li><a href="p_etc.jsp">기타</a></li>
						<li><a href="p_importP.jsp">수입제품</a></li>

					</ul>
				</li>
			</ul>
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
	
	<jsp:include page="/WEB-INF/views/Common/Footer.jsp" />
	
</body>
</html>