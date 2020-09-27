<%@page import="main.bean.AES256Util"%>
<%@page import="main.bean.SHA256"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${ check == 1 }">
	<c:set var="YJFBID_SES" value="${ mem_id }" scope="session" />
</c:if>
<p id='ck'>${ check }