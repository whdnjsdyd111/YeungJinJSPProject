<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${ check1 == 1 && check2 == 1 }">
	<p id='reco'>${ reco_count }reco</p>
</c:if>