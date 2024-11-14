<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>News - Card View</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">
<style>
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

h1 {
	 margin-top: 20px;
	 margin-left: 70px;
}

.news-container {
	display: grid;
	grid-template-columns: repeat(3, minmax(0, 1fr)); /* 3열 고정 */
	gap: 20px; /* 카드 간의 간격 */
	padding: 20px;
	margin-left: 50px;
}

.news-card {
	border: 1px solid #ddd;
	border-radius: 8px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	max-width: 400px;
	height: 450px;
	overflow: hidden;
	transition: 0.3s;
}

.news-card:hover {
	transform: translateY(-5px);
	box-shadow: 0 8px 12px rgba(0, 0, 0, 0.2);
}

.news-image {
	width: 100%;
	height: 200px;
	object-fit: cover;
}

.news-content {
	padding: 15px;
	font-size: 1em;
}

.news-title {
	font-size: 1.8em;
	margin-bottom: 10px;
}

.news-summary {
	color: #555;
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	-webkit-line-clamp: 2; /* 본문 요약 2줄 제한 */
	-webkit-box-orient: vertical;
}

.news-date {
	font-size: 0.9em;
	color: #888;
	margin-bottom: 10px;
}

.read-more {
	color: #007BFF;
	text-decoration: none;
	font-weight: bold;
}

.read-more:hover {
	text-decoration: underline;
}

.pagination {
	display: flex;
	margin-top: 20px;
	justify-content: center;
}

.pagination a {
	color: black;
	float: left;
	padding: 8px 16px;
	text-decoration: none;
	transition: background-color .3s;
}

.pagination a.active {
	background-color: #8B0000;
	color: white;
	border-radius: 5px;
}

.pagination a:hover:not(.active) {
	background-color: #ddd;
	border-radius: 5px;
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


	<h1> 최신 뉴스 </h1>
	<div class="news-container">
		<c:forEach var="news" items="${newsList}">
			<div class="news-card">
				<img src="${news.news_img}" alt="News Image" class="news-image">
				<div class="news-content">
					<h3 class="news-title">${news.news_title}</h3>
					<p class="news-summary">${fn:substring(news.news_content, 0, 100)}...</p>
					<p class="news-date">등록일: ${news.created_at}</p>
					<a
						href="${pageContext.request.contextPath}/news/detail/${news.news_idx}"
						class="read-more">자세히보기</a>
				</div>
			</div>
		</c:forEach>
	</div>
	
	<!-- Pagination -->
	<div class="pagination">
		<c:if test="${currentPage > 1}">
			<a href="?page=${currentPage - 1}">&laquo; Prev</a>
		</c:if>
		<c:forEach begin="1" end="${totalPages}" var="pageNum">
			<a href="?page=${pageNum}"
				class="${pageNum == currentPage ? 'active' : ''}">${pageNum}</a>
		</c:forEach>
		<c:if test="${currentPage < totalPages}">
			<a href="?page=${currentPage + 1}">Next &raquo;</a>
		</c:if>
	</div>
	<br>
	<br>
	<br>
	
	
	<jsp:include page="../Common/Footer.jsp" />

</body>
</html>
