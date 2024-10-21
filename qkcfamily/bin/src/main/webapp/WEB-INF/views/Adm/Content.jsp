<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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


</style>
</head>

<body>

<h1>페이지설정</h1>

<form>
 <label for="pageSelect">수정할 페이지를 선택하세요</label>
    <select id="pageSelect">
    	  <option value="">페이지 선택</option>	
        <option value="edit_mushroom">버섯</option>
         <option value="edit_snack">제과</option>
        <option value="edit_foodstuffs">식료품</option>
        <option value="edit_import">수입제품</option>
        <option value="edit_etc">기타</option>
        
       
    </select>
	<input type="button" onclick="edit_button()" value="수정">
</form>	
	
	   <div id="pageEditor" >
        <p>수정할 페이지를 선택하세요.</p>
   	   </div>


<div id="edit_product">

</div>


<script>

   function edit_button(){
	   var selectedPage = $('#pageSelect').val();
	   console.log(selectedPage)
	    if (!selectedPage) {
            alert('페이지를 선택하세요.');
            return;
        }
	   
	   $.ajax({
		   
		   url:"editPage.do/"+selectedPage,
		   type:"get",
		   success:function(response){
			   
			   $('#pageEditor').html(response);
			   
		   },
		   error:function(){
			   
			   alert("통신실패")
			   
			   
		   }
		   
		   
	   })
	   
   } 
   
   function submitUpdate() {
	    // 수정된 데이터를 각 필드에서 가져오기
	    var pd_idx = $("#pd_idx").val();
	    var pd_name = $("#pd_name").val();
	    var pd_content = $("#pd_content").val();
	    var price = $("#price").val();
	    var pd_img = $("#pd_img").val();
	    var category = $("#category").val();
	    var item = $("#item").val();
	    var spec_carton = $("#spec_carton").val();
	    var carton_size = $("#carton_size").val();
	    var load_qty = $("#load_qty").val();
	    var shelf_life = $("#shelf_life").val();

	    $.ajax({
	        url: "UpdateProduct.do",  // 수정 요청을 처리할 서버 엔드포인트
	        type: "POST",
	        data: {
	            pd_idx: pd_idx,
	            pd_name: pd_name,
	            pd_content: pd_content,
	            price: price,
	            pd_img: pd_img,
	            category: category,
	            item: item,
	            spec_carton: spec_carton,
	            carton_size: carton_size,
	            load_qty: load_qty,
	            shelf_life: shelf_life
	        },
	        success: function(res) {
	            alert("수정이 완료되었습니다!");
	            // 필요한 경우 수정 후 페이지를 새로 고침하거나 수정된 정보를 다시 표시
	        },
	        error: function() {
	            alert("수정에 실패했습니다.");
	        }
	    });
	}
   
   function insertNewProduct() {
	    // 입력된 값을 가져옴
	    var pd_name = $("#new_pd_name").val();
	    var pd_content = $("#new_pd_content").val();
	    var price = $("#new_price").val();
	    var pd_img = $("#new_pd_img").val();
	    var category = $("#new_category").val();
	    var item = $("#new_item").val();
	    var spec_carton = $("#new_spec_carton").val();
	    var carton_size = $("#new_carton_size").val();
	    var load_qty = $("#new_load_qty").val();
	    var shelf_life = $("#new_shelf_life").val();

	    
	    console.log(pd_name)
	    // 유효성 검사 (예: 필수 필드 체크)
	   

	    // 서버로 데이터 전송 (AJAX 요청)
	    $.ajax({
	        url: "InsertProducts.do",  // Insert를 처리할 서버 엔드포인트
	        type: "POST",
	        data: {
	            pd_name: pd_name,
	            pd_content: pd_content,
	            price: price,
	            pd_img: pd_img,
	            category: category,
	            item: item,
	            spec_carton: spec_carton,
	            carton_size: carton_size,
	            load_qty: load_qty,
	            shelf_life: shelf_life
	        },
	        success: function() {
	            alert("새로운 제품이 성공적으로 추가되었습니다!");
	            location.reload();  // 페이지를 새로고침하여 새 콘텐츠 반영
	        },
	        error: function() {
	            alert("콘텐츠 추가에 실패했습니다.");
	        }
	    });
	}
   
   
   
</script>


</body>
</html>