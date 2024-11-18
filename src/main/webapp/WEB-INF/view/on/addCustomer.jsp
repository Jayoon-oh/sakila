<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<meta charset="UTF-8">
<title>고객 추가</title>
</head>
<body class="container-fluid">
	<div class="row">
		<div class="col-sm-2 bg-light">
			<!-- leftMenu.jsp include -->
			<c:import url="/WEB-INF/view/on/inc/leftMenu.jsp"></c:import>
		</div>
		
		<div class="col-sm-10">
			<!-- main content -->
			<h1>고객 추가</h1>
			
			<!-- 주소 검색 -->
			<div class="mb-4">
				<h2>주소 검색</h2>
				<form id="addressSearchForm">
					<div class="input-group">
						<input type="text" class="form-control" id="searchAddress" name="searchAddress">
						<button class="btn btn-primary" type="button">검색</button>
					</div>
				</form>
				<div id="addressResults" class="mt-2">
					<!-- 검색 결과가 여기에 표시됩니다 -->
				</div>
			</div>
			
			<!-- 고객 입력 폼 -->
			<div>
				<h1>고객 입력</h1>
		    <form action="/insertCustomer" method="post">
		        <label for="storeId">스토어 ID:</label>
		        <input type="number" id="storeId" name="storeId"><br><br>
		
		        <label for="firstName">이름:</label>
		        <input type="text" id="firstName" name="firstName"><br><br>
		
		        <label for="lastName">성:</label>
		        <input type="text" id="lastName" name="lastName"><br><br>
		
		        <label for="email">이메일:</label>
		        <input type="email" id="email" name="email"><br><br>
		
		        <label for="addressId">주소 ID:</label>
		        <input type="number" id="addressId" name="addressId"><br><br>
		
		        <input type="submit" value="고객 추가">
  			  </form>

 <script>
        // 영화 제목 검색하는 버튼
        $('#btnSearchFilm').click(function(){
            // 유효성 검사 코드 추가
            $('#formSearchFilm').submit();
        });
        // 출연작(film) 추가하는 버튼
        $('#btnAddFilm').click(function(){
            // 유효성 검사 코드 추가
            $('#formAddFilm').submit();
        });

        // 주소 검색 기능을 위한 JavaScript 코드
        $('#btnSearchAddress').click(function(){
            // 주소 검색 로직을 여기에 추가
            const addressId = $('#addressId').val();
            if (addressId) {
                alert('주소 검색 기능이 구현되어야 합니다. 입력된 주소 ID: ' + addressId);
            } else {
                alert('주소 ID를 입력해 주세요.');
            }
        });
    </script>
</body>
</html>