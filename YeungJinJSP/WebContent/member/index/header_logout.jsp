<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header class="container-fluid px-0">
	<div class="navbar navbar-expand-lg navbar-dark bg-dark flex-md-row bd-navbar fixed-top">
	
		<a class="navbar-brand mr-0 mr-md-2" href="mainBoard.do?kind=all&sort=pop" aria-label="YJFB"> <img
			width="40" height="40" src="resource/images/index/yjfb_logo.png">
		</a>
		
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ml-md-auto">
				<li class="nav-item dropdown mr-3"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"><span><i class="fa fa-newspaper-o mr-2"></i>정보</span></a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="mainBoard.do?kind=600&sort=recent">공지사항</a> 
							<a class="dropdown-item" href="mainBoard.do?kind=700&sort=recent">소식</a>
						</div></li>
				<li class="nav-item dropdown mr-3"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"><span><i class="fa fa-list mr-2"></i>커뮤니티</span></a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="mainBoard.do?kind=100&sort=pop">자유</a> 
							<a class="dropdown-item" href="mainBoard.do?kind=200&sort=pop">유머</a>
							<a class="dropdown-item" href="mainBoard.do?kind=300&sort=pop">공포</a>
							<a class="dropdown-item" href="mainBoard.do?kind=400&sort=pop">만화</a>
							<a class="dropdown-item" href="mainBoard.do?kind=500&sort=pop">코로나 뉴스</a>
						</div></li>
				<li class="nav-item mr-3"><a class="nav-link"
					href="loginForm.do"><span><i class="fa fa-sign-in mr-2"></i>로그인</span></a></li>
				<li class="nav-item mr-3"><a class="nav-link"
					href="findPasswdForm.do"><span><i class="fa fa-key mr-2"></i>비밀번호 찾기</span></a></li>
				<li class="nav-item mr-3"><a class="nav-link"
					href="registerForm.do"><span><i class="fa fa-user-secret mr-2"></i>회원가입</span></a></li>
			</ul>
		</div>
	</div>
</header>