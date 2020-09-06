<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${ checkMail == 1 }">
	<script>
		alert("메일 전송이 성공되었습니다.");
	</script>
	<meta http-equiv="Refresh" content="0; url=/YeungJinFunnyBone/index.do">	
</c:if>
<c:if test="${ checkMail != 1 }">
	<script>
		alert("메일 전송이 실패하였습니다.");
	</script>
	<meta http-equiv="Refresh" content="0; url=/YeungJinFunnyBone/findPasswdForm.do">
</c:if>