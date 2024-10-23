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
	min-height: 100vh;
	display: flex;
	flex-direction: column;
	
}
/* products body */
.productBody {
	display: flex;
	min-height: 100vh; /* 최소 높이를 100vh로 설정 */
}

/* 사이드 메뉴 */
.productsMenus {
	display: flex;
	flex-direction: column;
	background-color: #F5F5DC;
	margin-right: 20px;
	margin-left: 5px;
	padding: 3px;
	position: relative; /* 하위 메뉴의 위치를 올바르게 참조 */
	z-index: 0; /* 전체 레이아웃에서 기본 z-index */
	height: 300px;
}

.productsMenu {
	width: 150px; /* 상위 메뉴의 너비 */
	height: 50px;
	background-color: #8B0000;
	margin-bottom: 3px;
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
	font-weight: bold;
	color: white;
}

.productsMenu:hover {
	background-color: #F5F5DC;
}

.innercontant {
	margin-left: 30px;
}
</style>
</head>
<body>
	<jsp:include page="../Common/Header2.jsp" />


	<!-- 홍보용 이미지 -->
	<div class="aboutPromotion" align="center">
		<img width="100%" height="200px" alt="홍보용 이미지"
			src="../resources/imgs/aboutus.png">
	</div>


	<br>
	<div class="productBody">
		<!-- 사이드 메뉴와 제품 리스트 -->
		<div style="display: flex;">
			<div class="productsMenus">
				<div class="productsMenu">
					<a href="Company">회사소개</a>
				</div>
				<div class="productsMenu">
					<a href="History">연혁</a>
				</div>
				<div class="productsMenu">
					<a href="Export">수출사업</a>
				</div>
				<div class="productsMenu">
					<a href="Import">수입사업</a>
				</div>
				<div class="productsMenu">
					<a href="Oem">OEM</a>
				</div>
				<div class="productsMenu">
					<a href="OurBrand">OurBrand</a>
				</div>
			</div>



			<section class="innercontant">
				<br>
				<h1>
					<회사소개>
				</h1>
				<article class="wrap introWrap">

					<img id="" alt="회사소개" src=""> <br> <br>
					<div class="bxComTit">
						<p class="tit">
							주식회사 동서는 공정하고 투명한 거래를 원칙으로 <br>
							<strong>인간중심을 통해 미래가치를 창출, 사회에 공헌</strong>하는 <br>세계적인 종합
							식품회사를 추구합니다.
						</p>
						<p class="txt">1975년에 설립된 주식회사 동서는 정도경영(正道經營)과 합리추구(合理追求)를
							기업이념으로 효율적인 경영활동을 통해 기업가치를 향상시키고 사회에 공헌하는 미래가치를 창출해 왔습니다.</p>
						<p class="txt">포장제품 제조업을 기반으로 사업을 시작한 주식회사 동서는 식자재 유통업, 해외 영업,
							구매대행업으로 사업 영역을 확대해, 끊임없는 신제품 개발과 철저한 품질관리, 고객만족을 위한 서비스향상 등으로
							안정적인 성장을 거듭하고 있습니다.</p>
						<p class="txt">포장사업분야는 1989년 반월공단 내 포장재 생산공장을 완공하여 연포장 등의 식품용
							포장제품을 본격적으로 생산·판매한 이후로 공장건물 증축 및 설비투자 확대 등을 통해 양적, 질적으로 끊임없이 발전해
							나아가고 있습니다.</p>
						<p class="txt">식품사업분야는 1995년 식자재 전문 브랜드인 ”리치스”를 탄생시킨 이후 꾸준한
							품목개발과 엄격한 품질관리를 통해서 국내 식자재 시장에서 주도적인 역할을 하고 있습니다. “리치스 음료”를 비롯해서
							“후르츠 칵테일“, “파인애플” 등 과실 통조림과 유지류, 다류 등 고객의 기호에 맞는 다양한 제품을 판매하고 있으며
							고객만족경영을 목표로 신제품 개발과 프리미엄 제품 출시 등 고객의 니즈를 충족시키고자 꾸준히 노력하고 있습니다.</p>
						<p class="txt">다류 사업분야는 소비자들에게 품질 좋은 다류 제품을 생산, 공급하기 위해 최첨단
							가공설비와 포장설비를 갖추고 2004년도 출발하였으며 세계일류 제품생산을 목표로 전진하고 있습니다.</p>
						<p class="txt">주식회사 동서는 외형적인 성장보다는 내실경영을 추구하여 건전한 재무구조와 경영의
							투명성을 실현하고 있습니다. 앞으로도 주식회사 동서는 급변하는 환경 변화에 적극적이고 탄력적으로 대응하고 진취적이고
							효율적인 경영활동을 통해 기업가치를 한층 더 향상시켜 주주 및 고객 여러분과 함께 발전해 나갈 것입니다.</p>
					</div>
				</article>
			</section>

		</div>
	</div>

	<br>


	<jsp:include page="../Common/Footer.jsp" />



</body>
</html>
