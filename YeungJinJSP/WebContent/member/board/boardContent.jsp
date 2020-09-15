<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="member/board/boardContent.js"></script>
<div>
	<div>
		<h2>${ board.getBoard_title() }</h2>
		<div>
			<div>
				<a>${ kind }</a>
				<span>|</span>
				<a>${ nickname }</a>
				<span>|</span>
				<span>${ level }</span>
			</div>
			
			<div>
				<span>${ board.getBoard_date() }</span>
				<span>|</span>
				<span>${ board.getBoard_readcount() }</span>
				<span>|</span>
				<span>${ board.getBoard_reco() }</span>
				<span>|</span>
				<span>${ board.getBoard_nonReco() }</span>
			</div>
		</div>
	</div>
	
	<c:if test="${ host != null }">
		<button id="board_delete">삭제</button>
		<button id="board_update">수정</button>
	</c:if>
	
	<div>
		${ board.getBoard_content() }
	</div>
	<div>
		<c:if test="${ empty sessionScope.YJFBID_SES }">
			<button class="go_login">${ board.getBoard_reco() }</button>
			<button class="go_login">${ board.getBoard_nonReco() }</button>
			<button class="go_login">북마크</button>
			<button class="go_login">신고하기</button>
		</c:if>
		
		<c:if test="${ !empty sessionScope.YJFBID_SES }">
			<c:if test="${ nonReco == null }">
				<button class="reco_n" id="reco">${ board.getBoard_reco() }</button>
				<button class="nonReco_n" id="nonReco">${ board.getBoard_nonReco() }</button>
			</c:if>
			<c:if test="${ nonReco == 'N' }">
				<button class="reco_y" id="reco">${ board.getBoard_reco() }</button>
				<button class="nonReco_n" id="nonReco">${ board.getBoard_nonReco() }</button>
			</c:if>
			<c:if test="${ nonReco == 'Y' }">
				<button class="reco_n" id="reco">${ board.getBoard_reco() }</button>
				<button class="nonReco_y" id="nonReco">${ board.getBoard_nonReco() }</button>
			</c:if>
			
			<c:if test="${ bookmark == null }">
				<button class="bookmark_n" id="bookmark">북마크</button>
			</c:if>
			<c:if test="${ bookmark != null }">
				<button class="bookmark_y" id="bookmark">북마크</button>
			</c:if>
			
			<button id="report">신고하기</button>
		</c:if>
		
	</div>
	<div id="comments_div">
		<jsp:include page="/member/board/comment.jsp" />	
	</div>
</div>