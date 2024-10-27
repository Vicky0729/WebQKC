<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>footer</title>
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



/* Footer 부분 CSS */
footer {
	background-color: #8B0000; /* 진한 붉은색 */
	padding: 20px;
	text-align: center;
	color: white;
	border-top: solid 3px #F5F5DC; /* 푸터 상단 테두리 */

}
.footer-content {
	padding: 20px; /* 내부 여백 */
    bottom: 0; /* 하단에 고정 */
    left: 0; /* 좌측 정렬 */
    width: 100%; /* 전체 너비 */

}

#footer-content p {
	margin: 10px 0;
	font-size: 14px;
}
</style>
</head>
<body>
<footer class="footer-content">
		<div id="footer-content">
			<p>㈜큐케이씨 | 서울특별시 성동구 아차산로 15길 52 삼환디지털벤처타워 905호</p>
			<p>대표 : 김새한 | Tel: 070-4352-2800 | Fax: 070-8673-2808</p>
			<p>사업자등록번호: 214-87-64337 | COPYRIGHTⓒQuali Korea Corp. ALL RIGHTS RESERVED.</p>
		</div>
	</footer>
</body>
</html>