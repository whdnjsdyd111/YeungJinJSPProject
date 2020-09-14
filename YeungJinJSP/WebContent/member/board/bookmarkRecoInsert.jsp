<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${ bookmark_db_check == 0 || reco_db_check == 0 }">
	<meta http-equiv="Refresh" content="0; url=/YeungJinFunnyBone/DBFail.do">
</c:if>