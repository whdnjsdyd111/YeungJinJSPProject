<%@page import="main.bean.AES256Util"%>
<%@page import="main.bean.SHA256"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="main.bean.CommentRecommandDBBean"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="main.bean.CommentDBBean"%>
<%@page import="main.bean.JoinMemberCommentDataBean"%>
<%@page import="main.bean.NestCommentDataBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<script type="text/javascript" src="member/board/comment.js"></script>

<%
	CommentDBBean commentProcess = CommentDBBean.getInstance();
	CommentRecommandDBBean comRecoProcess = CommentRecommandDBBean.getInstance();
	int board_id = Integer.valueOf(request.getParameter("bdNum"));
	String sort = request.getParameter("sort");
	Object mem_id = session.getAttribute("YJFBID_SES");

	Map<JoinMemberCommentDataBean, List<NestCommentDataBean>> commentMap = null;
	Map<Integer, String> comRecoMap = null;

	if(mem_id != null) {
		comRecoMap = comRecoProcess.getComRecoMap((Integer) mem_id, board_id);
		request.setAttribute("mem_id", (Integer) mem_id);
	}
		
	if(sort == null)
		commentMap = commentProcess.getCommentList(board_id);
	else 
		commentMap = commentProcess.getCommentRecentList(board_id);
	
	request.setAttribute("commentMap", commentMap);
	request.setAttribute("comRecoMap", comRecoMap);
%>

<sql:query var="rs" dataSource="jdbc/yjfb">
	SELECT 	COUNT(n.necom_id) + COUNT(distinct c.com_id) AS comments FROM comment c LEFT JOIN nestcomment n 
	ON c.com_id = n.com_id WHERE c.com_bd_id = ?;
	<sql:param value="<%= board_id %>" />
</sql:query>
<sql:query var="rs_nick" dataSource="jdbc/yjfb">
	SELECT mem_nickname FROM member WHERE mem_id = ?
	<sql:param value="<%= (Integer) mem_id %>" />
</sql:query>
<h2 class="p-3"><i class="fa fa-comment mr-2"></i>댓글<span class="ml-2 text-success">${ rs.rowsByIndex[0][0] }</span>개</h2>

<c:if test="${ !empty sessionScope.YJFBID_SES }">
	<div class="my-2">
		<div class="border border-dark write_comment_top mx-3">
			<div class="ml-3 write_comment_member" id="mem_nickname">${ rs_nick.rowsByIndex[0][0] }</div>
			<div class="w-100 write_comment_middle">
				<div id="comment_content" class="px-3" contentEditable="true"></div>
			</div>
		</div>
		<div class="border border-dark border-top-0 mx-3">
			<div class="w-100 d-flex">
				<div class="custom-file w-75">
					<input type="file" class="custom-file-input" id="comment_image">
					<label class="custom-file-label" for="comment_image"><i class="fa fa-upload mr-2"></i>이미지 삽입</label>
				</div>
				<button id="commentBtn" class="btn btn-info w-25">작성하기</button>
			</div>
		</div>
	</div>	
</c:if>

<div id="start_com">
	<c:forEach var="entry" items="${ commentMap }">
		<c:set var="joinMemCom" value="${ entry.key }" />
		<c:set var="comReco" value="${ comRecoMap.get(joinMemCom.getCom_id()) }" />
		<div class="container p-3 comments">
			<form method="post" class="mx-3 d-flex flex-column">
			
			<c:if test="${ empty sessionScope.YJFBID_SES }">
				<button type="button" class="go_login btn btn-outline-dark btn-sm"><i class="fa fa-chevron-up"></i></button>
				<span class="reco_count container">${ joinMemCom.com_reco }</span>
				<input type="hidden" name="com_id" value="${ joinMemCom.com_id }">
				<input type="hidden" name="mem_id" value="${ joinMemCom.com_mem_id }">
				<button type="button" class="go_login btn btn-outline-dark btn-sm"><i class="fa fa-chevron-down"></i></button>
			</c:if>
			
			<c:if test="${ !empty sessionScope.YJFBID_SES }">
					<c:if test="${ comReco == null }">
						<button id="comReco_n" type="button" class="recoBtn btn btn-outline-dark btn-sm">
							<i class="fa fa-chevron-up"></i>
						</button>
						<span class="reco_count container">${ joinMemCom.com_reco }</span>
						<input type="hidden" name="com_id" value="${ joinMemCom.com_id }">
						<input type="hidden" name="mem_id" value="${ joinMemCom.com_mem_id }">
						<button id="comNonReco_n" type="button" class="nonRecoBtn btn btn-outline-dark btn-sm">
							<i class="fa fa-chevron-down"></i>
						</button>		
					</c:if>
					<c:if test="${ comReco == 'N' }">
						<button id="comReco_y" type="button" class="recoBtn btn btn-outline-dark btn-sm">
							<i class="fa fa-chevron-up"></i>
						</button>
						<span class="reco_count container">${ joinMemCom.com_reco }</span>
						<input type="hidden" name="com_id" value="${ joinMemCom.com_id }">
						<input type="hidden" name="mem_id" value="${ joinMemCom.com_mem_id }">
						<button id="comNonReco_n" type="button" class="nonRecoBtn btn btn-outline-dark btn-sm">
							<i class="fa fa-chevron-down"></i>
						</button>						
					</c:if>
					<c:if test="${ comReco == 'Y' }">
						<button id="comReco_n" type="button" class="recoBtn btn btn-outline-dark btn-sm">
							<i class="fa fa-chevron-up"></i>
						</button>
						<span class="reco_count container">${ joinMemCom.com_reco }</span>
						<input type="hidden" name="com_id" value="${ joinMemCom.com_id }">
						<input type="hidden" name="mem_id" value="${ joinMemCom.com_mem_id }">
						<button id="comNonReco_y" type="button" class="nonRecoBtn btn btn-outline-dark btn-sm">
							<i class="fa fa-chevron-down"></i>
						</button>						
					</c:if>
			</c:if>

			</form>
			<div class="col mr-auto d-flex flex-column" >
				<div class="">
					<a class="text-dark" style="text-decoration: none;" 
							href="mainBoard.do?kind=all&target=writer&search=${ joinMemCom.com_mem_nickname }">
						<span class="mr-2"><i class="fa fa-user-circle mr-2"></i>${ joinMemCom.com_mem_nickname }</span>
					</a>
					<span class="d-inline-block" tabindex="0" data-toggle="tooltip" title="레벨 ${ joinMemCom.com_mem_level }">
						<button class="btn m-0" style="pointer-events: none; vertical-align: inherit;" type="button">
							<i class="fa fa-y-combinator-square mr-1"></i>${ joinMemCom.com_mem_level }
						</button>
					</span>
					<span class="d-inline-block" tabindex="0" data-toggle="tooltip" title="${ joinMemCom.com_date }">
						<button class="btn" style="pointer-events: none; vertical-align: inherit;" type="button">
							<%
								long time = new Timestamp(System.currentTimeMillis()).getTime() - 
									((JoinMemberCommentDataBean) pageContext.getAttribute("joinMemCom")).getCom_date().getTime();
							
								out.print(
									(time / 1000 < 60) ? time / 1000 + "초 전" : (time / 1000 / 60 < 60) ? time / 1000 / 60 + "분 전"
											: (time / 1000 / 60 / 60 < 24) ? time / 1000 / 60 / 60 + "시간 전" : time / 1000 / 60 / 60 / 24 + "일 전"
										);
							%>
						</button>
					</span>
				</div>
				<div class="container my-2 writen_comment">
					<div>${ joinMemCom.com_content }</div>
				</div>
				<div class="mt-2">
					<c:if test="${ empty sessionScope.YJFBID_SES }">
						<button class="go_login btn btn-dark">답글쓰기</button>
						<button class="go_login btn btn-danger">신고</button>
					</c:if>
					<c:if test="${ !empty sessionScope.YJFBID_SES }">
						<button class="write_reply btn btn-dark" >답글쓰기</button>
						<c:if test="${ joinMemCom.com_mem_id != mem_id }">
							<input type="hidden" value="${ joinMemCom.com_mem_id }" />
							<input type="hidden" value="${ joinMemCom.com_mem_nickname }" name="nickname"/>
						</c:if>
						<button class="btn btn-danger">신고</button>
						<c:if test="${ joinMemCom.com_mem_id == mem_id }">
							<button class="btn btn-warning delete_com"><i class="fa fa-trash mr-2"></i>삭제</button>
							<input type="hidden" value="${ joinMemCom.com_id }" />
						</c:if>
					</c:if>
				</div>
			</div>
		</div>
		
		<c:forEach var="nestComment" items="${ entry.value }">
			<div class="nestComments container p-3 d-flex flex-md-row">
				<div class="border border-right-0 border-top-0 border-dark ml-5" style="width: 30px; height: 30px">
					
				</div>
				<div class="col mr-auto ml-3 d-flex flex-column">
					<div class="">
						<a class="text-dark" style="text-decoration: none;" 
								href="mainBoard.do?kind=all&target=writer&search=${ nestComment.mem_nickname }">
							<span class="mr-2"><i class="fa fa-user-circle mr-2"></i>${ nestComment.mem_nickname }</span>
						</a>
						<span class="d-inline-block" tabindex="0" data-toggle="tooltip" title="레벨 ${ nestComment.mem_level }">
							<button class="btn m-0" style="pointer-events: none; vertical-align: inherit;" type="button">
								<i class="fa fa-y-combinator-square mr-1"></i>${ nestComment.mem_level }
							</button>
						</span>
						<span class="d-inline-block" tabindex="0" data-toggle="tooltip" title="${ nestComment.reCom_date }">
							<button class="btn" style="pointer-events: none; vertical-align: inherit;" type="button">
								<%
									long nest_time = new Timestamp(System.currentTimeMillis()).getTime() - 
										((NestCommentDataBean) pageContext.getAttribute("nestComment")).getReCom_date().getTime();
								
									out.print(
										(nest_time / 1000 < 60) ? nest_time / 1000 + "초 전"
												: (nest_time / 1000 / 60 < 60) ? nest_time / 1000 / 60 + "분 전"
												: (nest_time / 1000 / 60 / 60 < 24) ? nest_time / 1000 / 60 / 60 + "시간 전"
												: nest_time / 1000 / 60 / 60 / 24 + "일 전"
											);
								%>
							</button>
						</span>
					</div>
					<div class="container my-2 writen_comment">
						<div>${ nestComment.reCom_content }</div>
					</div>
					<div class="mt-2">
						<c:if test="${ empty sessionScope.YJFBID_SES }">
							<button class="go_login btn btn-dark">답글쓰기</button>
							<button class="go_login btn btn-danger">신고</button>
						</c:if>
						<c:if test="${ !empty sessionScope.YJFBID_SES }">
							<button class="write_nest_reply btn btn-dark" >답글쓰기</button>
							<c:if test="${ nestComment.mem_id != mem_id }">
								<input type="hidden" value="${ nestComment.mem_id }" />
								<input type="hidden" value="${ nestComment.mem_nickname }" name="nickname" />
							</c:if>
							<button class="btn btn-danger">신고</button>
							<c:if test="${ nestComment.mem_id == mem_id }">
								<button class="btn btn-warning delete_nest_com"><i class="fa fa-trash mr-2"></i>삭제</button>
								<input type="hidden" value="${ nestComment.neCom_id }" />
							</c:if>
						</c:if>
					</div>
				</div>
			</div>
		</c:forEach>
	</c:forEach>
</div>