<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>뉴스 생성 양식</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f7f8fa;
        color: #333;
        display: flex;
        flex-direction: column;
        align-items: center;
        padding: 20px;
    }

    h2 {
        font-size: 24px;
        color: #333;
        font-weight: bold;
        margin-bottom: 20px;
    }

    form {
        background-color: #fff;
        padding: 20px;
        border: 1px solid #ddd;
        border-radius: 8px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        width: 100%;
        max-width: 600px;
    }

    label {
        font-weight: bold;
        margin-top: 10px;
        display: block;
        color: #555;
    }

    input[type="text"],
    textarea {
        width: 100%;
        padding: 10px;
        margin-top: 5px;
        margin-bottom: 15px;
        border: 1px solid #ddd;
        border-radius: 4px;
        font-size: 14px;
        box-sizing: border-box;
    }

    textarea {
        resize: vertical;
        min-height: 100px;
    }

    .btn-container {
        display: flex;
        justify-content: space-between;
        gap: 10px;
    }

    button {
        padding: 12px;
        font-size: 16px;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s;
    }

    .btn-submit {
        background-color: #007BFF;
        flex: 1;
    }

    .btn-submit:hover {
        background-color: #0056b3;
    }

    .btn-cancel {
        background-color: #9E9E9E;
        flex: 1;
    }

    .btn-cancel:hover {
        background-color: #757575;
    }

    /* 이미지 미리보기와 드롭존 스타일 */
    .image-preview {
        margin-top: 15px;
        width: 100%;
        height: 200px;
        border: 2px dashed #ddd;
        border-radius: 5px;
        display: flex;
        align-items: center;
        justify-content: center;
        color: #aaa;
        font-size: 16px;
        cursor: pointer;
        background-color: #f9f9f9;
    }

    .image-preview img {
        max-width: 100%;
        max-height: 100%;
        border-radius: 5px;
    }

    .image-preview.drag-over {
        border-color: #007BFF;
        background-color: #eaf4ff;
    }
</style>
</head>
<body>

<h2>새 뉴스 작성</h2>
<form action="NewsForm/1" method="post" enctype="multipart/form-data">
    <label for="title">제목:</label>
    <input type="text" id="title" name="news_title" required>

    <label for="content">내용:</label>
    <textarea id="content" name="news_content" required></textarea>

    <label for="imagePath">이미지 업로드 (선택):</label>
    <input type="file" id="imageUpload" name="news_img" accept="image/*" style="display:none;">
    
    <div class="image-preview" id="imagePreview" onclick="document.getElementById('imageUpload').click()">
        이미지 파일을 드래그하거나 클릭하여 업로드하세요.
    </div>

    <div class="btn-container">
        <button type="submit" class="btn-submit">저장</button>
        <button type="button" class="btn-cancel" onclick="history.back()">취소</button>
    </div>
</form>

<script>
    const imageUpload = document.getElementById('imageUpload');
    const imagePreview = document.getElementById('imagePreview');

    imageUpload.addEventListener('change', handleFileSelect);
    imagePreview.addEventListener('dragover', handleDragOver);
    imagePreview.addEventListener('dragleave', handleDragLeave);
    imagePreview.addEventListener('drop', handleFileDrop);

    function handleFileSelect(event) {
        const file = event.target.files[0];
        if (file) {
            displayImagePreview(file);
        }
    }

    function handleDragOver(event) {
        event.preventDefault();
        imagePreview.classList.add('drag-over');
    }

    function handleDragLeave(event) {
        event.preventDefault();
        imagePreview.classList.remove('drag-over');
    }

    function handleFileDrop(event) {
        event.preventDefault();
        imagePreview.classList.remove('drag-over');
        const file = event.dataTransfer.files[0];
        if (file) {
            displayImagePreview(file);
        }
    }

    function displayImagePreview(file) {
        const reader = new FileReader();
        reader.onload = function(e) {
            imagePreview.innerHTML = '<img src="' + e.target.result + '" alt="Image Preview">';
        }
        reader.readAsDataURL(file);
    }
</script>

</body>
</html>
