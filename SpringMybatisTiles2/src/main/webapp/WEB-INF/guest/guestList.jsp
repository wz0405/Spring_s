<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<c:set var="path" value="<%=request.getContextPath()%>"></c:set>
<meta charset="utf-8">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<title>Insert title here</title>
</head>
<body>
	<h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">Image_List</h2>
	<!-- Icon Divider-->
	<div class="divider-custom">
		<div class="divider-custom-line"></div>
		<div class="divider-custom-icon">
			<i class="fas fa-star"></i>
		</div>
		<div class="divider-custom-line"></div>
	</div>
	<section class="page-section" style="text-align: center;">
		<div class="container">


			<c:if test="${sessionScope.loginok!=null }">
				<button type="button" class="btn btn-success btn-sm" style="width: 200px;" onclick="location.href='form'">Image_Board_Upload</button>
			</c:if>

			<br>
			<br>

			<b style="text-align: center;">총 ${totalCount}개의 방명록이 있습니다</b>
			<br>
			<br>
			<b style="text-align: center;">파일 업로드는 로그인 후 사용가능합니다.</b>
			<div>
				<hr width="500" size="3" color="gray">
				<c:forEach var="dto" items="${list }">
					<b>no.${no }</b>
					<br>
					<span style="margin-left: 650px;">추천 <span style="color: red; font-weight: bold;" class="chu">${dto.chu }</span>
					</span>
					<br>

					<c:set var="no" value="${no-1 }" />
					<table style="width: 700px; margin-left: 200px;" >
						<tr>
							<td>작성자: ${dto.writer } 
								<fmt:formatDate value="${dto.writeday }" pattern="yyyy-MM-dd HH:mm" /> <pre>${dto.content }</pre>
								<br> <c:if test="${dto.imagename!='noimage' }">
									<c:forTokens var="myimg" items="${dto.imagename }" delims=",">
										<a href="${path }/save/${myimg}" target="_new"> <img alt="" src="${path }/save/${myimg}"
											style="max-width: 100px; text-align: center;" class="img-rounded"
										> <!-- "img-thumbnail","img-circle","img-rounded" -->
										</a>

									</c:forTokens>
								</c:if>
							</td>
						</tr>
					</table>
					<!-- 수정,삭제 -->
					<span style="margin-left: 350px;">

						<button type="button" class="btn btn-danger" style="width: 60px; margin-left: 300px;"
							onclick="location.href='delete?num=${dto.num}&pageNum=${currentPage}'"
						>삭제</button>
					</span>
					<br>
					<br>
				</c:forEach>
				<!-- 페이징 -->
				<!-- 요기에 페이징처리 -->

				<div style="width: 1000px; text-align: center; margin-left: auto; margin-right: auto;">
					<ul class="pagination">
						<c:if test="${startPage>1 }">
							<li><a href="list?pageNum=${startPage-1}">◀</a></li>
						</c:if>

						<c:forEach var="pp" begin="${startPage }" end="${endPage }">
							<li><c:if test="${pp==currentPage}">
									<a href="list?pageNum=${pp}" style="color: red;">${pp }</a>
								</c:if> <c:if test="${pp!=currentPage}">
									<a href="list?pageNum=${pp}" style="color: black;">${pp }</a>
								</c:if></li>
						</c:forEach>

						<c:if test="${endPage<totalPage }">
							<li><a href="list?pageNum=${endPage+1}">▶</a></li>
						</c:if>


					</ul>
				</div>

			</div>
		</div>
	</section>
</body>
</html>
