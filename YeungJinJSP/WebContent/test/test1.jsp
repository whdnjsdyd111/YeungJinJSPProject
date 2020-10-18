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
<script type="text/javascript">
	$(function() {
		$('#check').click(function() {
			$.ajax({
				type: "post",
				data: {
					nickname: $('#nickname').val()
				},
				url: "test2.jsp",
				success: function(data) {
					data = data.trim();
					
					if(data == "0") {
						$('#ck').text("닉네임 사용이 가능합니다.");
					} else {
						$('#ck').text("닉네임이 중복되었습니다");
					}
				}
			});
		});
	});
</script>
</head>
<body>
	<form>
		아이디 : <input type="text"><br>
		비밀번호 : <input type="password"><br>
		닉네임 : <input type="text" id="nickname"><span id="ck"></span>
		<input type="button" value="중복확인" id="check"><br>
	</form>
</body>
</html>