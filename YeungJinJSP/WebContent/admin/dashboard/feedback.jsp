<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<c:if test="${ feedbacks == 0 }">
	<script>
		window.location.href = "feedback.do?sort=nonProcessed";
	</script>
</c:if>

<script type="text/javascript" src="dashboard/feedback.js"></script>

<h2 class="mb-3">피드백 처리</h2>
<div class="container pl-0">
	<div class="input-group">
		<div class="input-group-prepend">
			<button class="btn btn-info"><a class="text-white" href="feedback.do?sort=nonProcessed">미처리 피드백</a></button>
		</div>
		<div class="input-group-append">
			<button class="btn btn-primary"><a class="text-white" href="feedback.do?sort=processed">처리된 피드백</a></button>	
		</div>
	</div>
</div>
<div class="container border border-dark rounded overflow-auto" style="height: 350px;">
<c:if test="${ !empty nonProcessedFeedbacks }">
	<c:forEach var="feedback" items="${ nonProcessedFeedbacks }">
		<div class="row d-flex justify-content-around my-3">
			<div class="col-lg-6 col-sx-4 d-flex justify-content-around mb-2 mt-1">
				<span>${ feedback.feed_email }</span>
				<span>${ feedback.feed_date }</span>
			</div>
			<button class="btn btn-outline-dark watch_content">내용 보기</button>
			<div class="d-none">${ feedback.feed_content }</div>
			<button class="btn btn-danger process">처리하기</button>
			<input type="hidden" value="${ feedback.feed_id }" />
			<button class="btn btn-warning delete">지우기</button>
		</div>	
	</c:forEach>
</c:if>
<c:if test="${ !empty processedFeedbacks }">
	<c:forEach var="feedback" items="${ processedFeedbacks }">
		<div class="row d-flex justify-content-around my-3">
			<div class="col-lg-6 col-sx-4 d-flex justify-content-around mb-2 mt-1">
				<span>${ feedback.feed_email }</span>
				<span>${ feedback.feed_date }</span>
			</div>
			<button class="btn btn-outline-dark watch_content">내용 보기</button>
			<div class="d-none">${ feedback.feed_content }</div>
			<button class="btn btn-success">처리완료<i class="fa fa-check-square ml-2"></i></button>
		</div>	
	</c:forEach>
</c:if>
</div>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
			  <h5 class="modal-title" id="exampleModalLabel">피드백 내용</h5>
			  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			    <span aria-hidden="true">&times;</span>
			  </button>
			</div>
			<div class="modal-body">
			  <div id="feed_content"></div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>