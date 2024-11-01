<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<div class="container mt-3">
    <div class="card">
        <div class="card-header text-center">
            <h5>메뉴</h5>
        </div>
        <ul class="list-group list-group-flush text-center">
            <li class="list-group-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/on/main">
                    <i class="bi bi-house"></i> 홈으로
                </a>
            </li>
            <li class="list-group-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/on/staffOne">
                    <i class="bi bi-person-circle"></i> ${loginStaff.username}님
                </a>
            </li>
            <li class="list-group-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/on/logout">
                    <i class="bi bi-box-arrow-right"></i> 로그아웃
                </a>
            </li>
            <li class="list-group-item bg-light">
                <strong>지점 관리</strong>
            </li>
            <li class="list-group-item">
                <a class="nav-link" href="">
                    <i class="bi bi-list-ul"></i> 지점 리스트
                </a>
            </li>
            <li class="list-group-item">
                <a class="nav-link" href="">
                    <i class="bi bi-plus-circle"></i> 지점 추가
                </a>
            </li>
            <li class="list-group-item bg-light">
                <strong>STAFF 관리</strong>
            </li>
            <li class="list-group-item">
                <a class="nav-link" href="">
                    <i class="bi bi-list-check"></i> 스탭 리스트
                </a>
            </li>
            <li class="list-group-item">
                <a class="nav-link" href="">
                    <i class="bi bi-person-plus"></i> 스탭 추가
                </a>
            </li>
            <li class="list-group-item bg-light">
                <strong>고객 관리</strong>
            </li>
            <li class="list-group-item">
                <a class="nav-link" href="">
                    <i class="bi bi-person-lines-fill"></i> 고객 리스트
                </a>
            </li>
            <li class="list-group-item">
                <a class="nav-link" href="">
                    <i class="bi bi-person-plus-fill"></i> 고객 추가
                </a>
            </li>
        </ul>
    </div>
</div>

<!-- Bootstrap Icons CDN -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
