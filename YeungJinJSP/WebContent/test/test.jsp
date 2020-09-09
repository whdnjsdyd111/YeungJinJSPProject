<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../resource/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('#a').click(function() {
			alert($('#d option:selected').val());
		});
		
		$('a').click(function() {
			var check = confirm("페이지 나겠습니까?");
			
			if(check == false)
				return false;
			
		});
	});
</script>
</head>
<body>
	<select id="d">
		<option value="100">1</option>
		<option value="200">2</option>
		<option value="300">3</option>
	</select>
	<button id="a" type="button">d</button>
	<a href="../index.do">index</a>
</body>
</html>