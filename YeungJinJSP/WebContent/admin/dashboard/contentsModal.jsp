<%@page import="main.bean.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% request.setAttribute("board", BoardDBBean.getInstance().getBorad(Integer.parseInt(request.getParameter("board_id")))); %>
   
<div class="modal-dialog">
	<div class="modal-content">
		<div class="modal-header">
			<h5 class="modal-title">${ board.board_title }</h5>
			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
		<div class="modal-body">
			<div class="modal_contents_body">
				${ board.board_content }
			</div>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			<input type="hidden" value="${ board.board_id }">
			<button type="button" class="btn btn-warning" onclick="delete_board(this)">지우기</button>
		</div>
	</div>
</div>