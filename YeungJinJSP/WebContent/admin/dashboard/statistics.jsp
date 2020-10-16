<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<sql:query var="mem_rs" dataSource="jdbc/yjfb">
	SELECT * FROM visit;
</sql:query>

<sql:query var="page_view_rs" dataSource="jdbc/yjfb">
	SELECT * FROM page_view;
</sql:query>

<sql:query var="board_rs" dataSource="jdbc/yjfb">
	SELECT DATE_FORMAT(board_date, '%H') AS hour, COUNT(*) FROM board GROUP BY hour ORDER BY hour ASC;
</sql:query>

<sql:query var="comment_rs" dataSource="jdbc/yjfb">
	SELECT DATE_FORMAT(com_date, '%H') AS hour, COUNT(*) FROM comment GROUP BY hour ORDER BY hour ASC;
</sql:query>

<div class="row d-flex flex-column">
	<div class="col">
		<canvas id="memCanvas" class="col"></canvas>
	</div>
	<div class="col">
		<canvas id="contentsCanvas" class="col"></canvas>
	</div>
	<script>
		var dates = [];
		var hour = [];
		var visit_num = [];
		var page_view = [];
		var board_hour = [];
		var board = [];
		var comment_hour = [];
		var comment = [];
		
		<c:forEach var="mem" items="${ mem_rs.rowsByIndex }">
			dates.push('<c:out value="${ mem[0] }" />');
			visit_num.push('<c:out value="${ mem[1] }" />');
		</c:forEach>
		
		<c:forEach var="page_view" items="${ page_view_rs.rowsByIndex }">
			page_view.push('<c:out value="${ page_view[1] }" />');
		</c:forEach>
		
		<c:forEach var="board" items="${ board_rs.rowsByIndex }">
			board_hour.push({'<c:out value="${ board[0] }" />': Number.parseInt('<c:out value="${ board[1] }" />')});
		</c:forEach>
		
		<c:forEach var="comment" items="${ comment_rs.rowsByIndex }">
			comment_hour.push({'<c:out value="${ comment[0] }" />': Number.parseInt('<c:out value="${ comment[1] }" />')});
		</c:forEach>
		
		let j1 = 0;
		let j2 = 0;
		
		for(let i = 0; i < 24; i++) {
			if(j1 == board_hour.length)
				break;
			if(i < 10) {
				if(board_hour[j1]['0' + i] === undefined)
					board.push(0);
				else
					board.push(board_hour[j1++]['0' + i]);
			} else {
				if(board_hour[j1][i] === undefined)
					board.push(0);
				else
					board.push(board_hour[j1++][i]);
			}
		}
		
		for(let i = 0; i < 24; i++) {
			if(j2 == comment_hour.length)
				break;
			if(i < 10) {
				if(comment_hour[j2]['0' + i] === undefined)
					comment.push(0);
				else
					comment.push(comment_hour[j2++]['0' + i]);
			} else {
				if(comment_hour[j2][i] === undefined)
					comment.push(0);
				else
					comment.push(comment_hour[j2++][i]);
			}
		}
		
		for(let i = 0; i < 24; i++) {
			hour.push(i + '시');
		}
		
		const mem_ctx = document.getElementById('memCanvas').getContext('2d');

		const mem_chart = new Chart(mem_ctx, {
			type: 'line',
			data: {
				labels: dates,
				datasets: [{
					label: "방문자 일별",
					backgroundColor: 'rgba(255, 99, 132)',
					borderColor: 'rgba(255, 99, 132)',
					lineTension: 0,
					fill: false,
					data: visit_num
				}, {
					label: "페이지뷰 일별",
					backgroundColor: 'rgba(54, 162, 235)',
					borderColor: 'rgba(54, 162, 235)',
					lineTension: 0,
					fill: false,
					data: page_view
				}]
			},
			options: {
				title: {
					display: true,
					text: '일별 현황'
				},
				scales: {
					xAxes: [{
						type: 'time',
						distribution: 'series',
						offset: true,
						ticks: {
							major: {
								enabled: true,
								fontStyle: 'bold'
							},
							source: 'data',
							autoSkip: true,
							autoSkipPadding: 75,
							maxRotation: 0,
							sampleSize: 100
						}
					}],
					yAxes: [{
						gridLines: {
							drawBorder: false
						},
						scaleLabel: {
							display: true,
							labelString: '이용자 수'
						}
					}]
				},
				tooltips: {
					intersect: false,
					mode: 'index'
				}
			}
		});
		
		const contents_ctx = document.getElementById('contentsCanvas').getContext('2d');

		const contents_chart = new Chart(contents_ctx, {
			type: 'line',
			data: {
				labels: hour,
				datasets: [{
					label: "게시판",
					backgroundColor: 'rgba(255, 99, 132)',
					borderColor: 'rgba(255, 99, 132)',
					lineTension: 0,
					fill: false,
					data: board
				}, {
					label: "댓글",
					backgroundColor: 'rgba(54, 162, 235)',
					borderColor: 'rgba(54, 162, 235)',
					lineTension: 0,
					fill: false,
					data: comment
				}]
			},
			options: {
				title: {
					display: true,
					text: '시간대별 콘텐츠 현황'
				},
				scales: {
					xAxes: [{
						offset: true,
						ticks: {
							major: {
								enabled: true,
								fontStyle: 'bold'
							},
							source: 'data',
							autoSkip: true,
							autoSkipPadding: 75,
							maxRotation: 0,
							sampleSize: 100
						}
					}],
					yAxes: [{
						gridLines: {
							drawBorder: false
						},
						scaleLabel: {
							display: true,
							labelString: '콘텐츠 사용 수'
						}
					}]
				},
				tooltips: {
					intersect: false,
					mode: 'index'
				}
			}
		});
	</script>
	
</div>