<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="member/login/findPw.js"></script>

<div class="container">
	<form class="mx-auto my-5" id="find_form" method="post" action="findPasswdPro.do" autocomplete="off">
		<h1 class="text-center text-dark font-weight-bold my-5">비밀번호 찾기</h1>
		
		<div class="container my-5">
			<div class="bg-secondary border border-dark notify_passwd_email">
				<h3 class="text-light my-0">찾고자 하는 YJFB의 이메일 ID를 입력하시면 해당 메일 주소로 비밀번호를 재설정할 수 있는 링크로 보내드립니다.</h3>
			</div>
		</div>
		
		<div class="container d-flex flex-column my-3">
			<div class="form-group my-5">
				<label for="email"><i class="fa fa-envelope-o mr-2"></i>이메일 입력</label>
				<input type="text" class="form-control" id="email" name="email">
				<small id="check_email" class="form-text text-muted check_small my-2"></small>
				<button id="find" type="submit" class="btn btn-success w-100 btn-lg" disabled="disabled">보내기</button>
			</div>
		</div>
	</form>
</div>