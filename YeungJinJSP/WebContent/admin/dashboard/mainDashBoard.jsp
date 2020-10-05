<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<sql:query var="t_users_rs" dataSource="jdbc/yjfb">
	SELECT visit_num FROM visit WHERE DATE_FORMAT(visit_date, '%y-%m-%d') = DATE_FORMAT(now(), '%y-%m-%d');
</sql:query>

<sql:query var="t_bd_rs" dataSource="jdbc/yjfb">
	SELECT COUNT(*) FROM board WHERE DATE_FORMAT(board_date, '%y-%m-%d') = DATE_FORMAT(now(), '%y-%m-%d');
</sql:query>

<sql:query var="t_cm_rs" dataSource="jdbc/yjfb">
	SELECT COUNT(*) FROM comment WHERE DATE_FORMAT(com_date, '%y-%m-%d') = DATE_FORMAT(now(), '%y-%m-%d');
</sql:query>

<sql:query var="t_rep_rs" dataSource="jdbc/yjfb">
	SELECT COUNT(*) FROM report;	
</sql:query>

<div class="row">
	<div class="col-12">
		<h2 class="border-bottom pb-3">Dashboard<small class="ml-3 text-secondary">notice your app data</small></h2>
	</div>
</div>
<div class="row">
	<div class="col-xl-3 col-lg-6 col-md-6 col-sm-6 col-xs-12 mb-3">
		<div class="row no-gutters">
			<div class="card w-100 flex-row text-center" style="height: 150px;">
				<a href="#" class="stretched-link"></a>
				<div class="col-5" style="background-color: #5cb85c">
					<i class="fa fa-calendar-check-o fa-5x ml-1" style="padding-top: 35px;"></i>
				</div>
				<div class="col-7">
					<div class="card-body">
						<p class="card-text">TODAY</p>
						<h4 class="card-title">${ t_users_rs.rowsByIndex[0][0] }</h4>
						<p class="card-text">사용자</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-xl-3 col-lg-6 col-md-6 col-sm-6 col-xs-12 mb-3">
		<div class="row no-gutters">
			<div class="card w-100 flex-row text-center" style="height: 150px;">
				<a href="#" class="stretched-link"></a>
				<div class="col-5" style="background-color: #4CB1CF">
					<i class="fa fa-list-alt fa-5x ml-1" style="padding-top: 35px;"></i>
				</div>
				<div class="col-7">
					<div class="card-body">
						<p class="card-text">TODAY</p>
						<h4 class="card-title">${ t_bd_rs.rowsByIndex[0][0] }</h4>
						<p class="card-text">게시판</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-xl-3 col-lg-6 col-md-6 col-sm-6 col-xs-12 mb-3">
		<div class="row no-gutters">
			<div class="card w-100 flex-row text-center" style="height: 150px;">
				<a href="#" class="stretched-link"></a>
				<div class="col-5" style="background-color: #f0ad4e">
					<i class="fa fa-comment-o fa-5x ml-1" style="padding-top: 35px;"></i>
				</div>
				<div class="col-7">
					<div class="card-body">
						<p class="card-text">TODAY</p>
						<h4 class="card-title">${ t_cm_rs.rowsByIndex[0][0] }</h4>
						<p class="card-text">댓글</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-xl-3 col-lg-6 col-md-6 col-sm-6 col-xs-12 mb-3">
		<div class="row no-gutters">
			<div class="card w-100 flex-row text-center" style="height: 150px;">
				<a href="#" class="stretched-link"></a>
				<div class="col-5" style="background-color: #F0433D">
					<i class="fa fa-fire fa-5x ml-1" style="padding-top: 35px;"></i>
				</div>
				<div class="col-7">
					<div class="card-body" style="padding-top: 35px;">
						<h4 class="card-title">${ t_rep_rs.rowsByIndex[0][0] }</h4>
						<p class="card-text">신고</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="row">
<div class="col-xl-6 col-md-12">
	<canvas id="canvas1"></canvas>
	<script>
		var lineChartData = {
			labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
			datasets: [{
				label: 'My First dataset',
				fill: false,
				backgroundColor: ['rgba(255, 99, 132, 0.2)'],
				borderColor: ['rgba(255, 99, 132, 0.2)'],
				data: [
					{ x: 10, y: 100 },
					{ x: 20, y: 20 },
					{ x: 30, y: 25 },
					{ x: 40, y: 50 },
					{ x: 50, y: 40 },
					{ x: 60, y: 20 },
					{ x: 70, y: 90 },
				],
				yAxisID: 'y-axis-1',
			}, {
				label: 'My Second dataset',
				backgroundColor: ['rgba(54, 162, 235, 0.2)'],
				borderColor: ['rgba(54, 162, 235, 0.2)'],
				fill: false,
				data: [
					{ x: 10, y: 70 },
					{ x: 20, y: 30 },
					{ x: 30, y: 40 },
					{ x: 40, y: 70 },
					{ x: 50, y: 50 },
					{ x: 60, y: 30 },
					{ x: 70, y: 60 },
				],
				yAxisID: 'y-axis-2'
			}]
		};

		window.onload = function() {
			var ctx = document.getElementById('canvas1').getContext('2d');
				window.myLine = Chart.Line(ctx, {
					data: lineChartData,
					options: {
						responsive: true,
						hoverMode: 'index',
						stacked: false,
						title: {
							display: true,
							text: 'Chart.js Line Chart - Multi Axis'
						},
						scales: {
							yAxes: [{
								type: 'linear', // only linear but allow scale type registration. This allows extensions to exist solely for log scale for instance
								display: true,
								position: 'left',
								id: 'y-axis-1',
							}, {
								type: 'linear', // only linear but allow scale type registration. This allows extensions to exist solely for log scale for instance
								display: true,
								position: 'right',
								id: 'y-axis-2',
	
								// grid line settings
								gridLines: {
									drawOnChartArea: false, // only want the grid lines for one axis to show up
								},
							}],
						}
					}
				});
			};
		</script>
	</div>
	<div class="col-xl-6 col-md-12">
		<canvas id="myChart"></canvas>
		<script>
		var ctx = document.getElementById('myChart').getContext('2d');
		var myChart = new Chart(ctx, {
		    type: 'bar',
		    data: {
		        labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
		        datasets: [{
		            label: '# of Votes',
		            data: [12, 19, 3, 5, 2, 3],
		            backgroundColor: [
		                'rgba(255, 99, 132, 0.2)',
		                'rgba(54, 162, 235, 0.2)',
		                'rgba(255, 206, 86, 0.2)',
		                'rgba(75, 192, 192, 0.2)',
		                'rgba(153, 102, 255, 0.2)',
		                'rgba(255, 159, 64, 0.2)'
		            ],
		            borderColor: [
		                'rgba(255, 99, 132, 1)',
		                'rgba(54, 162, 235, 1)',
		                'rgba(255, 206, 86, 1)',
		                'rgba(75, 192, 192, 1)',
		                'rgba(153, 102, 255, 1)',
		                'rgba(255, 159, 64, 1)'
		            ],
		            borderWidth: 1
		        }]
		    },
		    options: {
		        scales: {
		            yAxes: [{
		                ticks: {
		                    beginAtZero: true
		                }
		            }]
		        }
		    }
		});
		</script>
	</div>
</div>