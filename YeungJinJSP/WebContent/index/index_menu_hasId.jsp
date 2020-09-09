<%@page import="main.bean.MemberDBBean"%>
<%@page import="main.bean.MemberDataBean"%>
<%@page import="main.bean.AES256Util"%>
<%@page import="main.bean.SHA256"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
	SHA256 sha = SHA256.getInstance();
	AES256Util aes = new AES256Util(sha.getSha256("random_mem_email_key"));

	String emailEnc = String.valueOf(session.getAttribute("YJFBID_SES"));
	String email = aes.aesDecode(emailEnc);
	MemberDBBean memProcess = MemberDBBean.getInstance();
	
	MemberDataBean mem = memProcess.getMember(email);
	request.setAttribute("mem", mem);
%>
<c:set var="mem" value="${ mem }" scope="request"/>
<div id="index_menu_bar">
	<label>${ mem.getMem_nickname() }</label>
	<span></span>
	<a href="logout.do">로그아웃</a>
	<span></span>
	<a href="">계정 설정</a>
</div>