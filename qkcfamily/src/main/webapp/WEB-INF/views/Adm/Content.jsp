<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>contentsManagement</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style type="text/css">
/* 기본 레이아웃 및 폰트 스타일 */
body {
	font-family: Arial, sans-serif;
	background-color: #f9f9f9;
	margin: 0;
	padding: 20px;
}

h1 {
	font-size: 26px;
	font-weight: bold;
	color: #333;
	margin-bottom: 20px;
}

h2 {
	font-size: 24px;
	font-weight: bold;
	color: #444;
}

/* pageEditor의 고정된 크기와 스타일 설정 */
#pageEditor {
	border: 1px solid #ddd;
	width: 1000px;
	height: 800px;
	overflow: auto;
	display: flex;
	justify-content: center;
	align-items: center;
	background-color: #fff;
	box-shadow: 0px 0px 8px rgba(0, 0, 0, 0.1);
	margin: 0 auto;
	border-radius: 8px;
}

/* 테이블 및 버튼 스타일 */
table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
	background-color: #fff;
	box-shadow: 0px 0px 8px rgba(0, 0, 0, 0.1);
	border-radius: 8px;
	overflow: hidden;
}

table, th, td {
	border: 1px solid #ddd;
	padding: 15px;
	text-align: left;
}

th {
	background-color: #f5f5f5;
	color: #333;
	font-weight: 600;
}

td {
	text-align: center;
	font-size: 14px;
	color: #555;
}

/* 버튼 스타일 */
.btn {
	padding: 8px 12px;
	background-color: #4CAF50;
	color: white;
	border: none;
	cursor: pointer;
	border-radius: 5px;
	font-size: 14px;
	transition: background-color 0.3s ease;
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
	display: inline-block;
	padding: 10px 20px;
	font-size: 16px;
}

.btn-add:hover {
	background-color: #1976D2;
}

/* select 및 폼 요소 스타일 */
#pageForm {
	margin-bottom: 20px;
}

label {
	font-size: 16px;
	color: #333;
	margin-right: 10px;
}

select, button[type="button"] {
	font-size: 14px;
	padding: 8px;
	border: 1px solid #ddd;
	border-radius: 4px;
}

select {
	margin-right: 10px;
}

/* 이미지 크기 조정 */
.scimg {
	width: 24px;
	height: 24px;
	cursor: pointer;
	transition: transform 0.2s ease;
}

.scimg:hover {
	transform: scale(1.1);
}
</style>
</head>

<body>

	<h1>페이지설정</h1>

	<form id="pageForm" action="AdminProduct" method="post">
		<label for="pageSelect">수정할 페이지를 선택하세요</label> 
		<select id="pageSelect" name="selectedPage">
			<option value="">페이지 선택</option>
			<option value="edit_mushroom">버섯</option>
			<option value="edit_snack">제과</option>
			<option value="edit_foodstuffs">식료품</option>
			<option value="edit_import">수입제품</option>
			<option value="edit_etc">기타</option>
		</select>
		<button type="button" onclick="validateAndSubmit()">찾기</button>
	</form>

	<button class="btn btn-add" onclick="addProduct()">새 제품 추가</button>

	<table>
		<thead>
			<tr>
				<th>제품 ID</th>
				<th>제품명</th>
				<th>가격</th>
				<th>내용</th>
				<th>수정</th>
				<th>삭제</th>
				<th>찜</th>
			</tr>
		</thead>
		<tbody>
			<!-- 샘플 데이터 (아마도 서버 연동 시 동적으로 변경 가능) -->
			<c:forEach items="${ProductList}" var="product" varStatus="status">
				<tr>
					<td>${status.index + 1}</td>
					<td>${product.pd_name}</td>
					<td>${product.price}</td>
					<td>${product.pd_content}</td>
					<td><button class="btn"
							onclick="updateProduct(${product.pd_idx})">수정</button></td>
					<td><button class="btn btn-delete"
							onclick="deleteProduct(${product.pd_idx})">삭제</button></td>
					<td><c:choose>
							<c:when test="${product.scrapped == 0}">
								<a href="javascript:void(0)"
									onclick="addScrap(${product.pd_idx})"> <img
									class="scimg"
									id="scimg-${product.pd_idx}"
									src="../resources/imgs/scrap_icon2.png" alt="스크랩 아이콘">
								</a>
							</c:when>
							<c:when test="${product.scrapped == 1}">
								<a href="javascript:void(0)"
									onclick="deleteScrap(${product.pd_idx})"> <img
									class="scimg"
									id="scimg-${product.pd_idx}"
									src="../resources/imgs/scrap_icon1.png" alt="스크랩 아이콘">
								</a>
							</c:when>
							<c:otherwise>
								<img src="../resources/imgs/default_icon2.png" alt="기본 아이콘">
							</c:otherwise>
						</c:choose></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<script>
		function deleteProduct(productIdx) {
			if (confirm("해당 제품을 삭제하시겠습니까?")) {
				$.ajax({
					url: "deleteProduct/" + productIdx,
					type: "delete",
					success: function() {
						alert("제품이 삭제되었습니다");
						window.location.reload();
					},
					error: function() {
						alert("통신실패");
					}
				});
			}
		}
		
		function addProduct() {
			window.location.href = "addProductPage";
		}

		function updateProduct(productIdx) {
			window.location.href = "updateProductPage?pd_idx=" + productIdx;
		}

		function addScrap(productIdx) {
			$.ajax({
				url: "addScrap/" + productIdx,
				type: "get",
				success: function() {
					$("#scimg-" + productIdx).attr("src", "../resources/imgs/scrap_icon1.png");
					$("#scimg-" + productIdx).parent().attr("onclick", `deleteScrap(${productIdx})`);
				},
				error: function() {
					alert("통신실패");
				}
			});
		}

		function deleteScrap(productIdx) {
			$.ajax({
				url: "deleteScrap/" + productIdx,
				type: "delete",
				success: function() {
					$("#scimg-" + productIdx).attr("src", "../resources/imgs/scrap_icon2.png");
					$("#scimg-" + productIdx).parent().attr("onclick", `addScrap(${productIdx})`);
				},
				error: function() {
					alert("통신실패");
				}
			});
		}

		function validateAndSubmit() {
			const pageSelect = document.getElementById("pageSelect").value;
			if (pageSelect === "") {
				alert("수정할 페이지를 선택하세요.");
			} else {
				document.getElementById("pageForm").submit();
			}
		}
	</script>

</body>
</html>
