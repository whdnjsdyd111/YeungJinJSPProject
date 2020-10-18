<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${ empty sessionScope.YJFBID_ADMIN_SES }">
	<script>
		window.location.href = "loginForm.do";
	</script>
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>YJFB DashBoard</title>
<link rel="shortcut icon"
	href="/YeungJinFunnyBone/resource/images/index/yjfb_logo_icon.ico">
<script type="text/javascript" src="../resource/js/jquery-3.5.1.min.js"></script>

<link rel="stylesheet" type="text/css"
	href="/YeungJinFunnyBone/resource/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript" src="../resource/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../resource/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="../resource/js/Chart.min.js"></script>
<script type="text/javascript" src="../resource/js/Chart.bundle.min.js"></script>

<script type="text/javascript" src="dashboard/dashboard.js"></script>
<link rel="stylesheet" type="text/css"
	href="/YeungJinFunnyBone/admin/dashboard/dashboard.css">
</head>
<body>
	<div class="container-fluid px-0">
		<nav class="navbar navbar-expand-lg navbar-dark bd-navbar header">

			<a class="navbar-brand" href="dashboard.do"> <img width="40"
				height="40" class="mr-2" src="../resource/images/index/yjfb_logo.png">
				YJFB
			</a>
				
			<ul class="nav col nav d-flex flex-row-reverse">
				<li class="nav-item">
					<a class="nav-link btn btn-outline-light" href="logout.do">로그아웃</a>
				</li>
			</ul>
			
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target=".sidebar"
				aria-controls="sidebar" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
		</nav>
		
		<div class="navbar-collapse sidebar" id="navbarSupportedContent">
			<ul class="navbar-nav side-menu">
				<li>
					<a href="dashboard.do">
					<i class="fa fa-dashboard mr-2"></i>대쉬보드
					</a>
				</li>
				<li>
					<a href="statistics.do">
						<i class="fa fa-line-chart mr-2"></i>통계
					</a>
				</li>
				<li>
					<a href="memberManagement.do">
						<i class="fa fa-users mr-2"></i>회원 관리
					</a>
				</li>
				<li>
					<a href="contentsManagement.do">
						<i class="fa fa-comments mr-2"></i>컨텐츠 관리
					</a>
					
				</li>
				<li>
					<a href="chattingRoom.do">
						<i class="fa fa-commenting mr-2"></i>채팅 룸
					</a>
				</li>
				<li>
					<a href="feedback.do">
						<i class="fa fa-bullhorn mr-2"></i>피드백
					</a>
				</li>
				<li>
					<a href="report.do">
						<i class="fa fa-fire mr-2"></i> 신고보기
					</a>
				</li>
			</ul>
		</div>
		
		<div class="dashboard-content bg-light">
			<jsp:include page="${ cont }" />
		</div>
	</div>
	<div>
		<footer class="container-fluid bg-dark">
			<div class="card mx-5 bg-warning">
				<div class="row mb-4 ">
					<div class="col-lg-4 col-md-7 col-sm-11 col-xs-11">
						<div class="pull-left">
							<div class="d-flex">
								<h1 class="mr-2 px-3">
									<img width="50" height="50" src="../resource/images/index/yjfb_logo.png">
								</h1>
								<h1 style="color: #957bda">YJFB</h1>
							</div>
							<p class="card-text">
								대구광역시 북구 복현로 35 본관 320호 <br /> 
								전화 053) 940 - 5114 (대표자 : 조원용)<br>
							</p>
						</div>
					</div>
					<div class="col-lg-2 col-md-6 col-sm-6 col-xs-6">
						<h4 class="pt-5 text-center">
							<i class="fa fa-facebook-official fa-lg"></i> 
						</h4>
					</div>
					<div class="col-lg-2 col-md-6 col-sm-6 col-xs-6">
						<h4 class="pt-5 text-center">
							<i class="fa fa-instagram fa-lg"></i>
						</h4>
					</div>
					<div class="col-lg-2 col-md-6 col-sm-6 col-xs-6">
						<h4 class="pt-5 text-center">
							<i class="fa fa-twitter fa-lg"></i>
						</h4>
					</div>
					<div class="col-lg-2 col-md-6 col-sm-6 col-xs-6">
						<h4 class="pt-5 text-center">
							<i class="fa fa-linkedin-square fa-lg"></i> 
						</h4>
					</div>
				</div>
		
				<div class="mb-4"></div>
				<div class="row" style="font-size: 10px;">
					<div class="col-md-6 col-sm-6 col-xs-6">
						<div class="pull-left">
							<p>&copy; Copyright WD-A Jo Won Yong All rights reserved</p>
						</div>
					</div>
					<div class="col-md-6 col-sm-6 col-xs-6">
						<div class="pull-right mr-4 d-flex">
							<div>Terms of Use</div>
							<div>Privacy Policy</div>
							<div>Cookie Policy</div>
						</div>
					</div>
				</div>
			</div>
		</footer>
	</div>
</body>
</html>