<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${ check_password == null }">
	<script>
		window.location.href = "checkPasswordForm.do";
	</script>
</c:if>
<c:if test="${ check_password != null }">
	<c:remove var="check_password" scope="session"/>
</c:if>


<script type="text/javascript" src="member/login/userSetting.js"></script>

<div class="container">
	<h1 class="text-center text-dark font-weight-bold my-3">개인 정보 관리</h1>
	
	<table class="table my-3">
		<tr>
			<th>이메일</th>
			<td>${ member.mem_email }</td>
		</tr>
		<tr>
			<th>생성일자</th>
			<td>${ member.mem_date }</td>
		</tr>
		<tr>
			<th>닉네임</th>
			<td>
				<div class="d-flex flex-column">
					<div class="d-flex flex-md-row">
						<input id="nickname" class="form-control w-50 mr-2" value="${ member.mem_nickname }"/>
						<button id="updateNick" class="btn btn-info" disabled="disabled">수정하기</button>
					</div>
					<small id="check_nick" class="form-text text-muted check_small"></small>
				</div>
			</td>
		</tr>
		<tr>
			<th>비밀번호 변경</th>
			<td>
				<div class="d-flex flex-column">
					<div class="form-group">
						<label for="password"><i class="fa fa-lock mr-2"></i>비밀번호 입력</label>
						<input type="password" class="form-control w-50" id="password" name="password">
					</div>
					<small id="check_pw" class="form-text text-muted check_small mb-3"></small>
				</div>
			
				<div class="d-flex flex-column">
					<div class="form-group">
						<label for="password"><i class="fa fa-key mr-2"></i>신규 비밀번호 입력</label>
						<input type="password" class="form-control w-50" id="new_password" name="password">
					</div>
					<small id="new_check_pw" class="form-text text-muted check_small my-3"></small>
				</div>
				
				<div class="d-flex flex-column">
					<div class="form-group">
						<label for="re_password"><i class="fa fa-key mr-2 text-muted"></i>신규 비밀번호 재입력</label>
						<input type="password" class="form-control w-50" id="new_re_passwd" name="password">
					</div>
					<small id="new_re_check_pw" class="form-text text-muted check_small mb-3"></small>
					<button type="submit" id="submit_new_pw" class="btn btn-success w-50 btn-lg" disabled="disabled">재설정 완료</button>
				</div>
			</td>
		</tr>
	</table>
</div>