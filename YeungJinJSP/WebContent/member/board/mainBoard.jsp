<%@page import="main.bean.JoinBoardMemberKindDataBean"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<c:if test="${ kind == null && (sort == null && search == null)}">
	<script>
		window.location.href = "mainBoard.do?kind=all&sort=pop";
	</script>
</c:if>

<script type="text/javascript" src="member/board/mainBoard.js"></script>

<div class="flex-column">
	<div id="board_nav_title" class="navbar navbar-expand flex-md-row navbar-light bg-light border border-bottom-0 border-dark">	<!-- 인기글 등의 메뉴, 검색, 글쓰기 기능 -->
		
		<h2 class="navbar-brand my-0">
			<c:if test="${ kind_name == null }">
				<c:if test="${ kind == 'bookmark' }">
					북마크
				</c:if>
				<c:if test="${ kind != 'bookmark' }">
					모든 게시판
				</c:if>
			</c:if>
			<c:if test="${ kind_name != null }">
				${ kind_name } 게시판
			</c:if>
		</h2>
		
		<ul class="navbar-nav nav ml-auto">
			<li class="nav-item">
			<c:if test="${ empty sessionScope.YJFBID_SES }">
					<a class="nav-link" href="loginForm.do">
			</c:if>
			
			<c:if test="${ !empty sessionScope.YJFBID_SES }">
					<a class="nav-link" href="writeBoardForm.do">	
			</c:if>
			<span><i class="fa fa-pencil mr-2"></i>글쓰기</span></a></li>
		</ul>
	</div>
	
	<div id="board_navbar" class="navbar navbar-expand navbar-light bg-secondary flex-md-row border border-primary">
		
		<ul class="navbar-nav nav mr-auto">
			<c:if test="${ kind != 'bookmark' }">
				<li class="nav-item"><a class="nav-link px-3" href="mainBoard.do?kind=${ kind }&sort=pop">
				<i class="fa fa-heart mr-2"></i><span>인기글</span></a><li>
				<li class="nav-item"><a class="nav-link px-3" href="mainBoard.do?kind=${ kind }&sort=recent">
				<i class="fa fa-arrow-down mr-2"></i><span>최신순</span></a><li>
				<li class="nav-item"><a class="nav-link px-3" href="mainBoard.do?kind=${ kind }&sort=TODAY">
				<i class="fa fa-clock-o mr-2"></i><span>TODAY</span></a><li>
				<li class="nav-item"><a class="nav-link px-3" href="mainBoard.do?kind=${ kind }&sort=nonReco">
				<i class="fa fa-frown-o mr-2"></i><span>최악글</span></a><li>
			</c:if>
		</ul>
		
		<ul class="navbar-nav nav ml-auto">
			<div class="input-group input-group-sm">
				<select class="custom-select" id="search_select">
					<option value="writer">작성자</option>
					<option value="title">제목</option>
					<option value="content">내용</option>
				</select>
				<input class="form-control" id="search_content" type="text" placeholder="검색">
			</div>
		</ul>
	</div>
</div>

<div id="board_space"></div>

<section>
	<c:forEach var="board" items="${ boardList }" >
		<sql:query var="rs" dataSource="jdbc/yjfb">
			SELECT 	COUNT(n.necom_id) + COUNT(distinct c.com_id) AS comments FROM comment c LEFT JOIN nestcomment n 
			ON c.com_id = n.com_id WHERE c.com_bd_id = ?;
			<sql:param value="${ board.board_id }" />
		</sql:query>
		
		<article class="row px-0 mx-0 border border-secondary border-top-0 board_article">
		
			<div class="container col-9 px-0 py-2">
				<div class="col-8 d-flex flex-column">
					<div class="col-12">
						<span class="mr-2">#${ board.board_id }</span>
						<span class="border rounded bg-info mr-3">
							<i class="fa fa-comments mx-1"></i>
							<c:if test="${ board.kind_id == 600 || board.kind_id == 700 }">
								정보
							</c:if>
							<c:if test="${ !(board.kind_id == 600 || board.kind_id == 700) }">
								커뮤니티
							</c:if>
						</span>
						<a class="bg-primary border rounded text-dark px-1" style="text-decoration: none"
							href="mainBoard.do?kind=${ board.kind_id }&sort=pop">${ board.kind_name }</a>
					</div>
					<a class="text-dark col-12" href="boardContent.do?bdNum=${ board.board_id }">${ board.board_title }</a>
				</div>
				<div class="col-4">
					<ul class="navbar navbar nav mr-auto p-0">
						<li><i class="fa fa-comment mx-2"></i>${ rs.rowsByIndex[0][0] }</li>
						
						<c:if test="${ sort == 'nonReco' }">
							<li><i class="fa fa-thumbs-o-down mx-2"></i>${ board.board_nonReco }</li>
						</c:if>
						<c:if test="${ sort != 'nonReco' }">
							<li><i class="fa fa-thumbs-o-up mx-2"></i>${ board.board_reco }</li>
						</c:if>
						
						<li><i class="fa fa-eye mx-2"></i>${ board.board_readcount }</li>
					</ul>
				</div>
			</div>
			
			<div class="container col-3 d-flex flex-column px-0 ">
				<div class="container">
					<div class="mx-auto">
						<a class="text-dark" style="text-decoration: none;" 
							href="mainBoard.do?kind=all&target=writer&search=${ board.mem_nickname }">
							<span><i class="fa fa-user-circle mr-2"></i>${ board.mem_nickname }</span>
						</a>
					</div>
						
					<div class="mx-auto">
						<span class="d-inline-block" tabindex="0" data-toggle="tooltip" title="레벨 ${ board.mem_level }">
							<button class="btn m-0" style="pointer-events: none; vertical-align: inherit;" type="button">
								<i class="fa fa-y-combinator-square mr-1"></i>${ board.mem_level }
							</button>
						</span>
					</div>
				</div>
				
				<span class="d-inline-block" tabindex="0" data-toggle="tooltip" title="${ board.board_date }">
					<button class="btn" style="pointer-events: none; vertical-align: inherit;" type="button">
						<%
							long time = new Timestamp(System.currentTimeMillis()).getTime() - 
								((JoinBoardMemberKindDataBean) pageContext.getAttribute("board")).getBoard_date().getTime();
						
							out.print(
								(time / 1000 < 60) ? time / 1000 + "초 전" : (time / 1000 / 60 < 60) ? time / 1000 / 60 + "분 전"
										: (time / 1000 / 60 / 60 < 24) ? time / 1000 / 60 / 60 + "시간 전" : time / 1000 / 60 / 60 / 24 + "일 전"
									);
						%>
					</button>
				</span>
			</div>
			
		</article>
	</c:forEach>
	
</section>

<div class="container my-2">
	<c:if test="${ page == 1 && board.size() == 30 }">
		<button type="button" class="btn btn-danger page" value="${ page + 1 }">다음<i class="fa fa-chevron-right ml-2"></i></button>
	</c:if>
	
	<c:if test="${ page != 1 }">
		<c:if test="${ boardList.size() < 30 || boardList == null }">
			<button type="button" class="btn btn-danger page" value="${ page - 1 }"><i class="fa fa-chevron-left mr-2"></i>이전</button>
		</c:if>
		<c:if test="${ boardList.size() == 30 }">
			<button type="button" class="btn btn-danger page" value="${ page - 1 }"><i class="fa fa-chevron-left mr-2"></i>이전</button>
			<button type="button" class="btn btn-danger page" value="${ page + 1 }">다음<i class="fa fa-chevron-right ml-2"></i></button>
		</c:if>
	</c:if>
	
	<input type="hidden" id="currentPage" value="${ page }">
</div>