<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>YJFB Admin</title>
<link rel="shortcut icon" href="/YeungJinFunnyBone/resource/images/index/yjfb_logo_icon.ico">
<script type="text/javascript" src="../resource/js/jquery-3.5.1.min.js"></script>

<link rel="stylesheet" type="text/css" href="/YeungJinFunnyBone/resource/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript" src="../resource/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../resource/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="login/login.js"></script>
<link rel="stylesheet" type="text/css" href="/YeungJinFunnyBone/member/login/memberLogin.css">
</head>
<body>
	<div class="container-fluid">
		<div class="row navbar navbar-expand-md">
			<div class="navbar-collapse collapse col-lg-2 col-md-2">
			
			</div>
			<div class="col-lg-8">
				<form autocomplete="off" class="mx-auto my-5">
					<h1 class="text-center text-dark font-weight-bold my-3">관리자 로그인</h1>
			
					<div class="container d-flex flex-column my-3">
						<div class="form-group my-3">
							<label for="email"><i class="fa fa-envelope-o mr-2"></i>이메일</label>
							<input type="text" class="form-control" id="email" name="email">
						</div>
			
						<div class="form-group mt-3">
							<label for="passward"><i class="fa fa-lock mr-2"></i>패스워드</label>
							<input type="password" class="form-control" id="pw" name="pw"> 
						</div>
						<small id="check_mail_pass" class="form-text text-muted check_small mt-1 mb-3"></small>
						
					</div>
					<div class="container d-flex flex-column my-3">
						<label>비밀번호를 잊으셨습니까?<a href="#"
							class="btn btn-outline-primary mx-3 btn-sm">비밀번호 찾기</a></label>
						<button type="button" id="loginBtn" disabled="disabled"	class="btn btn-success my-3 col w-50 btn-lg">로그인</button>
					</div>
			
				</form>
			</div>
			<div class="navbar-collapse collapse col-lg-2 col-md-2">
			
			</div>
		</div>
	</div>
</body>
</html>
