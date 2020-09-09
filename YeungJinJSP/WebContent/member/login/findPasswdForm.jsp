<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="member/login/findPw.js"></script>
<form id="find_form" method="post" action="findPasswdPro.do" autocomplete="off" class="login_form">
	<h1 class="login_h1">비밀번호 찾기</h1><br>
	<h3 class="login_h1" style="font-size:large;">찾고자 하는 YJFB의 이메일 ID를 입력하시면 해당 메일 주소로 비밀번호를 재설정할 수 있는 링크로 보내드립니다.</h3>
	<br><br><br><br>
	<label class="login_label">이메일 입력</label><br>
	<input class="login_input" type="text" id="email" name="email"><label id="check_email"></label><br>
	<button class="login_btn" id="find" type="submit" disabled="disabled">보내기</button>
</form>