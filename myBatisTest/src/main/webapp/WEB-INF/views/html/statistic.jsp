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
			  <!-- #BeginDate format:Ko1a -->2020년 8월 31일  12:24 PM<!-- #EndDate -->
			</div>
			<nav>
				<a href="ship">메인</a>
				<a class="on" href="statistic">통계</a> 
				<a href="control-1">로그</a>
			</nav>
	</header>
	<main>
		<section class="top_wrapper02 select_area">
			<div>
				<select>
					<option>일보</option>
					<option>월보</option>
					<option>연보</option>
				</select>
				<input type="date"><button class="btn_blue01">조회</button>
			</div>
			<div><button class="btn_green01">엑셀다운로드</button></div>					
		</section>
		<section class="bottom_wrapper02">
			<section class="condition_sum">
				<div>조회기간 결과</div>
				<div>총 전력 사용량<br><span>5,500</span> kWh</div>
				<div>발전기 발전량<br><span>5,500</span> kWh</div>
				<div>총 배터리 충전량<br><span>5,500</span> kWh</div>
				<div>총 배터리 방전량<br><span>5,500</span> kWh</div>
				<div>총 전력 절감량<br><span>5,500</span> kWh</div>
			</section>
			<section class="top_left short_top">
				<h1>전력사용량 추이</h1>
				<div class="condition">그래프영역</div>
			</section>
			<section class="top_right short_top">
				<h1>발전기 발전량 </h1>
			  	<div class="condition">그래프 영역</div>
			</section>
			<section class="bottom_left short_bottom">
				<h1>전력 절감량 </h1>
				<div class="condition">그래프영역</div>
			</section>
			<section class="bottom_right short_bottom">
				<h1>배터리 충방전량 </h1>
			  	<div class="condition">그래프영역</div>
			</section>
		</section>
	</main>
	
</body>
</html>
