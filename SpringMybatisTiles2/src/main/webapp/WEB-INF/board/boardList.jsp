<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>

<head>

    <c:set var="path" value="<%=request.getContextPath()%>"></c:set>
    <meta charset="utf-8">
    <title>Insert title here</title>
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

</head>
<body>
<h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">Board</h2>
	<!-- Icon Divider-->
			<div class="divider-custom">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon">
					<i class="fas fa-star"></i>
				</div>
				<div class="divider-custom-line"></div>
			</div>

    
    <h3 style="text-align: center;">총<strong>${totalCount}</strong>개의 글이 있습니다</h3>

<br>
<div>
    <button class="btn btn-danger btn-sm" style="width: 100px; margin-left: 100px;"
            onclick="location.href='${path}/board/writeform'"
    >글쓰기
    </button>
</div>
<table class="table table-bordered" style="margin-left: auto; margin-right: auto; width: 700px;">

    <tr>
        <th style="width: 60px;">번호</th>
        <th style="width: 300px;">제목</th>
        <th style="width: 80px;">작성자</th>
        <th style="width: 60px;">조회</th>
        <th style="width: 120px;">작성일</th>
    </tr>
    <c:forEach var="dto" items="${list }">
        <tr>
            <td align="center">${no }</td>
            <c:set var="no" value="${no-1}"/>
            <td><a href="content?num=${dto.num }&pageNum=${currentPage}">${dto.subject }</a></td>
            <td align="center">${dto.writer }</td>
            <td align="center">${dto.readcount }</td>
            <td align="center"><fmt:formatDate value="${dto.writeday }" pattern="yyyy-MM-dd HH:mm"/></td>


        </tr>
    </c:forEach>

</table>
<!-- 요기에 페이징처리 -->

<div style="width: 1000px; text-align: center; margin-left: auto; margin-right: auto;">
    <ul class="pagination">
        <c:if test="${startPage>1 }">
            <li><a href="list?pageNum=${startPage-1}">◀</a></li>
        </c:if>

        <c:forEach var="pp" begin="${startPage }" end="${endPage }">
            <li><c:if test="${pp==currentPage}">
                <a href="list?pageNum=${pp}" style="color: red;">${pp }</a>
            </c:if> <c:if test="${pp!=currentPage}">
                <a href="list?pageNum=${pp}" style="color: black;">${pp }</a>
            </c:if></li>
        </c:forEach>

        <c:if test="${endPage<totalPage }">
            <li><a href="list?pageNum=${endPage+1}">▶</a></li>
        </c:if>


    </ul>
</div>


</body>

</html>