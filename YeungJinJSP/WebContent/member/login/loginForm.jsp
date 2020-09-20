<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script type="text/javascript" src="member/login/login.js"></script>

<div class="container">
	<form autocomplete="off" class="mx-auto my-5">
		<h1 class="text-center text-dark font-weight-bold my-3">로그인</h1>
		
		
		<div class="container d-flex flex-column my-3">
			<label>아직 계정이 없으십니까?<a href="registerForm.do" class="btn btn-outline-primary mx-3 btn-sm">회원가입</a></label>
			<div class="form-group my-3">
				<label for="email"><i class="fa fa-envelope-o mr-2"></i>이메일</label>
				<input type="text" class="form-control" id="email" name="email">
			</div>
			
			<div class="form-group my-3">
				<label for="passward"><i class="fa fa-lock mr-2"></i>패스워드</label>
				<input type="password" class="form-control" id="pw" name="pw">
				<small id="check_mail_pass" class="form-text text-muted check_small my-2"></small>
			</div>
		</div>
		<div class="container d-flex flex-column my-3">
			<label>비밀번호를 잊으셨습니까?<a href="findPasswdForm.do" class="btn btn-outline-primary mx-3 btn-sm">비밀번호 찾기</a></label>
			<div class="custom-control custom-switch my-3">
			  	<input type="checkbox" class="custom-control-input" id="login_cookie">
			  	<label class="custom-control-label" for="login_cookie">로그인 유지</label>
			</div>
			<button type="button" id="loginBtn" disabled="disabled" class="btn btn-success my-3 col btn-lg">로그인</button>
		</div>
		
	</form>
</div>
<div id="load_dialog">

</div>