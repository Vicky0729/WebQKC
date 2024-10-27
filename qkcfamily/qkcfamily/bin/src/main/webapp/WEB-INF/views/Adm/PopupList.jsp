<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>광고 및 팝업 관리</title>
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
    <h2>광고 및 팝업 관리</h2>

    <!-- 새로운 팝업/광고 추가 -->
    <button class="btn btn-add" onclick="window.location.href='addAd.jsp'">새 광고/팝업 추가</button>

    <!-- 광고/팝업 목록 테이블 -->
    <table>
        <thead>
            <tr>
                <th>광고 ID</th>
                <th>광고/팝업 제목</th> <!-- 팝업? 광고? 구분 해야할 것 같아요 -->
                <th>노출 시작일</th>
                <th>노출 종료일</th>
                <th>수정</th>
                <th>삭제</th>
            </tr>
        </thead>
        <tbody>
            <!-- 샘플 데이터 (서버와 연동 시 동적으로 변경 가능) -->
            <tr>
                <td>1</td>
                <td>여름 할인 이벤트 팝업</td>
                <!-- 임의로 일단 보여지게 값만 넣어둘게여 -->
                <td>2024-07-01</td>
                <td>2024-07-31</td>
                <td><button class="btn" onclick="window.location.href='editAd.jsp?id=1'">수정</button></td>
                <td><button class="btn btn-delete" onclick="deleteAd(1)">삭제</button></td>
            </tr>
            <tr>
                <td>2</td>
                <td>신제품 출시 광고</td>
                <td>2024-08-01</td>
                <td>2024-08-31</td>
                <td><button class="btn" onclick="window.location.href='editAd.jsp?id=2'">수정</button></td>
                <td><button class="btn btn-delete" onclick="deleteAd(2)">삭제</button></td>
            </tr>
            <!-- 더 많은 광고/팝업 정보가 추가될 수 있음 -->
        </tbody>
    </table>

    <script>
        // 광고/팝업 삭제 확인 및 처리
        function deleteAd(adId) {
            if (confirm("해당 광고/팝업을 삭제하시겠습니까?")) {
                // 서버와 연동하여 광고/팝업 삭제 처리 (Ajax 등 사용 가능)
                alert(adId + "번 광고/팝업이 삭제되었습니다.");
                // 페이지를 새로고침하여 목록을 갱신
                window.location.reload();
            }
        }
    </script>
</body>
</html>