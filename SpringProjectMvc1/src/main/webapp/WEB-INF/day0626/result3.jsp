<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Insert title here</title>
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<body>
<h1>result3 결과값입니다</h1>
<h2>Nice Controller로 부터 포워드 한 값</h2>
<b>날씨: ${weather }<br> 오늘날짜: <fmt:formatDate value="${today }" pattern="yyyy-MM-dd"/></b>

</body>

</html>