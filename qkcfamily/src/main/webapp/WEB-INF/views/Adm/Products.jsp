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

        input[type="text"],
        input[type="number"] {
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
    </style>
</head>
<body>

    <h2>새 제품 추가</h2>

    <form action="addProductAction.jsp" method="post">
        <div class="form-group">
            <label for="productName">제품명</label>
            <input type="text" id="productName" name="productName" required>
        </div>

        <div class="form-group">
            <label for="productPrice">가격</label>
            <input type="number" id="productPrice" name="productPrice" required>
        </div>

        <div class="form-group">
            <label for="productStock">재고</label>
            <input type="number" id="productStock" name="productStock" required>
        </div>

        <input type="submit" class="btn" value="제품 추가">
        <button type="button" class="btn btn-cancel" onclick="window.location.href='productManagement.jsp'">취소</button>
    </form>

</body>
</html>