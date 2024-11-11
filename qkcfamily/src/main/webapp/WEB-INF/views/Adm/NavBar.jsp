<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>상단바 수정</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f7f8fa;
        color: #333;
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    h2 {
        color: #333;
        font-size: 24px;
        font-weight: bold;
        margin-bottom: 20px;
    }

    /* 상단바 버튼 스타일 */
    ul {
        display: flex;
        gap: 10px;
        list-style: none;
        padding: 0;
        margin-bottom: 20px;
    }

    button {
        background-color: #007BFF;
        color: #fff;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s;
        font-size: 16px;
    }

    button:hover {
        background-color: #0056b3;
    }

    /* 콘텐츠 영역 스타일 */
    #contentArea {
        background-color: #fff;
        border: 1px solid #ddd;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        width: 80%;
        max-width: 900px;
    }

    #contentArea p {
        color: #666;
    }

    /* 테이블 스타일 */
    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }

    th, td {
        padding: 12px 15px;
        text-align: center;
        border-bottom: 1px solid #ddd;
        font-size: 14px;
    }

    th {
        background-color: #f4f4f4;
        color: #333;
        font-weight: bold;
    }

    tr:nth-child(even) {
        background-color: #f9f9f9;
    }

    img {
        border-radius: 5px;
    }

    /* 수정 및 삭제 버튼 스타일 */
    .edit-btn, .delete-btn {
        padding: 8px 12px;
        border: none;
        border-radius: 5px;
        color: #fff;
        cursor: pointer;
        font-size: 14px;
    }

    .edit-btn {
        background-color: #28a745;
    }

    .edit-btn:hover {
        background-color: #218838;
    }

    .delete-btn {
        background-color: #dc3545;
    }

    .delete-btn:hover {
        background-color: #c82333;
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
                            <button type="submit" class="edit-btn" style="background-color: #007BFF; font-size: 16px;">뉴스 추가</button>
                        </form>
                        <table>
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
                                "<td><button class='edit-btn' onclick='editNews(" + news.news_idx + ")'>수정</button></td>" +
                                "<td>" +
                                    "<form action='" + contextPath + "/Adm/deleteNews/" + news.news_idx + "' method='post' onsubmit='return confirmDelete();'>" +
                                        "<button type='submit' class='delete-btn'>삭제</button>" +
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
