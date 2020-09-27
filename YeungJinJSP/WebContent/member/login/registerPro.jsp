<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>
	<c:when test="${ checkDB == 1 && checkMail == 1 }">
		<script>
			alert("메일 전송이 성공되었습니다.");
		</script>
		<meta http-equiv="Refresh" content="0; url=/YeungJinFunnyBone/mainBoard.do?kind=all&sort=recent">	
	</c:when>
	<c:when test="${ checkDB != 1 }">
		<meta http-equiv="Refresh" content="0; url=/YeungJinFunnyBone/DBFail.do">
	</c:when>
	<c:when test="${ checkMail != 1 }">
		<meta http-equiv="Refresh" content="0; url=/YeungJinFunnyBone/emailFail.do">		
	</c:when>
</c:choose>