<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${ check == 1 }">
	<meta http-equiv="Refresh" content="0; url=/YeungJinFunnyBone/loginForm.do">
	<script>
		alert("이메일 인증을 성공하셨습니다.");
	</script>
</c:if>

<c:if test="${ check != 1 }">
	<meta http-equiv="Refresh" content="0; url=/YeungJinFunnyBone/loginForm.do">
	<script>
		alert("이메일 인증에 실패하셨습니다.")
	</script>
</c:if>