<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>QKCfamily</title>
    <style>
        body {
            font-family: Pretendard-Regular, Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        .container {
            background: white;
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
        }
        .product-header {
            display: flex;
            gap: 20px;
            align-items: center;
            margin-bottom: 20px;
        }
        .product-header img {
            width: 300px;
            border: 1px solid #ddd;
        }
        .product-details {
            flex: 1;
        }
        .product-name {
            font-size: 24px;
            font-weight: bold;
        }
        .product-description {
            margin-top: 10px;
            font-size: 16px;
            color: #666;
        }
        .contact-email {
            margin-top: 10px;
            font-weight: bold;
        }
        .product-specs {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
        }
        .product-specs th, .product-specs td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }
        .product-specs th {
            background: #f5f5f5;
        }
        .additional-info {
            margin-top: 20px;
            font-size: 14px;
            color: #555;
        }
    </style>
</head>
<body>
	
	<jsp:include page="../Common/Header2.jsp" />
	

		<br>



	<!-- 사이드 메뉴와 제품 리스트 -->
	<div style="display: flex;">
		<div class="productsMenus">
			<div class="productsMenu">
				<a href="Mushroom">버섯류</a>
			</div>
			<div class="productsMenu">
				<a href="Groceries">식료품</a>
				<ul class="subcategory">
					<li><a href="G_frozen">냉동</a></li>
					<li><a href="G_fresh">냉장</a></li>
					<li><a href="G_ambient">상온</a></li>
				</ul>
			</div>
			<div class="productsMenu">
				<a href="Snack">제과</a>
				<ul class="subcategory">
                <li><a href="S_cookies">쿠키류</a></li>
                <li><a href="S_snacks">스낵류</a></li>
                <li><a href="S_biscuits">비스켓류</a></li>
            	</ul>
			</div>
			<div class="productsMenu">
				<a href="Etc">기타</a>
			</div>
			<div class="productsMenu">
				<a href="../ImportBusiness/Product">수입제품</a>
			</div>
		</div>
	



    <div class="container">
        <div class="product-header">
            <img src="#" alt="사진">
            <div class="product-details">
                <div class="product-name">컵라면</div>
                <div class="product-description">컵라면 입니다</div>
                <div class="contact-email">제품문의: 010-1111-1111</div>
            </div>
        </div>

        <h2>제품상세</h2>
        <table class="product-specs">
            <tr>
                <th>제품명</th>
                <td>컵라면</td>
            </tr>
            <tr>
                <th>스펙</th>
                <td>11111111111111111111</td>
            </tr>
            <tr>
                <th>박스사이즈</th>
                <td>22222222222222222222222222222222222</td>
            </tr>
            <tr>
                <th>적재수량/팔레트</th>
                <td>3333333333333333333333333333333333</td>
            </tr>
            <tr>
                <th>적재수량/컨테이너</th>
                <td>5555555555555555555555555555555</td>
            </tr>
        </table>

        <div class="additional-info">
            쓸내용 있으면 쓰고 없으면 넘어가는 칸
        </div>
    </div>
</body>
</html>