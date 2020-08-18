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
<h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">MemberList</h2>
	<!-- Icon Divider-->
			<div class="divider-custom">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon">
					<i class="fas fa-star"></i>
				</div>
				<div class="divider-custom-line"></div>
			</div>
<button type="button" class="btn btn-info" style="width: 100px; margin-left: 100px;"
        onclick="location.href='${path}/member/insertform'"
>회원가입
</button>
<br>
<br>
<div class="container">
    <table class="table table-bordered" style="margin-left: auto; margin-right: auto; width: 700px;">
        <tr>
            <th>번호</th>
            <th>이름</th>
            <th>아이디</th>
            <th>비밀번호</th>
            <th>가입날짜</th>
            <th>편집</th>
        </tr>
        <c:forEach var="a" items="${list }" varStatus="i">
            <tr>
                <td>${i.count }</td>
                <td>${a.name }</td>
                <td>${a.id }</td>
                <td>${a.pass }</td>
                <td><fmt:formatDate value="${a.gaipday }" pattern="yyyy-MM-dd HH:mm"/></td>
                <td><a href="updateform?num=${a.num }">수정</a><a href="delete?num=${a.num }">삭제</a></td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>