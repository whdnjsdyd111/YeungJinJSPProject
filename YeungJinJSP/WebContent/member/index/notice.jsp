<%@page import="main.bean.AdminNoticeDataBean"%>
<%@page import="main.bean.AdminNoticeDBBean"%>
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
	
	request.setAttribute("notices", NoticeDBBean.getInstance().getNoticeList(id));
	request.setAttribute("admin_notices", AdminNoticeDBBean.getInstance().getNoticeList(id));
%>

<c:if test="${ notices == null && admin_notices == null }">
	<script>
		$('#notice_bell').attr('class', 'fa fa-bell-o fa-2 text-white ml-3 mr-3');
	</script>
	<div class="row no-gutters bg-light border border-dark border-left-0 border-right-0">
		<div class="col p-4 bg-highlight d-flex flex-md-row">
			<h3 class="mr-3">알림이 없습니다.<i class="fa fa-envelope-open-o ml-3"></i></h3>
		</div>
	</div>
</c:if>
<c:if test="${ notices != null || admin_notices != null }">
	<script>
		$('#notice_bell').attr('class', 'fa fa-bell fa-2 text-red ml-3 mr-3 faa-ring animated');
	</script>
	<script type="text/javascript" src="member/index/notice.js"></script>
	
	<c:set var="loop_flag" value="false" />
	<c:forEach var="i" begin="0" end="2" step="1" varStatus="status">
		<c:if test="${ notices.size() + admin_notices.size() == i }">
			<c:set var="loop_flag" value="true" />
		</c:if>
		<c:if test="${ not loop_flag }">
			<c:if test="${ admin_notices.size() > i }">
				<c:set var="admin_notice" value="${ admin_notices.get(i) }" />
				<div class="row no-gutters bg-light border border-white border-left-0 border-right-0">
					<div class="col-10 p-4 bg-highlight d-flex flex-column">
						<div>
							<span class="text-info mr-2">관리자 메시지</span>
							<span class="d-inline-block" tabindex="0" data-toggle="tooltip" title="${ admin_notice.notice_date }">
								<button class="btn" style="pointer-events: none; vertical-align: inherit;" type="button">
									<%
										long time = new Timestamp(System.currentTimeMillis()).getTime() - 
											((AdminNoticeDataBean) pageContext.getAttribute("admin_notice")).getNotice_date().getTime();
									
										out.print(
											(time / 1000 < 60) ? time / 1000 + "초 전" : (time / 1000 / 60 < 60) ? time / 1000 / 60 + "분 전"
													: (time / 1000 / 60 / 60 < 24) ? time / 1000 / 60 / 60 + "시간 전" : time / 1000 / 60 / 60 / 24 + "일 전"
												);
									%>
								</button>
							</span>
						</div>
						<div>
							<span>${ admin_notice.notice_content }</span>
						</div>
					</div>
					<div class="col-2 bg-highlight d-flex">
						<button type="button" class="close m-auto delete_admin_notice" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<input type="hidden" value=${ admin_notice.notice_id } />
					</div>
				</div>
			</c:if>
			<c:if test="${ admin_notices.size() <= i }">
				<c:set var="notice" value="${ notices.get(i - admin_notices.size()) }" />
				<c:if test="${ notice.kind_id == 100 }">
					<div class="row no-gutters bg-light border border-white border-left-0 border-right-0">
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
							<input type="hidden" name="notice" value="${ notice.board_id }" />
						</div>
					</div>
				</c:if>
		
				<c:if test="${ notice.kind_id == 200 }">
					<div class="row no-gutters bg-light border border-white border-left-0 border-right-0">
						<div class="col-10 p-4 bg-highlight d-flex flex-column">
							<div>
								<span class="text-info mr-2">리댓</span>
								<span>
									<sql:query var="rs_title" dataSource="jdbc/yjfb">
										SELECT board_title, INSERT(board_title, 14, CHAR_LENGTH(board_title), '..') FROM board WHERE board_id = ?
										<sql:param value="${ notice.board_id }" />
									</sql:query>
									${ rs_title.rowsByIndex[0][0] }
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
								<c:if test="${ notice.notice_number > 1 }">
									<span>그 외 <i class="fa fa-commenting-o mr-2"></i>${ notice.notice_number }</span>
								</c:if>
								<c:if test="${ notice.notice_number == 1 }">
									<span><i class="fa fa-commenting-o mr-2"></i>${ notice.notice_number }</span>
								</c:if>
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
			</c:if>
				
		</c:if>
	</c:forEach>
	<c:if test="${ notices.size() + admin_notices.size() > 3 }">
		<div class="d-flex flex-column">
			<div class="spinner-grow text-danger mx-auto mb-1" role="status" style="width: 5px; height: 5px;">
				<span class="sr-only">Loading...</span>
			</div>
			<div class="spinner-grow text-warning mx-auto mb-1" role="status" style="width: 5px; height: 5px;">
				<span class="sr-only">Loading...</span>
			</div>
			<div class="spinner-grow text-success mx-auto mb-1" role="status" style="width: 5px; height: 5px;">
				<span class="sr-only">Loading...</span>
			</div>
		</div>
	</c:if>
	<div class="d-flex">
		<button id="delete_notices" class="btn btn-outline-dark mx-auto my-1">모두 지우기</button>
	</div>
</c:if>

