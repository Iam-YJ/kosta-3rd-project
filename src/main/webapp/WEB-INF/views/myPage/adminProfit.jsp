<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.bundle.js"></script>

</head>

<body>
	<h1>ADMIN의 마이페이지</h1>
	
	<canvas id="myChart" width="400" height="400"></canvas>

<script>
$(document).ready(function(){
        var time_Array = ["0, 2020-12-29"];
        var meas_value_Array = function(){ return ${dayProfit.realpay} };


        //console.log(time_Array);
        //console.log(meas_value_Array);

        var ctx = document.getElementById ('myChart').getContext('2d');
        var myChart = new Chart(ctx, {
        type: 'line',
        data: {
        labels: time_Array,
        datasets: [{
        label: '풉킷',
        data: meas_value_Array,
        backgroundColor: "rgba(255,153,0,0.4)"
        }]
        },

            options: {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero:true
                    }
                }],
                xAxes: [{
                    type: 'time',
                    time: {
                        parser: 'YYYY-MM-DD HH:mm:ss',
                        unit: 'minute',
                        displayFormats: {
                            'minute': 'YYYY-MM-DD HH:mm',
                            'hour': 'YYYY-MM-DD HH:mm'
                        }
                    },
                    ticks: {
                        source: 'data'
                    }
                }]                    
            }
        }
    });
});
</script>
	
	
</body>
</html>