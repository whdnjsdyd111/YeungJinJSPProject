<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${ checkDB == 1 }">
	<meta http-equiv="Refresh" content="0; url=/YeungJinFunnyBone/loginForm.do">
	<script>
		alert("비밀번호 재설정이 완료되었습니다.");
	</script>
</c:if>
<c:if test="${ checkDB != 1 }">
	<meta http-equiv="Refresh" content="0; url=/YeungJinFunnyBone/DBFail.do">
</c:if>
