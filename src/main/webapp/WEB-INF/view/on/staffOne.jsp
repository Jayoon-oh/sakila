<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

    <meta charset="UTF-8">
    <title>회원정보</title>
    <style>
        body {
            background-color: #f8f9fa; /* 부드러운 배경색 */
        }
        .card {
            border-radius: 10px; /* 모서리 둥글게 */
        }
        .table th, .table td {
            vertical-align: middle; /* 세로 정렬 */
        }
    </style>
</head>
<body class="container-fluid">
    <div class="row">
        <div class="col-sm-2 bg-light">
            <!-- leftMenu.jsp include -->
            <c:import url="/WEB-INF/view/on/inc/leftMenu.jsp"></c:import>
        </div>
        
        <div class="col-sm-10">
            <div class="container mt-3">
                <div class="card shadow">
                    <div class="card-header">
                        <h2 class="mb-0">회원정보</h2>
                    </div>
                    <div class="card-body">
                        <table class="table table-bordered table-striped">
                            <thead class="table-light">
                                <tr>
                                    <th>이름</th>
                                    <th>${staff.firstName}</th>
                               </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>매장 주소</td>
                                    <td>${staff.storeCountry} ${staff.storeAddress}</td>
                                    <td></td> <!-- 빈 셀 -->
                                </tr>
                                <tr>
                                    <td>매니저 이름</td>
                                    <td>${staff.managerName}</td>
                                    <td>고유번호: ${staff.storeId}</td>
                                </tr>
                                <tr>
                                    <td>스태프 주소</td>
                                    <td>${staff.staffAddress}</td>
                                    <td>${staff.staffPhone}</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
