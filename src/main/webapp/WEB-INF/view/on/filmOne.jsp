<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

    <meta charset="UTF-8">
    <title>Film Details</title>
</head>
<body class="container-fluid">
    <div class="row">
        <div class="col-sm-2 bg-light p-3">
            <!-- leftMenu.jsp include -->
            <c:import url="/WEB-INF/view/on/inc/leftMenu.jsp"></c:import>
        </div>
        <div class="col-sm-10">
            <!-- main content -->
            <h1 class="mt-3">영화 정보</h1>
            <div class="mb-3">
                <!-- 필름 하나의 상세 정보 -->
                <div class="border p-3 bg-light">
                   <table class="table table bordered striped">
			    <tr>
			        <td><strong>제목</strong></td>
			        <td>${film.title}</td>
			    </tr>
			    <tr>
			        <td><strong>줄거리</strong></td>
			        <td>${film.description}</td>
			    </tr>
			    <tr>
			        <td><strong>출시년도</strong></td>
			        <td>${film.releaseYear}</td>
			    </tr>
			    <tr>
			        <td><strong>언어</strong></td>
			        <td>${film.language}</td>
			    </tr>
			    <tr>
			        <td><strong>영화길이</strong></td>
			        <td>${film.length} minutes</td>
			    </tr>
			    <tr>
			        <td><strong>영화등급</strong></td>
			        <td>${film.rating}</td>
			    </tr>
			    <tr>
			        <td><strong>특별추가</strong></td>
			        <td>${film.specialFeatures}</td>
			    </tr>
			    <tr>
			        <td><strong>대여비</strong></td>
			        <td>${film.rentalRate}</td>
			    </tr>
			    <tr>
			        <td><strong>대여기간</strong></td>
			        <td>${film.rentalDuration} days</td>
			    </tr>
			    <tr>
			        <td><strong>교체비용</strong></td>
			        <td>${film.replacementCost}</td>
			    </tr>
			    <tr>
			        <td><strong>번호</strong></td>
			        <td>${film.filmId}</td>
			    </tr>
			    <tr>
			        <td><strong>업데이트 일자</strong></td>
			        <td>${film.lastUpdate}</td>
			    </tr>
			</table>

                </div>
            </div>
            <div class="mb-3">
                <a class="btn btn-primary" href="${pageContext.request.contextPath}/on/modifyFilm?filmId=${film.filmId}">영화 수정</a>
                <a class="btn btn-danger" href="${pageContext.request.contextPath}/on/removeFilm?filmId=${film.filmId}">영화 삭제</a>
                <span class="text-danger">${removeFilmMsg}</span>
            </div>
            
            <div class="mb-4">
                <h2>작품 장르</h2>
                <form id="formFileCategory" action="${pageContext.request.servletContext}/on/addFileCategory" method="post">
                    <input type="hidden" name="filmId" value="${film.filmId}">
                    <div class="input-group mb-3">
                        <select name="categoryId" id="categoryId" class="form-select">
                            <option value="">카테고리 선택</option>
                            <c:forEach var="ac" items="${allCategoryList}">
                                <option value="${ac.categoryId}">${ac.name}</option>
                            </c:forEach>
                        </select>
                        <button id="btnFileCategory" type="button" class="btn btn-success">현재필름 카테고리 추가</button>
                    </div>
                </form>
                
                <div>
                    <h4>현재 카테고리 리스트</h4>
                    <c:forEach var="fc" items="${filmCategoryList}">
                        <div class="d-flex justify-content-between align-items-center border-bottom py-2">
                            <span>${fc.name}</span>
                            <a href="#" class="text-danger">삭제</a>
                        </div>
                    </c:forEach>
                </div>                
            </div>
            
            <div class="mb-4">
                <h2>작품에 출연한 배우들</h2>
                <form id="formSearchName" action="${pageContext.request.contextPath}/on/filmOne" method="get" class="mb-3">
                    <input type="hidden" name="filmId" value="${film.filmId}">
                    <div class="input-group">
                        <input type="text" name="searchName" id="searchName" class="form-control" placeholder="배우 이름 검색">
                        <button id="btnSearchName" type="button" class="btn btn-primary">이름검색</button>
                    </div>
                </form>
                
                <form method="post" class="mb-3">
                    <select name="actorId" id="actorId" class="form-select" size="5">
                        <option value="">배우 선택</option>
                        <c:forEach var="sa" items="${searchActorList}">
                            <option value="${sa.actorId}">${sa.firstName} ${sa.lastName}</option>
                        </c:forEach>
                    </select>
                    <button type="button" class="btn btn-success mt-2">출연배우 추가</button>
                </form>
                
                <div>
                    <h4>출연 배우 리스트</h4>
                    <c:forEach var="a" items="${actorList}">
                        <div class="d-flex justify-content-between align-items-center border-bottom py-2">
                            <a href="${pageContext.request.contextPath}/on/actorOne?actorId=${a.actorId}">
                                ${a.firstName} ${a.lastName}
                            </a>
                            <a href="${pageContext.request.contextPath}/on/removeFilmCategory?filmId=${fc.filmId}&categoryId=${fc.categoryId}" class="text-danger">삭제</a>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</body>
<script>
    $('#btnSearchName').click(function() {
        if($('#searchName').val() == '') {
            alert('검색이름을 입력하세요');
        } else {
            $('#formSearchName').submit();
        }
    });

    $('#btnFileCategory').click(function() {
        if($('#categoryId').val() == '') {
            alert('categoryId를 선택하세요');
        } else {
            $('#formFileCategory').submit();
        }
    });
</script>
</html>
