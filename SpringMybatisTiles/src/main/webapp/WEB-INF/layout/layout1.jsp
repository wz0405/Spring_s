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
<style type="text/css">
#top { /* id가 top */
	position: absolute;
	left: 300px;
	top: 10px;
	width: 400px;
	height: 50px;
	text-align: center;
}

#menu {
	position: absolute;
	left: 200px;
	top: 250px;
	width: 700px;
	height: 70px;
	text-align: center;
}

#body {
	position: absolute;
	left: 250px;
	top: 500px;
	width: 1200px;
	height: 500px;
	padding-left: 200px;
}

#bottom {
	position: absolute;
	left: 200px;
	top: 900px;
	width: 700px;
	height: 80px;
	text-align: center;
}
</style>
</head>
<body>
	<div id="top">
		<tiles:insertAttribute name="header" />
	</div>
	<div id="menu">
		<tiles:insertAttribute name="menu" />
	</div>
	<div id="body">
		<tiles:insertAttribute name="body" />
	</div>
	<div id="bottom">
		<tiles:insertAttribute name="bottom" />
	</div>
</body>
</html>