<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>새 제품 추가</title>
<style>
body {
	font-family: 'Arial', sans-serif;
	margin: 20px;
}

h2 {
	font-size: 24px;
	font-weight: bold;
}

form {
	margin-top: 20px;
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

.btn {
	padding: 10px 15px;
	background-color: #4CAF50;
	color: white;
	border: none;
	cursor: pointer;
	border-radius: 5px;
}

.btn:hover {
	background-color: #45a049;
}

.btn-cancel {
	background-color: #f44336;
}

.btn-cancel:hover {
	background-color: #e53935;
}

.form-group {
	margin-bottom: 15px;
}

#preview {
	margin-top: 10px;
	max-width: 300px;
	max-height: 300px;
	display: none; /* 초기엔 숨김 */
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
</style>
</head>
<body>

	<h2>새 제품 추가</h2>

	<form action="insertProduct" method="post">
		<div class="form-group">
			<label for="productImage">제품 이미지</label> <input type="file"
				id="productImage" name="pd_img" accept="image/*"
				onchange="previewImage(event)"> <img id="preview"
				alt="이미지 미리 보기">
		</div>

		<div class="form-group">
			<label for="productName">제품명</label> <input type="text"
				id="productName" name="pd_name" required>
		</div>

		<div class="form-group">
			<label for="productPrice">가격</label> <input type="number"
				id="productPrice" name="price" required>
		</div>
		
		<div class="form-group">
			<label for="category">카테고리</label> <select id="category" name="category_d" required>
				<option value="">카테고리 선택</option>
				<option value="버섯">버섯</option>
				<option value="상온">상온</option>
				<option value="쿠키류">쿠키류</option>
				<option value="스낵류">스낵류</option>
				<option value="냉장">냉장</option>
				<option value="냉동">냉동</option>
				<option value="식료품">식료품</option>
				<option value="수입품">수입품</option>
				<option value="기타">기타</option>
			</select>
		</div>
		<div class="form-group">
			<label for="productStock">spec_carton</label> <input type="text"
				id="productStock" name="spec_carton">
		</div>

		<div class="form-group">
			<label for="productStock">load_qty</label> <input type="text"
				id="productStock" name="load_qty">
		</div>
		<div class="form-group">
			<label for="productStock">저장기간</label> <input type="text"
				id="productStock" name="shelf_life">
		</div>

		<div class="form-group">
			<label for="content">콘텐츠 내용</label>
			<textarea id="content" name="pd_content" rows="10" required></textarea>
		</div>

		<input type="submit" class="btn" value="제품 추가">
		<button type="button" class="btn btn-cancel"
			onclick="window.location.href='productManagement.jsp'">취소</button>
	</form>










	<script type="text/javascript">
		function previewImage(event) {
			const reader = new FileReader();
			const preview = document.getElementById('preview');

			reader.onload = function() {
				preview.src = reader.result;
				preview.style.display = 'block'; // 이미지 표시
			};

			// 선택된 파일 읽기 시작
			reader.readAsDataURL(event.target.files[0]);
		}
	</script>
</body>
</html>