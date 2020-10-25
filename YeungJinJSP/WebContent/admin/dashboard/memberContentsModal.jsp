<%@page import="main.bean.MemberDBBean"%>
<%@page import="main.bean.NestCommentDBBean"%>
<%@page import="main.bean.CommentDBBean"%>
<%@page import="main.bean.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	request.setAttribute("mem", MemberDBBean.getInstance().getMember(Integer.parseInt(request.getParameter("mem_id"))));
	request.setAttribute("boards", BoardDBBean.getInstance().getBoardIds(Integer.parseInt(request.getParameter("mem_id"))));
	request.setAttribute("comments", CommentDBBean.getInstance().getCommentIds(Integer.parseInt(request.getParameter("mem_id"))));
	request.setAttribute("nestComments", NestCommentDBBean.getInstance().getNestCommentIds(Integer.parseInt(request.getParameter("mem_id"))));
%>

<script type="text/javascript" src="dashboard/memberContentsModal.js"></script>

<div class="modal-dialog">
	<div class="modal-content">
		<div class="modal-header flex-column">
			<div class="col d-flex justify-content-between">
				<h4 class="modal-title" >${ mem.mem_nickname }</h4>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
		</div>
		<div class="modal-body">
			<div>
				<p class="border">이메일 : ${ mem.mem_email }</p>
				<p class="border">가입일 : ${ mem.mem_date }</p>
				<p class="border">레벨 : ${ mem.mem_level }</p>
				<p class="border">경험치 : ${ mem.mem_ex }</p>
			</div>
			<div class="modal_contents_body">
				<div>
					<h5>게시판 활동</h5>
					<c:forEach var="id" items="${ boards }">
						<span class="btn btn-danger mb-2 board">${ id }</span>
						<input type="hidden" value="${ id }">
					</c:forEach>
				</div>
				<hr>
				<div>
					<h5>댓글 활동</h5>
					<c:forEach var="id" items="${ comments }">
						<span class="btn btn-warning mb-2 comment">${ id }</span>
						<input type="hidden" value="${ id }">
					</c:forEach>
				</div>
				<hr>
				<div>
					<h5>리댓 활동</h5>
					<c:forEach var="id" items="${ nestComments }">
						<span class="btn btn-success mb-2 nest_comment">${ id }</span>
						<input type="hidden" value="${ id }">
					</c:forEach>
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		</div>
	</div>
</div>