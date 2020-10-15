<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<script type="text/javascript" src="dashboard/memo.js"></script>

<sql:query var="memo_rs" dataSource="jdbc/yjfb">
	SELECT m.memo_id, m.memo_content, DATE_FORMAT(m.memo_date, '%y-%m-%d %T'), a.admin_name FROM memo m JOIN 
	admin a ON a.admin_id = m.admin_id ORDER BY memo_date DESC LIMIT 0, 3;
</sql:query>

<div class="border border-dark bg-primary">
	<div class="h-25 d-flex justify-content-between">
		<h3 class="p-1">메모장</h3>
		<button type="button" class="btn btn-light h-50" id="memo_modal"><i class="fa fa-arrows-alt"></i></button>
	</div>
	<c:forEach begin="1" end="${ memo_rs.rowCount }" step="1" var="i">
		<div class="d-flex flex-md-row pl-2 pt-1 mb-2 bg-info">
			<div class="mx-2">
				<i class="fa fa-user-circle fa-3x"></i>
				<span>${ memo_rs.rowsByIndex[memo_rs.rowCount - i][3] }</span>
			</div>
			<div class="d-flex flex-column">
				<span>${ memo_rs.rowsByIndex[memo_rs.rowCount - i][2] }</span>
				<span class="overflow-auto" style="height: 48px;">${ memo_rs.rowsByIndex[memo_rs.rowCount - i][1] }</span>
			</div>
			<div class="align-self-center bg-danger m-2">
				<button type="button" class="close delete_memo" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<input type="hidden" value="${ memo_rs.rowsByIndex[memo_rs.rowCount - i][0] }" />
			</div>
		</div>
	</c:forEach>
	<div class="input-group">
		<input id="memo_content" class="form-control rounded-0" placeholder="메모하기" aria-label="메모하기" type="text" maxlength="100"/>
		<div class="input-group-append">
			<button class="btn btn-dark rounded-0" id="memo_pro" type="button">메모</button>
		</div>
	</div>
</div>
<div class="modal fade" tabindex="-1">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5>관리자 메모장</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
		        	<span aria-hidden="true">&times;</span>
		        </button>
			</div>
			<div class="modal-body overflow-auto" id="memo_modal_div" style="max-height: 500px">
				<jsp:include page="memo_modal.jsp" />
			</div>
			<div class="modal-footer">
				<input class="form-control" id="memo_modal_content" placeholder="메모하기" aria-label="메모하기" type="text" maxlength="100" />
				<div class="input-group-append">
					<button class="btn btn-primary" id="memo_modal_pro" type="button">메모</button>
					<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
</div>