<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
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
<div class="container">
    <form action="loginproc" method="post">
        <table class="table table-hover" style="width: 300px;">
            <caption>세션로그인</caption>
            <tr>
                <th>아이디</th>
                <td><c:if test="${save=='yes' }">
                    <!-- 아이디 저장여부 체크 -->
                    <input type="text" name="id" size="10" placeholder="아이디" required="required" class="form-control"
                           value="${id }">
                </c:if> <c:if test="${save=='no' }">
                    <input type="text" name="id" size="10" placeholder="아이디" required="required" class="form-control">
                </c:if>&nbsp; <input type="checkbox" name="idsave" ${save=='yes'?"checked":"" }>아이디저장
                </td>
            </tr>
            <tr>
                <th>비밀번호</th>
                <td><input type="password" name="pass" size="10" placeholder="비밀번호" required="required"
                           class="form-control">
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center"><input type="submit" value="로그인" class="btn btn-danger"> <input
                        type="button" value="회원가입" onclick="location.href='${path }/member/insertform'"
                        class="btn btn-danger"
                ></td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>