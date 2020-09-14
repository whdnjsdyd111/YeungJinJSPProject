<%@page import="main.bean.AES256Util"%>
<%@page import="main.bean.SHA256"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${ check == 1 }">
	<%
		request.setCharacterEncoding("utf-8");
		SHA256 sha = SHA256.getInstance();
		AES256Util aes = new AES256Util(sha.getSha256("random_mem_id_key"));
	
		String id = String.valueOf(request.getAttribute("mem_id"));
		String idEnc = aes.aesEncode(id);
		
		session.setAttribute("YJFBID_SES", idEnc);
	%>
</c:if>
<p id='ck'>${ check }