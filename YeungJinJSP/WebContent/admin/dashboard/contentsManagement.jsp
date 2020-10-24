<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${ !empty none_param }">
	<script>
		window.location.href = "contentsManagement.do?search=board&sort=recent";
	</script>
</c:if>

<script type="text/javascript" src="dashboard/contentsManagement.js"></script>
    
<h2 class="mb-3">컨텐츠 관리 페이지</h2>
<div class="container pl-0">
	<div class="input-group">
		<div class="input-group-prepend">
			<button class="btn btn-info"><a class="text-white" href="contentsManagement.do?search=board&sort=recent">게시판</a></button>
		</div>
		<div class="input-group-append">
			<button class="btn btn-primary"><a class="text-white" href="contentsManagement.do?search=comment&sort=recent">댓글/리댓</a></button>	
		</div>
	</div>
</div>
<div class="container border border-dark rounded overflow-auto" style="height: 350px;">
	<div class="row">
		<button class="col-4 btn btn-secondary rounded-0 border-right" id="recent">최신순</button>
		<button class="col-4 btn btn-secondary rounded-0 border-right" id="recommend">추천순</button>
		<button class="col-4 btn btn-secondary rounded-0" id="nonRecommend">비추순</button>
	</div>
	
	<c:if test="${ !empty board }">
		<c:forEach var="bd" items="${ board }">
			<div class="row d-flex justify-content-around my-3">
				<div class="col-lg-6 col-sx-4 d-flex justify-content-around mb-2 mt-1">
					<a class="btn btn-outline-secondary col-6 mr-2" href="#${ bd.mem_id }">${ bd.mem_nickname }</a>
					<span class="border col-6">${ bd.board_title }</span>
				</div>
				<button class="btn btn-outline-dark watch_content">내용 보기</button>
				<input type="hidden" value="${ bd.board_id }" />
				<button class="btn btn-warning delete">지우기</button>
			</div>
		</c:forEach>
	</c:if>
</div>
<div class="modal" tabindex="-1">
	
</div>