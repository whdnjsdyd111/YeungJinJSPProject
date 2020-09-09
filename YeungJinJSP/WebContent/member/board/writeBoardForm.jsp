<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${ empty sessionScope.YJFBID_SES }">
	<script>
		alert("로그인 후 이용해주세요.");
		window.location.href = "index.do";
	</script>
</c:if>
<div class="write_whole">
	<div>
		<h3>글쓰기</h3>
	</div>
	<div>
		<input type="text" placeholder="타이틀" >
		<select>
			<option>자유</option>
			<option>유머</option>
			<option>공포</option>
			<option>만화</option>
			<option>코로나 뉴스</option>
		</select>
	</div>
	<div>
		<input type="file" placeholder="사진 또는 동영상 업로드" class="write_input">
	
	</div>
	<div>
		<input type="text" placeholder="https://사진 또는 동영상 링크 입력" class="write_input">	
	</div>
	<div>
		<textarea rows="50" cols="45" class="write_input"></textarea>
	</div>
	<div>
		<button id="back">취소</button>
		<button id="complete">작성하기</button>
	</div>
</div>