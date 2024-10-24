<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
 <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>contactUs</title>
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



/*구글 맵 CSS  */
      /* 전체 페이지 스타일 */
      body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        height: 100vh;
        background-color: #f4f4f9;
      }
      h1 {
        color: #333;
        margin-bottom: 20px;
        font-size: 24px;
      }
      /* 맵 크기 및 박스 스타일 */
      #map {
        height: 60vh;
        width: 90%;
        max-width: 1000px;
        border: 2px solid #ccc;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        border-radius: 8px;
      }
      /* 주소 스타일 */
      .address {
        margin: 20px;
        font-size: 18px;
        color: #555;
      }



</style>
</head>
<body>

	<jsp:include page="../Common/Header2.jsp" />
	

	<!-- 컨택 info-->
	<div class="aboutPromotion" align="center">
		<img width="1392px" height="200px" alt="홍보용 이미지" src="../resources/imgs/contact.png">
	</div>
	<br>
	<br>
	
	<!--구글 지도-->

 <h1>회사 찾아오시는 길</h1>
    <div class="address">
      서울특별시 성동구 아차산로15길 52
    </div>
    <!-- 맵이 표시될 div -->
    <div id="map"></div>

    <script>
      // 지도 초기화 함수
      function initMap() {
        // 지정된 좌표 (서울특별시 성동구 아차산로15길 52)
        const location = { lat: 37.548339, lng: 127.064182 };
        // 지도 객체 생성
        const map = new google.maps.Map(document.getElementById("map"), {
          zoom: 16,
          center: location,
        });
        // 마커 이미지 경로 (원하는 이미지 URL 또는 파일 경로로 대체)
        const image = "";
        	/*  {
          url: "img/logo.png", // 이미지 경로
          scaledSize: new google.maps.Size(50, 50), // 이미지 크기 (가로, 세로)
        }; */

        // 마커 표시 (사용자 지정 이미지)
        const marker = new google.maps.Marker({
          position: location,
          map: map,
          icon: image, // 사용자 정의 이미지 설정
        });
      }
    </script>

    <!-- Google Maps JavaScript API 로드 -->
    <script
      async
      defer
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCkMKSuFICn4ZYgCu-u50vBYzXmLSj8Tuo&callback=initMap">
    </script>

	<br>
	
	<jsp:include page="../Common/Footer.jsp" />
	
</body>
</html>
