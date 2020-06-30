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
	<h1></h1>
	<form action="update" method="post">
		<table class="table table-striped" style="width: 400px;">
			<caption>
				<b>글쓰기</b>
			</caption>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="writer" style="width: 100px;" class="form-control input-sm" value="${dto.writer}"></td>
			</tr>

			<tr>
				<th>제목</th>
				<td><input type="text" name="subject" style="width: 300px;" class="form-control input-sm" value="${dto.subject}"></td>

			</tr>

			<tr>
				<td colspan="2"><textarea style="width: 400px; height: 150px;" name="content" class="form-control">${dto.content }
          
          </textarea></td>
			</tr>

			<tr>
				<td colspan="2" align="center">
				<!-- num hidden으로 넘기기 -->
				<input type="hidden" name="num" value="${dto.num }">
					<button type="submit" class="btn btn-info">db수정</button>
				</td>
			</tr>
		</table>

	</form>
</body>
</html>