<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

</head>
<body>
<h1>매핑주소로 이동</h1>
<ul>
<li><a href="happy">happy로 이동</a></li>
<li><a href="hello">hello로 이동</a></li>
<li><a href="hello.do">hello.do로 이동</a></li>
<li><a href="nice.do">nice.do로 이동</a></li>
</ul>
<h1>폼 전송-get방식</h1>
<b><a href="myform">입력 폼</a></b>
<h1>여러개의 매핑주소가 하나의 메서드 기능을 수행하고자 할 경우</h1>
<a href="apple">process4.jsp로 이동</a>
<a href="kiwi">process4.jsp로 이동</a>
<a href="orange">process4.jsp로 이동</a>
<br>
<b><a href="score">성적입력</a></b>
</body>
</html>