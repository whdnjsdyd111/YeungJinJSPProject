<%@page import="main.bean.MemberDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setAttribute("mem", MemberDBBean.getInstance().getMember(Integer.parseInt(request.getParameter("mem_id")))); %>
    
<script type="text/javascript" src="dashboard/memberAuthModal.js"></script>
    
<div class="modal-dialog">
	<div class="modal-content">
		<div class="modal-header flex-column">
			<div class="col d-flex justify-content-between">
				<h4 class="modal-title" >${ mem.mem_nickname }</h4>
				<input type="hidden" id="mem_id" value="${ mem.mem_id }">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
		</div>
		<div class="modal-body">
			<div class="modal_contents_body">
				<div>
					<p class="border">이메일 : ${ mem.mem_email }</p>
					<p class="border">가입일 : ${ mem.mem_date }</p>
					
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text">레벨</span>
						</div>
						<input type="text" class="form-control" value="${ mem.mem_level }" id="level_form">
						<div class="input-group-append">
							<button type="button" class="btn btn-danger" id="level">변경</button>
						</div>
					</div>
					
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text">경험치</span>
						</div>
						<input type="text" class="form-control" value="${ mem.mem_ex }" id="ex_form">
						<div class="input-group-append">
							<button type="button" class="btn btn-danger" id="ex">변경</button>
						</div>
					</div>
					
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text">이메일 인증</span>
						</div>
						<input type="text" class="form-control" value="${ Character.toString(mem.mem_auth) }" id="auth_form">
						<div class="input-group-append">
							<button type="button" class="btn btn-danger" id="auth">변경</button>
						</div>
					</div>
					<p class="text-secondary text-right">Y 또는 N</p>
					
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text">메시지 보내기</span>
						</div>
						<input type="text" class="form-control" id="message_form" maxlength="35">
						<div class="input-group-append">
							<button type="button" class="btn btn-danger" id="message">보내기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		</div>
	</div>
</div>