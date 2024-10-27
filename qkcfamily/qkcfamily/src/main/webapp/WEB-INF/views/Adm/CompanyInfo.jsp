<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<!-- 로고 변경하는 페이지 따로 만들었는데 관리자페이지에서 바로 변경할 수 있게끔 만들수 있습니다 -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회사기본정보</title>
</head>
<body>
<!-- 회사로고 변경 -->
    <h2>회사 로고 변경</h2>
    <form action="UploadLogoServlet" method="post" enctype="multipart/form-data">
        <label for="file">새 로고 이미지 선택:</label>
        <input type="file" name="file" id="file" accept="image/*">
        <input type="submit" value="로고 업로드">
    </form>
    
<!-- 회사기본 정보 변경 -->
 회사명
 대표자명
 사업자번호
 주소
 대표전화번호
 대표이메일주소
</body>
</html>