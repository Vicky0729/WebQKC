<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>상단바 수정</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
#contentArea {
	border: 1px solid #ddd;
	padding: 20px;
	margin-top: 20px;
	width: 100%;
}

button {
	margin: 5px;
	padding: 10px;
	cursor: pointer;
}
</style>
</head>
<body>

	<h2>상단바 수정</h2>

	<!-- 고정된 상단바 리스트 -->
	<ul>
		<button onclick="showSection('about')">About Us</button>
		<button onclick="showSection('products')">Products</button>
		<button onclick="showNews('news')">News</button>
		<button onclick="showSection('import')">Import Business</button>
		<button onclick="showSection('contact')">Contact Us</button>
	</ul>

	<div id="contentArea">
		<p>이곳에 선택된 섹션 내용이 로드됩니다.</p>
	</div>

	<script>
        const contextPath = "${pageContext.request.contextPath}";

        function showSection(section) {
            if (!section) {
                $("#contentArea").html("<p>리스트에서 항목을 선택하세요.</p>");
                return;
            }

            $.ajax({
                url: contextPath + "/api/nav/" + section, // API 호출
                method: "GET",
                success: function(response) {
                	console.log(response);
                    $("#contentArea").html(response); // 응답 결과 삽입
                },
                error: function() {
                    alert(section + " 페이지를 불러오는 데 실패했습니다.");
                }
            });
        }
        function showNews() {
            $.ajax({
                url: contextPath + "/api/nav/news", // JSON 반환
                method: "GET",
                success: function(response) {
                	console.log(response);
                	
                	
                    let tableContent = `
                    	<form action="NewsForm" method="get">
                        <button type="submit">뉴스 추가</button>
                    </form>
                        <table border="1">
                            <thead>
                                <tr>
                                    <th>제목</th>
                                    <th>내용</th>
                                    <th>이미지</th>
                                    <th>작성일</th>
                                    <th>수정</th>
                                    <th>삭제</th>
                                </tr>
                            </thead>
                            <tbody>
                    `;

                    response.forEach(function(news) {
                    	tableContent +=
                    	    "<tr>" +
                    	        "<td>" + news.news_title + "</td>" +
                    	        "<td>" + news.news_content + "</td>" +
                    	        "<td><img src='" + news.news_img + "' alt='이미지' width='50'></td>" +
                    	        "<td>" + news.created_at + "</td>" +
                    	        "<td><button onclick='editNews(" + news.news_idx + ")'>수정</button></td>" +
                    	        "<td>" +
                    	            "<form action='" + contextPath + "/Adm/deleteNews/" + news.news_idx + "' method='post' onsubmit='return confirmDelete();'>" +
                    	                "<button type='submit'>삭제</button>" +
                    	            "</form>" +
                    	        "</td>" +
                    	    "</tr>";

                     });

                    tableContent += `</tbody></table>`;
                    $("#contentArea").html(tableContent);
                },
                error: function() {
                    alert("뉴스 데이터를 불러오는 데 실패했습니다.");
                }
            });
        }
        
        
     // 수정 버튼 클릭 시 호출되는 함수
        function editNews(newsId) {
            window.location.href = "UpNewsForm/" + newsId; // 수정 페이지로 이동 (newsId에 맞춰서 이동)
        }

        function confirmDelete() {
            return confirm("정말로 삭제하시겠습니까?");
        }
    </script>

</body>
</html>
