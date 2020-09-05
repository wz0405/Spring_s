<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
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
		<a href="ship"><h1>선박 전력 모니터링 시스템<br><span>한국수산과학원</span></h1></a>
			<div class="time">
			  <!-- #BeginDate format:Ko1a -->2020년 8월 27일  12:00 PM<!-- #EndDate -->
			</div>
			<nav>
				<a href="ship">메인</a>
				<a href="statistic">통계</a> 
				<a class="on" href="control-1">로그</a>
			</nav>
	</header>
	<main>
		<section class="top_wrapper03">
			<div class="tabs">
				<ul>
					<li><a href="control-1">계측로그</a></li>
					<li class="on"><a href="control-2">사용량로그</a></li>
				</ul>
			</div>				
		</section>
		<section class="bottom_wrapper03">
			<div class="select_area">
				<select>
					<option>일보</option>
					<option>월보</option>
					<option>연보</option>
				</select>
				<input type="date"> ~ <input type="date"><button class="btn_blue01">조회</button>
		        <button class="btn_green01" style="float: right">엑셀다운로드</button>
			</div>	
			<div class="table_section">  
				<div class="table_wrapper">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
						  <th>No.</th>
						  <th>시간</th>
						  <th>총발전량</th>
						  <th>발전기#1 발전량</th>
						  <th>발전기#2 발전량</th>
						  <th>발전기#3 발전량</th>
						  <th>총 전력사용량</th>
						  <th>어업장비 전력사용량</th>
						  <th>항해장비 전력사용량</th>
						  <th>운영장비 전력사용량</th>
						  <th>배터리 충전량</th>
						  <th>배터리 방전량</th>
						  <th>에너지 절감량</th>
						</tr>
						<tr>
							<td>1</td>
							<td>2020-08-04 10:01:55</td>
							<td>총 발전량</td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>2</td>
							<td>2020-08-03 18:54:12</td>
							<td>총 발전량</td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>3</td>
							<td>2020-08-03 16:44:57</td>
							<td>총 발전량</td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>4</td>
							<td>2020-08-03 12:51:45</td>
							<td>총 발전량</td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>5</td>
							<td>2020-08-03 10:01:55</td>
							<td>총 발전량</td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>6</td>
							<td>2020-08-03 10:01:55</td>
							<td>총 발전량</td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</table>                   
				</div><!--table_wrapper END-->	
				
			</div><!--table_section END-->
		</section>
	</main>
	
</body>
</html>
