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
            font-family: "Noto Sans KR", sans-serif;
            background-color: #f8f9fa; /* Light background for better contrast */
            color: #343a40; /* Dark text color for readability */
        }
        .container {
            padding: 20px;
            border-radius: 8px;
            background-color: #ffffff; /* White background for the main content */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Subtle shadow for depth */
        }
        h1, h2 {
            color: #007bff; /* Primary color for headings */
        }
        .btn-primary {
            background-color: #007bff; /* Primary button color */
            border: none;
        }
        .btn-primary:hover {
            background-color: #0056b3; /* Darker shade on hover */
        }
        table {
            margin-top: 20px;
        }
        select, input[type="text"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ced4da; /* Light border */
            border-radius: 4px; /* Rounded corners */
        }
        select:focus, input[type="text"]:focus {
            border-color: #007bff; /* Highlight border on focus */
            outline: none; /* Remove default outline */
        }
        .list-group-item {
            border: none; /* Remove border between items */
        }
</style>
</head>
<body class="container-fluid">
 <div class="container">
  <div class="row">
		<div class="col-sm-2 bg-light">
			<!-- leftMenu.jsp include -->
			<c:import url="/WEB-INF/view/on/inc/leftMenu.jsp"></c:import>
		</div>
		
		<div class="col-sm-10">
			<!-- main content -->
			<h1>ADD STAFF</h1>
			
			<h2>주소 검색</h2>
			<form id="formAddress" action="${pageContext.request.contextPath}/on/addStaff" method="get">
				<input type="text" name="searchAddress" id="searchAddress">
				<button type="button" class="btn btn-primary active" id="btnAddress">주소검색</button>
			</form>
			<p>
			</p>
			<div>
				<h2>주소를 선택하세요</h2>
				<select id="resultAddress" size="10">
					<c:forEach var="a" items="${addressList}">
						<option value="${a.addressId}">
							(ADDRESS ID : ${a.addressId}) ${a.address}
						</option>
					</c:forEach>
				</select>
				<br>
				<button type="button" class="btn btn-primary active" id="btnAddrSel">주소선택</button>
			</div>
			
			<hr>
			
			<h2>입력 폼</h2>
			<form id="addForm" action="${pageContext.request.contextPath}/on/addStaff" method="post">
				<table class="table table-striped" style="width: 80%">
					<tr>
						<td>storeId</td>
						<td>
							<select name="storeId" id="storeId">
								<option value="">:::선택:::</option>
								<c:forEach var="s" items="${storeList}">
									<option value="${s.storeId}">${s.storeId}</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					
					<tr>
						<td>addressId</td>
						<td>
							<input type="text" name="addressId" id="addressId" readonly>
						</td>
					</tr>
					
					<tr>
						<td>firstName</td>
						<td>
							<input type="text" name="firstName" id="firstName">
						</td>
					</tr>
					
					<tr>
						<td>lastName</td>
						<td>
							<input type="text" name="lastName" id="lastName">
						</td>
					</tr>
					
					<tr>
						<td>email</td>
						<td>
							<input type="text" name="email" id="email">
						</td>
					</tr>
					
					<tr>
						<td>userName</td>
						<td>
							<input type="text" name="username" id="username">
						</td>
					</tr>
				</table>
				<button type="button" class="btn btn-primary active" id="btnAddStaff" type="button">스텝 추가</button>
			</form>
		</div>
	</div>
	</div>
</body>
<script>
	// 액션 서브밋 버튼
	$('#btnAddStaff').click(function() {
		// 입력폼 유효성 검사
		if($('#storeId').val() == null || $('#storeId').val() =='') {
			alert('storeId를 입력하세요');
		} else if($('#addressId').val() == null || $('#addressId').val() =='') {
			alert('addressId를 입력하세요');
		} else if($('#firstName').val() == null || $('#firstName').val() =='') {
			alert('firstName를 입력하세요');
		} else if($('#lastName').val() == null || $('#lastName').val() =='') {
			alert('lastName를 입력하세요');
		} else if($('#email').val() == null || $('#email').val() =='') {
			alert('email를 입력하세요');
		} else if($('#username').val() == null || $('#username').val() =='') {
			alert('username를 입력하세요');
		} else{
			console.log('submit....');
			$('#addForm').submit();
		}
	});
	
	// 주소 선택 버튼
	$('#btnAddrSel').click(function() {
		console.log($('#resultAddress').val());
		if($('#resultAddress').val() == null || $('#resultAddress').val() =='') {
			alert('주소 선택을 먼저 하세요');
		} else {
			$('#addressId').val($('#resultAddress').val()); // resultAddress 값이 들어감.
		}
	});

	// 주소 검색 버튼
	$('#btnAddress').click(function(){
		if($('#searchAddress').val() == "") {
			alert('주소 검색어를 입력하세요');
		} else {
			$('#formAddress').submit();
		}
	});
</script>
</html>