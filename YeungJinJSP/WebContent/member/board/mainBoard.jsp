<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${ kind == null || sort == null }">
	<script>
		window.location.href = "mainBoard.do?kind=all&sort=pop";
	</script>
</c:if>
<script type="text/javascript" src="member/board/mainBoard.js"></script>
<div class="board_menu">
	<div class="board_menu1" >	<!-- 인기글 등의 메뉴, 검색, 글쓰기 기능 -->
		<h3>모든 게시판</h3>
		<c:if test="${ empty sessionScope.YJFBID_SES }">
			<a href="loginForm.do">글쓰기</a>
		</c:if>
		<c:if test="${ !empty sessionScope.YJFBID_SES }">
			<a href="writeBoardForm.do">글쓰기</a>
		</c:if>
	</div>
	<div class="board_menu2">
		<a href="mainBoard.do?kind=${ kind }&sort=pop">인기글</a>
		<a href="mainBoard.do?kind=${ kind }&sort=recent">최신순</a>
		<a href="mainBoard.do?kind=${ kind }&sort=TODAY">TODAY</a>
		<a href="mainBoard.do?kind=${ kind }&sort=nonReco">최악글</a>
		<select>
			<option>작성자</option>
			<option>내용</option>
			<option>작성자 + 내용</option>
		</select>
		<input type="text" placeholder="검색">
	</div>
</div>
<div class="board_space">

</div>
<section class="board_whole">
	<c:forEach var="board" items="${ boardList }" >
		<article class="board_obj">
		<div class="board_rec">			
			<c:if test="${ sort == 'nonReco' }">
				<div>비추 수</div>
				<div>${ board.getBoard_nonReco() }</div>
			</c:if>
			<c:if test="${ sort != 'nonReco' }">
				<div>추천 수</div>
				<div>${ board.getBoard_reco() }</div>
			</c:if>
		</div>
		<div class="board_info">
			<div id="board_title"><a href="boardContent.do?bdNum=${ board.getBoard_id() }">${ board.getBoard_title() }</a></div>
			<div class="board_publisher">${ board.getMem_nickname() }</div><div class="board_level">${ board.getMem_level() }</div>
			<div class="board_date">${ board.getBoard_date() }</div>
			<div class="board_kind">${ board.getKind_name() }</div>
		</div>
		<div class="board_read">
			<div>조회수</div>
			<div>${ board.getBoard_readcount() }</div>
		</div>
		</article>
	</c:forEach>
	<article class="board_obj">
		<div class="board_rec">추천 수</div>
		<div class="board_title">내용</div>
		<div class="board_read">조회수</div>
	</article>
	<article class="board_obj">
		<div class="board_rec">추천 수</div>
		<div class="board_title">내용</div>
		<div class="board_read">조회수</div>
	</article>
	<article class="board_obj">
		<div class="board_rec">추천 수</div>
		<div class="board_title">내용</div>
		<div class="board_read">조회수</div>
	</article>
	<article class="board_obj">
		<div class="board_rec">추천 수</div>
		<div class="board_title">내용</div>
		<div class="board_read">조회수</div>
	</article>
	<article class="board_obj">
		<div class="board_rec">추천 수</div>
		<div class="board_title">내용</div>
		<div class="board_read">조회수</div>
	</article>
	<article class="board_obj">
		<div class="board_rec">추천 수</div>
		<div class="board_title">내용</div>
		<div class="board_read">조회수</div>
	</article>
	<article class="board_obj">
		<div class="board_rec">추천 수</div>
		<div class="board_title">내용</div>
		<div class="board_read">조회수</div>
	</article>
	<article class="board_obj">
		<div class="board_rec">추천 수</div>
		<div class="board_title">내용</div>
		<div class="board_read">조회수</div>
	</article>
	<article class="board_obj">
		<div class="board_rec">추천 수</div>
		<div class="board_title">내용</div>
		<div class="board_read">조회수</div>
	</article>
</section>
<div class="next_page">
	<button value="${ page }" id="next_pageBtn">다음 페이지</button>
</div>