<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>새 사용자 추가</title>
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
        input[type="email"],
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

    <h2>새 사용자 추가</h2>

    <form action="addUserAction.jsp" method="post">
        <div class="form-group">
            <label for="userName">이름</label>
            <input type="text" id="userName" name="userName" required>
        </div>

        <div class="form-group">
            <label for="userId">회원아이디</label>
            <input type="text" id="userId" name="userId" required>
        </div>

        <div class="form-group">
            <label for="userEmail">이메일</label>
            <input type="email" id="userEmail" name="userEmail" required>
        </div>

        <div class="form-group">
            <label for="userDepartment">부서</label>
            <input type="text" id="userDepartment" name="userDepartment" required>
        </div>

        <div class="form-group">
            <label for="userRole">구분</label>
            <select id="userRole" name="userRole" required>
                <option value="admin">관리자</option>
                <option value="user">일반 사용자</option>
            </select>
        </div>

        <input type="submit" class="btn" value="사용자 추가">
        <button type="button" class="btn btn-cancel" onclick="window.location.href='userManagement.jsp'">취소</button>
    </form>

</body>
</html>