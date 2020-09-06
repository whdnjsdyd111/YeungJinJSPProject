<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="member/login/register.js"></script>
<form id="reg_form" method="post" action="registerPro.do">
	<label>이메일</label>
	<input type="text" id="reg_email" name="email"><label id="check_email"></label><br>
	<label>패스워드</label>
	<input type="password" id="reg_passwd" name="passwd"><label id="check_passwd"></label><br>
	<label>닉네임</label>
	<input type="text" id="reg_nick" name="nick"><label id="check_nick"></label><br>
	<button type="button" id="back">돌아가기</button>
	<button type="submit" id="join" disabled="disabled">가입하기</button>
</form>