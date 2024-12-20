<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body class="container-flud">
	<div class="row">
		<div class="col-sm-2 bg-light">
			<!-- leftMenu.jsp include -->
			<c:import url="/WEB-INF/view/on/inc/leftMenu.jsp"></c:import>
		</div>
		
		<div class="col-sm-10">
			<!-- main content -->
			<h1>STAFF LIST</h1>
			
			<table class="table table-striped">
				<tr>
					<td>스태프 ID</td>
					<td>이름</td>
					<td>성</td>
					<td>주소 ID</td>
					<td>이메일</td>
					<td>가게 ID</td>
					<td>사용자이름</td>
					<td>최근 업데이트</td>
					<td>활성화 상태</td>
					<td>활성/비활성화</td>
				</tr>
				<c:forEach var="s" items="${staffList}">
					<tr>
						<td>${s.staffId}</td>
						<td>${s.firstName}</td>
						<td>${s.lastName}</td>
						<td>${s.addressId}</td>
						<td>${s.email}</td>
						<td>${s.storeId}</td>
						<td>${s.username}</td>
						<td>${s.lastUpdate}</td>
						<td>${s.active}</td> <!-- 삭제 불가, active값만 수정 가능. -->
						<td>
						<c:choose>
					        <c:when test="${s.active == 1}">
					            <a href="${pageContext.request.contextPath}/on/modifyStaffActive?staffId=${s.staffId}&active=${s.active}" class="btn btn-danger">
					                사용금지로 변경
					            </a>
					        </c:when>
					        <c:when test="${s.active == 2}">
					            <a href="${pageContext.request.contextPath}/on/modifyStaffActive?staffId=${s.staffId}&active=${s.active}" class="btn btn-primary">
					                사용으로 변경
					            </a>
					         </c:when>
					    </c:choose>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>




