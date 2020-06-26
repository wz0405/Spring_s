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
<b>성적을 입력하세요.</b>
	<form action="action" method="post">

		이름 :<input type="text" name="name" size="10">
		<br>
		자바 :<input type="text" name="java" size="10">
		<br>
		jsp :<input type="text" name="jsp" size="10">
		<br>
		spring :<input type="text" name="spring" size="10">
		<br>

		<button type="submit">전송</button>
	</form>
</body>
</html>