<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${ admin_id != 0 }">
	<c:set var="YJFBID_ADMIN_SES" value="${ admin_id }" scope="session" />
</c:if>

<p id='ck'>${ admin_id }admin_id</p>