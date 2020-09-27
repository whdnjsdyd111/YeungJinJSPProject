<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container-fluid" style="margin-top: 3.65rem !important">

	<div class="row navbar navbar-expand-lg px-0" >
			
		<div class="col-xl-3 col-lg-3 collapse navbar-collapse">
			<nav id="sidebar" class="nav_wrap">
			    <div class="sidebar">
			        <ul>
			            <li><a href="mainBoard.do?kind=all&sort=recent"><i class="fa fa-home"></i>홈으로</a></li>
			            <li><a href="loginForm.do"><i class="fa fa-sign-in"></i>로그인</a></li>
			            <li><a href="findPasswdForm.do"><i class="fa fa-key"></i>비밀번호 찾기</a></li>
			            <li><a href="registerForm.do"><i class="fa fa-user-plus"></i>회원가입</a></li>
			        </ul>
			        <p class="px-3 ml-5"><i class="fa fa-newspaper-o mr-3"></i>정보</p>
			        <ul>
			            <li><a href="mainBoard.do?kind=600&sort=recent">공지사항</a></li>
			            <li><a href="mainBoard.do?kind=700&sort=recent">소식</a></li>
			        </ul>
			        <p class="px-3 ml-5"><i class="fa fa-list mr-3"></i>커뮤니티</p>
			        <ul>
			            <li><a href="mainBoard.do?kind=100&sort=recent">자유</a></li>
			            <li><a href="mainBoard.do?kind=200&sort=recent">유머</a></li>
			            <li><a href="mainBoard.do?kind=300&sort=recent">공포</a></li>
			            <li><a href="mainBoard.do?kind=400&sort=recent">만화</a></li>
			            <li><a href="mainBoard.do?kind=500&sort=recent">코로나 뉴스</a></li>
			        </ul>
			    </div>
			</nav>
		</div>
		
		<div id="content" class="col-xl-9 col-lg-9 row px-0 mt-0 mx-0">
	
			<div id="content_main" class="col-xl-10 col-lg-12 px-0">
				<section>
					<c:if test="${ cont == null }">
						<script type="text/javascript">
							window.location.href = "mainBoard.do?kind=all&sort=recent";
						</script>
					</c:if>
					
					<c:if test="${ cont != null }">
						<jsp:include page="${ cont }" />
					</c:if>
				</section>
			</div>
		
			<div id="content_add" class="col-xl-2 col-lg-12 px-0">
				<section>
					<img id="add" class="img-fluid" src="" />
				</section>
			</div>
			
		</div>
	</div>

</div>