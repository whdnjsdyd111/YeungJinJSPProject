<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/YeungJinJSP/resource/css/indexInit.css">
</head>
<body>
	<header>
		<jsp:include page="/common/header.jsp" />
	</header>
	
	<div id="index_div">
		<nav>
		
		</nav>
		
		<section>
			<c:if test="${ cont == null }">
				<meta http-equiv="Refresh" content="0; url=/YeungJinJSP/index.do">
			</c:if>
			<c:if test="${ cont != null }">
				<jsp:include page="${ cont }" />
			</c:if>
		</section>
	</div>
	
	<footer>
		
	</footer>
</body>
</html>