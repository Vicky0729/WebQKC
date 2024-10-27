<!-- WEB-INF/views/main.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>헤더/푸터 사용예시</title>
</head>
<body>
<!-- 헤더/푸터 사용예시 -->

	<!-- header -->
	<div>
		<%@ include file="/WEB-INF/views/Common/Header.jsp" %>
	</div>
   
    
    <!-- 간단한 인사말 -->
    <br>
    <h1>안녕하세요</h1>

    <!-- Footer -->
    <div>
   		<%@ include file="/WEB-INF/views/Common/Footer.jsp" %>
    </div>
    

</body>
</html>
