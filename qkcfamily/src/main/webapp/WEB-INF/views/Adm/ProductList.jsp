<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>제품 관리</title>
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

input[type="text"], input[type="number"], input[type="file"] {
	width: 100%;
	padding: 10px;
	margin-bottom: 20px;
	border: 1px solid #ddd;
	border-radius: 4px;
	box-sizing: border-box;
}

textarea {
	width: 100%; /* 부모 요소에 맞춰 가로 크기를 조정 */
	max-width: 800px; /* 최대 가로 크기 제한 */
	min-width: 300px; /* 최소 가로 크기 설정 */
	border: 1px solid #ddd;
	border-radius: 4px;
	resize: both; /* 사용자가 크기를 조정할 수 있도록 설정 */
	box-sizing: border-box; /* 패딩과 보더 포함한 크기 계산 */
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
	<h2>제품 수정</h2>

	<!-- 새로운 제품 추가하는 곳입니다 -->


	<!-- 제품 목록 테이블 -->
	<form action="updateProduct" method="post">
		<div class="form-group">
			<label for="currentImage">현재 이미지</label><br> <img
				id="currentImagePreview" src="${productOne.pd_img}" alt="현재 이미지"
				style="max-width: 200px; max-height: 200px;">
		</div>

		<!-- 새 이미지 업로드 -->
		<div class="form-group">
			<label for="productImage">새 이미지 선택</label>
			<div id="dropZone">여기에 이미지를 드롭하거나 클릭하여 업로드하세요</div>
			<input type="file" id="pd_img" name="pd_img" accept="image/*"
				style="display: none;" onchange="previewImage(event)">
			<div id="root"></div>
		</div>

		<div class="form-group">
			<label for="productName">제품명</label> <input type="text"
				id="productName" name="pd_name" value="${productOne.pd_name}"
				required>
		</div>

		<div class="form-group">
			<label for="productPrice">가격</label> <input type="number"
				id="productPrice" name="price" value="${productOne.price}" required>
		</div>


		<div class="form-group">
			<label for="productStock">spec_carton</label> <input type="text"
				id="productStock" name="spec_carton"
				value="${productOne.spec_carton}">
		</div>

		<div class="form-group">
			<label for="productStock">load_qty</label> <input type="text"
				id="productStock" name="load_qty" value="${productOne.load_qty}">
		</div>
		<div class="form-group">
			<label for="productStock">저장기간</label> <input type="text"
				id="productStock" name="shelf_life" value="${productOne.shelf_life}">
		</div>

		<div class="form-group">
			<label for="content">콘텐츠 내용</label>
			<textarea id="content" name="pd_content" rows="10" required>${productOne.pd_content}</textarea>
		</div>

		<input type="hidden" name="pd_idx" value="${productOne.pd_idx}">
		<input type="submit" class="btn" value="제품 수정">
		<button type="button" class="btn btn-cancel"
			onclick="window.location.href='Content'">취소</button>
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
	const productImageInput = document.getElementById('pd_img');

	// 드롭존 클릭 시 파일 선택 트리거
	dropZone.addEventListener('click', () => productImageInput.click());

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
	        productImageInput.files = event.dataTransfer.files; // 파일 입력 설정
	        previewImage({ target: { files: [file] } });
	    }
	});
	</script>
</body>
</html>