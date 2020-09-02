<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YeungJin 커뮤니티</title>
<script type="text/javascript" src="resource/js/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="/YeungJinJSP/resource/css/indexInit.css">

<script type="text/javascript" src="common/index.js"></script>
</head>
<body>
	<header id="indexHeader">
		<!-- 고정되어 움직이는 헤더 -->
		<a href="index.do">
			<img id="index_logo" src="resource/images/index/index_logo.png">
		</a>
		
		<div id="index_menu_bar">
			<a href="loginForm.do">로그인</a>
			<span></span>
			<a href="">아이디 찾기</a>
			<span></span>
			<a href="">비밀번호 찾기</a>
			<span></span>
			<a href="">회원가입</a>
		</div>
	</header>
	
	<div id="index_div">
		<nav>
		
		</nav>
		
		<section id="content">
			<c:if test="${ cont == null }">
				<meta http-equiv="Refresh" content="0; url=/YeungJinJSP/index.do">
			</c:if>
			<c:if test="${ cont != null }">
				<jsp:include page="${ cont }" />
			</c:if>
		</section>
		
		<section id="add">
			<a href="#"><img src="resource/images/index/add.png" /></a>
		</section>
	</div>
	
	<footer>
		<div>
			
		</div>
	</footer>
</body>
</html>