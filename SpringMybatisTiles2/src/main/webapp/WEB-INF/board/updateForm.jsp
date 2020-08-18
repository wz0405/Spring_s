<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<c:set var="path" value="<%=request.getContextPath()%>"></c:set>
<meta charset="utf-8">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<title>Insert title here</title>
</head>
<body>
	<h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">Write_Board</h2>
	<!-- Icon Divider-->
			<div class="divider-custom">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon">
					<i class="fas fa-star"></i>
				</div>
				<div class="divider-custom-line"></div>
			</div>
			<form action="update" method="post">


				<table class="table table-striped" style="margin-left: auto; margin-right: auto; width: 400px;">

					<tr>
						<th>Writer</th>
						<td><input type="text" name="writer" class="form-control" value="${dto.writer }"></td>
					</tr>

					<tr>
						<th>Subject</th>
						<td><input type="text" name="subject" class="form-control" value="${dto.subject }"></td>
					</tr>
					<tr>
						<td colspan="2"><textarea rows="10" cols="40" name="content" class="form-control">${dto.content }

         </textarea></td>
					</tr>

					<tr>
						<td colspan="2" align="center"><input type="hidden" name="num" value="${dto.num }"> <input
								type="hidden" name="pageNum" value="${pageNum }"
							>
							<button class="btn btn-default " type="submit">edit</button></td>
					</tr>
				</table>
			</form>
	
</body>
</html>
