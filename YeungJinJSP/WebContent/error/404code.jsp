<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러 페이지</title>
</head>
<body>
	<% response.setStatus(HttpServletResponse.SC_OK); %>
	404 페이지 오류!
</body>
</html>