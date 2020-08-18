    <%@ page language="java" contentType="text/html; charset=utf-8"
             pageEncoding="utf-8" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
        <%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
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
        <img alt="" src="${path}/image/2.png">
        </body>
        </html>