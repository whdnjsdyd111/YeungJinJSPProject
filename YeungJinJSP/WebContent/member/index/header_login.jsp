<%@page import="main.bean.MemberDataBean"%>
<%@page import="main.bean.MemberDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");

	int id = (Integer) session.getAttribute("YJFBID_SES");
	MemberDBBean memProcess = MemberDBBean.getInstance();
	MemberDataBean mem = memProcess.getMember(id);

	request.setAttribute("mem", mem);
%>

<header class="container-fluid px-0">
	<div class="navbar navbar-expand-lg navbar-dark bg-dark flex-md-row bd-navbar fixed-top justify-content-start">
	
		<a class="navbar-brand mr-0 mr-md-2" href="mainBoard.do?kind=all&sort=pop" aria-label="YJFB"> <img
			width="40" height="40" src="resource/images/index/yjfb_logo.png">
		</a>
			
		<div class="navbar-expand">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item dropdown">
					<a class="nav-link" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"><span><i id="notice_bell" class="fa fa-bell-o fa-2 text-white ml-3 mr-3"></i></span></a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown" style="width: 350px;">
							<!-- 알림 -->
							<div id="notice_div">
								<jsp:include page="/member/index/notice.jsp" />
							</div>
							
						</div></li>
				<li class="nav-item dropdown">
					<a class="nav-link" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"><span class="text-white">${ mem.mem_nickname }</span></a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<div class="text-primary text-center">레벨 <span>${ mem.mem_level }</span></div>
							<div class="progress m-1">
  								<div class="progress-bar bg-success" role="progressbar" style="width: 25%" 
  									aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">${ mem.mem_ex }</div>
							</div>
							<div class="text-muted text-center">남은 경험치 10</div>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item text-center" href="mainBoard.do?kind=all&target=writer&search=${ mem.mem_nickname }">
								<i class="fa fa-sticky-note mr-2"></i>내가 쓴 글
							</a>
							<a class="dropdown-item text-center" href="mainBoard.do?kind=bookmark">
								<i class="fa fa-bookmark mr-2"></i>북마크
							</a>
							<a class="dropdown-item text-center" href="writeBoardForm.do"><i class="fa fa-pencil mr-2"></i>글쓰기</a>
						</div></li>
			</ul>
		</div>
			
		<button class="navbar-toggler header_support_btn mr-2" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ml-md-auto">
				<li class="nav-item dropdown mr-3"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"><span><i class="fa fa-newspaper-o mr-2"></i>정보</span></a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="mainBoard.do?kind=600&sort=recent">공지사항</a> 
							<a class="dropdown-item" href="mainBoard.do?kind=700&sort=recent">소식</a>
						</div></li>
				<li class="nav-item dropdown mr-3"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"><span><i class="fa fa-list mr-2"></i>커뮤니티</span></a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="mainBoard.do?kind=100&sort=pop">자유</a> 
							<a class="dropdown-item" href="mainBoard.do?kind=200&sort=pop">유머</a>
							<a class="dropdown-item" href="mainBoard.do?kind=300&sort=pop">공포</a>
							<a class="dropdown-item" href="mainBoard.do?kind=400&sort=pop">만화</a>
							<a class="dropdown-item" href="mainBoard.do?kind=500&sort=pop">코로나 뉴스</a>
						</div></li>
				<li class="nav-item mr-3"><a class="nav-link"
					href="logout.do"><span><i class="fa fa-sign-out mr-2"></i>로그아웃</span></a></li>
				<li class="nav-item mr-3"><a class="nav-link"
					href="checkPasswordForm.do"><span><i class="fa fa-address-card mr-2"></i>계정설정</span></a></li>
			</ul>
		</div>
	</div>
</header>