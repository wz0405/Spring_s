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
	<form action="${path }/member/update" method="post">
		<table class="table table-hover" style="width: 400px;">
			<caption>[회원수정]</caption>
			<tr>
				<th>회원명</th>
				<td><input type="text" size="10" name="name" value="${dto.name }" class="form-control"></td>
			</tr>
			<tr>
				<th>아이디</th>
				<td><input type="text" size="15" name="id" class="form-control" value="${dto.id }" readonly="readonly"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" size="15" name="pass" value="${dto.pass }" class="form-control"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="hidden" name="num" value="${dto.num }"> <input
						type="submit" value="수정완료" class="btn btn-info"
					> <input type="button" value="회원목록" onclick="location.href='${path }/member/list'" class="btn btn-info"></td>
			</tr>
		</table>
	</form>
</body>
</html>