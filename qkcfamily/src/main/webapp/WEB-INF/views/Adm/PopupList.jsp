<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.ArrayList"%>
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

/* 모달 창 스타일 */
.modal {
	display: none; /* 처음에는 숨겨둡니다. */
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5); /* 배경 반투명 */
}

.modal-content {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background-color: white;
	padding: 20px;
	width: 50%; /* 화면의 1/2 크기로 설정 */
	box-shadow: 0px 0px 10px 0px #000;
}

.close {
	color: red;
	float: right;
	font-size: 24px;
}

.close:hover {
	cursor: pointer;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<h2>광고 및 팝업 관리</h2>

	<!-- 새로운 팝업/광고 추가 -->
	<button class="btn btn-add" onclick="window.location.href='addAd.jsp'">새
		광고/팝업 추가</button>

	<!-- 광고/팝업 목록 테이블 -->
	<table>
		<thead>
			<tr>
				<th>팝업 ID</th>
				<th>팝업 이름</th>
				<!-- 팝업? 광고? 구분 해야할 것 같아요 -->
				<th>노출 시작일</th>
				<th>노출 종료일</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
			<!-- 샘플 데이터 (서버와 연동 시 동적으로 변경 가능) -->
			<c:forEach items="${popupList}" var="popup">
				<tr>
					<td>${popup.pop_idx}</td>
					<td>${popup.pop_title}</td>
					<td>${popup.start_date}</td>
					<td>${popup.end_date}</td>
					<td><button class="btn"
							onclick="window.location.href='editAd.jsp?id=1'">수정</button></td>
					<td><button class="btn btn-delete" onclick="deleteAd(1)">삭제</button></td>
				</tr>
			</c:forEach>

		</tbody>
	</table>

			<!-- 모달 창 -->
			<div id="modal" class="modal">
				<div class="modal-content">
					<span class="close">&times;</span>
					<h2>새 광고/팝업 추가</h2>
					<form action="popup/1" id="addPopupFrom" method="post">
						팝업 제목: <input type="text" id="pop_title" name="pop_title" required><br>
						<br> 팝업 이미지 경로: <input type="text" id="pop_img"
							name="pop_img" required><br>
						<br> 노출 시작일: <input type="date" id="start_date"
							name="start_date" required><br>
						<br> 노출 종료일: <input type="date" id="end_date" name="end_date"
							required><br>
						<br>
						<button type="submit">추가</button>
					</form>
				</div>
			</div>






	<script>
	
	$(document).ready(function() {
	    // 모달 창 열기/닫기 기능은 그대로 유지
	    var modal = document.getElementById("modal");
	    var addBtn = document.querySelector(".btn-add");
	    var closeBtn = document.querySelector(".close");

	    addBtn.onclick = function() {
	        modal.style.display = "block";
	    }

	    closeBtn.onclick = function() {
	        modal.style.display = "none";
	    }

	    window.onclick = function(event) {
	        if (event.target == modal) {
	            modal.style.display = "none";
	        }
	    }

	    // Ajax로 폼 제출
	    $('#addPopupFrom').on('submit', function(event) {
	        event.preventDefault(); // 기본 폼 제출 막기
	        
	        // 폼 데이터 가져오기
	        var formData = {
	            pop_title: $('#pop_title').val(),
	            pop_img: $('#pop_img').val(),
	            start_date: $('#start_date').val(),
	            end_date: $('#end_date').val()
	        };

	        // Ajax 요청
	        $.ajax({
	            type: 'POST',
	            url: 'popup/1',  // 서버에서 처리하는 URL로 변경
	            data: formData,
	            success: function(response) {
	                alert('팝업이 성공적으로 추가되었습니다.');
	                modal.style.display = "none";  // 폼 제출 후 모달 닫기
	                window.location.reload();      // 페이지 새로고침하여 목록 갱신
	            },
	            error: function(xhr, status, error) {
	                alert('팝업 추가 중 오류가 발생했습니다.');
	            }
	        });
	    });
	});

	
	
	
	
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