<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" href="/YeungJinFunnyBone/resource/images/index/yjfb_logo_icon.ico">
<title>에러 페이지</title>
<script type="text/javascript" src="resource/js/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="/YeungJinFunnyBone/resource/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript" src="resource/js/bootstrap.min.js"></script>
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Manrope:wght@200&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Girassol&display=swap');

html,
body {
    height: 100%
}

body {
    display: grid;
    place-items: center;
    background: #000;
    color: #fff
}

.not-found {
    font-size: 220px;
    font-weight: 700;
    font-family: 'Girassol', cursive
}

.oops-text {
    background: #fff;
    padding: 10px;
    color: #000;
    border-radius: 5px
}

.not-found-text {
    font-family: 'Manrope', sans-serif;
    font-size: 20px
}

.send {
    color: #fff;
    background-color: #dc3545;
    border-color: #dc3545;
    border-radius: 54px;
    font-family: 'Manrope', sans-serif;
    box-shadow: 2px 3px #dc3545
}

.send:hover {
    color: #fff;
    background-color: #dc3545;
    border-color: #dc3545;
    border-radius: 54px;
    box-shadow: 2px 3px #dc3545
}
</style>
</head>
<body>

<% response.setStatus(HttpServletResponse.SC_OK); %>

<div class="container-fluid text-center">
    <div class="px-5 py-5">
        <h1 class="not-found">404</h1>
        <span class="oops-text">페이지를 찾을 수 없습니다!</span>
        <h4 class="not-found-text mt-4">접속하신 페이지의 주소가 잘못되었거나 삭제되었습니다!<br>페이지를 정확하게 입력했는지 확인해주십시오!</h4>
        <div class="text-center mt-4 mb-5"> 
	        <a class="btn btn-success send px-3" href="mainBoard.do?kind=all&sort=pop">
	        	<i class="fa fa-long-arrow-left mr-1"></i>메인으로 가기
	        </a>
        </div>
    </div>
</div>

</body>
</html>