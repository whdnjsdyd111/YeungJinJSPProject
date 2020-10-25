<%@page import="main.bean.NestCommentDBBean"%>
<%@page import="main.bean.CommentDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	if(request.getParameter("com_id") != null) {
		request.setAttribute("com", CommentDBBean.getInstance().getCom(Integer.parseInt(request.getParameter("com_id"))));
	} else if(request.getParameter("neCom_id") != null) {
		request.setAttribute("neCom", NestCommentDBBean.getInstance().getNestCom(Integer.parseInt(request.getParameter("neCom_id"))));
	}
%>

<script type="text/javascript" src="dashboard/contentsBoardComModal.js"></script>

<c:if test="${ !empty com }">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header flex-column">
				<div class="col d-flex justify-content-between">
					<a class="modal-title font-weight-bold btn btn-outline-dark" href="#" style="font-size: 2rem">${ com.com_mem_nickname }</a>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<span class="ml-2">${ com.com_date }</span>
				<span class="mr-2"><i class="fa fa-thumbs-o-up mx-2"></i>${ com.com_reco }</span>
			</div>
			<div class="modal-body">
				<div class="modal_contents_body">
					<div>
						${ com.com_content }
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-danger" id="show_board">소속 게시판 보기</button>
				<input type="hidden" value="${ com.com_db_id }">
				<input type="hidden" value="${ com.com_id }">
				<button type="button" class="btn btn-warning" id="delete_com">지우기</button>
			</div>
		</div>
	</div>
</c:if>

<c:if test="${ !empty neCom }">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header flex-column">
				<div class="col d-flex justify-content-between">
					<a class="modal-title font-weight-bold btn btn-outline-dark" href="#" style="font-size: 2rem">${ neCom.com_mem_nickname }</a>
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
				<input type="hidden" value="${ neCom.com_id }">
				<button type="button" class="btn btn-warning" id="delete_neCom">지우기</button>
			</div>
		</div>
	</div>
</c:if>