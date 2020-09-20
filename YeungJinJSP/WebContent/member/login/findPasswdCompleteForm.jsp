<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript" src="member/login/findPwForm.js"></script>

<c:if test="${ checkMail == 1 }">
	<div class="container">
		<form class="mx-auto my-5" method="post" action="findPasswdCompletePro.do" autocomplete="off">
			<h1 class="text-center text-dark font-weight-bold my-3">비밀번호 재설정 하기</h1>
			
			<div class="container d-flex flex-column">
				<div class="form-group mt-5">
					<label for="password"><i class="fa fa-key mr-2"></i>비밀번호 입력</label>
					<input type="password" class="form-control" id="password" name="password">
				</div>
				<small id="check_pw" class="form-text text-muted check_small my-1"></small>
			</div>
			
			<div class="container d-flex flex-column">
				<div class="form-group mt-3">
					<label for="re_password"><i class="fa fa-key mr-2 text-muted"></i>비밀번호 재입력</label>
					<input type="password" class="form-control" id="rePasswd" name="password">
				</div>
				<small id="reCheck_pw" class="form-text text-muted check_small my-1"></small>
				<button type="submit" id="rePwOk" class="btn btn-success w-50 btn-lg" disabled="disabled">재설정 완료</button>
			</div>
			

			<input type="hidden" name="enc" value="${ enc }">
		</form>
	</div>
</c:if>

<c:if test="${ checkMail != 1}">
	<meta http-equiv="Refresh" content="0; url=/YeungJinFunnyBone/emailFail.do">
</c:if>