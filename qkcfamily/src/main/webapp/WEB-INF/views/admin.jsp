<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>productsM</title>
<style>
/* 전체 적용 CSS */
html, body {
	width: 100%;
	font-family: Pretendard-Regular, Arial, sans-serif;
	font-size: 16px;
	line-height: 1.5;
	color: #333;
}

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	display: flex;
	flex-direction: column;
	min-height: 100vh; /* 최소 높이를 100vh로 설정 */
}

/* 중간 메뉴 쿼리 */
@media only screen and (max-width: 1499px) {
	.location .wrap {
		width: auto;
		padding: 0;
	}
	.wrap, .orgaWrap .wrap {
		width: 100%;
		padding: 60px 80px 120px;
		box-sizing: border-box;
	}
}
/* 하위에 숨겨져 있다가 나오게*/
.location ul ul {
	display: none;
	position: absolute;
	top: 100%;
	left: 0;
	background: #fff;
	padding: 10px;
	border: 1px solid #e9e9e9;
	width: 120px;
	list-style: none;
	z-index: 10; /* 다른 요소 위에 보이도록 설정 */
}

.location ul li:hover>ul {
	display: block;
}

/*메뉴 버튼 스타일*/
.location>ul>li {
	list-style: none;
	position: relative;
	display: inline-block;
	padding: 10px 15px;
	width: 120px;
	background-color: #f6f6f6;
	border-bottom: solid 3px #8B0000;
	border-right: solid 0.5px #8B0000;
}

.location>ul>li:hover {
	background: #eb1c24; /* 마우스 오버 시 배경색 변경 */
}

.location>ul>li a {
	display: flex;
	justify-content: center;
	color: #282828;
	font-size: 16px;
	text-decoration: none;
}

.location>ul>li:after {
	position: absolute;
	top: 0;
	right: 0;
	display: block;
	content: '';
	height: 50px;
	width: 1px;
	background: #e9e9e9;
}
/* 미디어 쿼리*/
@media only screen and (max-width: 768px) {
	.location ul {
		flex-direction: column;
		width: 100%;
	}
	.location>ul>li {
		display: block;
		width: 100%;
	}
}

.product-name {
	margin-top: 10px;
	font-weight: bold;
}

.adminLogin {
	width: 100%;
	height: 50px;
}

#loginbox {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	width: 100%;
	height: 490px;
}

#loginform {
	width: 330px;
}

.submit-btn {
	background-color: #920e0e; /* 부드러운 초록색 */
	border: none;
	color: white;
	padding: 12px 24px;
	text-align: center;
	font-size: 16px;
	cursor: pointer;
	border-radius: 25px; /* 둥근 모서리 */
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* 그림자 */
	transition: background-color 0.3s ease, box-shadow 0.3s ease;
	margin-top: 50px;
	font-size: 20px;
}

</style>
</head>
<script type="text/javascript">
	// URL 파라미터 확인 및 로그인 실패 경고 표시
	const urlParams = new URLSearchParams(window.location.search);
	const errorType = urlParams.get('error');

	if (errorType === 'idnotfound') {
		alert('존재하지 않는 ID입니다. 다시 확인해주세요.');
	} else if (errorType === 'loginfail') {
		alert('비밀번호가 일치하지 않습니다. 다시 확인해주세요.');
	}
</script>
<body>
	<jsp:include page="Common/Header.jsp" />

	<br>
	<div id="loginbox">
		<h1 style="font-size: 24px; color: #333; margin-bottom: 20px;">관리자
			로그인</h1>
		<div id="loginform"
			style="width: 100%; max-width: 400px; padding: 40px; background-color: #fff; border: 1px solid #ddd; border-radius: 10px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); text-align: center;">
			<form action="Adm/adminMain" method="post">
				<div>
					<input type="text" name="admin_id" class="adminLogin"
						placeholder="아이디를 입력해주세요" autocomplete="off"
						style="width: 100%; padding: 12px 15px; margin: 10px 0; border: 1px solid #ccc; border-radius: 5px; font-size: 16px; outline: none; transition: border-color 0.3s;">
				</div>
				<div>
					<input type="password" name="admin_pw" class="adminLogin"
						placeholder="비밀번호를 입력해주세요" autocomplete="off"
						style="width: 100%; padding: 12px 15px; margin: 10px 0; border: 1px solid #ccc; border-radius: 5px; font-size: 16px; outline: none; transition: border-color 0.3s;">
				</div>
				<span id="pwd_hint"
					style="color: #d9534f; font-size: 14px; display: none; margin-top: 5px;">CAPS
					LOCK 켜져 있습니다.</span>
				<div align="center">
					<input type="submit" value="로그인" class="submit-btn"
						style="background-color: #8B0000; color: white; width: 100%; padding: 12px; font-size: 16px; font-weight: bold; border: none; border-radius: 5px; cursor: pointer; transition: background-color 0.3s ease;">
				</div>
			</form>
		</div>
	</div>
		<h3 align="center"> 🧑‍✈️ 지정된 관리자만 로그인 가능합니다.</h3>

	<br>
	<br>
	<br>
	<jsp:include page="Common/ScrollToTopBtn.jsp" />

	<jsp:include page="Common/Footer.jsp" />


	<script type="text/javascript">
		document.querySelector('input[name=admin_pw]').addEventListener(
				'keyup', function(e) {
					const pwdHint = document.getElementById('pwd_hint');

					if (e.getModifierState && e.getModifierState('CapsLock')) {
						pwdHint.innerHTML = 'CAPS LOCK 켜져 있습니다.';
						pwdHint.style.display = 'block';
					} else {
						pwdHint.style.display = 'none';
					}
				});
	</script>
</body>
</html>