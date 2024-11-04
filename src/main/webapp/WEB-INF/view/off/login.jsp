<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<link rel="preconnect" href="https://fonts.googleapis.com">
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <style>
        body {
           background-color: rgba(240, 240, 240, 0.8);
            height: 100vh; /* 전체 높이 */
            display: flex;
            justify-content: center;
            align-items: center;
           	font-family: "Noto Sans KR", sans-serif;
        }
		

        .login-container {
            background: rgba(255, 255, 255, 0.9); /* 로그인 박스의 배경을 흰색으로 설정 */
            padding: 2rem;
            border-radius: 8px; /* 둥근 모서리 */
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
            width: 100%;
            max-width: 400px; /* 최대 너비 */
        }
        .form-label {
            font-weight: bold; /* 레이블 굵게 */
        }
        
        
    </style>
</head>

<body>
    <div class="login-container">
        <section class="bg-light p-3 p-md-4 p-xl-5 text-center">
            <h1>로그인 <span>${msg}</span></h1>
        </section>

        <form id="form" action="${pageContext.request.contextPath}/off/login" method="post">
            <div class="mb-3">
                <label for="staffId" class="form-label">ID:</label>
                <input id="staffId" name="staffId" type="text" class="form-control"> 
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Password:</label>
                <input id="password" name="password" type="password" class="form-control">
            </div>
            <button id="btn" type="button" class="btn btn-primary w-100">Login</button> <!-- 버튼 너비 100% -->
        </form>
    </div>

    <script>
        // btn버튼 클릭시 폼값 유효성 검사
        $('#btn').click(function() {
            console.log('click'); // 디버깅
            if ($.isNumeric($('#staffId').val()) == false) {
                alert('staff는 숫자만 입력 가능');
            } else if ($('#password').val().length < 4) {
                alert('password는 4자 이상 입력 가능');
            } else {
                $('#form').submit(); // 폼 제출
            }
        });
    </script>
</body>
</html>
