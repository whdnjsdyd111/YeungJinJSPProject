<%@page import="main.bean.NestCommentDBBean"%>
<%@page import="main.bean.CommentDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% request.setAttribute("neCom", NestCommentDBBean.getInstance().getNestCom(Integer.parseInt(request.getParameter("neCom_id")))); %>

<script type="text/javascript" src="dashboard/contentsNestComModal.js"></script>

<div class="modal-dialog">
	<div class="modal-content">
		<div class="modal-header flex-column">
			<div class="col d-flex justify-content-between">
				<a class="modal-title font-weight-bold btn btn-outline-dark" 
					href="memberManagement.do?sort=new#${ neCom.com_mem_id }" style="font-size: 2rem">${ neCom.com_mem_nickname }</a>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<span class="ml-2">${ neCom.com_date }</span>
		</div>
		<div class="modal-body">
			<div class="modal_contents_body">
				<div>
					${ neCom.com_content }
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			<button type="button" class="btn btn-danger" id="show_board">소속 게시판 보기</button>
			<input type="hidden" value="${ neCom.com_db_id }">
			<button type="button" class="btn btn-success" id="show_commment">소속 댓글 보기</button>
			<input type="hidden" value="${ neCom.com_id }">
			<button type="button" class="btn btn-warning" id="delete_neCom">지우기</button>
			<input type="hidden" value="${ neCom.neCom_id }" >
		</div>
	</div>
</div>