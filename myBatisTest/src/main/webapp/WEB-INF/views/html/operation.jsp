<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<title>태양광 연계 에너지저장장치 통합 모니터링 시스템</title>
<link rel="stylesheet" type="text/css" href="resources/css/style1.css">
</head>

<body>
	<header>
		<a href="ship"><h1>태양광 연계 에너지저장장치 통합 모니터링 시스템<br><span>수원시 팔달구 SUWON CITY PALDAL-GU</span></h1></a>
			<div class="time">현재시각출력</div>
			<nav>
				<a href="ship">메인</a>
				<a class="on" href="operation">운영</a> 
				<a href="statistic">통계</a> 
				<a href="condition">현황</a> 
				<a href="control-1">관리</a>
			</nav>
	</header>
	<main>
		<section class="top_wrapper01">
			<section class="diagram oper_flow">
				<div class="oper_kepco">
					<p class="title01">한국전력</p>
					<p class="picture"><img src="resources/image/img_kepco.png" alt="한국전력로고"></p>
					<p class="output"><input type="number" class="diagram"> kW</p>
				</div>
				<div class="oper_senior">				
					<p class="title01">노인복지회관</p>
					<p class="picture"><img src="resources/image/img_senior.png" alt="팔달구노인복지회관전경"></p>
					<p class="output"><input type="number" class="diagram"> kW</p>
				</div>
				<div class="oper_ess">
				  <p class="title01">전력저장장치(151kW)</p>
				  <p class="picture"><img src="resources/image/img_ess.png" alt="전력저장장치"></p>
					<p class="output"><input type="number" class="diagram"> kW</p>
				</div>
				<div class="oper_pcs">
				  <p class="title01">전력변환장치(50kW)</p>
				  <p class="picture"><img src="resources/image/img_pcs.png" alt="전력변환장치"></p>
					<p class="output"><input type="number" class="diagram"> kW</p>
				</div>
				<div class="oper_pv">
				  <p class="title01">태양광(31kW)</p>
				  <p class="picture"><img src="resources/image/img_pv.png" alt="태양광"></p>
				</div>
				<div class="oper_ivt">
					<p class="title01">인버터</p>
					<p class="picture"><img src="resources/image/img_ivt.png" alt="인버터"></p>
					<p class="output"><input type="number" class="diagram"> kW</p>
				</div>
				
				<!--한전에서 복지회관-->
				<div class="arrow11 nobg">
					<img src="resources/image/arrow_red_left.png" alt="" class="arrow" id="arrow11">
				</div>
				<div class="arrow12 nobg">
					<img src="resources/image/arrow_red_down.png" alt="" class="arrow" id="arrow12">
				</div>
				<div class="arrow13 nobg">
					<img src="resources/image//arrow_red_right.png" alt="" class="arrow" id="arrow13">
				</div>
								
				<!--PCS에서 ESS-->
				<div class="arrow14 nobg">
					<img src="resources/image/arrow_green_up.png" alt="" class="arrow" id="arrow14">
				</div>
				
				<!--ESS에서 PCS-->
				<div class="arrow14 nobg">
					<img src="resources/image/arrow_green_down.png" alt="" class="arrow" id="arrow14-1">
				</div>			
				
				<!--PV에서 IVT-->
				<div class="arrow10 nobg"></div>
				
				<!--PCS에서  복지회관-->
				<div class="arrow15 nobg">
					<img src="resources/image/arrow_green_left.png" alt="" class="arrow" id="arrow15">
				</div>
				
				<!--복지회관에서 PCS-->
				<div class="arrow15 nobg">
					<img src="resources/image/arrow_green_right.png" alt="" class="arrow" id="arrow15-1">
				</div>
				
				<!--인버터에서 복지회관-->
				<div class="arrow16 nobg">
					<img src="resources/image/arrow_green_right.png" alt="" class="arrow" id="arrow16">
				</div>
				<div class="arrow17 nobg">
					<img src="resources/image/arrow_green_up.png" alt="" class="arrow" id="arrow17">
				</div>
				<div class="arrow18 nobg">
					<img src="resources/image/arrow_green_right.png" alt="" class="arrow" id="arrow18">
				</div>
				<div class="arrow19 nobg">
					<img src="resources/image/arrow_green_down.png" alt="" class="arrow" id="arrow19">
				</div>				
			</section>
			<section class="right_top01">
				<h1>절감정보</h1>
				<table cellpadding="0" cellspacing="0" border="0">
					<tr>
						<th>금일피크</th>
						<td><input class="operation" type="number"> kW</td>
					</tr>
					<tr>
						<th>피크 절감량</th>
						<td><input class="operation" type="number"> kW</td>
					</tr>
				</table>
			</section>
			<section class="right_bottom01">	
				<h1>신재생에너지 공급전력</h1>
				<table cellpadding="0" cellspacing="0" border="0">
					<tr>
						<th>금일 태양광 발전량</th>
						<td><input class="operation" type="number"> kWh</td>
					</tr>
					<tr>
						<th>금일 배터리 방전량</th>
						<td><input class="operation" type="number"> kWh</td>
					</tr>
					<tr>
						<th>금일 절감량</th>
						<td><input class="operation" type="number"> kWh</td>
					</tr>
				</table>
			</section>	
		</section>
		<section class="divider"></section>
		<section class="bottom_wrapper01">
			<section class="left_bottom02">
				<h1>전력 수급 현황</h1>
				<div class="total_state">
					<p>신재생에너지 공급전력</p>
					<p><span>0.2</span>kW</p>
					<br>
					<p>전체 전력 사용량</p>
					<p><span>309.6</span>kW</p>
				</div>
				<div>
					<p><img src="resources/image/img_kepco.png" alt="한국전력로고"></p>
					<p>한국전력</p>
					<p style="margin-top: 44px;"><span>309.2</span>kW</p>
				</div>
				<div>
					<p><img src="resources/image/img_pcs.png" alt="pcs"></p>
					<p>전력변환장치<br>(50kW)</p>
					<p class="last"><span>309.2</span>kW</p>				
				</div>
				<div>
					<p><img src="resources/image/img_ess.png" alt="ess"></p>
					<p>전력저장장치<br>(151kW)</p>
					<p class="last"><span>309.2</span>kW</p>				
				</div>
				<div>
					<p><img src="resources/image/img_pv.png" alt="pv"></p>
					<p>태양광<br>(31kW)</p>
					<p class="last"><span>309.2</span>kW</p>				
				</div>
			</section>
			<section class="right_bottom03">
				<h1>예상전력요금</h1>
				<table cellpadding="0" cellspacing="0" border="0" class="balance">
					<tr>
						<th colspan="2">이번달 사용량</th>
						<th>&nbsp;</th>
						<th colspan="2">이번달 예상요금</th>
					</tr>
					<tr>
						<td colspan="2" class="right">지난 달 대비 <span class="pink">-5,716.34 kWh</span></td>
						<td></td>
						<td colspan="2" class="right">지난 달 대비 <span class="green2">-513,132 원</span></td>
					</tr>
					<tr>
						<td colspan="2" class="right value">8,455 kWh</td>
						<td class="value"></td>
						<td colspan="2" class="right value">3,027,000 원</td>
					</tr>
					<tr>
						<td colspan="5">&nbsp;</td>
					</tr>
					<tr>
						<td width="15%">건물명</td>
						<td width="35%">수원시 팔달구 노인복지회관</td>
						<td></td>
						<td width="15%">계약 요금</td>
						<td width="35%">일반용(갑)I - 고압A:선택 I</td>
					</tr>
					<tr>
						<td width="15%">사용기간</td>
						<td width="35%">2017.08.01~2017.08.31</td>
						<td></td>
						<td width="15%">계약 전력</td>
						<td width="35%">1000kW</td>
					</tr>
					<tr>
						<td width="15%">주소</td>
						<td width="35%">경기도 수원시 팔달구 인계로101번길 1</td>
						<td></td>
						<td width="15%">검침일</td>
						<td width="35%">매월 1일</td>
					</tr>
				</table>
			</section>
		</section>
	</main>
	
	
</body>
</html>
