<%@page import="main.bean.AES256Util"%>
<%@page import="main.bean.SHA256"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${ check == 1 }">
	<%
		request.setCharacterEncoding("utf-8");
		SHA256 sha = SHA256.getInstance();
		AES256Util aes = new AES256Util(sha.getSha256("random_mem_email_key"));
	
		String email = request.getParameter("email");
		String emailEnc = aes.aesEncode(email);
		
		session.setAttribute("YJFBID_SES", emailEnc);
	%>
</c:if>
<p id='ck'>${ check }