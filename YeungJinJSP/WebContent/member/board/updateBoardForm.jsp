<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<sql:query var="admin" dataSource="jdbc/yjfb">
	SELECT admin_id FROM admin WHERE admin_id = ?
	<sql:param value="${ sessionScope.YJFBID_SES }" />
</sql:query>

<script type="text/javascript" src="member/board/updateBoard.js"></script>

<c:if test="${ board == null }">
	<script>
		alert("수정할 권한이 없습니다!");
		window.history.back();
	</script>
</c:if>

<div class="container d-flex flex-column">
	<div>
		<h3>글 수정</h3>
	</div>
	<div class="input-group mb-3">
		<input class="input-group-prepend form-control col-9" id="board_title" type="text" 
			placeholder="타이틀" maxlength="30" value="${ board.board_title }">
		<select class="input-group-append custom-select col-3" id="board_kind">
			<c:if test="${ board.board_kind == 100 }">
				<option value="100" selected="selected">자유</option>
			</c:if>
			<c:if test="${ board.board_kind != 100 }">
				<option value="100">자유</option>
			</c:if>
			<c:if test="${ board.board_kind == 200 }">
				<option value="200" selected="selected">유머</option>
			</c:if>
			<c:if test="${ board.board_kind != 200 }">
				<option value="200">유머</option>
			</c:if>
			<c:if test="${ board.board_kind == 300 }">
				<option value="300" selected="selected">공포</option>
			</c:if>
			<c:if test="${ board.board_kind != 300 }">
				<option value="300">공포</option>
			</c:if>
			<c:if test="${ board.board_kind == 400 }">
				<option value="400" selected="selected">만화</option>
			</c:if>
			<c:if test="${ board.board_kind != 400 }">
				<option value="400">만화</option>
			</c:if>
			<c:if test="${ board.board_kind == 500 }">
				<option value="500" selected="selected">코로나 뉴스</option>
			</c:if>
			<c:if test="${ board.board_kind != 500 }">
				<option value="500">코로나 뉴스</option>
			</c:if>
			<c:if test="${ board.board_kind == 600 }">
				<option value="600" selected="selected">공지사항</option>
			</c:if>
			<c:if test="${ board.board_kind != 600 }">
				<option value="600">공지사항</option>
			</c:if>
			<c:if test="${ board.board_kind == 700 }">
				<option value="700" selected="selected">소식</option>
			</c:if>
			<c:if test="${ board.board_kind != 700 }">
				<option value="700">소식</option>
			</c:if>
		</select>
	</div>
	
	<div class="input-group mb-3">
		<div class="input-group-prepend">
			<button class="btn btn-outline-secondary" type="button" id="upload_image"><i class="fa fa-upload mr-2"></i>업로드</button>
		</div>
		<div class="custom-file">
			<input type="file" class="custom-file-input" accept="image/*;capture=camera" id="file_image">
			<label class="custom-file-label">이미지 삽입<i class="fa fa-file-image-o ml-2"></i></label>
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
			<div id="board_content" contentEditable="true" class="px-3">
				${ board.board_content }
			</div>
		</div>
	</div>
	
	<div class="container my-3">
		<button class="btn btn-outline-dark btn-lg" id="back">취소</button>
		<button class="btn btn-warning btn-lg" id="complete">수정하기</button>
	</div>
</div>