<%@page import="com.qkcfamily.entity.Admin"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

	<%
	Admin adminS = (Admin) session.getAttribute("admin");
	%>


	<h2>사용자 관리</h2>

	<!-- 새로운 사용자(관리자?) 추가 -->
	<button class="btn btn-add" id="btn-add">새 사용자 추가</button>

	<!-- 사용자 목록 테이블 -->
	<table>
		<thead>
			<tr>
				<th>사용자 ID</th>
				<th>이름</th>
				<th>이메일</th>
				<th>가입일자</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
			<!-- 동적 데이터 -->
			<c:forEach items="${adminList}" var="admin">
				<tr>
					<td>${admin.admin_id}</td>
					<td>${admin.admin_name}</td>
					<td>${admin.admin_email}</td>
					<td>${admin.created_at}</td>

					<!-- 수정 버튼: 세션의 admin_id와 currentAdmin.getAdmin_id()가 같거나, 세션의 admin_id가 "admin"이면 표시 -->
					<%
					Admin currentAdmin = (Admin) pageContext.findAttribute("admin");

					if (adminS != null
							&& (adminS.getAdmin_id().equals(currentAdmin.getAdmin_id()) || adminS.getAdmin_id().equals("admin"))) {
					%>
					<td>
						<button class="btn btn-update" data-id="${admin.admin_id}">수정</button>
					</td>
					<%
					} else {
					%>
					<td></td>
					<%
					}
					%>

					<!-- 삭제 버튼: 세션의 admin_id가 "admin"일 때만 표시 -->
					<%
					if (adminS != null && adminS.getAdmin_id().equals("admin")) {
					%>
					<td>
						<form action="admin/3" method="post"
							onsubmit="return confirm('삭제하시겠습니까?');">
							<input type="hidden" name="admin_id" value="${admin.admin_id}">
							<button type="submit" class="btn btn-delete">삭제</button>
						</form>
					</td>
					<%
					} else {
					%>
					<td></td>
					<%
					}
					%>

				</tr>
			</c:forEach>


		</tbody>
	</table>

	<!-- 모달 창 -->
	<div id="modal" class="modal">
		<div class="modal-content">
			<span class="close">&times;</span>
			<h2>회원 추가</h2>
			<form action="admin/1" method="post" id="addAdminForm">
				아이디: <input type="text" id="admin_id" name="admin_id" required><br>
				<br> 비밀번호: <input type="password" id="admin_pw" name="admin_pw"
					required><br> <br> 비밀번호 확인: <input
					type="password" id="admin_pw_check" name="admin_pw_check" required><br>
				<br> 이름: <input type="text" id="admin_name" name="admin_name"
					required><br> <br> 이메일: <input type="text"
					id="admin_email" name="admin_email" required><br> <br>
				<button type="submit">확인</button>
			</form>
		</div>
	</div>

	<div id="modal2" class="modal">
		<div class="modal-content">
			<span class="close">&times;</span>
			<h2>회원 수정</h2>
			<form action="admin/2" method="post" id="updateAdminForm">
				아이디: <input type="text" id="admin_id2" name="admin_id" readonly><br>
				<br> 비밀번호: <input type="password" id="admin_pw2"
					name="admin_pw" required><br> <br> 비밀번호 확인: <input
					type="password" id="admin_pw_check2" name="admin_pw_check" required><br>
				<br> 이름: <input type="text" id="admin_name2" name="admin_name"
					required><br> <br> 이메일: <input type="text"
					id="admin_email2" name="admin_email" required><br> <br>
				<button type="submit">확인</button>
			</form>
		</div>
	</div>

	<script>
		$(document).ready(function() {
			// 모달 열기
			$("#btn-add").click(function() {
				$("#modal").fadeIn(); // 모달을 서서히 나타나게 함
			});

			$(".btn-update").click(function() {
				var adminId = $(this).data("id");
				console.log("수정할 admin ID: " + adminId); // 클릭한 admin_id 확인

				$.ajax({
					url : 'getAdminData', // 데이터를 가져올 서버 측 URL
					type : 'post',
					data : {
						admin_id : adminId
					}, // 전달할 데이터 (admin_id)
					dataType : 'json',
					success : function(response) {
						console.log("서버 응답 데이터: ", response); // 서버에서 받은 데이터를 콘솔에 출력
						if (response) {
							// 서버로부터 받은 데이터를 모달에 채움
							$("#admin_id2").val(response.admin_id); // 아이디
							$("#admin_pw2").val(response.admin_pw); // 비밀번호
							$("#admin_pw_check2").val(response.admin_pw); // 비밀번호 확인
							$("#admin_name2").val(response.admin_name); // 이름
							$("#admin_email2").val(response.admin_email); // 이메일

							// 모달 표시
							$("#modal2").fadeIn();
						} else {
							console.log("빈 응답이 반환되었습니다.");
						}
					},
					error : function(xhr, status, error) {
						console.log("Ajax 요청 실패"); // 실패했을 때 메시지 출력
						console.log("에러 상태: " + status); // 실패 상태 출력
						console.log("에러 내용: " + error); // 실패 내용 출력
						console.log("서버 응답 텍스트: " + xhr.responseText); // 서버 응답 내용 출력
						alert("데이터를 불러오는 중 오류가 발생했습니다.");
					}
				});
			});

			// 모달 닫기
			$(".close").click(function() {
				$(this).closest(".modal").fadeOut(); // 모달을 서서히 사라지게 함
			});

			// 모달 외부를 클릭하면 모달 닫기
			$(window).click(function(event) {
				if ($(event.target).hasClass("modal")) {
					$(event.target).fadeOut();
				}
			});

			// addAdminForm 폼 제출 이벤트 가로채기
			$("#addAdminForm").on("submit", function(event) {
				event.preventDefault(); // 폼 제출 중지

				var adminId = $("#admin_id").val(); // 입력된 admin_id 값 가져오기
				console.log(adminId);

				// 비밀번호 확인 체크
				var pw = $("#admin_pw").val();
				var pwCheck = $("#admin_pw_check").val();
				if (pw !== pwCheck) {
					alert("비밀번호가 일치하지 않습니다.");
					return; // 비밀번호가 일치하지 않으면 종료
				}

				$.ajax({
					url : 'checkId',
					data : {
						'admin_id' : adminId
					},
					type : 'post',
					success : function(data) {
						console.log("서버 응답:", data);
						if (data === "중복") {
							alert("이미 존재하는 아이디입니다.");
							$("#admin_id").focus();
						} else {
							$("#addAdminForm")[0].submit();
						}
					},
					error : function() {
						alert("통신 실패");
					}
				});
			});

			// updateAdminForm 폼 제출 이벤트 가로채기
			$("#updateAdminForm").on("submit", function(event) {
				event.preventDefault(); // 폼 제출 중지

				var adminId = $("#admin_id2").val(); // 입력된 admin_id 값 가져오기
				console.log(adminId);

				// 비밀번호 확인 체크
				var pw = $("#admin_pw2").val();
				var pwCheck = $("#admin_pw_check2").val();
				if (pw !== pwCheck) {
					alert("비밀번호가 일치하지 않습니다.");
					return; // 비밀번호가 일치하지 않으면 종료
				} else {
					$("#updateAdminForm")[0].submit();
				}
			});
		});
	</script>
</body>
</html>
