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
		<div class="input-group-append">
			<button class="btn btn-danger"><a class="text-white" href="contentsManagement.do?search=deleted&sort=recent">삭제된 콘텐츠</a></button>	
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
			<div class="row d-flex justify-content-around my-3" id="${ bd.board_id }">
				<div class="col-lg-6 col-sx-4 d-flex justify-content-around mb-2 mt-1">
					<div class="col">
						<a class="btn btn-outline-secondary mr-2" href="memberManagement.do?sort=new#${ bd.mem_id }">${ bd.mem_nickname }</a>
					</div>
					<span class="border col-6">${ bd.board_title }</span>
				</div>
				<button class="btn btn-outline-dark watch_board">내용 보기</button>
				<input type="hidden" value="${ bd.board_id }" />
				<button class="btn btn-warning" onclick="delete_board(this)">지우기</button>
			</div>
		</c:forEach>
	</c:if>
	
	<c:if test="${ !empty comment }">
		<c:forEach var="com" items="${ comment }">
			<div class="row d-flex justify-content-around my-3" id="${ com.com_id }">
				<div class="col-lg-6 col-sx-4 d-flex justify-content-around mb-2 mt-1">
					<div class="col">
						<a class="btn btn-outline-secondary mr-2" href="memberManagement.do?sort=new#${ com.mem_id }">${ com.mem_nickname }</a>
					</div>
					<span class="border col com_content">${ com.com_content }</span>
				</div>
				<button class="btn btn-outline-dark watch_comment">내용 보기</button>
				<input type="hidden" value="${ com.com_id }" />
				<button class="btn btn-warning" onclick="delete_comment(this)">지우기</button>
			</div>
		</c:forEach>
	</c:if>
	
	<c:if test="${ !empty deleted }">
		<h4 class="my-1">게시판</h4>
		<c:forEach var="cont" items="${ deleted_board }">
			<div class="row d-flex flex-column my-3">
				<div class="col-12 mb-2 mt-1 d-flex justify-content-around">
					<span class="border col-6">${ cont.cont_title }</span>
					<span class="border col-6 com_content">${ cont.cont_content }</span>
				</div>
				<div class="col-12 d-flex justify-content-around">
					<span class="ml-2">#${ cont.cont_id }</span>
					<a class="btn btn-outline-secondary mr-2" href="memberManagement.do?sort=new#${ cont.mem_id }">${ cont.mem_nickname }</a>
					<button class="btn btn-warning restore_board">복구</button>
					<input type="hidden" value="${ cont.cont_id }" />
					<button class="btn btn-danger comple_delete_board">완전 삭제</button>
				</div>
			</div>
		</c:forEach>
		
		<hr>
		<h4 class="my-1">댓글</h4>
		<c:forEach var="cont" items="${ deleted_comment }">
			<div class="row d-flex justify-content-around my-3">
				<div class="col-lg-6 col-sx-4 d-flex justify-content-around mb-2 mt-1">
					<div class="col">
						<a class="btn btn-outline-secondary mr-2" href="memberManagement.do?sort=new#${ cont.mem_id }">${ cont.mem_nickname }</a>
						<span class="ml-2">#${ cont.cont_id }</span>
					</div>
					<span class="border col com_content">${ cont.cont_content }</span>
				</div>
				<button class="btn btn-warning restore_comment">복구</button>
				<input type="hidden" value="${ cont.cont_id }" />
				<button class="btn btn-danger comple_delete_comment">완전 삭제</button>
			</div>
		</c:forEach>
		
		<hr>
		<h4 class="my-1">리댓</h4>
		<c:forEach var="cont" items="${ deleted_nestcomment }">
			<div class="row d-flex justify-content-around my-3">
				<div class="col-lg-6 col-sx-4 d-flex justify-content-around mb-2 mt-1">
					<div class="col">
						<a class="btn btn-outline-secondary mr-2" href="memberManagement.do?sort=new#${ cont.mem_id }">${ cont.mem_nickname }</a>
						<span class="ml-2">#${ cont.cont_id }</span>
					</div>
					<span class="border col com_content">${ cont.cont_content }</span>
				</div>
				<button class="btn btn-warning restore_nestcomment">복구</button>
				<input type="hidden" value="${ cont.cont_id }" />
				<button class="btn btn-danger comple_delete_nestcomment">완전 삭제</button>
			</div>
		</c:forEach>
	</c:if>
	
</div>
<div class="modal" tabindex="-1">
	
</div>