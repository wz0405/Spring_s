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
<script type="text/javascript">
	// 차트 Data
	var xData;
	var xDatas;
	var xDatas1;
	var xData1;
	var viewDatas;
	var searchedDate;
	var searchedType;
	var timerInfo = null;
	
	$(document).ready(function() {
		
		$('#main_menu_01').attr('src', '${contextPath}/resources/new/img/main_menu_01_icon_unsel.png');
		$('#main_menu_02').attr('src', '${contextPath}/resources/new/img/main_menu_02_icon_unsel.png');
		$('#main_menu_03').attr('src', '${contextPath}/resources/new/img/main_menu_03_icon_sel.png');
		$('#main_menu_04').attr('src', '${contextPath}/resources/new/img/main_menu_04_icon_unsel.png');
		$('#main_03').addClass("main_menu_active");
		$('#main_01').removeClass("main_menu_active");
		$('#main_02').removeClass("main_menu_active");
		$('#main_04').removeClass("main_menu_active");
		
		if(timerInfo != null) { clearInterval(timerInfo); }
		setDateValue();
		totalPowerChart();
	});
	
	
	// 조회 버튼
	$("#btnSearch").click(function() {
		$('#amiPowerChart').empty();
		$('#pvPowerChart').empty();
		$('#ecoPowerChart').empty();
		$('#batPowerChart').empty();
		$('#batPowerChart2').empty();
		
		totalPowerChart();
	});
	
	function getToday() {
		var today = new Date();
		return today.getFullYear() + "-" + numberUtils.leadingZeros((today.getMonth() + 1), 2)  + "-" + numberUtils.leadingZeros(today.getDate(), 2);
	}
	
	function setDateValue() {
		$('#dateValue').val(getToday());
	}
	
	// 화면의 4개 Chart View
	function totalPowerChart() {		
		var totalAmiPower = 0;
		var totalPvPower = 0;
		var totalBatChargePower= 0;
		var totalBatDischargePower = 0;
		var totalEcoChargePower = 0;
		
		searchedDate= $('#dateValue').val();
		searchedType = $("#selectType option:selected").val();
		
		$.ajax({
			type: "get",
			url: "${contextPath}/condition/rest/getChartData/" + searchedDate + "/" + searchedType,
			contentType: 'application/json',
			dataType: "json",
			success: function (json) {
				var amiPowerList = json.amiPowerList;
				var amiPowerListPrev = json.amiPowerListPrev;
				var pvPowerList = json.pvPowerList;
				var pcsPowerList1 = json.pcsPowerList1;
				var pcsPowerList2 = json.pcsPowerList2;   // Reuse
				
				// 전력사용량 추이 차트
				initializeChartData();
				$.each(amiPowerList, function (index, data) {
					xData = [data.regDate, data.activePowerAmount];
					xDatas.push(xData);
					totalAmiPower += data.activePowerAmount;
				});
				$.each(amiPowerListPrev, function (index, data) {
					xData1 = [data.regDate, data.activePowerAmount];
					xDatas1.push(xData1);
				});
				viewDatas = [xDatas, xDatas1];
				drawChartLine("amiPowerChart", viewDatas, "#dda0dd", "#f6794d");
				
				// 태양광 발전량 차트
				initializeChartData();
				$.each(pvPowerList, function (index, data) {
					xData = [data.regDate, data.todayPowerAmount];
					xDatas.push(xData);
					totalPvPower += data.todayPowerAmount;
				});
				viewDatas = [xDatas];
				if(searchedType == "month"){
					drawChart2("pvPowerChart", viewDatas, "#f6794d");
				}else{
					drawChart("pvPowerChart", viewDatas, "#f6794d");
				}
				
				// 배터리 충방전량 차트
				initializeChartData();
				$.each(pcsPowerList2, function (index, data) {
					xData = [data.regDate, data.charge];
					xDatas.push(xData);
					xData1 = [data.regDate, (data.discharge * -1)];
					xDatas1.push(xData1);
					totalBatChargePower += data.charge;
					totalBatDischargePower += data.discharge;
				});
				viewDatas = [xDatas, xDatas1];
				if(searchedType == "day" || searchedType == "month"){
					drawChart2("batPowerChart", viewDatas, "#30be66", "#c52611");
				}else{
					drawChart("batPowerChart", viewDatas, "#30be66", "#c52611");
				}

				// 배터리 충방전량 차트 아래
				initializeChartData();
				$.each(pcsPowerList1, function (index, data) {
					xData = [data.regDate, data.charge];
					xDatas.push(xData);
					xData1 = [data.regDate, (data.discharge * -1)];
					xDatas1.push(xData1);
					totalBatChargePower += data.charge;
					totalBatDischargePower += data.discharge;
				});
				viewDatas = [xDatas, xDatas1];
				if(searchedType == "day" || searchedType == "month"){
					drawChart2("batPowerChart2", viewDatas, "#1088ff", "#c52611");
				}else{
					drawChart("batPowerChart2", viewDatas, "#1088ff", "#c52611");
				}
				

				// 전력 절감량 차트
				totalEcoChargePower = totalPvPower + totalBatDischargePower;
				initializeChartData();
				for(var i=0; i<pvPowerList.length; i++){
					xData = [pvPowerList[i].regDate, (pvPowerList[i].todayPowerAmount + pcsPowerList1[i].discharge + pcsPowerList2[i].discharge)];
					xDatas.push(xData);
				}
				viewDatas = [xDatas];
				if(searchedType == "month"){
					drawChart2("ecoPowerChart", viewDatas, "#a3bf59");
				}else{
					drawChart("ecoPowerChart", viewDatas, "#a3bf59");
				}
				
				
				// 조회기간 결과
				$("#totalAmiPower").text(numberUtils.addComma(Math.round(totalAmiPower)));
				$("#totalPvPower").text(numberUtils.addComma(Math.round(totalPvPower)));
				$("#totalBatChargePower").text(numberUtils.addComma(Math.round(totalBatChargePower)));
				$("#totalBatDischargePower").text(numberUtils.addComma(Math.round(totalBatDischargePower)));
				$("#totalEcoChargePower").text(numberUtils.addComma(Math.round(totalEcoChargePower)));
				
				// 전력사용량추이 범례 수정
				if(searchedType == "day"){
					//$('#legend1_1').attr('src', '${contextPath}/resources/new/img/pink_kw_hour.png');
					$('#legend1_2').attr('src', '${contextPath}/resources/new/img/map_03_hour.png');
					//$('#legend2').attr('src', '${contextPath}/resources/new/img/kw_022_hour.png');
					//$('#legend3').attr('src', '${contextPath}/resources/new/img/kw_02_hour.png');
					//$('#legend4').attr('src', '${contextPath}/resources/new/img/kw_03_hour.png');
					//$('#legend5').attr('src', '${contextPath}/resources/new/img/kw_03_hour.png');
				} else if(searchedType == "month"){
					//$('#legend1_1').attr('src', '${contextPath}/resources/new/img/pink_kw_day.png');
					$('#legend1_2').attr('src', '${contextPath}/resources/new/img/map_03_day.png');
					//$('#legend2').attr('src', '${contextPath}/resources/new/img/kw_022_day.png');
					//$('#legend3').attr('src', '${contextPath}/resources/new/img/kw_02_day.png');
					//$('#legend4').attr('src', '${contextPath}/resources/new/img/kw_03_day.png');
					//$('#legend5').attr('src', '${contextPath}/resources/new/img/kw_03_day.png');
				} else if(searchedType == "year"){
					//$('#legend1_1').attr('src', '${contextPath}/resources/new/img/pink_kw_month.png');
					$('#legend1_2').attr('src', '${contextPath}/resources/new/img/map_03_month.png');
					//$('#legend2').attr('src', '${contextPath}/resources/new/img/kw_022_month.png');
					//$('#legend3').attr('src', '${contextPath}/resources/new/img/kw_02_month.png');
					//$('#legend4').attr('src', '${contextPath}/resources/new/img/kw_03_month.png');
					//$('#legend5').attr('src', '${contextPath}/resources/new/img/kw_03_month.png');
				}
			},
			error : function(request, status, error) {
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	}
	
	// 초기화
	function initializeChartData() {
		xData = [];
		xDatas = [];
		xDatas1 = [];
		xData1 = [];
		viewDatas = [];
	}
	
	// Chart 그리기
	function drawChart(chartName, viewDatas, color1, color2) {
		 $.jqplot(chartName, viewDatas, {
			animate: true,
			animateReplot: true,
			seriesDefaults: {
				renderer:$.jqplot.BarRenderer,
                rendererOptions: { fillToZero: true },
				pointLabels: { show: true },
                showMarker:false
			},
			negativeSeriesColors:[color1, color2],
			series: [{color: color1}, {color: color2}],
			axesDefaults: {
				tickRenderer: $.jqplot.CanvasAxisTickRenderer,
				rendererOptions: { 
	                drawBaseline: false
	            }
			},
			axes: {
				xaxis: {
					renderer: $.jqplot.CategoryAxisRenderer,
					tickOptions: {
				        showGridline: false,
				        formatString: "%'d"
					}
				},
				yaxis: {
					tickOptions: {
						formatString: "%'d  "
					}
				}
			},
			grid: {
	            drawGridLines: false,
	            shadow: false,
	            borderWidth: 0,
	            background: '#FFFFFF',
	            lastPropertyConvenience: 0
			},
			highlighter: {
				show: true
			}
		});
	}
	
	// Chart 그리기
	function drawChart2(chartName, viewDatas, color1, color2) {
		 $.jqplot(chartName, viewDatas, {
			animate: true,
			animateReplot: true,
			seriesDefaults: {
				renderer:$.jqplot.BarRenderer,
                rendererOptions: { fillToZero: true, barWidth: 5 },
				pointLabels: { show: true },
                showMarker:false
			},
			negativeSeriesColors:[color1, color2],
			series: [{color: color1}, {color: color2}],
			axesDefaults: {
				tickRenderer: $.jqplot.CanvasAxisTickRenderer,
				rendererOptions: { 
	                drawBaseline: false
	            }
			},
			axes: {
				xaxis: {
					renderer: $.jqplot.CategoryAxisRenderer,
					tickOptions: {
				        showGridline: false,
				        formatString: "%'d"
					}
				},
				yaxis: {
					tickOptions: {
						formatString: "%'d  "
					}
				}
			},
			grid: {
	            drawGridLines: false,
	            shadow: false,
	            borderWidth: 0,
	            background: '#FFFFFF',
	            lastPropertyConvenience: 0
			},
			highlighter: {
				show: true
			}
		});
	}
	
	// LineChart 그리기
	function drawChartLine(chartName, viewDatas, color1, color2) {
		 $.jqplot(chartName, viewDatas, {
			animate: true,
			animateReplot: true,
			seriesDefaults: {
				renderer:$.jqplot.LineRenderer,
                rendererOptions: { fillToZero: true },
				pointLabels: { show: true },
                showMarker:false
			},
			negativeSeriesColors:[color1, color2],
			series: [{color: color1}, {color: color2}],
			axesDefaults: {
				tickRenderer: $.jqplot.CanvasAxisTickRenderer,
				rendererOptions: {
	                drawBaseline: false
	            }
			},
			axes: {
				xaxis: {
					renderer: $.jqplot.CategoryAxisRenderer,
					tickOptions: {
				        showGridline: false,
				        formatString: "%'d"
					}
				},
				yaxis: {
					tickOptions: {
						formatString: "%'d  "
					}
				}
			},
			grid: {
	            drawGridLines: false,
	            shadow: false,
	            borderWidth: 0,
	            background: '#FFFFFF',
	            lastPropertyConvenience: 0
			},
			highlighter: {
				show: true
			}
		});
	}
	
	// 엑셀다운로드
	$('#excelButton').click( function() {
		location.href = '${contextPath}/condition/rest/excelDownload/' + searchedDate + "/" + searchedType;
	});
</script>

</html>


