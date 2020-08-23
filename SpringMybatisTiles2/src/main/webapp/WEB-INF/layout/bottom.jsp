
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
	<footer class="footer text-center">
		<div class="container">
			<div class="row">
				<!-- Footer Location-->
				<div class="col-lg-4 mb-5 mb-lg-0">
					<h4 class="text-uppercase mb-4">Location</h4>
					<p class="lead mb-0">
						Seoul
						<br />
						Dongjak-Gu
					</p>
				</div>
				<!-- Footer Social Icons-->
				<div class="col-lg-4 mb-5 mb-lg-0">
					<h4 class="text-uppercase mb-4">Around the Web</h4>
					<a class="btn btn-outline-light btn-social mx-1" href="https://github.com/wz0405"><i
						class="fab fa-fw fa-github"
					></i></a> <a class="btn btn-outline-light btn-social mx-1" href="https://www.instagram.com/h.hyunhee/"><i
						class="fab fa-fw fa-instagram"
					></i></a> <a class="btn btn-outline-light btn-social mx-1" href="https://wz0405.tistory.com"><i
						class="fab fa-fw fa-dribbble"
					></i></a>
				</div>
				<!-- Footer About Text-->
				<div class="col-lg-4">
					<h4 class="text-uppercase mb-4">About 꼬마자갈</h4>
					<p class="lead mb-0">원활한 커뮤니케이션이 개발자의 가장 중요한 덕목이라 생각하는 개발자 한현희입니다.</p>
				</div>
			</div>
		</div>
	</footer>
</body>
</html>