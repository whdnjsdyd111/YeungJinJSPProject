<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${ empty sessionScope.YJFBID_ADMIN_SES }">
	<script>
		window.location.href = "loginForm.do";
	</script>
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>YJFB DashBoard</title>
<link rel="shortcut icon" href="/YeungJinFunnyBone/resource/images/index/yjfb_logo_icon.ico">
<script type="text/javascript" src="../resource/js/jquery-3.5.1.min.js"></script>

<link rel="stylesheet" type="text/css" href="/YeungJinFunnyBone/resource/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript" src="../resource/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../resource/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	
</body>
</html>