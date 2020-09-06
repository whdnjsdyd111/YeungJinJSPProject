<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript" src="member/login/findPwForm.js"></script>
<c:if test="${ checkMail == 1 }">
	<form id="re_pw" method="post" action="findPasswdCompletePro.do">
		<h1>비밀번호 재설정 하기</h1>
		<label>비밀번호 입력</label>
		<input type="password" id="password" name="password"><label id="check_pw"></label><br>
		<label>비밀번호 재입력</label>
		<input type="password" id="rePasswd"><label id="reCheck_pw"></label><br>
		<button type="submit" id="rePwOk" disabled="disabled">재설정 완료</button>
		<input type="hidden" name="enc" value="${ enc }">
	</form>
</c:if>
<c:if test="${ checkMail != 1}">
	<meta http-equiv="Refresh" content="0; url=/YeungJinFunnyBone/emailFail.do">
</c:if>