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
<script type="text/javascript"
	src="../resource/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="../resource/js/Chart.min.js"></script>
<script type="text/javascript" src="../resource/js/Chart.bundle.min.js"></script>

<script type="text/javascript" src="dashboard/dashboard.js"></script>
<link rel="stylesheet" type="text/css"
	href="/YeungJinFunnyBone/admin/dashboard/dashboard.css">
</head>
<body>
	<div class="container-fluid px-0">
		<nav class="navbar navbar-expand-lg navbar-dark flex-md-row bd-navbar header">

			<a class="navbar-brand" href="dashboard.do"> <img width="40"
				height="40" class="mr-2" src="../resource/images/index/yjfb_logo.png">
				YJFB
			</a>
			
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
					<a href="#">
						<i class="fa fa-line-chart mr-2"></i>통계
					</a>
				</li>
				<li>
					<a href="#">
						<i class="fa fa-users mr-2"></i>회원 관리
					</a>
				</li>
				<li>
					<a href="#">
						<i class="fa fa-comments mr-2"></i>컨텐츠 관리
					</a>
					
				</li>
				<li>
					<a href="#">
						<i class="fa fa-commenting mr-2"></i>채팅 룸
					</a>
				</li>
				<li>
					<a href="#">
						<i class="fa fa-bullhorn mr-2"></i>피드백
					</a>
				</li>
				<li>
					<a href="#">
						<i class="fa fa-fire mr-2"></i> 신고보기
					</a>
				</li>
			</ul>
		</div>
		
		<div class="dashboard-content" style="min-height: 1200px">
			<jsp:include page="mainDashBoard.jsp" />
		</div>
	</div>
</body>
</html>