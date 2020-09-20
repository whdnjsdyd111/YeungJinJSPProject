<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script type="text/javascript" src="member/login/register.js"></script>

<div class="container">
<form id="reg_form" class="mx-auto my-5" method="post" action="registerPro.do" autocomplete="off">
	<h1 class="text-center text-dark font-weight-bold my-3">회원가입</h1>
	
	<div class="container px-0 my-3">
		<div class="bg-secondary border border-dark notify_email">
			<span class="text-light my-0">회원가입 시 이메일 인증을 위해서 이메일이 발송되며, 인증이 완료되기 전까지 회원가입 완료가 되지 않습니다.</span>
		</div>
	</div>
	
	<div class="container d-flex flex-column">
		<div class="form-group mt-2 mb-0">
			<label for="email"><i class="fa fa-envelope-o mr-2"></i>이메일</label>
			<input type="text" class="form-control" id="reg_email" name="email">
		</div>
		<small id="check_email" class="form-text text-muted check_small mb-2"></small>
		
		<div class="form-group mt-2 mb-0">
			<label for="passward"><i class="fa fa-lock mr-2"></i>패스워드</label>
			<input type="password" class="form-control" id="reg_passwd" name="passwd">
		</div>
		<small id="check_passwd" class="form-text text-muted check_small mb-2"></small>
	
		<div class="form-group mt-2 mb-0">
			<label for="nickname"><i class="fa fa-user mr-2"></i>닉네임</label>
			<input type="text" class="form-control" id="reg_nick" name="nick">
		</div>
		<small id="check_nick" class="form-text text-muted check_small mb-2"></small>
	</div>
	<div class="row">
		<button type="button" id="back" class="btn btn-outline-dark col mx-3 btn-lg">돌아가기</button>
		<button type="submit" id="join" class="btn btn-success col mx-3 btn-lg" disabled="disabled">가입하기</button>
	</div>
</form>
</div>