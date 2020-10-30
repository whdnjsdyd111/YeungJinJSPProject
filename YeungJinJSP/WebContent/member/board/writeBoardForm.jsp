<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<sql:query var="admin" dataSource="jdbc/yjfb">
	SELECT admin_id FROM admin WHERE admin_id = ?
	<sql:param value="${ sessionScope.YJFBID_SES }" />
</sql:query>

<script type="text/javascript" src="member/board/writeBoard.js"></script>
<c:if test="${ empty sessionScope.YJFBID_SES }">
	<script>
		alert("로그인 후 이용해주세요.");
		window.location.href = "loginForm.do";
	</script>
</c:if>
<div class="container d-flex flex-column">
	<div>
		<h3>글쓰기</h3>
	</div>
	<div class="input-group mb-3">
		<input class="input-group-prepend form-control col-9" id="board_title" type="text" placeholder="타이틀" maxlength="30">
		<select class="input-group-append custom-select col-3" id="board_kind">
			<option value="100">자유</option>
			<option value="200">유머</option>
			<option value="300">공포</option>
			<option value="400">만화</option>
			<option value="500">코로나 뉴스</option>
			<c:if test="${ !empty admin.rowsByIndex[0][0] }">
				<option value="600">공지사항</option>
				<option value="700">소식</option>
			</c:if>
		</select>
	</div>
	
	<div class="input-group mb-3">
		<div class="input-group-prepend">
			 <button class="btn btn-outline-secondary" type="button" id="upload_image"><i class="fa fa-upload mr-2"></i>업로드</button>
		</div>
		<div class="custom-file">
			<input type="file" class="custom-file-input" accept="image/*" id="file_image" capture="camera">
			<label class="custom-file-label" for="file_image">이미지 삽입<i class="fa fa-file-image-o ml-2"></i></label>
		</div>
	</div>
	
	<div class="input-group mb-3">
		<div class="input-group-prepend">
			<span class="input-group-text">https://</span>
		</div>
		<input id="insert_img" class="input-group-append form-control" type="text" class="custom-file-input" placeholder="사진 링크 입력">
	</div>
	
	<div class="w-100 border border-dark rounded write_content_top">
		<div class="w-100 write_content_middle">
			<div id="board_content" contentEditable="true" class="p-3"></div>
		</div>
	</div>
	
	<div class="container my-3">
		<button class="btn btn-outline-dark btn-lg" id="back">취소</button>
		<button class="btn btn-success btn-lg" id="complete">작성하기</button>
	</div>
</div>