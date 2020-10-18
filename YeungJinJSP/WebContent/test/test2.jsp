<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%

	String nicknames[] = { "asd", "조원용" };
	String nickname = request.getParameter("nickname");

	int check = 0;
	
	for(int i = 0; i < nicknames.length; i++) {
		if(nicknames[i].equals(nickname))
			check = 1;
	}
	
	// DB 처리해서 중복이 된건지 안된건지 확인
	
	// 중복되면 1
	// 중복 아니면 0
%>
<%= check %>