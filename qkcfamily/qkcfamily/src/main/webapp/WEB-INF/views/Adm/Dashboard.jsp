<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script>
       /* 차후 Google Analytics 기능 사용으로 실제 방문자통계 잡히도록 해볼 수 있어요 */
        // Google 차트 로드
        google.charts.load('current', {'packages':['corechart']});

        // 차트 로드 완료 시 그리기
        google.charts.setOnLoadCallback(drawCharts);

        function drawCharts() {
            drawVisitorsChart();
            drawPageViewsChart();
        }

        function drawVisitorsChart() {
            var data = google.visualization.arrayToDataTable([
                ['날짜', '방문자 수'],
                ['2024-10-01', 100],
                ['2024-10-02', 120],
                ['2024-10-03', 90],
                ['2024-10-04', 110],
                ['2024-10-05', 130],
                ['2024-10-06', 150],
                ['2024-10-07', 170]
            ]);

            var options = {
                title: '일일 방문자 수',
                curveType: 'function',
                legend: { position: 'bottom' },
                height: 300
            };

            var chart = new google.visualization.LineChart(document.getElementById('visitors_chart'));
            chart.draw(data, options);
        }

        function drawPageViewsChart() {
            var data = google.visualization.arrayToDataTable([
                ['날짜', '페이지 조회 수'],
                ['2024-10-01', 300],
                ['2024-10-02', 350],
                ['2024-10-03', 280],
                ['2024-10-04', 300],
                ['2024-10-05', 450],
                ['2024-10-06', 500],
                ['2024-10-07', 600]
            ]);

            var options = {
                title: '일일 페이지 조회 수',
                curveType: 'function',
                legend: { position: 'bottom' },
                height: 300
            };

            var chart = new google.visualization.LineChart(document.getElementById('pageviews_chart'));
            chart.draw(data, options);
        }
    </script>
</head>
<body>
    <div class="container">
        <h1>대시보드</h1>

        <div class="stats">
            <div class="card">
                <h2>1500</h2>
                <p>총 방문자 수</p>
            </div>
            <div class="card">
                <h2>4500</h2>
                <p>총 페이지 조회 수</p>
            </div>
            <div class="card">
                <h2>300</h2>
                <p>활동 중인 유저</p>
            </div>
        </div>

        <div class="chart-container">
            <div id="visitors_chart"></div>
        </div>

        <div class="chart-container">
            <div id="pageviews_chart"></div>
        </div>

        <div class="recent-visitors">
            <h2>최근 방문자</h2>
            <table>
                <tr>
                    <th>날짜</th>
                    <th>IP 주소</th>
                    <th>위치</th>
                </tr>
                <tr>
                    <td>2024-10-07</td>
                    <td>192.168.0.1</td>
                    <td>서울, 대한민국</td>
                </tr>
                <tr>
                    <td>2024-10-07</td>
                    <td>192.168.0.2</td>
                    <td>부산, 대한민국</td>
                </tr>
                <tr>
                    <td>2024-10-06</td>
                    <td>192.168.0.3</td>
                    <td>인천, 대한민국</td>
                </tr>
                <tr>
                    <td>2024-10-06</td>
                    <td>192.168.0.4</td>
                    <td>대구, 대한민국</td>
                </tr>
            </table>
        </div>
    </div>
</body>
</html>