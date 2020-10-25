<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${ !empty none_param }">
	<script>
		window.location.href = "memberManagement.do?sort=new";
	</script>
</c:if>

<script type="text/javascript" src="dashboard/memberManagement.js"></script>

<h2 class="mb-3">멤버 관리 페이지</h2>
<div class="container pl-0">
	<div class="input-group">
		<div class="input-group-prepend">
			<button class="btn btn-info"><a class="text-white" href="memberManagement.do?sort=new">신규 회원 순</a></button>
		</div>
		<div class="input-group-append">
			<button class="btn btn-primary"><a class="text-white" href="memberManagement.do?sort=old">오래된 회원 순</a></button>	
		</div>
		<div class="input-group-append">
			<button class="btn btn-dark"><a class="text-white" href="memberManagement.do?sort=level">회원 레벨 순</a></button>	
		</div>
	</div>
</div>
<div class="container border border-dark rounded overflow-auto" style="height: 350px;">
	<c:forEach var="mem" items="${ member }">
		<div class="row d-flex justify-content-around my-3" id="#${ mem.mem_id }">
			<div class="col-lg-6 col-sx-4 d-flex justify-content-around mb-2 mt-1">
				<div class="col">
					<span class="border border-secondary rounded mr-2 p-1">${ mem.mem_nickname }</span>
				</div>
				<span class="border col com_content">가입일 : ${ mem.mem_date }</span>
			</div>
			<button class="btn btn-outline-dark watch_contents">활동 보기</button>
			<input type="hidden" value="${ mem.mem_id }" />
			<button class="btn btn-warning watch_auth">경고/권한</button>
		</div>
	</c:forEach>
</div>
<div class="modal" tabindex="-1">
	
</div>