	<%@page import="main.bean.BoardDataBean"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript" src="member/board/boardContent.js"></script>

<div>
	<div class="col-12 p-3 border border-bottom-0 border-muted">
		<h2>${ board.board_title }</h2>
	</div>
	
	<div class="row d-flex mx-0 border border-bottom-0 border-muted">
		<div class="col-lg-7 col-sm-6 px-0">
			<span class="mr-2 ml-5">#${ board.board_id }</span>
			<a class="bg-primary border rounded text-dark px-1 mr-2 my-1" style="text-decoration: none"
							href="mainBoard.do?kind=${ board.board_kind }&sort=pop">${ kind }</a>
			<a class="text-dark" style="text-decoration: none;"
							href="mainBoard.do?kind=all&target=writer&search=${ nickname }">
							<span><i class="fa fa-user-circle mr-1"></i>${ nickname }</span>
						</a>
			<span class="d-inline-block" tabindex="0" data-toggle="tooltip" title="레벨 ${ level }">
					<button class="btn m-0" style="pointer-events: none; vertical-align: inherit;" type="button">
						<i class="fa fa-y-combinator-square mr-1"></i>${ level }
					</button>
				</span>
		</div>
		
		<div class="col-lg-5 col-sm-6 px-0">
			<span class="d-inline-block ml-3 my-1" tabindex="0" data-toggle="tooltip" title="${ board.board_date }">
				<button class="btn" style="pointer-events: none;" type="button">
					<%
						long time = new Timestamp(System.currentTimeMillis()).getTime() - 
							((BoardDataBean) request.getAttribute("board")).getBoard_date().getTime();
					
						out.print(
							(time / 1000 < 60) ? time / 1000 + "초 전" : (time / 1000 / 60 < 60) ? time / 1000 / 60 + "분 전"
									: (time / 1000 / 60 / 60 < 24) ? time / 1000 / 60 / 60 + "시간 전" : time / 1000 / 60 / 60 / 24 + "일 전"
								);
					%>
				</button>
			</span>
			
			<span><i class="fa fa-eye mx-2"></i>${ board.board_readcount }</span>
			<span><i class="fa fa-thumbs-o-up mx-2"></i>${ board.board_reco }</span>
			<span><i class="fa fa-thumbs-o-down mx-2"></i>${ board.board_nonReco }</span>
		</div>
	</div>
	
	<c:if test="${ host != null }">
		<div class="col-12 px-0 py-2 border border-muted border-bottom-0">
			<button id="board_update" class="btn btn-outline-warning ml-5">수정</button>
			<button id="board_delete" class="btn btn-outline-warning ml-3">삭제</button>
		</div>
	</c:if>
	
	<div class="jumbotron border border-muted rounded-0 border-bottom-0 mb-0">
		<div class="container">
			${ board.getBoard_content() }
		</div>
	</div>
	
	<c:if test="${ empty sessionScope.YJFBID_SES }">
		<div class="container border border-muted border-bottom-0">
			<div class="mx-auto">
				<button class="btn btn-lg btn-light mx-2 go_login">
					<span><i class="fa fa-level-up mr-2"></i>${ board.board_reco }</span>
				</button>
				<button class="btn btn-lg btn-light mx-2 go_login">
					<span>${ board.board_nonReco }<i class="fa fa-level-down ml-2"></i></span>
				</button>
				
				<input type="button" class="heart_box go_login" id="bookmark" />
					<label for="bookmark"> <svg class="svg_heart" id="heart-svg" viewBox="467 392 58 57" xmlns="http://www.w3.org/2000/svg">
			            <g id="Group" fill="none" fill-rule="evenodd" transform="translate(467 392)">
			                 <path 
			                 	d="M29.144 20.773c-.063-.13-4.227-8.67-11.44-2.59C7.63 28.795 28.94 43.256 29.143 43.394c.204-.138 21.513-14.6 11.44-25.213-7.214-6.08-11.377 2.46-11.44 2.59z"
								id="heart" fill="#AAB8C2" />
			                 <circle id="main-circ" fill="#E2264D" opacity="0"
								cx="29.5" cy="29.5" r="1.5" />
			                 <g id="heartgroup7" opacity="0" transform="translate(7 6)">
			                     <circle id="heart1" fill="#9CD8C3" cx="2" cy="6" r="2" />
			                     <circle id="heart2" fill="#8CE8C3" cx="5" cy="2" r="2" />
			                 </g>
			                 <g id="heartgroup6" opacity="0" transform="translate(0 28)">
			                     <circle id="heart1" fill="#CC8EF5" cx="2" cy="7" r="2" />
			                     <circle id="heart2" fill="#91D2FA" cx="3" cy="2" r="2" />
			                 </g>
			                 <g id="heartgroup3" opacity="0" transform="translate(52 28)">
			                     <circle id="heart2" fill="#9CD8C3" cx="2" cy="7" r="2" />
			                     <circle id="heart1" fill="#8CE8C3" cx="4" cy="2" r="2" />
			                 </g>
			                 <g id="heartgroup2" opacity="0" transform="translate(44 6)">
			                     <circle id="heart2" fill="#CC8EF5" cx="5" cy="6" r="2" />
			                     <circle id="heart1" fill="#CC8EF5" cx="2" cy="2" r="2" />
			                 </g>
			                 <g id="heartgroup5" opacity="0" transform="translate(14 50)">
			                     <circle id="heart1" fill="#91D2FA" cx="6" cy="5" r="2" />
			                     <circle id="heart2" fill="#91D2FA" cx="2" cy="2" r="2" />
			                 </g>
			                 <g id="heartgroup4" opacity="0" transform="translate(35 50)">
			                     <circle id="heart1" fill="#F48EA7" cx="6" cy="5" r="2" />
			                     <circle id="heart2" fill="#F48EA7" cx="2" cy="2" r="2" />
			                 </g>
			                 <g id="heartgroup1" opacity="0" transform="translate(24)">
			                     <circle id="heart1" fill="#9FC7FA" cx="2.5" cy="3" r="2" />
			                     <circle id="heart2" fill="#9FC7FA" cx="7.5" cy="2" r="2" />
			                 </g>
			             </g>
			         </svg>
				</label>
			</div>
		</div>
	</c:if>
	
	<c:if test="${ !empty sessionScope.YJFBID_SES }">
		<div class="border border-muted border-bottom-0">
			<div class="container">
				<div class="mx-auto">
					<c:if test="${ nonReco == null }">
						<button class="btn btn-lg btn-light mx-2 reco_n" id="reco">
							<span><i class="fa fa-level-up mr-2"></i>${ board.board_reco }</span>
						</button>
						<button class="btn btn-lg btn-light mx-2 nonReco_n" id="nonReco">
							<span>${ board.board_nonReco }<i class="fa fa-level-down ml-2"></i></span>
						</button>
					</c:if>
					<c:if test="${ nonReco == 'N' }">
						<button class="btn btn-lg btn-light mx-2 reco_y" id="reco">
							<span><i class="fa fa-level-up mr-2"></i>${ board.board_reco }</span>
						</button>
						<button class="btn btn-lg btn-light mx-2 nonReco_n" id="nonReco">
							<span>${ board.board_nonReco }<i class="fa fa-level-down ml-2"></i></span>
						</button>
					</c:if>
					<c:if test="${ nonReco == 'Y' }">
						<button class="btn btn-lg btn-light mx-2 reco_n" id="reco">
							<span><i class="fa fa-level-up mr-2"></i>${ board.board_reco }</span>
						</button>
						<button class="btn btn-lg btn-light mx-2 nonReco_y" id="nonReco">
							<span>${ board.board_nonReco }<i class="fa fa-level-down ml-2"></i></span>
						</button>
					</c:if>
					<c:if test="${ bookmark == null }">
						<input type="checkbox" class="heart_box bookmark_n" id="bookmark" />
							<label for="bookmark"> <svg class="svg_heart" id="heart-svg" viewBox="467 392 58 57" xmlns="http://www.w3.org/2000/svg">
					            <g id="Group" fill="none" fill-rule="evenodd" transform="translate(467 392)">
					                 <path 
					                 	d="M29.144 20.773c-.063-.13-4.227-8.67-11.44-2.59C7.63 28.795 28.94 43.256 29.143 43.394c.204-.138 21.513-14.6 11.44-25.213-7.214-6.08-11.377 2.46-11.44 2.59z"
										id="heart" fill="#AAB8C2" />
					                 <circle id="main-circ" fill="#E2264D" opacity="0"
										cx="29.5" cy="29.5" r="1.5" />
					                 <g id="heartgroup7" opacity="0" transform="translate(7 6)">
					                     <circle id="heart1" fill="#9CD8C3" cx="2" cy="6" r="2" />
					                     <circle id="heart2" fill="#8CE8C3" cx="5" cy="2" r="2" />
					                 </g>
					                 <g id="heartgroup6" opacity="0" transform="translate(0 28)">
					                     <circle id="heart1" fill="#CC8EF5" cx="2" cy="7" r="2" />
					                     <circle id="heart2" fill="#91D2FA" cx="3" cy="2" r="2" />
					                 </g>
					                 <g id="heartgroup3" opacity="0" transform="translate(52 28)">
					                     <circle id="heart2" fill="#9CD8C3" cx="2" cy="7" r="2" />
					                     <circle id="heart1" fill="#8CE8C3" cx="4" cy="2" r="2" />
					                 </g>
					                 <g id="heartgroup2" opacity="0" transform="translate(44 6)">
					                     <circle id="heart2" fill="#CC8EF5" cx="5" cy="6" r="2" />
					                     <circle id="heart1" fill="#CC8EF5" cx="2" cy="2" r="2" />
					                 </g>
					                 <g id="heartgroup5" opacity="0" transform="translate(14 50)">
					                     <circle id="heart1" fill="#91D2FA" cx="6" cy="5" r="2" />
					                     <circle id="heart2" fill="#91D2FA" cx="2" cy="2" r="2" />
					                 </g>
					                 <g id="heartgroup4" opacity="0" transform="translate(35 50)">
					                     <circle id="heart1" fill="#F48EA7" cx="6" cy="5" r="2" />
					                     <circle id="heart2" fill="#F48EA7" cx="2" cy="2" r="2" />
					                 </g>
					                 <g id="heartgroup1" opacity="0" transform="translate(24)">
					                     <circle id="heart1" fill="#9FC7FA" cx="2.5" cy="3" r="2" />
					                     <circle id="heart2" fill="#9FC7FA" cx="7.5" cy="2" r="2" />
					                 </g>
					             </g>
					         </svg>
						</label>
					</c:if>
					<c:if test="${ bookmark != null }">
						<input type="checkbox" class="heart_box bookmark_y" id="bookmark" />
							<label for="bookmark"> <svg class="svg_heart" id="heart-svg" viewBox="467 392 58 57" xmlns="http://www.w3.org/2000/svg">
					            <g id="Group" fill="none" fill-rule="evenodd" transform="translate(467 392)">
					                 <path 
					                 	d="M29.144 20.773c-.063-.13-4.227-8.67-11.44-2.59C7.63 28.795 28.94 43.256 29.143 43.394c.204-.138 21.513-14.6 11.44-25.213-7.214-6.08-11.377 2.46-11.44 2.59z"
										id="heart" fill="#AAB8C2" />
					                 <circle id="main-circ" fill="#E2264D" opacity="0"
										cx="29.5" cy="29.5" r="1.5" />
					                 <g id="heartgroup7" opacity="0" transform="translate(7 6)">
					                     <circle id="heart1" fill="#9CD8C3" cx="2" cy="6" r="2" />
					                     <circle id="heart2" fill="#8CE8C3" cx="5" cy="2" r="2" />
					                 </g>
					                 <g id="heartgroup6" opacity="0" transform="translate(0 28)">
					                     <circle id="heart1" fill="#CC8EF5" cx="2" cy="7" r="2" />
					                     <circle id="heart2" fill="#91D2FA" cx="3" cy="2" r="2" />
					                 </g>
					                 <g id="heartgroup3" opacity="0" transform="translate(52 28)">
					                     <circle id="heart2" fill="#9CD8C3" cx="2" cy="7" r="2" />
					                     <circle id="heart1" fill="#8CE8C3" cx="4" cy="2" r="2" />
					                 </g>
					                 <g id="heartgroup2" opacity="0" transform="translate(44 6)">
					                     <circle id="heart2" fill="#CC8EF5" cx="5" cy="6" r="2" />
					                     <circle id="heart1" fill="#CC8EF5" cx="2" cy="2" r="2" />
					                 </g>
					                 <g id="heartgroup5" opacity="0" transform="translate(14 50)">
					                     <circle id="heart1" fill="#91D2FA" cx="6" cy="5" r="2" />
					                     <circle id="heart2" fill="#91D2FA" cx="2" cy="2" r="2" />
					                 </g>
					                 <g id="heartgroup4" opacity="0" transform="translate(35 50)">
					                     <circle id="heart1" fill="#F48EA7" cx="6" cy="5" r="2" />
					                     <circle id="heart2" fill="#F48EA7" cx="2" cy="2" r="2" />
					                 </g>
					                 <g id="heartgroup1" opacity="0" transform="translate(24)">
					                     <circle id="heart1" fill="#9FC7FA" cx="2.5" cy="3" r="2" />
					                     <circle id="heart2" fill="#9FC7FA" cx="7.5" cy="2" r="2" />
					                 </g>
					             </g>
					         </svg>
						</label>
					</c:if>
				</div>
			</div>
		</div>
	</c:if>
	
	<div class="col-12 border border-muted border-bottom-0">
		<div class="container">
			<c:if test="${ !empty sessionScope.YJFBID_SES }">
				<button id="report" class="btn btn-danger ml-auto my-2"><i class="fa fa-fire mr-2"></i>신고하기</button>
			</c:if>
		</div>
	</div>
	
	<div class="border border-muted" id="comments_div">
		<jsp:include page="/member/board/comment.jsp" />	
	</div>
</div>