<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>사용자 관리</title>
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
    </style>
</head>
<body>
    <h2>사용자(?) 관리</h2>

    <!-- 새로운 사용자(관리자?) 추가 -->
    <button class="btn btn-add" onclick="window.location.href='addUser.jsp'">새 사용자 추가</button>

    <!-- 사용자 목록 테이블 -->
    <table>
        <thead>
            <tr>
                <th>사용자 ID</th>
                <th>이름</th>
                <th>이메일</th>
                <th>권한</th>
                <th>수정</th>
                <th>삭제</th>
            </tr>
        </thead>
        <tbody>
            <!-- 샘플 데이터 (서버와 연동 시 동적으로 변경 가능) -->
            <tr>
                <td>1</td>
                <td>냥대장</td>
                <td>hong@example.com</td>
                <td>관리자</td>
                <!-- 여기도 온클릭 함수로 버튼이동 하겠습니다 -->
                <td><button class="btn" onclick="window.location.href='editUser.jsp?id=1'">수정</button></td>
                <td><button class="btn btn-delete" onclick="deleteUser(1)">삭제</button></td>
            </tr>
            <tr>
                <td>2</td>
                <td>냥부관</td>
                <td>kim@example.com</td>
                <td>일반 사용자</td>
                <td><button class="btn" onclick="window.location.href='editUser.jsp?id=2'">수정</button></td>
                <td><button class="btn btn-delete" onclick="deleteUser(2)">삭제</button></td>
            </tr>
            <!-- 더 많은 사용자 정보가 추가될 수 있음 -->
        </tbody>
    </table>

    <script>
        // 사용자 삭제 확인 및 처리
        function deleteUser(userId) {
            if (confirm("사용자를 삭제하시겠습니까?")) {
                // 서버와 연동하여 사용자 삭제 처리 (Ajax 등 사용 가능)
                alert(userId + "번 사용자가 삭제되었습니다.");
                // 페이지를 새로고침하여 목록을 갱신
                window.location.reload();
            }
        }
    </script>
</body>
</html>