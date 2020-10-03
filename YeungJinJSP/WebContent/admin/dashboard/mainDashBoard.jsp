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

<%-- <sql:query var="t_rep_rs">
	
</sql:query> --%>

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
						<h4 class="card-title">1,000</h4>
						<p class="card-text">신고</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>