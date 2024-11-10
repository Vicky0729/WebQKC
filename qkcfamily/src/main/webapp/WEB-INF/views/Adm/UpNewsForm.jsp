<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>뉴스 수정</title>
<style>
body {
    font-family: 'Arial', sans-serif;
    margin: 20px;
}

h2 {
    font-size: 24px;
    font-weight: bold;
}

table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}

table, th, td {
    border: 1px solid #ddd;
    padding: 10px;
    text-align: left;
}

th {
    background-color: #f4f4f4;
}

td {
    text-align: center;
}

.btn {
    padding: 5px 10px;
    background-color: #4CAF50;
    color: white;
    border: none;
    cursor: pointer;
    border-radius: 5px;
}

.btn:hover {
    background-color: #45a049;
}

.btn-delete {
    background-color: #f44336;
}

.btn-delete:hover {
    background-color: #e53935;
}

.btn-add {
    background-color: #2196F3;
    margin-bottom: 20px;
}

.btn-add:hover {
    background-color: #1976D2;
}

label {
    display: block;
    margin: 10px 0 5px;
    font-weight: bold;
}

input[type="text"], input[type="file"] {
    width: 100%;
    padding: 10px;
    margin-bottom: 20px;
    border: 1px solid #ddd;
    border-radius: 4px;
    box-sizing: border-box;
}

textarea {
    width: 100%;
    max-width: 800px;
    min-width: 300px;
    border: 1px solid #ddd;
    border-radius: 4px;
    resize: both;
    box-sizing: border-box;
}

#dropZone {
    width: 100%;
    padding: 20px;
    border: 2px dashed #4CAF50;
    border-radius: 5px;
    text-align: center;
    color: #aaa;
    margin-bottom: 20px;
    cursor: pointer;
}

#dropZone.dragover {
    background-color: #e0f7e9;
    color: #4CAF50;
}
</style>
</head>
<body>
    <h2>뉴스 수정</h2>

    <!-- 뉴스 수정 폼 -->
    <form action="${pageContext.request.contextPath}/Adm/updateNews" method="post">
        <div class="form-group">
            <label for="currentImage">현재 이미지</label><br> 
            <img id="currentImagePreview" src="${newsOne.news_img}" alt="현재 이미지" style="max-width: 200px; max-height: 200px;">
        </div>

        <!-- 새 이미지 업로드 -->
        <div class="form-group">
            <label for="newsImage">새 이미지 선택</label>
            <div id="dropZone">여기에 이미지를 드롭하거나 클릭하여 업로드하세요</div>
            <input type="file" id="news_img" name="news_img" accept="image/*" style="display: none;" onchange="previewImage(event)">
        </div>

        <div class="form-group">
            <label for="newsTitle">뉴스 제목</label> 
            <input type="text" id="newsTitle" name="news_title" value="${newsOne.news_title}" required>
        </div>

        <div class="form-group">
            <label for="newsContent">뉴스 내용</label>
            <textarea id="newsContent" name="news_content" rows="10" required>${newsOne.news_content}</textarea>
        </div>

        <input type="hidden" name="news_idx" value="${newsOne.news_idx}">
        <input type="submit" class="btn" value="뉴스 수정">
        <button type="button" class="btn btn-cancel" onclick="history.back()">취소</button>
    </form>

    <script>
    // 이미지 미리보기 함수
    function previewImage(event) {
        const reader = new FileReader();
        reader.onload = function () {
            const output = document.getElementById('currentImagePreview');
            output.src = reader.result;
        };
        reader.readAsDataURL(event.target.files[0]);
    }

    const dropZone = document.getElementById('dropZone');
    const newsImageInput = document.getElementById('news_img');

    // 드롭존 클릭 시 파일 선택 트리거
    dropZone.addEventListener('click', () => newsImageInput.click());

    // 드래그 앤 드롭 이벤트 핸들러
    dropZone.addEventListener('dragover', (event) => {
        event.preventDefault();
        dropZone.classList.add('dragover');
    });

    dropZone.addEventListener('dragleave', () => {
        dropZone.classList.remove('dragover');
    });

    dropZone.addEventListener('drop', (event) => {
        event.preventDefault();
        dropZone.classList.remove('dragover');

        const file = event.dataTransfer.files[0];
        if (file && file.type.startsWith('image/')) {
            newsImageInput.files = event.dataTransfer.files;
            previewImage({ target: { files: [file] } });
        }
    });
    </script>
</body>
</html>
