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
		<img width="100%" height="300px" alt="홍보용 이미지" src="img/aboutus.png">
	</div>




		<br>
		
<!-- 사이드 메뉴와 제품 리스트 -->
		<div style="display: flex;">
			<div class="productsMenus">
				<div class="productsMenu">
					<a href="aboutM.jsp">회사소개</a>
				</div>
				<div class="productsMenu">
					<a href="aboutM_History.jsp">연혁</a>
				</div>
				<div class="productsMenu">
					<a href="aboutM_Export.jsp">수출사업</a>
				</div>
				<div class="productsMenu">
					<a href="aboutM_Import.jsp">수입사업</a>
				</div>
				<div class="productsMenu">
					<a href="aboutM_Im_pro.jsp">수입제품</a>
				</div>
				<div class="productsMenu">
					<a href="aboutM_OEM.jsp">OEM</a>
				</div>
				<div class="productsMenu">
					<a href="aboutM_O_brand.jsp">자사브랜드</a>
				</div>
		    </div>
			
			
			
			<section>
			<br>
			<h1> <수입제품> </h1>
			<article class="wrap introWrap">

		<img class="intro" alt="회사소개" src="">
		<br>
		
		<br>
		<div class="bxComTit">
			<p class="tit">주식회사 동서는 공정하고 투명한 거래를 원칙으로 <br><strong>인간중심을 통해 미래가치를 창출, 사회에 공헌</strong>하는 <br>세계적인 종합 식품회사를 추구합니다.</p>
			<p class="txt">
				1975년에 설립된 주식회사 동서는 정도경영(正道經營)과 합리추구(合理追求)를 기업이념으로
				효율적인 경영활동을 통해 기업가치를 향상시키고 사회에 공헌하는 미래가치를 창출해 왔습니다.
			</p>
			<p class="txt">
				포장제품 제조업을 기반으로 사업을 시작한 주식회사 동서는 식자재 유통업, 해외 영업, 구매대행업으로
				사업 영역을 확대해, 끊임없는 신제품 개발과 철저한 품질관리, 고객만족을 위한 서비스향상 등으로
				안정적인 성장을 거듭하고 있습니다.
			</p>
			<p class="txt">
				포장사업분야는 1989년 반월공단 내 포장재 생산공장을 완공하여 연포장 등의 식품용 포장제품을
				본격적으로 생산·판매한 이후로 공장건물 증축 및 설비투자 확대 등을 통해 양적, 질적으로 끊임없이
				발전해 나아가고 있습니다.
			</p>
			<p class="txt">
				식품사업분야는 1995년 식자재 전문 브랜드인 ”리치스”를 탄생시킨 이후 꾸준한 품목개발과
				엄격한 품질관리를 통해서 국내 식자재 시장에서 주도적인 역할을 하고 있습니다. “리치스 음료”를
				비롯해서 “후르츠 칵테일“, “파인애플” 등 과실 통조림과 유지류, 다류 등 고객의 기호에 맞는 다양한
				제품을 판매하고 있으며 고객만족경영을 목표로 신제품 개발과 프리미엄 제품 출시 등 고객의 니즈를
				충족시키고자 꾸준히 노력하고 있습니다.
			</p>
			<p class="txt">
				다류 사업분야는 소비자들에게 품질 좋은 다류 제품을 생산, 공급하기 위해 최첨단 가공설비와
				포장설비를 갖추고 2004년도 출발하였으며 세계일류 제품생산을 목표로 전진하고 있습니다.
			</p>
			<p class="txt">
				주식회사 동서는 외형적인 성장보다는 내실경영을 추구하여 건전한 재무구조와 경영의 투명성을
				실현하고 있습니다. 앞으로도 주식회사 동서는 급변하는 환경 변화에 적극적이고 탄력적으로
				대응하고 진취적이고 효율적인 경영활동을 통해 기업가치를 한층 더 향상시켜 주주 및 고객 여러분과
				함께 발전해 나갈 것입니다.
			</p>
		</div>
	</article>
</section>
			
		</div>
	</div>


	<br>

	<jsp:include page="../Common/Footer.jsp" />

</body>
</html>
