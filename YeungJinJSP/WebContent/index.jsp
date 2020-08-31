<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/YeungJinJSP/resource/css/indexInit.css">
</head>
<body>
	<header><jsp:include page="/common/header.jsp"></jsp:include></header>
	<hr>
	<nav></nav>
	<section><jsp:include page="${ cont }" /></section>
	<footer></footer>
</body>
</html>