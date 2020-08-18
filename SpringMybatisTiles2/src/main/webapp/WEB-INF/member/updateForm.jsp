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
	<h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">회원정보 수정</h2>
	<!-- Icon Divider-->
	<div class="divider-custom">
		<div class="divider-custom-line"></div>
		<div class="divider-custom-icon">
			<i class="fas fa-star"></i>
		</div>
		<div class="divider-custom-line"></div>
	</div>
	<div class="row">
		<div class="col-lg-8 mx-auto">

			<form action="${path }/member/update" method="post">
				<div class="control-group">
					<div class="form-group floating-label-form-group controls mb-0 pb-2">
						<label>Member Name</label>
						<input class="form-control" name="name" type="text" placeholder="Name" required="required" value="${dto.name }" />
						<p class="help-block text-danger"></p>
					</div>
				</div>
				<div class="control-group">
					<div class="form-group floating-label-form-group controls mb-0 pb-2">
						<label>Member ID</label>
						<input class="form-control" name="id" type="text" placeholder="ID" value="${dto.id }" required="required"
							readonly="readonly"
						/>
						<p class="help-block text-danger"></p>
					</div>
				</div>
				<div class="control-group">
					<div class="form-group floating-label-form-group controls mb-0 pb-2">
						<label>Member Password</label>
						<input class="form-control" name="pass" type="text" placeholder="Password" value="${dto.pass }" required="required" />
						<p class="help-block text-danger"></p>
					</div>
				</div>


				<input type="hidden" name="num" value="${dto.num }">
				<input type="submit" value="수정완료" class="btn btn-info">
				<input type="button" value="회원목록" onclick="location.href='${path }/member/list'" class="btn btn-info">

			</form>
		</div>
	</div>
</body>
</html>