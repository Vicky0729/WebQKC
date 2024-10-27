<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>side Menu bar</title>
<style type="text/css">

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
    background-color: #F5F5F5;
    border: 1px solid #D3D3D3;
    margin-right: 20px;
    padding: 10px;
    position: relative; /* 하위 메뉴의 위치를 올바르게 참조 */
    z-index: 0; /* 전체 레이아웃에서 기본 z-index */
}

.productsMenu {
    width: 150px; /* 상위 메뉴의 너비 */
    height: 50px;
    background-color: #FFFAF0;
    margin-bottom: 10px;
    display: flex;
    justify-content: center;
    align-items: center;
    transition: background-color 0.3s;
    border: 1px solid #D3D3D3;
    position: relative; /* 하위 메뉴가 이 요소를 기준으로 배치됨 */
    z-index: 1; /* 상위 메뉴와 하위 메뉴 간의 겹침 방지 */
}

.productsMenu a {
    text-decoration: none;
    color: #333;
    font-weight: bold;
}

.productsMenu:hover {
    background-color: #FAF0E6;
}

/* 하위 메뉴 */
.subcategory {
    display: none; /* 기본적으로 숨김 */
    position: absolute; /* 상위 메뉴를 기준으로 절대 위치 */
    top: 0; /* 상위 메뉴 바로 아래에 위치 */
    left: 100%; /* 상위 메뉴의 오른쪽으로 이동 */
    width: 150px; /* 하위 메뉴 너비를 상위 메뉴와 동일하게 설정 */
    background-color: #fff;
    list-style: none;
    padding-left: 0;
    margin: 0;
    border: 1px solid #D3D3D3;
    z-index: 10; /* 하위 메뉴가 상위 메뉴 위로 오도록 설정 */
     box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1); /* 그림자 추가 */
}

.productsMenu:hover .subcategory {
    display: block; /* 상위 항목에 마우스를 올렸을 때 하위 메뉴 표시 */
}

.subcategory li {
    margin: 0;
    padding: 5px 15px;
}

.subcategory li a {
    text-decoration: none;
    color: #555;
    display: block;
    padding: 10px;
}

.subcategory li a:hover {
    background-color: #f0f0f0; /* 하위 메뉴 항목에 마우스를 올렸을 때 배경색 변경 */
    color: #000; /* 하위 메뉴 항목에 마우스를 올렸을 때 색상 변경 */
}

</style>
</head>
<body>
	<!-- 사이드 메뉴와 제품 리스트 -->
	<div style="display: flex;">
		<div class="productsMenus">
			<div class="productsMenu">
				<a href="p_mushroom.jsp">버섯류</a>
			</div>
			<div class="productsMenu">
				<a href="p_foodstuffs.jsp">식료품</a>
				<ul class="subcategory">
                <li><a href="p_f_frozen.jsp">냉동/냉장</a></li>
                <li><a href="p_f_roomtemp.jsp">상온</a></li>
            	</ul>
			</div>
			<div class="productsMenu">
				<a href="p_snack.jsp">제과</a>
				<ul class="subcategory">
                <li><a href="p_s_cookies.jsp">쿠키류</a></li>
                <li><a href="p_s_snacks.jsp">스낵류</a></li>
                <li><a href="p_s_biscuits.jsp">비스켓류</a></li>
            	</ul>
			</div>
			<div class="productsMenu">
				<a href="p_etc.jsp">기타</a>
			</div>
			<div class="productsMenu">
				<a href="p_importP.jsp">수입제품</a>
			</div>
		</div>
</body>
</html>