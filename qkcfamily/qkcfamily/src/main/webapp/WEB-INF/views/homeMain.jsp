<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DCX스터디</title>
<style type="text/css">
@font-face {
	font-family: 'Pretendard-Regular';
	src:
		url('https://fastly.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff')
		format('woff');
	font-weight: 400;
	font-style: normal;
}
/* 전체 적용 CSS  */
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
	height: 100%;
	adding-bottom: 100px; /* 푸터 높이만큼 아래쪽에 공간을 추가 */
	display: flex;
	flex-direction: column; /* 수직 방향으로 정렬 */
}

/* 메인페이지 홍보 영상 부분 CSS */
iframe {
	width: 95%;
	height: 100%;
	min-width: 1150px;
	min-height: 650px;
	justify-content: center;
}

/* 메인페이지 상품 버튼(식료품, 제과, 버섯, 수입) 부분 CSS */
.MainProducts {
	display: flex;
	justify-content: center;
}

.MainProduct {
	position: relative;
	display: inline-block;
	width: 300px;
	height: 100px;
	padding-left: 30px;
	box-sizing: border-box;
	border-top: solid 3px #fff;
	line-height: 82px; /* 텍스트 세로 정렬을 위한 기본 값 */
	font-size: 18px;
	color: #fff;
	font-weight: 300;
	margin-left: -4px;
	overflow: hidden; /* 내용을 넘치는 부분 숨기기 */
	border: solid 2px #F5F5DC; /* 테두리 색상 */
}

.visualThumb {
	position: absolute;
	top: 50%; /* 세로 중앙 정렬 */
	left: 50%; /* 가로 중앙 정렬 */
	transform: translate(-50%, -50%); /* 중앙으로 이동 */
	z-index: 1;
	font-size: 18px;
	color: #fff;
	font-weight: 300;
	cursor: pointer;
	text-align: center; /* 텍스트 가운데 정렬 */
}

.grayBg {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.5); /* 투명도 조정 */
	z-index: 0;
	transition: background 0.3s ease; /* 부드러운 배경 전환 효과 추가 */
}

.MainProduct a {
	position: absolute; /* 링크를 부모 요소를 완전히 덮도록 설정 */
	text-decoration: none;
	color: transparent; /* 링크 텍스트 색상을 투명하게 설정 */
	font-weight: bold;
	padding: 0;
	margin: 0;
	display: block; /* 링크를 전체 버튼으로 만들기 */
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	z-index: 2; /* 이미지와 텍스트 위에 표시되도록 설정 */
}

/* .MainProduct의 hover 스타일 */
.MainProduct:hover {
	background-color: #eb1c24;
}

.MainProduct:hover a {
	color: inherit; /* hover 시 a 태그의 글자색을 원래 색으로 설정 (원할 경우) */
}

.MainProduct:hover .visualThumb {
	color: #fff; /* hover 시 visualThumb의 글자색을 흰색으로 설정 */
}

.MainProduct img {
	width: 100%;
	height: 100%;
	object-fit: cover;
	position: absolute; /* Fix this typo (was 'osition') */
	top: 0;
	left: 0;
}

/* 메인페이지 사업(수출, 수입, OEM제조, 브랜드사업) 부분 CSS */
.MainOthers {
	bottom: 10px;
	width: 100%;
	left: 0;
	position: relative;
	margin: 0 auto 40px;
	margin-left: 5%;
}

.Othersactive {
	position: relative;
	background: #cfc5c4; /* 서브 색상으로 선택한 베이지 계열 */
	padding: 10px 0;
	line-height: 46px; /* 수직 정렬을 위한 라인 높이 */
	display: inline-block; /* 수평으로 나열하기 위해 inline-block 사용 */
	width: calc(( 90% - 50px)/4); /* 전체 너비에서 여백을 빼고 균등 분배 */
	height: 200px;
	margin-right: 0;
	border-radius: 5px; /* 모서리를 둥글게 만들기 */
	opacity: 1;
	vertical-align: top;
	list-style: none; /* 기본 리스트 스타일 제거 */
	text-align: center; /* 텍스트 가운데 정렬 */
}

.Othersactive a {
	color: #fff; /* 링크 색상 */
	text-decoration: none; /* 링크의 밑줄 제거 */
	display: block; /* 링크가 전체 박스를 커버하게 */
	height: 100%; /* 링크가 전체 높이를 차지하도록 설정 */
	line-height: 60px; /* 높이를 키우고 텍스트를 수직 중앙 정렬 */
	font-size: 20px; /* 글자 크기를 키웁니다 */
}

.Othersactive:hover {
	background: #eb1c24; /* 마우스 오버 시 배경색 변경 */
}

/* BEST 상품 슬라이더 */
.slider-section {
	margin-top: 30px;
}

.slider-container {
	position: relative;
	width: 80%;
	max-width: 600px;
	overflow: hidden;
	margin: 0 auto;
}

.slider {
	width: 100%;
	display: flex;
	overflow: hidden;
}

.slides {
	display: flex;
	transition: transform 0.5s ease-in-out;
}

.slide {
	min-width: 100%;
	box-sizing: border-box;
}

.slider-container img {
	width: 100%;
	border-radius: 10px;
}

.slider-container button {
	position: absolute;
	top: 50%;
	transform: translateY(-50%);
	background-color: rgba(0, 0, 0, 0.5);
	color: white;
	border: none;
	padding: 10px;
	cursor: pointer;
	font-size: 18px;
}

.slider-container button.prev {
	left: 10px;
}

.slider-container button.next {
	right: 10px;
}

/* 모달 스타일 */
.modal {
	display: none;
	position: fixed;
	background-color: rgba(255, 255, 255, 0.9);
	border: 1px solid #ccc;
	z-index: 1000;
	overflow: hidden;
	padding: 10px;
	/* 기본 크기는 이미지 비율에 맞춰 조정되지만, 최대 크기를 지정 */
	max-width: 500px; /* 최대 너비 */
	max-height: 500px; /* 최대 높이 */
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* 그림자 효과 */
}

/* 팝업 이미지 스타일 */
.modal img {
	width: auto;
	height: auto;
	max-width: 100%; /* 모달 창의 최대 너비 */
	max-height: 100%; /* 모달 창의 최대 높이 */
	object-fit: contain; /* 비율을 유지하면서 크기 조정 */
}

/* 닫기 버튼 스타일 */
.close {
	position: absolute;
	top: 5px;
	right: 5px;
	width: 25px;
	height: 25px;
	background-color: #f44336;
	color: white;
	text-align: center;
	line-height: 20px;
	border-radius: 50%;
	cursor: pointer;
}
</style>
</head>


<body>
	<jsp:include page="Common/Header.jsp" />



	<br>
	<br>
	<br>

	<!-- 팝업 창 -->
	<c:if test="${not empty popupList}">
		<c:forEach var="popup" items="${popupList}" varStatus="status">
			<div id="popupModal_${status.index}" class="modal"
				style="top:${status.index * 50}px; left:${status.index * 50}px;">
				<span class="close">&times;</span> <img
					id="popup_img_${status.index}" src="${popup.pop_img}" alt="팝업 이미지">
			</div>
		</c:forEach>
	</c:if>

	<!-- 메인페이지 홍보 영상 코딩 -->
	<div class="MainPromotion" align="center">
		<!-- 아무영상이나 퍼가기로 연습해본 예시  -->
		<iframe width="768" height="432"
			src="https://www.youtube.com/embed/Ql-U70qBjE0?si=ReVHxVKqvStKv0So"
			title="YouTube video player" frameborder="0"
			allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
			referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
	</div>

	<br>
	<br>
	<!-- 메인화면에서 상품을 눌러 페이지로 갈 수 있는 박스(추후 버튼으로 바꿀 예정) -->
	<div class='MainProducts' align="center"
		style="display: flex; justify-content: center">

		<div class="MainProduct active-nav">
			<p class="visualThumb">식료품</p>
			<a href="Products/Groceries"></a> <img alt="식료품"
				src="resources/imgs/product3.png"> <span class="grayBg"></span>
		</div>
		<div class="MainProduct active-nav">
			<p class="visualThumb">제과</p>
			<a href="Products/Snack"></a> <img alt="제과"
				src="resources/imgs/product1.png"> <span class="grayBg"></span>
		</div>
		<div class="MainProduct active-nav">
			<p class="visualThumb">버섯</p>
			<a href="Products/Mushroom"></a> <img alt="버섯"
				src="resources/imgs/product2.png"> <span class="grayBg"></span>
		</div>
		<div class="MainProduct active-nav">
			<p class="visualThumb">수입제품</p>
			<a href="ImportBusiness/Product"></a> <img alt="수입제품"
				src="resources/imgs/product4.png"> <span class="grayBg"></span>
		</div>

	</div>

	<br>
	<br>
	<!-- 사업영역 구분 -->
	<div>
		<h1 align="center">사업영역</h1>
	</div>

	<br>
	<br>

	<!-- 메인화면에서 수출,수입, OEM제조, 브랜드 사업으로 갈 수 있는 박스(추후 버튼으로 바꿀 예정) -->
	<div class="MainOthers">
		<ul>
			<li class="Othersactive"><a href="AboutUs/Export" class="click">수출
					사업</a></li>
			<li class="Othersactive"><a href="AboutUs/Import" class="click">수입
					사업</a></li>
			<li class="Othersactive"><a href="AboutUs/Oem" class="click">OEM제조</a></li>
			<li class="Othersactive"><a href="AboutUs/OurBrand"
				class="click">브랜드사업</a></li>
		</ul>
	</div>

	<br>
	<br>

	<!-- BEST 구간 -->
	<div>
		<h1 align="center">BEST</h1>
	</div>

	<br>
	<br>
	<!-- BEST 상품 슬라이더(캐러셀) -->
	<div class="slider-section">
		<!-- 슬라이더가 적용될 영역 -->
		<div class="slider-container">
			<button class="prev">◀</button>
			<div class="slider">
				<div class="slides">
				<c:forEach items="${bestList}" var="bestPrduct" varStatus="status">
				<div class="slide">
						<img src="${bestPrduct.pd_img}" alt="Product ${status.index + 1}">
				</div>
				</c:forEach>
				</div>
			</div>
			<button class="next">▶</button>
		</div>
	</div>

	<br>
	<br>
	<br>
	<br>


	<jsp:include page="Common/Footer.jsp" />


	<!-- Best 상품 슬라이더 관련 JavaScript 코드를 JSP 파일 내에 직접 포함 -->
	<script>
   document.addEventListener("DOMContentLoaded", function () {
        const slidesContainer = document.querySelector('.slider .slides');  // '.slider .slides'를 정확히 선택
        const slides = document.querySelectorAll('.slider .slide');
        const prevBtn = document.querySelector('.prev');
        const nextBtn = document.querySelector('.next');

        let currentIndex = 0;
        const totalSlides = slides.length;

        // 다음 버튼 클릭 이벤트
        nextBtn.addEventListener('click', () => {
            currentIndex = (currentIndex + 1) % totalSlides; // 마지막 슬라이드에서 첫 슬라이드로 순환
            updateSlidePosition();
        });

        // 이전 버튼 클릭 이벤트
        prevBtn.addEventListener('click', () => {
            currentIndex = (currentIndex - 1 + totalSlides) % totalSlides; // 첫 슬라이드에서 마지막 슬라이드로 순환
            updateSlidePosition();
        });

        // 슬라이드 위치 업데이트 함수
        function updateSlidePosition() {
            slidesContainer.style.transform = `translateX(-${currentIndex * 100}%)`; // 현재 인덱스에 따라 슬라이드 이동
        }
    });
    
    </script>

	<script>
	window.onload = function() {
	    // 모든 팝업을 가져와 각각 열리도록 설정
	    document.querySelectorAll(".modal").forEach(function(popup, index) {
	        const img = popup.querySelector("img");

	        // 이미지 로드 완료 후 모달 창 크기를 조정
	        img.onload = function() {
	            console.log('이미지 로드 완료:', img.src);
	            adjustModalSize(popup, img);
	            popup.style.display = "block";
	        };

	        // 이미 로드된 이미지 처리 (캐시된 이미지일 경우)
	        if (img.complete) {
	            console.log('이미지 이미 로드됨:', img.src);
	            adjustModalSize(popup, img);
	            popup.style.display = "block";
	        }

	        // 팝업 드래그 기능 추가
	        makeDraggable(popup);
	    });

	    // 모든 닫기 버튼을 가져와 클릭 시 해당 팝업 닫기
	    document.querySelectorAll(".close").forEach(function(closeBtn, index) {
	        closeBtn.onclick = function() {
	            document.querySelectorAll(".modal")[index].style.display = "none";
	        };
	    });

	    // 모달 창 크기를 이미지 크기에 맞게 조정하는 함수
	    function adjustModalSize(popup, img) {
	        // 최대 크기 500px에 맞추어 크기를 조정
	        const maxWidth = 500;
	        const maxHeight = 500;

	        // 이미지의 실제 크기
	        const imgWidth = img.naturalWidth;
	        const imgHeight = img.naturalHeight;

	        console.log('이미지 크기:', imgWidth, imgHeight);

	        // 비율에 맞춰 크기 조정
	        const scale = Math.min(maxWidth / imgWidth, maxHeight / imgHeight);

	        // 모달 창 크기를 이미지 크기에 맞춰 조정
	        popup.style.width = imgWidth * scale + 'px';
	        popup.style.height = imgHeight * scale + 'px';
	    }

	    // 팝업을 드래그할 수 있게 설정하는 함수
	    function makeDraggable(popup) {
	        let shiftX, shiftY;

	        popup.onmousedown = function(e) {
	            e.preventDefault();

	            shiftX = e.clientX - popup.getBoundingClientRect().left;
	            shiftY = e.clientY - popup.getBoundingClientRect().top;

	            document.onmousemove = function(e) {
	                moveAt(e.pageX, e.pageY);
	            };

	            function moveAt(pageX, pageY) {
	                popup.style.left = pageX - shiftX + 'px';
	                popup.style.top = pageY - shiftY + 'px';
	            }

	            document.onmouseup = function() {
	                document.onmousemove = null;
	                document.onmouseup = null;
	            };
	        };

	        popup.ondragstart = function() {
	            return false;
	        };
	    }
	};
	
	
	let autoPlay = setInterval(() => {
	    nextBtn.click(); // 다음 버튼을 자동 클릭
	}, 3000); // 3초마다 자동 이동

	// 마우스를 올리면 자동 재생 중지
	document.querySelector('.slider-container').addEventListener('mouseenter', () => {
	    clearInterval(autoPlay);
	});

	// 마우스를 치우면 자동 재생 재개
	document.querySelector('.slider-container').addEventListener('mouseleave', () => {
	    autoPlay = setInterval(() => {
	        nextBtn.click();
	    }, 3000);
	});


</script>



</body>
</html>
