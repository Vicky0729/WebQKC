<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>대시보드</title>
<style>
body {
	font-family: Pretendard-Regular, Arial, sans-serif;
	background-color: #f4f4f4;
	margin: 0;
	padding: 0;
}

.container {
	max-width: 1200px;
	margin: 0 auto;
	padding: 20px;
}

h1 {
	text-align: center;
	margin-bottom: 20px;
}

.stats {
	display: flex;
	gap: 20px;
	margin-bottom: 20px;
}

.card {
	background: white;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	flex: 1;
	text-align: center;
}

.card h2 {
	font-size: 2em;
	margin-bottom: 10px;
}

.chart-container {
	margin-bottom: 20px;

}

.chart-container>div {
	width: 100% !important;
}

.recent-visitors {
	background: white;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.recent-visitors table {
	width: 100%;
	border-collapse: collapse;
}

.recent-visitors th, .recent-visitors td {
	padding: 10px;
	border: 1px solid #ddd;
	text-align: left;
}

.recent-visitors th {
	background-color: #f8f8f8;
}
</style>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
        let dailyVisitors = [];
        
        // 일일 방문자 데이터 파싱
        try {
            dailyVisitors = JSON.parse('${dailyVisitors}'.replace(/&quot;/g, '"'));
        } catch (e) {
            console.error("Failed to parse dailyVisitors JSON:", e);
        }
        
        // 월별 방문자 데이터 파싱
        try {
            monthlyVisitors = JSON.parse('${monthlyVisitors}'.replace(/&quot;/g, '"'));
        } catch (e) {
            console.error("Failed to parse monthlyVisitors JSON:", e);
        }

        
        google.charts.load('current', {'packages':['corechart']});
        google.charts.setOnLoadCallback(drawCharts);

        function drawCharts() {
            drawVisitorsChart();
            drawPageViewsChart();
        }

        function drawVisitorsChart() {
            const dataArr = [['날짜', '방문자 수']];
            dailyVisitors.forEach(item => {
                dataArr.push([item.date, item.count]);
            });

            const data = google.visualization.arrayToDataTable(dataArr);
            const options = {
                title: '일일 방문자 수',
                curveType: 'function',
                legend: { position: 'bottom' },
                height: 300,
                width: '100%' 
            };
            const chart = new google.visualization.LineChart(document.getElementById('visitors_chart'));
            chart.draw(data, options);
        }

        function drawPageViewsChart() {

        	const dataArr = [['월', '방문자 수']];
            monthlyVisitors.forEach(item => {
                dataArr.push([item.month, item.count]);
            });

            const data = google.visualization.arrayToDataTable(dataArr);

            const options = {
                title: '월별 방문자 수',
                curveType: 'function',
                legend: { position: 'bottom' },
                height: 300,
                width: '100%' 
            };

            const chart = new google.visualization.LineChart(document.getElementById('monthly_visitors_chart'));
            chart.draw(data, options);
        
        }
    </script>
</head>
<body>
	<div class="container">
		<h1>대시보드</h1>

		<div class="stats">
			<div class="card">
				<h2>${visitCount}</h2>
				<p>오늘 총 방문자 수</p>
			</div>
			<div class="card">
				<h2>${totalVisitors}</h2>
				<p>웹사이트 누적 방문자 수</p>
			</div>
			<div class="card">
				<h2>${adminNum}</h2>
				<p>관리자 수</p>
			</div>
		</div>

		<div class="chart-container">
			<div id="visitors_chart"></div>
		</div>

		<div class="chart-container">
			<div id="monthly_visitors_chart"></div>
		</div>
	</div>
</body>
</html>
