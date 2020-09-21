<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container-fluid" style="margin-top: 3.65rem !important">

	<div class="row navbar navbar-expand-lg px-0" >
			
		<div class="col-xl-3 col-lg-3 collapse navbar-collapse">
			<nav id="sidebar" class="nav_wrap">
			    <div class="sidebar">
			    	
			        <ul>
			            <li><a href="mainBoard.do?kind=all&sort=pop"><i class="fa fa-home"></i>홈으로</a></li>
			        </ul>
			        <p class="px-3 text-center mb-1">${ mem.mem_nickname }</p>
			        <div class="text-center">레벨 <span>${ mem.mem_level }</span></div>
			        <div class="progress ml-2 mr-2">
  								<div class="progress-bar bg-success" role="progressbar" style="width: 25%" 
  									aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">${ mem.mem_ex }</div>
							</div>
			        <div class="text-center mb-1">남은 경험치 10</div>
			        <div class="row text-center">
						<div class="col px-0 ml-3">
							<a href="mainBoard.do?kind=all&target=writer&search=${ mem.mem_nickname }" 
								class="btn btn-secondary" role="button" aria-pressed="true">
								<i class="fa fa-sticky-note"></i>내가 쓴 글
							</a>
						</div>
						<div class="col px-0 mr-1">
							<a href="mainBoard.do?kind=bookmark" 
								class="btn btn-secondary" role="button" aria-pressed="true">
								<i class="fa fa-bookmark"></i>북마크
							</a>
						</div>
					</div>
			        <ul class="mt-1">
			            <li><a href="logout.do"><i class="fa fa-sign-out"></i>로그아웃</a></li>
			        </ul>
			        <p class="px-3 ml-5"><i class="fa fa-newspaper-o mr-3"></i>정보</p>
			        <ul>
			            <li><a href="mainBoard.do?kind=600&sort=pop">공지사항</a></li>
			            <li><a href="mainBoard.do?kind=700&sort=pop">소식</a></li>
			        </ul>
			        <p class="px-3 ml-5"><i class="fa fa-list mr-3"></i>커뮤니티</p>
			        <ul>
			            <li><a href="mainBoard.do?kind=100&sort=pop">자유</a></li>
			            <li><a href="mainBoard.do?kind=200&sort=pop">유머</a></li>
			            <li><a href="mainBoard.do?kind=300&sort=pop">공포</a></li>
			            <li><a href="mainBoard.do?kind=400&sort=pop">만화</a></li>
			            <li><a href="mainBoard.do?kind=500&sort=pop">코로나 뉴스</a></li>
			        </ul>
			    </div>
			</nav>
		</div>
		
		<div id="content" class="col-xl-9 col-lg-9 row px-0 mt-0 mx-0">
	
			<div id="content_main" class="col-xl-10 col-lg-12 bg-success px-0">
				<section>
					<c:if test="${ cont == null }">
						<script type="text/javascript">
							window.location.href = "mainBoard.do?kind=all&sort=pop";
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