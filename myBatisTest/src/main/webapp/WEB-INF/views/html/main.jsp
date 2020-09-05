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
			  <!-- #BeginDate format:Ko1a -->2020년 8월 31일  12:58 PM<!-- #EndDate -->
			</div>
			<nav>
				<a class="on" href="ship">메인</a>
				<a href="statistic">통계</a> 
				<a href="control-01">로그</a>
			</nav>
	</header>
	<main>
		<section class="top_wrapper01">
			<section class="diagram ship_flow">
				<div class="generator01">
					<div class="title01">발전기#1</div>
					<div class="picture"><img src="resources/image/img_generator.png" alt=""></div>
					<div class="output"><div class="diagram"></div> kW</div>
				</div>
				<div class="generator02">
					<div class="title01">발전기#2</div>
					<div class="picture"><img src="resources/image/img_generator.png" alt=""></div>
					<div class="output"><div class="diagram"></div> kW</div>
				</div>
				<div class="generator03">				
					<div class="title01">발전기#3</div>
					<div class="picture"><img src="resources/image/img_generator.png" alt=""></div>
					<div class="output"><div class="diagram"></div> kW</div>
				</div>
				<div class="ess">
				  	<div class="title01">전력저장장치(30kWh)</div>
				  	<div class="picture"><img src="resources/image/img_ess.png" alt="전력저장장치"></div>
				</div>
				<div class="ivt">
					<div class="title01">인버터(30kW)</div>
					<div class="picture"><img src="resources/image/img_ivt.png" alt="인버터"></div>
					<div class="output"><div class="diagram"></div> kW</div>
				</div>
				<div class="equipt01">
				 	<div class="title01">어업장비</div>
				  	<div class="picture"><img src="resources/image/img_equipt.png" alt="어업장비"></div>
					<div class="output"><div class="diagram"></div> kW</div>
				</div>
				<div class="equipt02">
					  <div class="title01">운영장비</div>
					  <div class="picture"><img src="resources/image/img_equipt.png" alt="운영장비"></div>
					<div class="output"><div class="diagram"></div> kW</div>
				</div>
				<div class="equipt03">
					  <div class="title01">항해장비</div>
					  <div class="picture"><img src="resources/image/img_equipt.png" alt="항해장비"></div>
					<div class="output"><div class="diagram"></div> kW</div>
				</div>
				
				
				<!--line-->
				<div class="arrow00 nobg">
					<img src="resources/image/arrow_green_right.png" alt="" class="arrow" id="arrow00">
				</div>
				
				<!--발전기-->
				<div class="arrow01 nobg">
					<img src="resources/image/arrow_red_right.png" alt="" class="arrow" id="arrow01">
				</div>
				<div class="arrow02 nobg">
					<img src="resources/image/arrow_red_right.png" alt="" class="arrow" id="arrow02">
				</div>
				<div class="arrow03 nobg">
					<img src="resources/image/arrow_red_right.png" alt="" class="arrow" id="arrow03">
				</div>						
				<!--발전기에서 line-->
				<div class="arrow04 nobg">
					<img src="resources/image/arrow_red_down.png" alt="" class="arrow" id="arrow04">
				</div>
				
				
				<!--장비-->
				<div class="arrow05 nobg">
					<img src="resources/image/arrow_red_left.png" alt="" class="arrow" id="arrow05">
				</div>
				<div class="arrow06 nobg">
					<img src="resources/image/arrow_red_left.png" alt="" class="arrow" id="arrow06">
				</div>
				<div class="arrow07 nobg">
					<img src="resources/image/arrow_red_left.png" alt="" class="arrow" id="arrow07">
				</div>				
				<!--장비에서 line-->
				<div class="arrow08 nobg">
					<img src="resources/image/arrow_red_down.png" alt="" class="arrow" id="arrow08">
				</div>

				<!--ESS에서 방전중일때-->
				<!--ESS에서 IVT-->
				<div class="arrow09 nobg">
					<img src="resources/image/arrow_green_down.png" alt="" class="arrow" id="arrow09">
				</div>	
				<!--IVT에서 LINE-->				
				<div class="arrow10 nobg">
					<img src="resources/image/arrow_green_down.png" alt="" class="arrow" id="arrow10">
				</div>	
				
				<!--
				ESS로 충전중일때
				IVT에서 ESS
				<div class="arrow11 nobg">
					<img src="resources/image/arrow_red_up.png" alt="" class="arrow" id="arrow11">
				</div>	
				LINE에서 IVT				
				<div class="arrow12 nobg">
					<img src="resources/image/arrow_red_up.png" alt="" class="arrow" id="arrow12">
				</div>		
				-->
								
		
				
				
			</section>
			
			<section class="right01">
				<div>
					<h1>현재 발전량</h1>
					<p><span class="orange">13,252</span>kWh</p>
				</div>
			</section>
			<section class="right02">			
				<div>
					<h1>전력사용량</h1>
					<p><span class="blue">13,252</span>kWh</p>
					<table class="ship_table" cellspacing="5">
						<tr>
							<th colspan="2">어업장비</th>
							<th colspan="2">운영장비</th>
							<th colspan="2">항해장비</th>						
						</tr>
						<tr>
							<td class="box_result">888,888</td>
							<td>kWh</td>
							<td class="box_result">888,888</td>
							<td>kWh</td>
							<td class="box_result">888,888</td>
							<td>kWh</td>					
						</tr>
					</table>
				</div>
			</section>
			<section class="right03">
				<div>
					<h1>이차전지 사용량</h1>
					<p><span class="green">13,252</span>kWh</p>
				</div>
			</section>	
			<section class="right04">			
				<div>
					<h1>발전기가동상태</h1>
					<table class="ship_table" cellspacing="5">
						<tr>
							<th>발전기#1</th>
							<th>발전기#2</th>
							<th>발전기#3</th>						
						</tr>
						<tr>
							<td class="box_result center">ON</td>
							<td class="box_result center">OFF</td>
							<td class="box_result center">OFF</td>
						</tr>
					</table>
				</div>
			</section>
		</section>
	</main>
	
	
</body>
</html>
