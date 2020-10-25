<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript" src="dashboard/mainDashBoard.js"></script>

<sql:query var="t_users_rs" dataSource="jdbc/yjfb">
	SELECT SUM(visit_num) FROM visit;
</sql:query>

<sql:query var="t_bd_rs" dataSource="jdbc/yjfb">
	SELECT COUNT(*) FROM board;
</sql:query>

<sql:query var="t_cm_rs" dataSource="jdbc/yjfb">
	SELECT COUNT(*) FROM comment;
</sql:query>

<sql:query var="t_rep_rs" dataSource="jdbc/yjfb">
	SELECT COUNT(*) FROM report;	
</sql:query>

<sql:query var="chart_visit_rs" dataSource="jdbc/yjfb">
	SELECT visit_num FROM visit WHERE visit_date >= DATE_SUB(CURDATE(), interval 6 day);
</sql:query>

<sql:query var="chart_page_view_rs" dataSource="jdbc/yjfb">
	SELECT view_num FROM page_view WHERE view_date >= DATE_SUB(CURDATE(), interval 6 day);
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

<sql:query var="new_bd_rs" dataSource="jdbc/yjfb">
	SELECT board_id, board_title, board_content FROM board;
</sql:query>

<sql:query var="new_com_rs" dataSource="jdbc/yjfb">
	SELECT c.com_id, m.mem_nickname, c.com_content FROM member m JOIN comment c ON m.mem_id = c.com_mem_id;
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
				<a href="memberManagement.do" class="stretched-link"></a>
				<div class="col-5" style="background-color: #5cb85c">
					<i class="fa fa-calendar-check-o fa-5x ml-1" style="padding-top: 35px;"></i>
				</div>
				<div class="col-7">
					<div class="card-body">
						<p class="card-text">TOTAL</p>
						<h4 class="card-title"><fmt:formatNumber value="${ t_users_rs.rowsByIndex[0][0] }" type="number"/></h4>
						<p class="card-text">사용자</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-xl-3 col-lg-6 col-md-6 col-sm-6 col-xs-12 mb-3">
		<div class="row no-gutters">
			<div class="card w-100 flex-row text-center" style="height: 150px;">
				<a href="contentsManagement.do?search=board&sort=recent" class="stretched-link"></a>
				<div class="col-5" style="background-color: #4CB1CF">
					<i class="fa fa-list-alt fa-5x ml-1" style="padding-top: 35px;"></i>
				</div>
				<div class="col-7">
					<div class="card-body">
						<p class="card-text">TOTAL</p>
						<h4 class="card-title"><fmt:formatNumber value="${ t_bd_rs.rowsByIndex[0][0] }" type="number"/></h4>
						<p class="card-text">게시판</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-xl-3 col-lg-6 col-md-6 col-sm-6 col-xs-12 mb-3">
		<div class="row no-gutters">
			<div class="card w-100 flex-row text-center" style="height: 150px;">
				<a href="contentsManagement.do?search=board&sort=recent" class="stretched-link"></a>
				<div class="col-5" style="background-color: #f0ad4e">
					<i class="fa fa-comment-o fa-5x ml-1" style="padding-top: 35px;"></i>
				</div>
				<div class="col-7">
					<div class="card-body">
						<p class="card-text">TOTAL</p>
						<h4 class="card-title"><fmt:formatNumber value="${ t_cm_rs.rowsByIndex[0][0] }" type="number"/></h4>
						<p class="card-text">댓글</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-xl-3 col-lg-6 col-md-6 col-sm-6 col-xs-12 mb-3">
		<div class="row no-gutters">
			<div class="card w-100 flex-row text-center" style="height: 150px;">
				<a href="report.do" class="stretched-link"></a>
				<div class="col-5" style="background-color: #F0433D">
					<i class="fa fa-fire fa-5x ml-1" style="padding-top: 35px;"></i>
				</div>
				<div class="col-7">
					<div class="card-body" style="padding-top: 35px;">
						<h4 class="card-title"><fmt:formatNumber value="${ t_rep_rs.rowsByIndex[0][0] }" type="number"/></h4>
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
				backgroundColor: 'rgba(255, 99, 132)',
				borderColor: 'rgba(255, 99, 132)',
				data: visits
			}, {
				label: '페이지 뷰',
				backgroundColor: 'rgba(54, 162, 235)',
				borderColor: 'rgba(54, 162, 235)',
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
				text: '최근 방문자 현황'
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
		
		var barChartData = {
			labels: dates,
	        datasets: [{
	            label: '게시판',
	            data: boards,
	            backgroundColor: 'rgba(255, 159, 64, 0.2)',
	            borderColor: 'rgba(255, 159, 64, 1)',
	            borderWidth: 1
	        }, {
	            label: '댓글',
	            data: comments,
	            backgroundColor: 'rgba(153, 102, 255, 0.2)',
	            borderColor: 'rgba(153, 102, 255, 1)',
	            borderWidth: 1
	        }],
		}
		
		var barChartOpt = {
			type: 'bar',
		    data: barChartData,
			title: {
				display: true,
				text: '최근 콘텐츠 현황'
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
			<div class="bg-danger">
				<table class="table table-hover table-danger table-sm mb-0">
					<caption class="text-warning"><i class="fa fa-list fa-2x ml-2"></i> 새 게시글</caption>
					<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">제목</th>
							<th scope="col">내용</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="new_bds" items="${ new_bd_rs.rowsByIndex }">
						<tr onclick="location.href = 'contentsManagement.do?search=board&sort=recent#${ new_bds[0] }'" class="hov">
							<th scope="row"><c:out value="${ new_bds[0] }" /></th>
							<th>${ new_bds[1] }</th>
							<th><span class="new_bds">${ new_bds[2] }</span></th>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<div class="col-xl-4 col-md-12 mb-3 overflow-auto">
		<div class="text-center bg-success" style="height: 250px;">
			<div class="bg-success">
				<table class="table table-hover table-success table-sm mb-0">
					<caption class="text-warning"><i class="fa fa-comment fa-2x ml-2"></i> 새 댓글</caption>
					<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">닉네임</th>
							<th scope="col">내용</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="new_coms" items="${ new_com_rs.rowsByIndex }">
						<tr onclick="location.href = 'contentsManagement.do?search=comment&sort=recent#${ new_coms[0] }'" class="hov">
							<th scope="row"><c:out value="${ new_coms[0] }" /></th>
							<th>${ new_coms[1] }</th>
							<th><span class="new_bds">${ new_coms[2] }</span></th>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-md-4 col-sm-6 col-xs-12 mb-3">
		<div class="bg-dark d-flex flex-column text-center text-light">
			<i class="fa fa-id-badge fa-5x mt-2"></i>
			<c:forEach var="my_info" items="${ applicationScope }">
				<c:catch>
					<c:if test="${ Integer.parseInt(my_info.key) == sessionScope.YJFBID_ADMIN_SES }">
					<span>${ my_info.value.admin_name }</span>
					<span class="mb-2">${ my_info.value.mem_email }</span>
					<hr>
					<table class="table table-borderless text-white table-sm">
						<tr>
							<th scope="col">위임일</th>
							<td>${ my_info.value.admin_reg_date }</td>
						</tr>
						<tr>
							<th scope="row">사용 닉네임</th>
							<td>${ my_info.value.mem_nickname }</td>
						</tr>
						<tr>
							<th scope="row">활동 레벨</th>
							<td>${ my_info.value.mem_level }</td>
						</tr>
					</table>
				</c:if>
				</c:catch>
			</c:forEach>
		</div>
	</div>
	<div class="col-md-4 col-sm-6 col-xs-12 mb-3">
		<h3 class="font-weight-bold p-3">접속중인 관리자</h3>
		<div id="visitors">
			<jsp:include page="visitor.jsp" />
		</div>
	</div>
	<div id="memo_div" class="col-xl-4 col-xs-12 mb-3">
		<jsp:include page="memo.jsp" />
	</div>
</div>