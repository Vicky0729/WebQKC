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
			<label for="productImage">제품 이미지</label>
			<input type="file" id="productImage" name="pd_img" accept="image/*"
				style="display: none;" onchange="previewImage(event)"> <img
				id="preview" alt="이미지 미리 보기">
				<div id="dropZone">여기에 이미지를 드롭하거나 클릭하여 업로드하세요</div>
		</div>
		<div id="root"></div>

		<div class="form-group">
			<label for="productName">제품명</label> <input type="text"
				id="productName" name="pd_name" required>
		</div>

		<div class="form-group">
			<label for="productPrice">가격</label> <input type="number"
				id="productPrice" name="price" required>
		</div>

		<div class="form-group">
			<label for="category">카테고리</label> <select id="category"
				name="category" required>
				<option value="">카테고리 선택</option>
				<option value="버섯류">버섯류</option>
				<option value="제과">제과</option>
				<option value="식료품">식료품</option>
				<option value="수입품">수입품</option>
				<option value="기타">기타</option>
			</select>
		</div>

		<div class="form-group">
			<label for="category">세부카테고리</label> <select id="category_d"
				name="category_d" required>
				<option value="">카테고리 선택</option>
				<option value="버섯">버섯</option>
				<option value="상온">상온</option>
				<option value="냉동">냉동</option>
				<option value="냉장">냉장</option>
				<option value="쿠키류">쿠키류</option>
				<option value="스낵류">스낵류</option>
				<option value="비스켓">비스켓</option>
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
			onclick="window.location.href='Content'">취소</button>
	</form>










	<script type="text/javascript">
	const dropZone = document.getElementById('dropZone');
    const productImageInput = document.getElementById('productImage');
    const preview = document.getElementById('preview');

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
            productImageInput.files = event.dataTransfer.files;
            previewImage({ target: { files: [file] } });
        }
    });

    // 이미지 미리보기
    function previewImage(event) {
        const reader = new FileReader();

        reader.onload = function() {
            preview.src = reader.result;
            preview.style.display = 'block';
        };

        reader.readAsDataURL(event.target.files[0]);
    }
    
    

		document.getElementById("category").addEventListener("change",
				function() {
					const category = this.value;
					const category_d = document.getElementById("category_d");

					// 모든 옵션 초기화
					category_d.innerHTML = '<option value="">카테고리 선택</option>';

					// 카테고리별 옵션 설정
					let options = [];

					switch (category) {
					case "버섯류":
						options = [ "버섯" ];
						break;
					case "제과":
						options = [ "쿠키류", "스낵류", "비스켓" ];
						break;
					case "식료품":
						options = [ "상온", "냉동", "냉장" ];
						break;
					case "수입품":
						options = [ "수입품" ];
						break;
					case "기타":
						options = [ "기타" ];
						break;
					}

					// 동적으로 옵션 추가
					options.forEach(function(option) {
						const newOption = document.createElement("option");
						newOption.value = option;
						newOption.text = option;
						category_d.appendChild(newOption);
					});
				});
		
		
	</script>
</body>
</html>