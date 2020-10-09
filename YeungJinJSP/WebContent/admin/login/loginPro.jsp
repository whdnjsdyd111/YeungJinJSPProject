<%@page import="main.bean.AdminDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${ admin_id != 0 }">
	<c:set var="YJFBID_ADMIN_SES" value="${ admin_id }" scope="session" />
	<% application.setAttribute(String.valueOf(request.getAttribute("admin_id")), 
			AdminDBBean.getInstance().getAdminMember( (Integer) request.getAttribute("admin_id"))); %>
</c:if>

<p id='ck'>${ admin_id }admin_id</p>