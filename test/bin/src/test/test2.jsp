<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<style>

select[id=selectType] { outline:none;min-width:30px;padding:0px;height:30px;line-height:30px;display:inline-block;vertical-align:middle;padding-left:15px;padding-right:35px;background-color:white;border-radius:4px;border:1px solid #d4d4d4;background-image:url('../img/sd.png'); background-repeat:no-repeat;background-position:center right;position:relative;overflow:visible; }
select[id=selectType]:hover { background-image:url('../img/sd_s.png');background-color:#20488d;color:white;cursor:pointer; }

input[name=hhh]{ outline:none;min-width:30px;padding:0px;height:30px;line-height:30px;display:inline-block;vertical-align:middle;padding-left:15px;padding-right:10px;background-color:white;border-radius:4px;border:1px solid #d4d4d4;background-image:url('../img/sd.png'); background-repeat:no-repeat;background-position:center right;position:relative;overflow:visible; }
input[name=hhh]:hover{ background-image:url('../img/sd_s.png');background-color:#20488d;color:white;cursor:pointer; }

</style>

<div class="close_second3"><img src="${contextPath}/resources/new/img/close.png" align="absmiddle" style="width:8px;display:inline-block;" id="sec_close"><img src="${contextPath}/resources/new/img/open.png" align="absmiddle" style="width:8px;display:none;" id="sec_open"></div>
<div class="second_depth3">
		<div class="time">
			<div id="ymdd">0000-00-00  일</div>
			<span><div id="time">00:00:00</div></span>
		</div>
		<div class="scroll-wrapper wrapper scrollbar-dynamic overflow-y" style="position: relative;">
		<div class="wrapper scrollbar-dynamic overflow-y scroll-content scroll-scrolly_visible" style="height: auto; max-height: 572px;">
			<div class="second_depth_contents">
			
				<div class="second_depth_contents_cell">
					<span class="title">조회기간 결과</span><br>
					<div class="box">
						<div class="fifty hundred text-align-left">
							총 전력 사용량
							<br><br>
							<img src="${contextPath}/resources/new/img/p_01.png" class="absmiddle">
							<b class="egg_yellow"><font id="totalAmiPower"></font><span style="float:right">&nbsp;&nbsp;kWh</span></b><br><br>
							
						</div>
						
					</div>
					<div class="box">
						<div class="fifty hundred text-align-left">
							총 태양광 발전량
							<br><br>
							<img src="${contextPath}/resources/new/img/p_02.png" class="absmiddle">	
							<b class="egg_yellow"><font id="totalPvPower"></font><span style="float:right">&nbsp;&nbsp;kWh</span></b><br><br>
						</div>
						
					</div>
					<div class="box">
						<div class="fifty border-right">
							<img src="${contextPath}/resources/new/img/ban.png" style="margin-right:3px;"><br>
							<b class="egg_yellow2"><font id="totalBatChargePower"></font><span style="float:right">kWh&nbsp;&nbsp;</span></b>
						</div>
						<div class="fifty">
							<img src="${contextPath}/resources/new/img/ban_02.png" style="margin-left:3px;"><br>
							<b class="egg_yellow2"><font id="totalBatDischargePower"></font><span style="float:right">kWh&nbsp;&nbsp;</span></b>
						</div>
					</div>
					<div class="box">
						<div class="fifty hundred text-align-left">
							총 전력 절감량
							<br><br>
							<img src="${contextPath}/resources/new/img/strash.png" class="absmiddle">
							<b class="egg_yellow2"><font id="totalEcoChargePower"></font><span style="float:right">&nbsp;&nbsp;kWh&nbsp;</span></b><br>
						</div>
						
					</div>
				</div><br>
				
			</div>
		</div>
			<div class="scroll-element scroll-x scroll-scrolly_visible">
				<div class="scroll-element_outer"><div class="scroll-element_size"></div>
				<div class="scroll-element_track"></div>
				<div class="scroll-bar" style="width: 89px;"></div>
				</div>
			</div>
			<div class="scroll-element scroll-y scroll-scrolly_visible">
				<div class="scroll-element_outer">
					<div class="scroll-element_size">
					</div><div class="scroll-element_track">
					</div>
					<div class="scroll-bar" style="height: 544px; top: 0px;"></div>
				</div>
			</div>
		</div>
	</div>
	<!-- mainWarp 시작 -->
<div class="main_wrap">
		<div>
			<select id="selectType">
				<option value="day">일보</option>
				<option value="month">월보</option>
				<option value="year">연보</option>
			</select>
			<input type="date" id="dateValue" name="hhh">
			<img src="${contextPath}/resources/new/img/p_blue.png" class="absmiddle" id="btnSearch" style="cursor:pointer;">조회
		 	 <img src="${contextPath}/resources/new/img/p_blue_02.png" class="absmiddle" id="excelButton" style="cursor:pointer;">다운로드
			
		</div>
		
	<br>
		<div class="clear_both"></div>
		<div class="left_dist">
			<div class="graph_50_left4">
				<span class="color_07">전력사용량 추이</span> 
				<img src="${contextPath}/resources/new/img/pink_kw.png"  id="legend1_1" class="kw1">
				<img src="${contextPath}/resources/new/img/map_02.png"  id="legend1_2" style="float:right;cursor:pointer;margin-top:40px;margin-right:10px;">
				<br/><br/><br/><br/>
				<div class="graph_canvas7" id="amiPowerChart"></div>
			</div>
			<div class="graph_50_left4">
				<span class="color_02">태양광(272kW) 발전량</span> 
				<img src="${contextPath}/resources/new/img/kw_02.png" id="legend2" class="kw1">
				<div class="graph_canvas1" id="pvPowerChart"></div>
			</div>
		</div>
		<div class="left_dist">
			<div class="graph_50_right4">
				<span class="color_03">Re-use 배터리  충/방전량</span> <img src="${contextPath}/resources/new/img/green_battery.png" class="absmiddle">
				<img src="${contextPath}/resources/new/img/kw_03.png" id="legend3" class="kw1">
				<div class="graph_canvas8" id="batPowerChart"></div>
				
				
			</div>
			<div class="graph_50_right4">
				<span class="color_04">New 배터리  충/방전량</span> <img src="${contextPath}/resources/new/img/blue_battery.png" class="absmiddle">
				<img src="${contextPath}/resources/new/img/kw_04.png" id="legend4" class="kw1">
				<div class="graph_canvas8" id="batPowerChart2"></div>
			</div>
			<div class="graph_50_right4">
				<span class="color_08">전력절감량</span> 
				<img src="${contextPath}/resources/new/img/green_kw.png" id="legend5" class="kw1">
				<div class="graph_canvas1" id="ecoPowerChart"></div>
			</div>
			</div>
</div><!-- main Wrap 끝-->

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
