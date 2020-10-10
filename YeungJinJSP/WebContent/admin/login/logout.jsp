<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	application.removeAttribute(String.valueOf(session.getAttribute("YJFBID_ADMIN_SES")));
%>
<c:remove var="YJFBID_ADMIN_SES" scope="session"/>
<meta http-equiv="Refresh" content="0; url=/YeungJinFunnyBone/admin/loginForm.do">