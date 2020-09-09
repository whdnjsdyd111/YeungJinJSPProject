<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="member/login/register.js"></script>
<form id="reg_form" method="post" action="registerPro.do" class="login_form" autocomplete="off">
	<h1 class="login_h1">회원가입</h1><br>
	<label class="login_label" >이메일</label><br>
	<input class="login_input" type="text" id="reg_email" name="email" style="margin-bottom: 0px"><br>
	<label id="check_email" class="login_reg"></label><br>
	<label class="login_label" >패스워드</label><br>
	<input class="login_input" type="password" id="reg_passwd" name="passwd"  style="margin-bottom: 0px"><br>
	<label id="check_passwd" class="login_reg"></label><br>
	<label class="login_label" >닉네임</label><br>
	<input class="login_input" type="text" id="reg_nick" name="nick" style="margin-bottom: 0px"><br>
	<label id="check_nick" class="login_reg"></label><br>
	<button type="button" id="back" class="register_btn" style="background-color: white;">돌아가기</button>
	<button type="submit" id="join" disabled="disabled" class="register_btn">가입하기</button>
</form>