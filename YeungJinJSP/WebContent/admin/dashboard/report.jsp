<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript" src="dashboard/report.js"></script>

<h2 class="mb-3">신고 처리</h2>
<div class="container border border-dark rounded overflow-auto" style="height: 350px;">
<c:forEach var="report" items="${ reports }">
	<div class="row d-flex justify-content-around my-3">
		<div class="col-lg-6 col-sx-4 d-flex justify-content-around mb-2 mt-1">
			<a class="btn btn-dark" href="memberManagement.do?sort=new#${ report.mem_id }">${ report.mem_nickname }</a>
			<span>${ report.rep_date }</span>
		</div>
		<input type="hidden" value="${ report.cont_id }" />
		<input type="hidden" value="${ report.cont_kind }">
		<button class="btn btn-outline-dark watch_content">내용 보기</button>
		<div class="d-none">${ report.rep_content }</div>
		<div class="d-none">${ report.rep_kind_name }</div>
		<button class="btn btn-danger" onclick="report_delete(this)">신고삭제</button>
		<button class="btn btn-success" onclick="report_pro(this)">신고처리</button>
		<input type="hidden" value="${ report.rep_id }" id="report_id"/>
		<input type="hidden" value="${ report.mem_id }" id="mem_id"/>
	</div>
</c:forEach>
</div>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
			  <h5 class="modal-title" id="exampleModalLabel">신고 내용</h5>
			  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			    <span aria-hidden="true">&times;</span>
			  </button>
			</div>
			<div class="modal-body">
				<h4 class="text-info">신고 종류</h4>
			 	<div id="report_kind"></div>
			 	<hr>
			 	<h4 class="text-primary">신고 내용</h4>
			 	<div id="report_content"></div>
				<hr>
			  <a id="go_contents" class="btn btn-warning">콘텐츠</a>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
				<button class="btn btn-danger" onclick="report_delete(this)">신고삭제</button>
				<button class="btn btn-success" onclick="report_pro(this)">처리완료</button>
				<input type="hidden" value="" id="modal_report_id"/>
				<input type="hidden" value="" id="modal_mem_id"/>
			</div>
		</div>
	</div>
</div>