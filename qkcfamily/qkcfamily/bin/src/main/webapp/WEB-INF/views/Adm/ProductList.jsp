<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    </style>
</head>
<body>
    <h2>제품 관리</h2>

    <!-- 새로운 제품 추가하는 곳입니다 -->
    <button class="btn btn-add" onclick="window.location.href='addProduct.jsp'">새 제품 추가</button>

    <!-- 제품 목록 테이블 -->
    <table>
        <thead>
            <tr>
                <th>제품 ID</th>
                <th>제품명</th>
                <th>가격</th>
                <th>재고</th>
                <th>수정</th>
                <th>삭제</th>
            </tr>
        </thead>
        <tbody>
            <!-- 샘플 데이터 (아마도 서버 연동 시 동적으로 변경 가능) -->
            <tr>
                <td>1</td>
                <td>시금치만 웨하스</td>
                <td>₩5,000</td>
                <td>100</td>
                <!-- a태그에서 변경해야될 것 같아서 온클릭함수 넣어서 만듦 -->
                <td><button class="btn" onclick="window.location.href='editProduct.jsp?id=1'">수정</button></td>
                <td><button class="btn btn-delete" onclick="deleteProduct(1)">삭제</button></td>
            </tr>
            <tr>
                <td>2</td>
                <td>악마의 장로버섯</td>
                <td>₩1,100,000</td>
                <td>50</td>
                <td><button class="btn" onclick="window.location.href='editProduct.jsp?id=2'">수정</button></td>
                <td><button class="btn btn-delete" onclick="deleteProduct(2)">삭제</button></td>
            </tr>
            <!-- 더 많은 제품 정보가 추가될 수 있음 -->
        </tbody>
    </table>

    <script>
        // 제품 삭제 확인 및 처리
        function deleteProduct(productId) {
            if (confirm("해당 제품을 삭제하시겠습니까?")) {
                // 서버와 연동하여 제품 삭제 처리 (Ajax 등 사용 가능)
                alert(productId + "번 제품이 삭제되었습니다.");
                // 페이지를 새로고침하여 목록을 갱신
                window.location.reload();
            }
        }
    </script>
</body>
</html>