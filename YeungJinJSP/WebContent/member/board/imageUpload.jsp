<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<p id='images'>
	<c:if test="${ results == null }">
		1
	</c:if>
	<c:forEach var="result" items="${ results }">
		<%= pageContext.getAttribute("result") + "," %>
	</c:forEach>
image_p_tag</p>