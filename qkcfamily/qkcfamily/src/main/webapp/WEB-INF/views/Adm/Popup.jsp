<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>광고/팝업 추가</title>
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
        input[type="date"],
        select {
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

    <h2>새 광고/팝업 추가</h2>

    <form action="addAdAction.jsp" method="post">
        <div class="form-group">
            <label for="adTitle">광고/팝업 제목</label>
            <input type="text" id="adTitle" name="adTitle" required>
        </div>

        <div class="form-group">
            <label for="adType">유형 선택</label>
            <select id="adType" name="adType" required>
                <option value="popup">팝업</option>
                <option value="ad">광고</option>
            </select>
        </div>

        <div class="form-group">
            <label for="startDate">노출 시작일</label>
            <input type="date" id="startDate" name="startDate" required>
        </div>

        <div class="form-group">
            <label for="endDate">노출 종료일</label>
            <input type="date" id="endDate" name="endDate" required>
        </div>

        <input type="submit" class="btn" value="광고/팝업 추가">
        <button type="button" class="btn btn-cancel" onclick="window.location.href='adManagement.jsp'">취소</button>
    </form>

</body>
</html>