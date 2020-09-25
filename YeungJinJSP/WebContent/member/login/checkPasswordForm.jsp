<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script type="text/javascript" src="member/login/checkPassword.js"></script>
    
<div class="container">
	<form autocomplete="off" class="mx-auto my-5">
		<h1 class="text-center text-dark font-weight-bold my-3">계정 설정</h1>

		<div class="container d-flex flex-column my-3">
			<div class="bg-secondary border border-dark">
				<span class="text-light my-0">정보 확인을 위해 비밀번호 인증을 한번 더 해주십시오.</span>
			</div>
			<div class="form-group my-3">
				<label for="email"><i class="fa fa-envelope-o mr-2"></i>이메일</label>
				<input type="text" class="form-control" id="email" name="email" value="${ email }" readonly="readonly">
			</div>

			<div class="form-group mt-3">
				<label for="passward"><i class="fa fa-lock mr-2"></i>패스워드</label>
				<input type="password" class="form-control" id="pw" name="pw"> 
			</div>
			<small id="check_mail_pass" class="form-text text-muted check_small mt-1 mb-3"></small>
			
		</div>
		<div class="container d-flex flex-column my-3">
			<label>비밀번호를 잊으셨습니까?<a href="findPasswdForm.do"
				class="btn btn-outline-primary mx-3 btn-sm">비밀번호 찾기</a></label>
			<button type="button" id="loginBtn" disabled="disabled"	class="btn btn-success my-3 col btn-lg">로그인</button>
		</div>
	</form>
</div>