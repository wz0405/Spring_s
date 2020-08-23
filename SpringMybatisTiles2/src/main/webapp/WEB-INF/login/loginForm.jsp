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
	<section class="page-section" id="contact">
		<h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">LogIn</h2>
		<!-- Icon Divider-->
		<div class="divider-custom">
			<div class="divider-custom-line"></div>
			<div class="divider-custom-icon">
				<i class="fas fa-star"></i>
			</div>
			<div class="divider-custom-line"></div>
		</div>
		<div class="container">
			<form action="loginproc" method="post">
				<div class="control-group">
					<div class="form-group floating-label-form-group controls mb-0 pb-2">
						<label>ID</label>
						<c:if test="${save=='yes' }">
							<input class="form-control" name="id" type="text" placeholder="ID" required="required" value="${id }" />
						</c:if>
						<c:if test="${save=='no' }">
							<input type="text" name="id" size="10" placeholder="아이디" required="required" class="form-control">
						</c:if>
						&nbsp;
						<input type="checkbox" name="idsave" ${save=='yes'?"checked":"" }>
						아이디저장

						<p class="help-block text-danger"></p>

					</div>
				</div>

				<div class="control-group">
					<div class="form-group floating-label-form-group controls mb-0 pb-2">
						<label>Password</label>
						<input class="form-control" name="pass" type="password" placeholder="Password" required="required" />
						<p class="help-block text-danger"></p>
					</div>
				</div>






				<input type="submit" value="로그인" class="btn btn-danger">
				<input type="button" value="회원가입" onclick="location.href='${path }/member/insertform'" class="btn btn-danger">

			</form>
		</div>

	</section>
</body>
</html>