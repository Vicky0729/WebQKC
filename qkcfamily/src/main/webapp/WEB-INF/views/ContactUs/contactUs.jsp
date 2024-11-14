<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>contactUs</title>
<!-- Font Awesome 추가 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
	integrity="sha384-k6RqeWeci5ZR/Lv4MR0sA0FfDOMqDkw5Q3YhvmS5w5x5lIvG5IymE+o4u2zpTG15"
	crossorigin="anonymous">
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
	min-height: 100vh;
	align-items: center; /* 전체 가운데 정렬 */
}

/* 구글 맵 및 회사 소개 CSS */
.map-container {
	display: flex;
	justify-content: center;
	gap: 20px;
	width: 90%;
	max-width: 1000px;
	margin-top: 20px;
	min-height: 100vh; /* 최소 높이를 100vh로 설정 */
}

/* 맵 크기 및 박스 스타일 */
#map {
	height: 60vh;
	width: 50%;
	max-width: 480px;
	border: 2px solid #ccc;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	border-radius: 8px;
}

/* Contact-Us 섹션 크기와 스타일 */
.Contact-Us {
	height: 60vh; /* 지도와 동일한 높이 */
	width: 50%; /* 지도와 동일한 너비 */
	max-width: 480px;
	padding: 20px;
	background-color: #f9f9f9; /* 밝은 배경색 추가 */
	border: 2px solid #ccc;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	border-radius: 8px;
	font-size: 16px;
	color: #555;
	line-height: 1.6;
	text-align: center; /* 텍스트 가운데 정렬 */
	display: flex;
	flex-direction: column;
	justify-content: center; /* 텍스트를 가운데 정렬 */
	align-items: center; /* 텍스트와 아이콘을 가로로도 가운데 정렬 */
}

.Contact-Us h2 {
	color: #333;
	font-size: 20px;
	margin-bottom: 20px;
}

/* Contact-Us의 아이콘과 텍스트 스타일 */
.Contact-Us p {
	margin: 10px 0;
	font-size: 15px;
	display: flex;
	align-items: center;
	justify-content: center;
	border-bottom: 1px solid #ddd; /* 각 줄에 밑줄 추가 */
	padding-bottom: 8px;
	width: 100%; /* 밑줄이 전체 너비에 걸쳐지도록 설정 */
}

.Contact-Us i {
	margin-right: 8px;
	color: #2980b9; /* 아이콘 색상 */
	font-size: 18px;
}
</style>
</head>
<body>

	<jsp:include page="../Common/Header2.jsp" />

	<!-- 컨택 info -->
	<div class="aboutPromotion" align="center">
		<img width="1392px" height="200px" alt="홍보용 이미지"
			src="../resources/imgs/contact.png">
	</div>
	<br>
	<br>

	<!-- 지도 및 회사 소개 섹션 -->
	<h1>회사 찾아오시는 길</h1>
	<div class="address">서울특별시 성동구 아차산로15길 52</div>

	<div class="map-container">
		<!-- 구글 지도 -->
		<div id="map"></div>

		<!-- 회사 소개 섹션 -->
		<div class="Contact-Us">
			<h2>Contact Us</h2>
			<p>
				<i class="fas fa-map-marker-alt"></i>🏠 123 Anywhere St., Any City,
				ST 12345
			</p>
			<p>
				<i class="fas fa-phone-alt"></i>📞 123-456-7890
			</p>
			<p>
				<i class="fas fa-envelope"></i>📧 hello@reallygreatsite.com
			</p>
			<p>
				<i class="fas fa-globe"></i>🌐 www.reallygreatsite.com
			</p>
		</div>
	</div>

	<script>
		// 지도 초기화 함수
		function initMap() {
			const location = {
				lat : 37.548339,
				lng : 127.064182
			};
			const map = new google.maps.Map(document.getElementById("map"), {
				zoom : 16,
				center : location,
			});
			const image = ""; // 마커 이미지 URL 설정 가능
			const marker = new google.maps.Marker({
				position : location,
				map : map,
				icon : image,
			});
		}
	</script>

	<!-- Google Maps JavaScript API 로드 -->
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCkMKSuFICn4ZYgCu-u50vBYzXmLSj8Tuo&callback=initMap">
		
	</script>

	<br>

	<jsp:include page="../Common/Footer.jsp" />

</body>
</html>
