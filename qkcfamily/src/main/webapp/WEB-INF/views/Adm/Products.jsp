<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>새 제품 추가</title>
<style>
    /* 페이지 기본 스타일 */
    body {
        font-family: 'Arial', sans-serif;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        background-color: #f4f4f9;
        color: #333;
    }

    /* 폼 컨테이너 */
    form {
        width: 90%;
        max-width: 600px;
        margin: 20px;
        padding: 20px;
        background-color: #fff;
        border-radius: 8px;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    }

    h2 {
        font-size: 24px;
        font-weight: bold;
        margin-bottom: 10px;
        color: #333;
        text-align: center;
    }

    label {
        display: block;
        margin: 8px 0 4px;
        font-weight: bold;
        font-size: 14px;
        color: #555;
    }

    /* 입력 필드 및 셀렉트 박스 스타일 */
    input[type="text"], input[type="number"], input[type="file"], select, textarea {
        width: 100%;
        padding: 8px 10px;
        margin-top: 4px;
        border: 1px solid #ddd;
        border-radius: 4px;
        font-size: 14px;
        color: #333;
        transition: border-color 0.3s;
        box-sizing: border-box;
    }

    input[type="text"]:focus, input[type="number"]:focus, input[type="file"]:focus, select:focus, textarea:focus {
        border-color: #4CAF50;
        outline: none;
    }

    .form-group {
        margin-bottom: 12px;
    }

    /* 카테고리와 세부카테고리를 줄이기 위한 flex 컨테이너 */
    .category-container {
        display: flex;
        gap: 10px;
    }

    .category-container .form-group {
        flex: 1;
    }

    /* 버튼 스타일 */
    .btn-container {
        display: flex;
        justify-content: space-between;
    }

    .btn {
        flex: 1;
        padding: 8px 0;
        background-color: #4CAF50;
        color: white;
        border: none;
        cursor: pointer;
        border-radius: 4px;
        font-size: 14px;
        transition: background-color 0.3s;
        text-align: center;
        margin-right: 5px;
    }

    .btn:hover {
        background-color: #45a049;
    }

    .btn-cancel {
        background-color: #f44336;
        margin-right: 0;
    }

    .btn-cancel:hover {
        background-color: #e53935;
    }

    /* 드롭존 스타일 */
    #dropZone {
        width: 95%;
        padding: 12px;
        border: 2px dashed #4CAF50;
        border-radius: 4px;
        text-align: center;
        color: #aaa;
        margin-bottom: 15px;
        cursor: pointer;
        transition: background-color 0.3s, color 0.3s;
        font-size: 14px;
    }

    #dropZone.dragover {
        background-color: #e0f7e9;
        color: #4CAF50;
    }

    #preview {
        margin-top: 8px;
        max-width: 100%;
        max-height: 200px;
        display: none;
        border-radius: 4px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
</style>
</head>
<body>

    <form action="insertProduct" method="post">
        <h2>새 제품 추가</h2>

        <div class="form-group">
            <label for="productImage">제품 이미지</label>
            <input type="file" id="productImage" name="pd_img" accept="image/*" style="display: none;" onchange="previewImage(event)">
            <img id="preview" alt="이미지 미리 보기">
            <div id="dropZone">여기에 이미지를 드롭하거나 클릭하여 업로드하세요</div>
        </div>

        <div class="form-group">
            <label for="productName">제품명</label>
            <input type="text" id="productName" name="pd_name" required>
        </div>

        <div class="form-group">
            <label for="productPrice">가격</label>
            <input type="number" id="productPrice" name="price" required>
        </div>

        <!-- 카테고리와 세부카테고리 flex 컨테이너로 묶기 -->
        <div class="category-container">
            <div class="form-group">
                <label for="category">카테고리</label>
                <select id="category" name="category" required>
                    <option value="">카테고리 선택</option>
                    <option value="버섯류">버섯류</option>
                    <option value="제과">제과</option>
                    <option value="식료품">식료품</option>
                    <option value="수입품">수입품</option>
                    <option value="기타">기타</option>
                </select>
            </div>

            <div class="form-group">
                <label for="category_d">세부카테고리</label>
                <select id="category_d" name="category_d" required>
                    <option value="">카테고리 선택</option>
                </select>
            </div>
        </div>

        <div class="form-group">
            <label for="spec_carton">spec_carton</label>
            <input type="text" id="spec_carton" name="spec_carton">
        </div>

        <div class="form-group">
            <label for="load_qty">load_qty</label>
            <input type="text" id="load_qty" name="load_qty">
        </div>

        <div class="form-group">
            <label for="shelf_life">저장기간</label>
            <input type="text" id="shelf_life" name="shelf_life">
        </div>

        <div class="form-group">
            <label for="content">콘텐츠 내용</label>
            <textarea id="content" name="pd_content" rows="5" required></textarea>
        </div>

        <div class="btn-container">
            <input type="submit" class="btn" value="제품 추가">
            <button type="button" class="btn btn-cancel" onclick="window.location.href='Content'">취소</button>
        </div>
    </form>

    <script type="text/javascript">
        const dropZone = document.getElementById('dropZone');
        const productImageInput = document.getElementById('productImage');
        const preview = document.getElementById('preview');

        dropZone.addEventListener('click', () => productImageInput.click());

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

        function previewImage(event) {
            const reader = new FileReader();
            reader.onload = function() {
                preview.src = reader.result;
                preview.style.display = 'block';
            };
            reader.readAsDataURL(event.target.files[0]);
        }

        document.getElementById("category").addEventListener("change", function() {
            const category = this.value;
            const category_d = document.getElementById("category_d");
            category_d.innerHTML = '<option value="">카테고리 선택</option>';
            let options = [];
            switch (category) {
                case "버섯류":
                    options = ["버섯"];
                    break;
                case "제과":
                    options = ["쿠키류", "스낵류", "비스켓"];
                    break;
                case "식료품":
                    options = ["상온", "냉동", "냉장"];
                    break;
                case "수입품":
                    options = ["수입품"];
                    break;
                case "기타":
                    options = ["기타"];
                    break;
            }
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
