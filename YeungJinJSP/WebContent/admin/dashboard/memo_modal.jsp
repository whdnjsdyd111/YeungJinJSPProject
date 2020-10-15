<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<sql:query var="memo_modal_rs" dataSource="jdbc/yjfb">
	SELECT m.memo_id, m.memo_content, DATE_FORMAT(m.memo_date, '%y-%m-%d %T'), a.admin_name FROM memo m JOIN 
	admin a ON a.admin_id = m.admin_id ORDER BY memo_date ASC;
</sql:query>
    
<c:forEach var="memo" items="${ memo_modal_rs.rowsByIndex }">
	<div class="d-flex flex-md-row pl-2 pt-1 mb-2">
		<div class="mx-2">
			<i class="fa fa-user-circle fa-3x"></i>
			<span>${ memo[3] }</span>
		</div>
		<div class="d-flex flex-column">
			<span>${ memo[2] }</span>
			<span class="overflow-auto" style="height: 48px;">${ memo[1] }</span>
		</div>
		<div class="align-self-center bg-danger m-2">
			<button type="button" class="close delete_memo_modal" aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
			<input type="hidden" value="${ memo[0] }" />
		</div>
	</div>
</c:forEach>