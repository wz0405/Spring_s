<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

</head>
<body>
	<div class="container">
		<form action="update" method="get">
			<table class="table table-hover" style="width: 350px;">
				<tr>
					<th>이름</th>
					<td><input type="text" name="name" size="7" class="control-form" value="${dto.name}"></td>
				</tr>
				<tr>
					<th>나이</th>
					<td><input type="text" name="age" size="5" class="control-form" value="${dto.age}"></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input type="text" name="addr" size="20" class="control-form" value="${dto.addr}"></td>
				</tr>

				<tr>
					<td colspan="2" align="center"><input type="submit" value="저장" class="btn btn-danger"> <input
							type="button" value="목록" onclick="location.href='list'" class="btn btn-danger"
						>
						<input type="hidden" name="num" value="${dto.num }"></td>
				</tr>
			</table>
		</form>

	</div>
</body>
</html>