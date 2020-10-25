<%@page import="main.bean.CommentDBBean"%>
<%@page import="main.bean.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% 	request.setAttribute("board", BoardDBBean.getInstance().getBorad(Integer.parseInt(request.getParameter("board_id")))); 
	request.setAttribute("comments", CommentDBBean.getInstance().getCommentList(Integer.parseInt(request.getParameter("board_id"))));
%>
   
<script type="text/javascript" src="dashboard/contentsBoardModal.js"></script>
   
<div class="modal-dialog">
	<div class="modal-content">
		<div class="modal-header flex-column">
			<div class="col d-flex justify-content-between">
				<span class="modal-title font-weight-bold" style="font-size: 2rem">${ board.board_title }</span>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<span class="ml-2">${ board.board_date }</span>
			<div class="flex">
				<span class="mr-2"><i class="fa fa-eye mx-2"></i>${ board.board_readcount }</span>
				<span class="mr-2"><i class="fa fa-thumbs-o-up mx-2"></i>${ board.board_reco }</span>
				<span class="mr-2"><i class="fa fa-thumbs-o-down mx-2"></i>${ board.board_nonReco }</span>
			</div>
		</div>
		<div class="modal-body">
			<div class="modal_contents_body">
				<div>
					${ board.board_content }
				</div>
				<hr>
				<div>
					<h5 class="text-success mb-3">댓글</h5>
					<div>
						<c:forEach var="entry" items="${ comments }">
							<c:set var="com" value="${ entry.key }" />
							<div class="row mb-2 pr-2">
								<div class="col-3">
									<a class="btn btn-outline-danger" 
										href="memberManagement.do?sort=new#${ com.com_mem_id }">${ com.com_mem_nickname }</a>
								</div>
								<div class="col-9 border border-primary pt-2">
									<span class="stretched-link com_id" role="button"></span>
									<input type="hidden" value="${ com.com_id }" />
									${ com.com_content }
								</div>
							</div>
							
							<c:forEach var="nestcom" items="${ entry.value }">
								<div class="row mb-2 pr-2">
									<div class="col-1">
										<i class="fa fa-caret-right mt-2"></i>
									</div>
									<div class="col-3">
										<a class="btn btn-outline-danger" 
											href="memberManagement.do?sort=new#${ nestcom.mem_id }">${ nestcom.mem_nickname }</a>
									</div>
									<div class="col-8 border border-primary pt-2">
										<span class="stretched-link neCom_id" role="button"></span>
										<input type="hidden" value="${ nestcom.neCom_id }" />
										${ nestcom.reCom_content }
									</div>
								</div>
							</c:forEach>
							
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			<input type="hidden" value="${ board.board_id }">
			<button type="button" class="btn btn-warning" onclick="delete_board(this)">지우기</button>
		</div>
	</div>
</div>