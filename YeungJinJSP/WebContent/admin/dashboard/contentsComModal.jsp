<%@page import="main.bean.NestCommentDBBean"%>
<%@page import="main.bean.CommentDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% 	request.setAttribute("com", CommentDBBean.getInstance().getCommentContents(Integer.parseInt(request.getParameter("com_id")))); 
	request.setAttribute("nestCom", NestCommentDBBean.getInstance().getNestList(Integer.parseInt(request.getParameter("com_id"))));
%>

<script type="text/javascript" src="dashboard/contentsComModal.js"></script>

<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header flex-column">
				<div class="col d-flex justify-content-between">
					<a class="modal-title font-weight-bold btn btn-outline-dark" 
						href="memberManagement.do?sort=new#${ com.com_mem_id }" style="font-size: 2rem">${ com.com_mem_nickname }</a>
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
					<hr>
					<div>
						<h5 class="text-success mb-3">리댓</h5>
						<div>
							<c:forEach var="nest" items="${ nestCom }">
								<div class="row mb-2 pr-2">
									<div class="col-1">
										<i class="fa fa-caret-right mt-2"></i>
									</div>
									<div class="col-3">
										<a class="btn btn-outline-danger" 
											href="memberManagement.do?sort=new#${ nest.mem_id }">${ nest.mem_nickname }</a>
									</div>
									<div class="col-8 border border-primary pt-2">
										<span class="stretched-link neCom_id" role="button"></span>
										<input type="hidden" value="${ nest.neCom_id }" />
										${ nest.reCom_content }
									</div>
								</div>
							</c:forEach>	
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-danger" id="show_board">소속 게시판 보기</button>
				<input type="hidden" value="${ com.com_db_id }">
				<button type="button" class="btn btn-warning" onclick="delete_comment(this)">지우기</button>
			</div>
		</div>
	</div>