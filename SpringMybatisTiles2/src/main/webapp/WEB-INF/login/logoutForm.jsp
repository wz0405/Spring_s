<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
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
<h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">LogIn_Member</h2>
	<!-- Icon Divider-->
			<div class="divider-custom">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon">
					<i class="fas fa-star"></i>
				</div>
				<div class="divider-custom-line"></div>
			</div>
	<section class="page-section" id="contact">
		<div class="container">
			<h2 class="page-section-heading text-uppercase text-secondary mb-0">${name }님이 로그인 중입니다.</h2>
			<br>
			<input type="button" class="btn btn-danger btn-sm" value="로그아웃" onclick="location.href='${path}/login/logout'">
		</div>
	</section>
	<br>

</body>
</html>