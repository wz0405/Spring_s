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

</head>
<body>
<form action="up" method="post" enctype="multipart/form-data">
    <table class="table table-bordered" style="width: 400px;">
        <caption>글쓰기</caption>
        <tr>
            <th>작성자</th>
            <td><input type="text" name="writer" class="form-control input-sm" style="width: 100px;"
                       value="${dto.writer}"></td>
        </tr>
        <tr>
            <th>사진</th>
            <td><input type="file" name="photo" class="form-control input-sm" style="width: 300px;"></td>
        </tr>

        <tr>
            <td colspan="2"><textarea style="width: 400px; height: 150px;" class="form-control"
                                      name="content">${dto.content}</textarea></td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input type="hidden" name="num" value="${dto.num }">

                <button type="submit" class="btn btn-sm btn-danger">db수정</button>
            </td>
        </tr>
    </table>

</form>
</body>
</html>