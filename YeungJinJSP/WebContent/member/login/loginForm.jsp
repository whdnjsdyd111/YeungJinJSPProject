<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script type="text/javascript" src="member/login/login.js"></script>
<form class="login_form" autocomplete="off">
	<h1 class="login_h1">로그인</h1><br>
	<label class="login_reg" >아직 계정이 없으십니까?<a class="login_a" href="registerForm.do">회원가입</a></label><br>
	<label class="login_label">이메일 아이디</label><br>
	<input type="text" id="email" name="email" class="login_input"><br>
	<label class="login_label" >비밀번호</label><br>
	<input type="password" id="pw" name="pw" class="login_input" ><br>
	<label id="check_mail_pass" class="login_reg"></label><br>
	<button class="login_btn" type="button" id="loginBtn" disabled="disabled">로그인</button><br/>
	<label class="login_reg"><a class="login_a" href="findPasswdForm.do">비밀번호 찾기</a></label>
</form>
<div id="load_dialog">

</div>
