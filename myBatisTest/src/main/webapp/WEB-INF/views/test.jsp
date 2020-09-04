<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<c:forEach items="${test}" var="test">
		<tr>
			<td>${test.id}</td>
			<td>${test.password}</td>
		</tr>
	</c:forEach>
</body>
</html>