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
        <a href="${path }/home">Home</a>
        <a href="${path }/info/insertform">입력폼</a>
        <a href="${path }/info/list">My목록</a>
        <a href="${path }/member/insertform">회원가입</a>
        <a href="${path }/member/list">회원목록</a>
        <a href="${path }/login/login">
        <c:if test="${sessionScope.loginok==null }">로그인</c:if>
        <c:if test="${sessionScope.loginok!=null }">로그아웃</c:if>
        </a>
        <c:if test="${sessionScope.loginok!=null }">
            <b style="color: red;">${sessionScope.idok }</b>님이 로그인 중
        </c:if>
        <a href="${path }/board/list">방명록</a>
        <a href="${path }/guest/list">파일입출력방명록</a>&nbsp;&nbsp;&nbsp;&nbsp;
        </body>
        </html>