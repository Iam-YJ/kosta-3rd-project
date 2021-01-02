<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/Chart.min.js"></script>
</head>

<body>
	<h1>ADMIN의 마이페이지</h1>

	<div style="width: 60%">
		<canvas id="canvas" height="800" width="700"></canvas>
	</div>
	

	<script type="text/javascript">
var randomScalingFactor = function(){ 
	
	console.log(${realProfit});
	//return ${profit}
  

}; 

var jan = ${realProfit[0]}
var feb = ${realProfit[1]}
var mar = ${realProfit[2]}
var apr = ${realProfit[3]}
var may = ${realProfit[4]}
var jun = ${realProfit[5]}
var jul = ${realProfit[6]}
var aug = ${realProfit[7]}
var sep = ${realProfit[8]}
var oct = ${realProfit[9]}
var nov = ${realProfit[10]}
var dec = ${realProfit[11]}

var months = ["January","February","March","April","May","June","July", "August", "September", "October", "November", "December"];
var barChart = null;
var barChartData = {
	labels : ["January","February","March","April","May","June","July", "August", "September", "October", "November", "December"],
	datasets : [
		{
			fillColor : "#28a745",
			strokeColor : "#ffc107",
			highlightFill: "#ffc107",
			highlightStroke: "#ffc107",
			data : [jan, feb, mar, apr, may, jun, jul, aug, sep, oct, nov, dec]
		},
		
	]

}; 



$(function() {
	var ctx = document.getElementById("canvas").getContext("2d");
	barChart = new Chart(ctx).Bar(barChartData, {
		//Boolean - Whether the scale should start at zero, or an order of magnitude down from the lowest value
		scaleBeginAtZero : false,
		//Boolean - Whether grid lines are shown across the chart
		scaleShowGridLines : true,
		//String - Colour of the grid lines
		scaleGridLineColor : "#fff",
		//Number - Width of the grid lines
		scaleGridLineWidth : 5,
		//Boolean - If there is a stroke on each bar
		barShowStroke : false,
		//Number - Pixel width of the bar stroke
		barStrokeWidth : 2,
		//Number - Spacing between each of the X value sets
		barValueSpacing : 5,
		//Number - Spacing between data sets within X values
		barDatasetSpacing : 1,
		onAnimationProgress: function() {
			console.log("onAnimationProgress");
		},
		onAnimationComplete: function() {
			console.log("onAnimationComplete");
		}
	});
});

$("input#btnAdd").on("click", function() {
	barChart.addData(
		[randomScalingFactor(),randomScalingFactor()], 
		months[(barChart.datasets[0].bars.length)%12]
	);
});

$("canvas").on("click", function(e) {
	var activeBars = barChart.getBarsAtEvent(e);
	console.log(activeBars);

	for(var i in activeBars) {
		console.log(activeBars[i].value);
	}
}); 

</script>




</body>
</html>