<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<title>선박 전력 모니터링 시스템</title>
<link rel="stylesheet" type="text/css" href="resources/css/style1.css">
</head>

<body>
	<header>
		<a href="ship"><h1>
				선박 전력 모니터링 시스템<br>
				<span>한국수산과학원</span>
			</h1></a>
		<div class="time">
			<!-- #BeginDate format:Ko1a -->
			2020년 8월 27일 12:00 PM
			<!-- #EndDate -->
		</div>
		<nav>
			<a href="ship">메인</a> <a href="statistic">통계</a> <a class="on"
				href="control-1">로그</a>
		</nav>
	</header>
	<main>
		<section class="top_wrapper03">
			<div class="tabs">
				<ul>
					<li class="on"><a href="control-1">계측로그</a></li>
					<li><a href="control-2">사용량로그</a></li>
				</ul>
			</div>
		</section>
		<section class="bottom_wrapper03">
			<div class="select_area">
				<select>
					<option>발전기#1</option>
					<option>발전기#2</option>
					<option>발전기#3</option>
					<option>어업장비</option>
					<option>항해장비</option>
					<option>운영장비</option>
					<option>배터리</option>
				</select> <input type="date"> ~ <input type="date">
				<button class="btn_blue01">조회</button>
				<button class="btn_green01" style="float: right">엑셀다운로드</button>
			</div>
			<div class="table_section">
				<div class="table_wrapper">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<th>No.</th>
							<th>시간</th>
							<th>발전기상태</th>
							<th>발전기구분</th>
							<th>전압</th>
							<th>전류</th>
							<th>Power</th>
							<th>Energy(계측값)</th>
							<th>Energy(누적값)</th>
						</tr>
						<c:forEach items="${test}" var="test">
							<tr>
								<td>${test.id}</td>
								<td>${test.password}</td>
								<td>${test.id}</td>
								<td>${test.password}</td>
								<td>${test.id}</td>
								<td>${test.password}</td>
								<td>${test.id}</td>
								<td>${test.password}</td>
								<td>${test.id}</td>
					
								
							</tr>
						</c:forEach>
					</table>
				</div>
				<!--table_wrapper END-->
				<div class="table_wrapper">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<th>No.</th>
							<th>시간</th>
							<th>전력사용상태</th>
							<th>부하그룹구분</th>
							<th>전압</th>
							<th>전류</th>
							<th>Power(유효전력)</th>
							<th>Energy(유효전력량_계측값)</th>
							<th>Energy(누적값)</th>
						</tr>
						<tr>
							<td>1</td>
							<td>2020-08-04 18:11:25</td>
							<td>ON/OFF(전류로판단)</td>
							<td>어업장비</td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>2</td>
							<td>2020-08-04 12:01:55</td>
							<td>ON/OFF(전류로판단)</td>
							<td>항해장비</td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>3</td>
							<td>2020-08-04 10:01:55</td>
							<td>ON/OFF(전류로판단)</td>
							<td>운영장비</td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>4</td>
							<td>2020-08-03 12:01:55</td>
							<td>ON/OFF(전류로판단)</td>
							<td>어업장비</td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>5</td>
							<td>2020-08-03 10:01:55</td>
							<td>ON/OFF(전류로판단)</td>
							<td>어업장비</td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</table>
				</div>
				<!--table_wrapper END-->

				<div class="table_wrapper">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<th>No.</th>
							<th>시간</th>
							<th>배터리상태</th>
							<th>전압</th>
							<th>전류</th>
							<th>Power(유효전력)</th>
						</tr>
						<tr>
							<td>1</td>
							<td>2020-08-04 18:11:25</td>
							<td>충전/방전(전류로판단)</td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>2</td>
							<td>2020-08-04 12:01:55</td>
							<td>충전/방전(전류로판단)</td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>3</td>
							<td>2020-08-04 10:01:55</td>
							<td>충전/방전(전류로판단)</td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>4</td>
							<td>2020-08-03 12:01:55</td>
							<td>충전/방전(전류로판단)</td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>5</td>
							<td>2020-08-03 10:01:55</td>
							<td>충전/방전(전류로판단)</td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</table>
				</div>
				<!--table_wrapper END-->

			</div>
			<!--table_section END-->
		</section>
	</main>

</body>
</html>
