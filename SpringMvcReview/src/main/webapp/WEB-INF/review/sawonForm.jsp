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
	<h2>사원입력 폼</h2>
	<form action="action" method="post">
		이름:<input type="text" name="name"><br> 급여:<input type="text" name="pay"><br> 나이:<input
			type="text" name="age"
		><br> 혈액형:<input type="text" name="blood"> <input type="submit">

	</form>
</body>
</html>