<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>YJ Funny Bone</title>
<link rel="shortcut icon" href="/YeungJinFunnyBone/resource/images/index/yjfb_logo_icon.ico">
<script type="text/javascript" src="resource/js/jquery-3.5.1.min.js"></script>

<link rel="stylesheet" type="text/css" href="/YeungJinFunnyBone/resource/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript" src="resource/js/bootstrap.min.js"></script>
<script type="text/javascript" src="resource/js/bootstrap.bundle.min.js"></script>

<script type="text/javascript" src="member/index/index.js"></script>
<link rel="stylesheet" type="text/css" href="/YeungJinFunnyBone/resource/css/index.css">
<link rel="stylesheet" type="text/css" href="/YeungJinFunnyBone/member/login/memberLogin.css">
<link rel="stylesheet" type="text/css" href="/YeungJinFunnyBone/member/board/writeBoard.css">
<link rel="stylesheet" type="text/css" href="/YeungJinFunnyBone/member/board/board.css">
<link rel="stylesheet" type="text/css" href="/YeungJinFunnyBone/member/board/boardContent.css">
<link rel="stylesheet" type="text/css" href="/YeungJinFunnyBone/member/index/notice.css">

<script type="text/javascript">

/*
if (document.location.protocol == 'http:') {

    document.location.href = document.location.href.replace('http:', 'https:');

}	// 시큐리티 사용 시 http를 https 로 바꿔주기
*/

var bad_word = ['시발', '씨발', '씨빨', '개새끼', '병신', '병씬', '뼝신', '뼝씬', '좆', '지랄', '성기', '어미', '애비',
	'fuck', 'dick'];
	
</script>

</head>
<body class="bg-light">

<%-- 헤더 --%>
<c:if test="${ empty sessionScope.YJFBID_SES }">
	<jsp:include page="/member/index/header_logout.jsp" />
</c:if>
<c:if test="${ !empty sessionScope.YJFBID_SES }">
	<jsp:include page="/member/index/header_login.jsp" />
</c:if>

<%-- 콘텐트 --%>

<c:if test="${ empty sessionScope.YJFBID_SES }">
	<jsp:include page="/member/index/content_logout.jsp" />
</c:if>

<c:if test="${ !empty sessionScope.YJFBID_SES }">
	<jsp:include page="/member/index/content_login.jsp" />
</c:if>
	
<%-- 푸터 --%>
<jsp:include page="member/index/footer.jsp" />

</body>
</html>