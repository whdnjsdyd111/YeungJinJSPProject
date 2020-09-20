<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script type="text/javascript" src="member/login/login.js"></script>

<div class="container">
	<form autocomplete="off" class="mx-auto my-5">
		<h1 class="text-center text-dark font-weight-bold my-3">로그인</h1>

		<div class="container d-flex flex-column my-3">
			<label>아직 계정이 없으십니까?<a href="registerForm.do"	class="btn btn-outline-primary mx-3 btn-sm">회원가입</a></label>
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
			<label>비밀번호를 잊으셨습니까?<a href="findPasswdForm.do"
				class="btn btn-outline-primary mx-3 btn-sm">비밀번호 찾기</a></label>
			<div class="custom-control custom-switch my-3">
				<input type="checkbox" class="custom-control-input" id="login_cookie">
				<label class="custom-control-label" for="login_cookie">로그인 유지</label>
			</div>
			<button type="button" id="loginBtn" disabled="disabled"	class="btn btn-success my-3 col btn-lg">로그인</button>
		</div>

	</form>
</div>
<div class="modal fade" id="emailModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">이메일 인증</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body bg-danger text-white">
				사용자(<label id="dialog_email"></label>)님의 계정은 아직 인증이 완료되지 않았습니다.
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary" id="reSend">이메일
					다시 보내기</button>
			</div>
		</div>
	</div>
</div>