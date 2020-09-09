<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YJ Funny Bone</title>
<script type="text/javascript" src="resource/js/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="/YeungJinFunnyBone/resource/css/indexInit.css">
<link rel="stylesheet" type="text/css" href="/YeungJinFunnyBone/resource/css/common.css">
<link rel="stylesheet" type="text/css" href="/YeungJinFunnyBone/member/login/dialog.css">
<link rel="stylesheet" type="text/css" href="/YeungJinFunnyBone/member/login/memberLogin.css">
<link rel="stylesheet" type="text/css" href="/YeungJinFunnyBone/member/board/board.css">
<link rel="stylesheet" type="text/css" href="/YeungJinFunnyBone/member/board/writeBoard.css">

<script type="text/javascript" src="member/index.js"></script>
</head>
<body>
	<header id="indexHeader">
		<a href="index.do">
			<img id="index_logo" src="resource/images/index/index_logo.png">
		</a>
		
		<c:if test="${ empty sessionScope.YJFBID_SES }">
			<jsp:include page="/index/index_menu_NoId.html" />
		</c:if>
		<c:if test="${ !empty sessionScope.YJFBID_SES }">
			<jsp:include page="/index/index_menu_hasId.jsp" />
		</c:if>
	</header>
	
	<div id="index_div">
		<nav id="nav">
			
		</nav>
		
		<section id="content">
			<c:if test="${ cont == null }">
				<meta http-equiv="Refresh" content="0; url=/YeungJinFunnyBone/index.do">
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
		<div id="policy">
			<ul id="pol_ul">
				<li><a href="introduction.do">홈페이지 소개</a></li>
				<span></span>
				<li><a href="tos.do">이용약관</a></li>
				<span></span>
				<li><a href="policy.do">정보처리방침</a></li>
				<span></span>
				<li><a href="">문의/피드백</a></li>
			</ul>
		</div>
		
		<div id="info">
			<div id="company">
				대구광역시 북구 복현로 35 본관 320호 <br/>
				전화 053) 940 - 5114 (대표자 : 조원용)<br>
				Copyright WD-A Jo Won Yong All rights reserved
			</div>
			<div id="sns">
				<a href=""><img src="resource/images/index/twitter.png" /></a>
				<a href=""><img src="resource/images/index/facebook.png" /></a>
				<a href=""><img src="resource/images/index/instagram.png" /></a>
			</div>
		</div>
	</footer>
</body>
</html>