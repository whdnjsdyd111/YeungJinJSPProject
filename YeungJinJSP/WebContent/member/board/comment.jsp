<%@page import="main.bean.CommentRecommandDBBean"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="main.bean.CommentDBBean"%>
<%@page import="main.bean.JoinMemberCommentDataBean"%>
<%@page import="main.bean.NestCommentDataBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<script type="text/javascript" src="member/board/comment.js"></script>
<%
	CommentDBBean commentProcess = CommentDBBean.getInstance();
	CommentRecommandDBBean comRecoProcess = CommentRecommandDBBean.getInstance();
	int board_id = Integer.valueOf(request.getParameter("bdNum"));
	String mem_idEnc = (String) session.getAttribute("YJFBID_SES");
	Map<Integer, String> comRecoMap = null;
	
	if(mem_idEnc != null)
		comRecoMap = comRecoProcess.getComRecoMap(mem_idEnc, board_id);
	
	Map<JoinMemberCommentDataBean, List<NestCommentDataBean>> commentMap = 
			commentProcess.getCommentList(board_id);
	request.setAttribute("commentMap", commentMap);
	request.setAttribute("comRecoMap", comRecoMap);
%>
<h2>댓글</h2>

<c:if test="${ !empty sessionScope.YJFBID_SES }">
	<div>
		<textarea rows="5" cols="15" id="comCont" ></textarea>
		<button id="commentBtn">작성하기</button>
	</div>	
</c:if>

<div>
	<c:forEach var="entry" items="${ commentMap }">
		<c:set var="joinMemCom" value="${ entry.key }" />
		<c:set var="comReco" value="${ comRecoMap.get(joinMemCom.getCom_id()) }" />
		<div class="comments">
			<form method="post" class="comment_reco">
			
			<c:if test="${ empty sessionScope.YJFBID_SES }">
				<button type="button" class="go_login">^</button>
				<span class="reco_count">${ joinMemCom.getCom_reco() }</span>
				<input type="hidden" name="com_id" value="${ joinMemCom.getCom_id() }">
				<input type="hidden" name="mem_id" value="${ joinMemCom.getCom_mem_id() }">
				<button type="button" class="go_login">V</button>			
			</c:if>
			
			<c:if test="${ !empty sessionScope.YJFBID_SES }">
					<c:if test="${ comReco == null }">
						<button id="comReco_n" type="button" class="recoBtn">^</button>
						<span class="reco_count">${ joinMemCom.getCom_reco() }</span>
						<input type="hidden" name="com_id" value="${ joinMemCom.getCom_id() }">
						<input type="hidden" name="mem_id" value="${ joinMemCom.getCom_mem_id() }">
						<button id="comNonReco_n" type="button" class="nonRecoBtn">V</button>		
					</c:if>
					<c:if test="${ comReco == 'N' }">
						<button id="comReco_y" type="button" class="recoBtn">^</button>
						<span class="reco_count">${ joinMemCom.getCom_reco() }</span>
						<input type="hidden" name="com_id" value="${ joinMemCom.getCom_id() }">
						<input type="hidden" name="mem_id" value="${ joinMemCom.getCom_mem_id() }">
						<button id="comNonReco_n" type="button" class="nonRecoBtn">V</button>						
					</c:if>
					<c:if test="${ comReco == 'Y' }">
						<button id="comReco_n" type="button" class="recoBtn">^</button>
						<span class="reco_count">${ joinMemCom.getCom_reco() }</span>
						<input type="hidden" name="com_id" value="${ joinMemCom.getCom_id() }">
						<input type="hidden" name="mem_id" value="${ joinMemCom.getCom_mem_id() }">
						<button id="comNonReco_y" type="button" class="nonRecoBtn">V</button>						
					</c:if>
			</c:if>

			</form>
			<div class="comment_body" >
				<div class="comment_mem_info">
					<span>${ joinMemCom.getCom_mem_level() }</span>
					<span>${ joinMemCom.getCom_mem_nickname() }</span>
					<span>${ joinMemCom.getCom_date() }</span>
				</div>
				<div class="comment_content">
					<div>${ joinMemCom.getCom_content() }</div>
				</div>
				<div>
					<c:if test="${ empty sessionScope.YJFBID_SES }">
						<button class="go_login">답글쓰기</button>
						<button class="go_login">신고</button>
					</c:if>
					<c:if test="${ !empty sessionScope.YJFBID_SES }">
						<button class="write_reply" >답글쓰기</button>
						<button class="go_login">신고</button>
					</c:if>
				</div>
			</div>
		</div>
		<c:forEach var="nestComment" items="${ entry.value }">
			<div class="nestComments">
				<div class="nestMark">
					<div class="mark"></div>
				</div>
				<div class="nestContent">
					<div class="comment_content">
						<span>${ nestComment.getMem_level() }</span>
						<span>${ nestComment.getMem_nickname() }</span>
						<span>${ nestComment.getReCom_date() }</span>
					</div>
					<div>
						<div>${ nestComment.getReCom_content() }</div>
					</div>
					<div>
						<c:if test="${ empty sessionScope.YJFBID_SES }">
							<button class="go_login">답글쓰기</button>
							<button class="go_login">신고</button>
						</c:if>
						<c:if test="${ !empty sessionScope.YJFBID_SES }">
							<button class="write_nest_reply">답글쓰기</button>
							<button class="go_login">신고</button>
						</c:if>
					</div>
				</div>
			</div>
		</c:forEach>
	</c:forEach>
</div>