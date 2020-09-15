<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="member/board/writeBoard.js"></script>
<c:if test="${ empty sessionScope.YJFBID_SES }">
	<script>
		alert("로그인 후 이용해주세요.");
		window.location.href = "loginForm.do";
	</script>
</c:if>
<div class="write_whole">
	<div>
		<h3>글쓰기</h3>
	</div>
	<div>
		<input id="board_title" type="text" placeholder="타이틀" maxlength="30">
		<select id="board_kind">
			<option value="100">자유</option>
			<option value="200">유머</option>
			<option value="300">공포</option>
			<option value="400">만화</option>
			<option value="500">코로나 뉴스</option>
		</select>
	</div>
	<div>
		<input type="file" placeholder="사진 또는 동영상 업로드" class="write_input">
	
	</div>
	<div>
		<input id="insert_img" type="text" placeholder="https://사진 또는 동영상 링크 입력" class="write_input">	
	</div>
	<img alt="" src="">
	<div>
		<div id="board_content" class="write_input textarea" contentEditable="true"></div>
	</div>
	<div>
		<button id="back">취소</button>
		<button id="complete">작성하기</button>
	</div>
</div>