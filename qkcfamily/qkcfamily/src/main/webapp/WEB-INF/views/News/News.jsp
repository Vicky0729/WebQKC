<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>News</title>
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
	
}
.newscontant{
	min-height: 100vh; /* 최소 높이를 100vh로 설정 */
}

.newsTitle {
	text-align: center;
	margin-bottom: 20px; /* 제목과 테이블 간 여백 */
	font-size: 24px;
	color: #333;
}

table {
	width: 80%;
	border-collapse: collapse;
	margin-left:auto; 
    margin-right:auto;
}

th, td {
	border: 1px solid #dddddd;
	padding: 8px;
	text-align: center;
}

th {
	background-color: #f2f2f2;
}

tr:nth-child(even) {
	background-color: #f9f9f9;
}

tr:hover {
	background-color: #f1f1f1;
}
</style>
</head>
<body>

	<jsp:include page="../Common/Header2.jsp" />

	<!-- 홍보용 이미지 -->
	<div class="aboutPromotion" align="center">
		<img width="100%" height="200px" alt="홍보용 이미지"
			src="../resources/imgs/news.png">
	</div>

	<br>
	<div class="newscontant">
	<h2 class="newsTitle">뉴스</h2>

	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>1</td>
				<td>첫 번째 뉴스</td>
				<td>김나혜</td>
				<td>2024-10-20</td>
				<td>15</td>
			</tr>
			<tr>
				<td>2</td>
				<td>두 번째 뉴스</td>
				<td>전정훈</td>
				<td>2024-10-22</td>
				<td>30</td>
			</tr>
			<tr>
				<td>3</td>
				<td>세 번째 뉴스</td>
				<td>김예원</td>
				<td>2024-10-21</td>
				<td>25</td>
			</tr>
						<tr>
				<td>1</td>
				<td>네 번째 뉴스</td>
				<td>송근주</td>
				<td>2024-10-22</td>
				<td>25</td>
			</tr>
			<tr>
				<td>2</td>
				<td>다섯 번째 뉴스</td>
				<td>김나혜</td>
				<td>2024-10-20</td>
				<td>35</td>
			</tr>
			<tr>
				<td>3</td>
				<td>여섯 번째 뉴스</td>
				<td>신충용</td>
				<td>2024-10-23</td>
				<td>1</td>
			</tr>
			
		</tbody>
	</table>
</div>

	<br>

	<jsp:include page="../Common/Footer.jsp" />

</body>
</html>