<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<script type="text/javascript" src="resource/js/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="/YeungJinFunnyBone/resource/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript" src="resource/js/bootstrap.min.js"></script>
<style type="text/css">

html, body {
	height: 100%
}

body {
	display: grid;
	place-items: center;
	font-family: 'Manrope', sans-serif;
	background: #FF5252;
	color: #fff
}

.db_fail {
	font-size: 70px;
	font-weight: 700
}

.cause {
	width: 400px;
}

.send {
	color: #fff;
	background-color: #dc3545;
	border-color: #dc3545;
	border-radius: 1px;
	box-shadow: 2px 3px #dc3545
}

.send:hover {
	color: #fff;
	background-color: #dc3545;
	border-color: #dc3545;
	border-radius: 1px;
	box-shadow: 2px 3px #dc3545
}
</style>
</head>
<body>
<div class="container-fluid text-center">
		<div class="text-center  display-1">
			<i class="fa fa-database"></i>
		</div>
		<div class="text-center">
			<h2 class="db_fail">데이터베이스 오류</h2>
			<h3>데이베이스 시스템에 오류가 발생하였습니다!</h3>
			<div class="text-center mt-4 mb-5">
				<a class="btn btn-success send px-3"
					href="mainBoard.do?kind=all&sort=pop"> <i
					class="fa fa-long-arrow-left mr-1"></i>메인으로 가기
				</a>

			</div>
		</div>
	</div>
</body>
</html>