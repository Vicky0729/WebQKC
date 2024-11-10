<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뉴스생성 양식</title>
</head>
<body>
<h2>새 뉴스 작성</h2>
<form action="NewsForm/1" method="post">
    <label for="title">제목:</label>
    <input type="text" id="title" name="news_title" required><br/>

    <label for="content">내용:</label>
    <textarea id="content" name="news_content" required></textarea><br/>

    <label for="imagePath">이미지 경로 (선택):</label>
    <input type="text" id="imagePath" name="news_img"><br/>

    <button type="submit">저장</button>
</form>
</body>
</html>