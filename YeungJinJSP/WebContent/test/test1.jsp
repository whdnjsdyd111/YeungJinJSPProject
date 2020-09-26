<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>부트스트랩 테스트 로그인</title>
<script type="text/javascript" src="../resource/js/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="/YeungJinFunnyBone/resource/css/bootstrap.css">
<script type="text/javascript" src="../resource/js/bootstrap.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="/YeungJinFunnyBone/resource/css/indexInit.css">

<style>

</style>

</head>
<body>
	<% request.setAttribute("str", "1234567890123456"); 
		String str = "asd";
	%>
	
	<c:if test="${ fn:length(str) > 13 }">
		${ str.substring(0, 13) }..
	</c:if>
</body>
</html>