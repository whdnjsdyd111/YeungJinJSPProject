<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<sql:query var="t_users_rs" dataSource="jdbc/yjfb">
	SELECT visit_num FROM visit WHERE visit_date = CURDATE();
</sql:query>

<sql:query var="t_bd_rs" dataSource="jdbc/yjfb">
	SELECT COUNT(*) FROM board WHERE DATE(board_date) = CURDATE();
</sql:query>

<sql:query var="t_cm_rs" dataSource="jdbc/yjfb">
	SELECT COUNT(*) FROM comment WHERE DATE(com_date) = CURDATE();
</sql:query>

<sql:query var="t_rep_rs" dataSource="jdbc/yjfb">
	SELECT COUNT(*) FROM report;	
</sql:query>

<sql:query var="chart_visit_rs" dataSource="jdbc/yjfb">
	SELECT visit_num FROM visit WHERE visit_date >= DATE_SUB(CURDATE(), interval 7 day);
</sql:query>

<sql:query var="chart_page_view_rs" dataSource="jdbc/yjfb">
	SELECT view_num FROM page_view WHERE view_date >= DATE_SUB(CURDATE(), interval 7 day);
</sql:query>

<sql:query var="chart_boards_rs" dataSource="jdbc/yjfb">
	CALL dates_from_board;
</sql:query>

<sql:query var="chart_comments_rs" dataSource="jdbc/yjfb">
	CALL dates_from_comments;
</sql:query>

<sql:query var="new_mem_rs" dataSource="jdbc/yjfb">
	SELECT mem_email, mem_nickname FROM member WHERE mem_date > '2020-08-01';
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
<script>
	var dates = [];

	<c:forEach var="date" items="${ dates }">
		dates.push('<c:out value="${ date }" />');
	</c:forEach>
	
	var visits = [];
	
	<c:forEach begin="0" end="6" step="1" var="i">
		visits.push('<c:out value="${ chart_visit_rs.rowsByIndex[i][0] }" />');
	</c:forEach>
	
	var page_views = [];
	
	<c:forEach begin="0" end="6" step="1" var="i">
		page_views.push('<c:out value="${ chart_page_view_rs.rowsByIndex[i][0] }" />');
	</c:forEach>
	
	var boards = [];
	
	<c:forEach begin="0" end="6" step="1" var="i">
		boards.push('<c:out value="${ chart_boards_rs.rowsByIndex[i][0] }" />');
	</c:forEach>	
	
	var comments = [];
	
	<c:forEach begin="0" end="6" step="1" var="i">
		comments.push('<c:out value="${ chart_comments_rs.rowsByIndex[i][0] }" />');
	</c:forEach>
</script>
<div class="row">
	<div class="col-xl-6 col-md-12 mb-3">
		<canvas id="memCanvas"></canvas>
		<script>
		var lineChartData = {
			labels: dates,
			datasets: [{
				label: '방문자 수',
				fill: false,
				backgroundColor: ['rgba(255, 99, 132)'],
				borderColor: ['rgba(255, 99, 132)'],
				data: visits
			}, {
				label: '페이지 뷰',
				backgroundColor: ['rgba(54, 162, 235)'],
				borderColor: ['rgba(54, 162, 235)'],
				fill: false,
				data: page_views
			}]
		};
		
		var lineChartOpt = {
			responsive: true,
			hoverMode: 'index',
			stacked: false,
			title: {
				display: true,
				text: '방문자 현황'
			},
			scales: {
				yAxes: [{
	                ticks: {
	                    beginAtZero: true
	                }
	            }]
			}
		};

		var mem_ctx = document.getElementById('memCanvas').getContext('2d');
		window.myLine = Chart.Line(mem_ctx, {
			type: 'line',
			data: lineChartData,
			options: lineChartOpt
		});
			
		</script>
	</div>
	<div class="col-xl-6 col-md-12 mb-3">
		<canvas id="contentsCanvas"></canvas>
		<script>
		var contents_ctx = document.getElementById('contentsCanvas').getContext('2d');
		
		var purple_trans = [];
		var purple = [];
		
		var orange_trans = [];
		var orange = [];
		
		for (let i = 0; i < 7; i++) {
			purple_trans.push('rgba(255, 159, 64, 0.2)');
			purple.push('rgba(255, 159, 64, 1)');
			orange_trans.push('rgba(153, 102, 255, 0.2)');
			orange.push('rgba(153, 102, 255, 1)');
		}
		
		var barChartData = {
			labels: dates,
	        datasets: [{
	            label: '게시판',
	            data: boards,
	            backgroundColor: purple_trans,
	            borderColor: purple,
	            borderWidth: 1
	        }, {
	            label: '댓글',
	            data: comments,
	            backgroundColor: orange_trans,
	            borderColor: orange,
	            borderWidth: 1
	        }],
		}
		
		var barChartOpt = {
			type: 'bar',
		    data: barChartData,
			title: {
				display: true,
				text: '콘텐츠 현황'
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
		}
		
		window.myBar = new Chart(contents_ctx, {
			type: 'bar',
			data: barChartData,
			options: barChartOpt
		});
		</script>
	</div>
</div>
<div class="row">
	<div class="col-xl-4 col-md-12 mb-3 overflow-auto">
		<div class="text-center bg-dark" style="height: 250px;">
			<div class="table-responsive" style="word-break: keep-all;">
				<table class="table table-striped table-dark table-borderless table-sm">
					<caption class="text-warning"><i class="fa fa-user-circle fa-2x ml-2"></i> 새 회원</caption>
					<thead>
						<tr>
							<th scope="col">#</th>
							<th scope="col">이메일</th>
							<th scope="col">닉네임</th>
						</tr>
					</thead>
					<tbody>
					<c:set var="mem_num" value="${ 1 }" />
					<c:forEach var="new_mem" items="${ new_mem_rs.rowsByIndex }">
						<tr>
							<th scope="row"><c:out value="${ mem_num }" /></th>
							<th>${ new_mem[0] }</th>
							<th>${ new_mem[1] }</th>
						</tr>
						<c:set var="mem_num" value="${ mem_num + 1 }" />
					</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<div class="col-xl-4 col-md-12 mb-3 overflow-auto">
		<div class="text-center bg-danger" style="height: 250px;">
			<div class="table-responsive" style="word-break: keep-all;">
				<table class="table table-striped table-danger table-borderless table-sm">
					<caption class="text-warning"><i class="fa fa-user-circle fa-2x ml-2"></i> 새 게시글</caption>
					<thead>
						<tr>
							<th scope="col">#</th>
							<th scope="col">이메일</th>
							<th scope="col">닉네임</th>
						</tr>
					</thead>
					<tbody>
					<c:set var="mem_num" value="${ 1 }" />
					<c:forEach var="new_mem" items="${ new_mem_rs.rowsByIndex }">
						<tr>
							<th scope="row"><c:out value="${ mem_num }" /></th>
							<th>${ new_mem[0] }</th>
							<th>${ new_mem[1] }</th>
						</tr>
						<c:set var="mem_num" value="${ mem_num + 1 }" />
					</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<div class="col-xl-4 col-md-12 mb-3 overflow-auto">
		<div class="text-center bg-success" style="height: 250px;">
			<div class="table-responsive" style="word-break: keep-all;">
				<table class="table table-striped table-success table-borderless table-sm">
					<caption class="text-warning"><i class="fa fa-user-circle fa-2x ml-2"></i> 새 댓글</caption>
					<thead>
						<tr>
							<th scope="col">#</th>
							<th scope="col">이메일</th>
							<th scope="col">닉네임</th>
						</tr>
					</thead>
					<tbody>
					<c:set var="mem_num" value="${ 1 }" />
					<c:forEach var="new_mem" items="${ new_mem_rs.rowsByIndex }">
						<tr>
							<th scope="row"><c:out value="${ mem_num }" /></th>
							<th>${ new_mem[0] }</th>
							<th>${ new_mem[1] }</th>
						</tr>
						<c:set var="mem_num" value="${ mem_num + 1 }" />
					</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>