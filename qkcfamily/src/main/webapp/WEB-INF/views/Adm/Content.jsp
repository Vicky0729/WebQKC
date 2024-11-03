<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>contentsManagement</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style type="text/css">
/* pageEditor의 고정된 크기와 스타일 설정 */
#pageEditor {
	border: 1px solid black;
	width: 1000px;
	height: 800px;
	overflow: auto; /* 스크롤 허용 */
	display: flex;
	justify-content: center;
	align-items: center;
}

/* div 내부의 컨텐츠 크기 조정 */
#pageEditor img {
	max-width: 100%;
	max-height: 100%;
	object-fit: contain; /* 이미지를 div 크기에 맞춤 */
}

#pageEditor p {
	margin: 0;
	padding: 10px;
	text-align: center;
	word-wrap: break-word; /* 텍스트가 넘치지 않도록 자동 줄바꿈 */
}

#pageEditor div {
	width: 100%;
	height: 100%;
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

h2 {
	font-size: 24px;
	font-weight: bold;
}

.scimg {
	width: 30px;
	height: 30px;
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
					<!-- a태그에서 변경해야될 것 같아서 온클릭함수 넣어서 만듦 -->
					<td><button class="btn"
							onclick="updateProduct(${product.pd_idx})">수정</button></td>
					<td><button class="btn btn-delete"
							onclick="deleteProduct(${product.pd_idx})">삭제</button></td>
					<td><c:choose>
							<c:when test="${product.scrapped == 0}">
								<a href="javascript:void(0)"
									onclick="addScrap(${product.pd_idx})"> <img
									class = "scimg"
									id="scimg-${product.pd_idx}"
									src="../resources/imgs/scrap_icon2.png" alt="스크랩 아이콘">
								</a>
							</c:when>
							<c:when test="${product.scrapped == 1}">
								<a href="javascript:void(0)"
									onclick="deleteScrap(${product.pd_idx})"> <img
									class = "scimg"
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

			<!-- 더 많은 제품 정보가 추가될 수 있음 -->
		</tbody>
	</table>






	<script>

	function deleteProduct(productIdx) {
		console.log(productIdx)
        if (confirm("해당 제품을 삭제하시겠습니까?")) {
        	
        	$.ajax({
        		url:"deleteProduct/"+productIdx,
        		type :"delete",
        		success:function(){
        			
        			alert("제품이 삭제되었습니다")
        			 window.location.reload();
        			
        		},
        		error:function(){
        			
        			
        			alert("통신실패")
        		}
        		
        		
        	})
        	
   
            
           
        }
    }
	
	
	function addProduct(){
		
		
		window.location.href = "addProductPage";
	}
	
	function updateProduct(productIdx){
		
		window.location.href = "updateProductPage?pd_idx=" + productIdx;
		
	}
	
  
   function addScrap(productIdx){
	   
	   console.log("addJs",productIdx)
	   
	   $.ajax({
			url:"addScrap/"+productIdx,
			type: "get",
			success: function(){
				
				console.log("스크랩 추가 성공");

	            // 기존 <a> 태그 전체를 찾고 새로운 요소로 교체
	            const newElement = ` 	
	                <a href="javascript:void(0)" onclick="deleteScrap(${productIdx})">
	                    <img class="scimg" id="scimg-${productIdx}" 
	                         src="../resources/imgs/scrap_icon1.png" alt="스크랩 아이콘">
	                </a>`;

	            // 기존 <a> 태그를 정확히 찾아서 교체
	            $(`#scimg-${productIdx}`).closest('a').replaceWith(newElement);
				
				
		            
			},
		   	error:function(){
		   		
		   		alert("통신실패")
		   		
		   	}
		  
		   
		   
		   
		   
	   })
	   
	   
	   
   }
   
 function deleteScrap(productIdx){
	   
	   
	   $.ajax({
			url:"deleteScrap/"+productIdx,
			type: "delete",
			success: function(){
				
				
				console.log("스크랩 추가 성공");

	            // 기존 <a> 태그 전체를 찾고 새로운 요소로 교체
	            const newElement = ` 	
	                <a href="javascript:void(0)" onclick="addScrap(${productIdx})">
	                    <img class="scimg" id="scimg-${productIdx}" 
	                         src="../resources/imgs/scrap_icon2.png" alt="스크랩 아이콘">
	                </a>`;

	            // 기존 <a> 태그를 정확히 찾아서 교체
	            $(`#scimg-${productIdx}`).closest('a').replaceWith(newElement);
			},
		   	error:function(){
		   		
		   		alert("통신실패")
		   		
		   	}
		  
		   
		   
		   
		   
	   })
	   
	   
	   
   }
   

	function validateAndSubmit() {
		const pageSelect = document.getElementById("pageSelect").value;
		if (pageSelect === "") {
			alert("수정할 페이지를 선택하세요.");
		} else {
			document.getElementById("pageForm").submit(); // 폼 제출
		}
	}

	
	 const urlParams = new URLSearchParams(window.location.search);
     const success = urlParams.get('success');
     const updated = urlParams.get('updated');

     if (success === 'true') {
         alert("제품이 성공적으로 추가되었습니다!");
     }
     
     if (updated === 'true') {
         alert("제품이 성공적으로 수정되었습니다!");
     }
    
    

   
</script>


</body>
</html>