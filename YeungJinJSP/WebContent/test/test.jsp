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
		$('#div2').click(function() {
			$('#div2').parent('#div1').after("<p>ddd</p>");
		})
	});
	
</script>
</head>
<body>
	<div id="div1">
		<div id="div2">
			<div id="div2" style="width: 100px; height: 100px; background-color: red" >
				
			</div>
		</div>
	</div>
</body>
</html>