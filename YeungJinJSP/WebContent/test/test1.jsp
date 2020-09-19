<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>부트스트랩 테스트 로그인</title>
<script type="text/javascript" src="../resource/js/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="/YeungJinFunnyBone/resource/css/bootstrap.css">
<script type="text/javascript" src="../resource/js/bootstrap.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="/YeungJinFunnyBone/resource/css/indexInit.css">

<style>

</style>
<script>
	function preloading(imageArray) { 
		let n = imageArray.length; 
		for (let i = 0; i < n; i++) { 
			let img = new Image(); 
			img.src = imageArray[i]; 
		} 
	} 
	
	preloading(['../resource/images/index/다운로드.jfif', '../resource/images/index/다운로드.png' ]);


	$(function() {
		if($('#content').width() == $('#content_add').width())
			$('#add').attr('src', '../resource/images/index/다운로드.png');
		else
			$('#add').attr('src', '../resource/images/index/다운로드.jfif');
		
		$(window).resize(function() {
			if($('#content').width() == $('#content_add').width())
				$('#add').attr('src', '../resource/images/index/다운로드.png');
			else
				$('#add').attr('src', '../resource/images/index/다운로드.jfif');
		});

		

		$(window).scroll(function() {
			if(window.scrollY > $('html').height() - $('#sidebar').height() - $('footer').height() - $('header').children().height() - 16 ) {	// 16은 1rem 값
				$('#sidebar').css({
					position: "absolute",
					top: "calc(" + ($('#content').height() / 2 - $('#sidebar').height()) + "px + 3.5rem)"
				});
			} else {
				$('#sidebar').css({
					position: "fixed",
					top: 66 + "px"
				});
			}
		});

	});
</script>
</head>
<body>
<header class="container-fluid px-0">
	<div class="navbar navbar-expand-lg navbar-dark bg-dark flex-md-row bd-navbar fixed-top justify-content-start">
		<a class="navbar-brand mr-0 mr-md-2" href="#" aria-label="YJFB"> <img
			width="40" height="40" src="../resource/images/index/yjfb_logo.png">
		</a>
		
		
		<div class="navbar-expand">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item dropdown">
					<a class="nav-link" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"><span><i class="fa fa-bell-o fa-2 text-white ml-3 mr-3"></i></span></a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<!-- 알림 -->
						</div></li>
				<li class="nav-item dropdown">
					<a class="nav-link" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"><span class="text-white">월롱이</span></a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<div class="text-primary text-left">레벨 1</div>
							<div class="progress">
  								<div class="progress-bar" role="progressbar" style="width: 25%" 
  									aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">10</div>
							</div>
							<div class="text-muted text-right">남은 경험치 10</div>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item text-center" href="#"><i class="fa fa-sticky-note mr-2"></i>내가 쓴 글</a>
							<a class="dropdown-item text-center" href="#"><i class="fa fa-bookmark mr-2"></i>북마크</a>
							<a class="dropdown-item text-center" href="#"><i class="fa fa-pencil mr-2"></i>글쓰기</a>
						</div></li>
			</ul>
		</div>
		
		
		
		<button class="navbar-toggler header_support_btn mr-2" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ml-md-auto">
				<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"><span><i class="fa fa-newspaper-o mr-2"></i>정보</span></a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="#">공지사항</a> <a
								class="dropdown-item" href="#">소식</a>
						</div></li>
				<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"><span><i class="fa fa-list mr-2"></i>커뮤니티</span></a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="#">자유</a> 
							<a class="dropdown-item" href="#">유머</a>
							<a class="dropdown-item" href="#">공포</a>
							<a class="dropdown-item" href="#">만화</a>
							<a class="dropdown-item" href="#">코로나 뉴스</a>
						</div></li>
				<li class="nav-item mr-3"><a class="nav-link"
					href="#"><span><i class="fa fa-sign-out mr-2"></i>로그아웃</span></a></li>
				<li class="nav-item mr-3"><a class="nav-link"
					href="#"><span><i class="fa fa-address-card mr-2"></i>계정설정</span></a></li>
			</ul>
		</div>
	</div>
</header>



<div class="container-fluid px-0" style="margin-top: 3.5rem !important">

	<div class="row navbar navbar-expand-lg px-0" >
			
		<div class="col-xl-3 col-lg-3 collapse navbar-collapse">
			<nav id="sidebar" class="nav_wrap">
			    <div class="sidebar">
			    	
			        <ul>
			            <li><a href="#"><i class="fa fa-home"></i>홈으로</a></li>
			        </ul>
			        <p class="px-3 text-center mb-1">월롱이</p>
			        <div class="text-center">레벨 1</div>
			        <div class="progress ml-2 mr-2">
  								<div class="progress-bar bg-success" role="progressbar" style="width: 25%" 
  									aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">10</div>
							</div>
			        <div class="text-center mb-1">남은 경험치 10</div>
			        <div class="row text-center">
						<div class="col px-0 ml-2">
							<a href="#" class="btn btn-secondary" role="button" aria-pressed="true">
								<i class="fa fa-sticky-note"></i>내가 쓴 글
							</a>
						</div>
						<div class="col px-0">
							<a href="#" class="btn btn-secondary" role="button" aria-pressed="true">
								<i class="fa fa-bookmark"></i>북마크
							</a>
						</div>
					</div>
			        <ul class="mt-1">
			            <li><a href="#"><i class="fa fa-sign-out"></i>로그아웃</a></li>
			        </ul>
			        <p class="px-3 ml-5"><i class="fa fa-newspaper-o mr-3"></i>정보</p>
			        <ul>
			            <li><a href="#">공지사항</a></li>
			            <li><a href="#">소식</a></li>
			        </ul>
			        <p class="px-3 ml-5"><i class="fa fa-list mr-3"></i>커뮤니티</p>
			        <ul>
			            <li><a href="#">자유</a></li>
			            <li><a href="#">유머</a></li>
			            <li><a href="#">공포</a></li>
			            <li><a href="#">만화</a></li>
			            <li><a href="#">코로나 뉴스</a></li>
			        </ul>
			    </div>
			</nav>
		</div>
		
		<div class="col-xl-9 col-lg-9 row px-0 mt-0">
	
			<div id="content" class="col-xl-10 col-lg-12 bg-success">
				<section style="height: 650px;">
					
				</section>
			</div>
		
			<div id="content_add" class="col-xl-2 col-lg-12 bg-danger">
				<section>
					<img id="add" class="img-fluid" src="" />
				</section>
			</div>
			
		</div>
	</div>

</div>



<jsp:include page="../member/index/footer.jsp" />

</body>
</html>