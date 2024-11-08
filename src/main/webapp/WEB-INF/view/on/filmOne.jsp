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
		<!--  
				1) film 상세
				1-1) film 수정 - /on/modifyFilm
				1-2) film 삭제 - /on/removeFilm (film_category삭제 + film_actor삭제 + film삭제)
				
				2) film_category 리스트
				2-1) film_category 추가 /on/addFilmCategory -> 카테고리 전체 목록에서 선택
				2-2) film_category 삭제 /on/removeFilmCategory
							
				3) film_actor 리스트
				3-1) film_actor 추가 /on/addActorByFilm -> 액터 검색 후 선택
				3-2) film_actor 삭제 /on/removeFileActor
				
		 -->
	<div class="col-sm-10">
    <h2>영화 정보</h2>
    <table class="table table-striped table-bordered">
        <tbody>
        <div>
        	<a href="영화수정"></a>
        	<a href="영화삭제"></a>
        </div>
            <tr>
                <td>제목</td>
                <td>${film.title}</td>
            </tr>
            <tr>
                <td>줄거리</td>
                <td>${film.description}</td>
            </tr>
            <tr>
                <td>출시 연도</td>
                <td>${film.releaseYear}</td>
            </tr>
            <tr>
                <td>길이</td>
                <td>${film.length} 분</td>
            </tr>
            <tr>
                <td>상영등급</td>
                <td>${film.rating}</td>
            </tr>
            <tr>
                <td>언어</td>
                <td>${film.language}</td>
            </tr>
            <tr>
                <td>대여비</td>
                <td>${film.rentalRate} 달러</td>
            </tr>
            <tr>
                <td>대여기간</td>
                <td>${film.rentalDuration} 일</td>
            </tr>
            <tr>
                <td>특별 기능</td>
                <td>${film.specialFeatures}</td>
            </tr>
            <tr>
                <td>마지막 수정일</td>
                <td>${film.lastUpdate}</td>
            </tr>
            <tr>
                <td>대체비용</td>
                <td>${film.replacementCost} 달러</td>
            </tr>
        </tbody>
    </table>
</div>
			
			<div>
				<h2>작품에 출연한 배우들</h2>
				<div>
					<c:forEach var="a" items="${actorList}">
						<div>
							<a href="${pageContext.request.contextPath}/on/actorOne?actorId=${a.actorId}">
								${a.firstName} ${a.lastName}
							</a>
						</div>
					</c:forEach>
					
				</div>
			</div>
		</div>
	</div>
</body>
</html>