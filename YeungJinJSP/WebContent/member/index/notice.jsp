<%@page import="java.util.List"%>
<%@page import="main.bean.NoticeDBBean"%>
<%@page import="main.bean.NoticeDataBean"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<%
	request.setCharacterEncoding("utf-8");
	
	int id = (Integer) session.getAttribute("YJFBID_SES");
	NoticeDBBean noticeProcess = NoticeDBBean.getInstance();
	List<NoticeDataBean> notices = noticeProcess.getNoticeList(id);
	
	request.setAttribute("notices", notices);
%>

<c:if test="${ notices == null }">
	<div class="row no-gutters bg-light border border-dark border-left-0 border-right-0">
		<div class="col p-4 bg-highlight d-flex flex-md-row">
			<h3 class="mr-3">알림이 없습니다.</h3>
			<div class="spinner-grow text-primary" role="status">
				<span class="sr-only">no messages</span>
			</div>
		</div>
	</div>
</c:if>
<c:if test="${ notices != null }">
	<script type="text/javascript" src="member/index/notice.js"></script>
	<c:forEach var="notice" items="${ notices }">
		<c:if test="${ notice.kind_id == 100 }">
			<div class="row no-gutters bg-light border border-dark border-left-0 border-right-0">
				<div class="col-10 p-4 bg-highlight d-flex flex-column">
					<div>
						<span class="text-info mr-2">댓글</span><span>${ notice.notice_content }</span>
					</div>
					<div>
						<span class="d-inline-block" tabindex="0" data-toggle="tooltip" title="${ notice.notice_date }">
							<button class="btn" style="pointer-events: none; vertical-align: inherit;" type="button">
								<%
									long time = new Timestamp(System.currentTimeMillis()).getTime() - 
										((NoticeDataBean) pageContext.getAttribute("notice")).getNotice_date().getTime();
								
									out.print(
										(time / 1000 < 60) ? time / 1000 + "초 전" : (time / 1000 / 60 < 60) ? time / 1000 / 60 + "분 전"
												: (time / 1000 / 60 / 60 < 24) ? time / 1000 / 60 / 60 + "시간 전" : time / 1000 / 60 / 60 / 24 + "일 전"
											);
								%>
							</button>
						</span>
						<span><i class="fa fa-comments-o mr-2"></i>${ notice.notice_number }</span>
						<sql:query var="rs_reco" dataSource="jdbc/yjfb">
							SELECT board_reco, board_nonReco FROM board WHERE board_id = ?
							<sql:param value="${ notice.board_id }" />
						</sql:query>
						<span><i class="fa fa-thumbs-o-up mx-2"></i>${ rs_reco.rowsByIndex[0][0] }</span>
						<span><i class="fa fa-thumbs-o-down mx-2"></i>${ rs_reco.rowsByIndex[0][1] }</span>
					</div>
			    	<a href="boardContent.do?bdNum=${ notice.board_id }#start_com" class="stretched-link"></a>
				</div>
				<div class="col-2 bg-highlight d-flex">
					<button type="button" class="close m-auto delete_notice" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<input type="hidden" name="board" value="${ notice.board_id }" />
					<input type="hidden" name="kind" value="${ notice.kind_id }" />
				</div>
			</div>
		</c:if>

		<c:if test="${ notice.kind_id == 200 }">
			<div class="row no-gutters bg-light border border-dark border-left-0 border-right-0">
				<div class="col-10 p-4 bg-highlight d-flex flex-column">
					<div>
						<span class="text-info mr-2">리댓</span>
						<span>
							<sql:query var="rs_title" dataSource="jdbc/yjfb">
								SELECT board_title FROM board WHERE board_id = ?
								<sql:param value="${ notice.board_id }" />
							</sql:query>
							<c:set var="title" value="${ rs_title.rowsByIndex[0][0] }" />
							<c:if test="${ title.length() > 13 }">
								${ title.substring(0, 13) }..
							</c:if>
							<c:if test="${ title.length() <= 13 }">
								${ title }
							</c:if>
						</span>
					</div>
					<div>
						<span>${ notice.notice_content }</span>
					</div>
					<div>
						<span class="d-inline-block" tabindex="0" data-toggle="tooltip" title="${ notice.notice_date }">
							<button class="btn" style="pointer-events: none; vertical-align: inherit;" type="button">
								<%
									long time = new Timestamp(System.currentTimeMillis()).getTime() - 
										((NoticeDataBean) pageContext.getAttribute("notice")).getNotice_date().getTime();
								
									out.print(
										(time / 1000 < 60) ? time / 1000 + "초 전" : (time / 1000 / 60 < 60) ? time / 1000 / 60 + "분 전"
												: (time / 1000 / 60 / 60 < 24) ? time / 1000 / 60 / 60 + "시간 전" : time / 1000 / 60 / 60 / 24 + "일 전"
											);
								%>
							</button>
						</span>
						<span><i class="fa fa-commenting-o mr-2"></i>${ notice.notice_number }</span>
					</div>
			    	<a href="boardContent.do?bdNum=${ notice.board_id }#start_com" class="stretched-link"></a>
				</div>
				<div class="col-2 bg-highlight d-flex">
					<button type="button" class="close m-auto delete_notice" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<input type="hidden" name="board" value="${ notice.board_id }" />
					<input type="hidden" name="kind" value="${ notice.kind_id }" />
				</div>
			</div>
		</c:if>
	</c:forEach>
	<div class="d-flex">
		<button id="delete_notices" class="btn btn-outline-dark mx-auto my-1">모두 지우기</button>
	</div>
</c:if>