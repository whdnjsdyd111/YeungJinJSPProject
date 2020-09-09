<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<a>인기글</a>
		<a>최신글</a>
		<a>TODAY</a>
		<a>최악글</a>
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
	<article class="board_obj">
		<div class="board_rec">
			<div>추천 수</div>
			<div>1000</div>
		</div>
		<div class="board_title">
			<div>게시판 타이틀</div>
			<div>작성자 이름   작성일    게시판 종류</div>
		</div>
		<div class="board_read">
			<div>조회수</div>
			<div>1000</div>
		</div>
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
	<article class="board_obj">
		<div class="board_rec">추천 수</div>
		<div class="board_title">내용</div>
		<div class="board_read">조회수</div>
	</article>
</section>
