<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript" src="member/index/feedback.js"></script>
<footer class="container-fluid mt-5 footer">
	<div class="card mx-5">
		<div class="row mb-4 ">
			<div class="col-lg-4 col-md-7 col-sm-11 col-xs-11">
				<div class="footer-text pull-left">
					<div class="d-flex">
						<h1 class="mr-2 px-3">
							<img width="50" height="50" src="resource/images/index/yjfb_logo.png">
						</h1>
						<h1 style="color: #957bda">YJFB</h1>
					</div>
					<p class="card-text">
						대구광역시 북구 복현로 35 본관 320호 <br /> 
						전화 053) 940 - 5114 (대표자 : 조원용)<br>
					</p>
					<div class="social mt-2 mb-3">
						<i class="fa fa-facebook-official fa-lg"></i> 
						<i class="fa fa-instagram fa-lg"></i>
						<i class="fa fa-twitter fa-lg"></i>
						<i class="fa fa-linkedin-square fa-lg"></i> 
						<i class="fa fa-facebook"></i>
					</div>
				</div>
			</div>
			<div class="col-lg-2 col-md-6 col-sm-6 col-xs-6">
				<h4 class="footer_heading pt-5 text-center">
					<a class="badge badge-dark" href="introduction.do">소개</a>
				</h4>
			</div>
			<div class="col-lg-2 col-md-6 col-sm-6 col-xs-6">
				<h4 class="footer_heading pt-5 text-center">
					<a class="badge badge-dark" href="tos.do">이용약관</a>
				</h4>
			</div>
			<div class="col-lg-2 col-md-6 col-sm-6 col-xs-6">
				<h4 class="footer_heading pt-5 text-center">
					<a class="badge badge-dark" href="policy.do">정보처리방침</a>
				</h4>
			</div>
			<div class="col-lg-2 col-md-6 col-sm-6 col-xs-6">
				<h4 class="footer_heading pt-5 text-center">
					<button class="badge badge-dark border-0" id="feedback">문의/피드백</button>
				</h4>
			</div>
		</div>

		<div class="foot_divide mb-4"></div>
		<div class="row" style="font-size: 10px;">
			<div class="col-md-6 col-sm-6 col-xs-6">
				<div class="pull-left">
					<p>&copy; Copyright WD-A Jo Won Yong All rights reserved</p>
				</div>
			</div>
			<div class="col-md-6 col-sm-6 col-xs-6">
				<div class="pull-right mr-4 d-flex policy">
					<div>Terms of Use</div>
					<div>Privacy Policy</div>
					<div>Cookie Policy</div>
				</div>
			</div>
		</div>
	</div>
</footer>
<div class="modal fade" id="feedback_modal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header flex-column">
				<h4 class="modal-title mb-2">피드백</h4>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text">@</span>
					</div>
					<input type="text" class="form-control" placeholder="이메일 입력란" id="feed_email">
				</div><br>
				<small id="check_email" class="form-text text-muted check_small mb-2"></small>
			</div>
			<div class="modal-body">
				<textarea class="w-100 rounded" style="resize: none; height: 300px;" id="feed_content"></textarea>
				<small id="check_content" class="form-text text-muted check_small mb-2"></small>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
				<button type="button" class="btn btn-primary" id="feed_submit">제출하기</button>
			</div>
		</div>
	</div>
</div>