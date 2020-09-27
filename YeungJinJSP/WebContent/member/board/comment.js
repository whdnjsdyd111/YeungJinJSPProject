$(function() {
	$('#commentBtn').click(function() {
		
		if(!$('#comment_content').html()) {
			alert("댓글 내용을 입력해주세요.");
			return false;
		}
		
		var href = window.location.href;
		var str = 'bdNum=';
		var loc = href.indexOf(str);
		var len = str.length;
		var get = href.substr(loc + len, href.length);

		$.ajax({
			type: "POST",
			url: "commentInsert.do",
			data: { 
				board_id: get,
				content: $('#comment_content').html() 
			},
			success: function() {
				$('#comments_div').load("/YeungJinFunnyBone/member/board/comment.jsp?bdNum=" + get + "&sort=recent");
			}
		});
	});
	
	$('.write_reply').click(function() {
		$('.reply').remove();
		
		var target_mem_id = $(this).next().val();
		var target_mem_nickname = $(this).nextAll('input[name=nickname]').val();
		
		var span_nickname = '<span class="mr-2 bg-success text-white rounded" contenteditable="false">' + target_mem_nickname + '</span><br>';
		
		if(target_mem_nickname === undefined)
			span_nickname = "";
		
		var com_id = $(this).parents('.comments').children('form').children('input[name=com_id]').val();
		var reply = "<div class='reply p-3 d-flex flex-md-row'>" + 
		"<div class='border border-right-0 border-top-0 border-dark ml-5' style='width: 30px; height: 30px'></div>" +
		'<div class="w-100"><div class="border border-dark write_comment_top mx-3">' +
		'<div class="ml-3 write_comment_member">' + $('#mem_nickname').text() + '</div><div class="w-100 write_comment_middle">' +
		'<div id="nestComCont" class="px-3" contentEditable="true">' +
		span_nickname +
		'</div></div></div>' +
		'<div class="border border-dark border-top-0 mx-3">' +
		'<div class="w-100 d-flex"><div class="custom-file w-75">' +
		'<input type="file" class="custom-file-input" id="comment_image">' +
		'<label class="custom-file-label" for="comment_image"><i class="fa fa-upload mr-2"></i>이미지 삽입</label></div>' +
		"<input type='hidden' name='com_id' value='" + com_id + "'>" + 
		'<button id="nestCommentBtn" class="btn btn-info w-25">작성</button></div></div><div>';
		
		$(this).parents('.comments').after(reply);
		
		$('#nestCommentBtn').click(function() {
			
			if(!$('#nestComCont').html()) {
				alert("댓글 내용을 입력해주세요.");
				return false;
			}
			
			var href = window.location.href;
			var str = 'bdNum=';
			var loc = href.indexOf(str);
			var len = str.length;
			var get = href.substr(loc + len, href.length);
			get = get.replace("#start_com", "");
			
			var notice_content = $('#nestComCont').html().replace(span_nickname.replace('<br>', ""), "").replace(/(<([^>]+)>)/ig,"");
			
			$.ajax({
				type: "post",
				url: "nestCommentInsert.do",
				data: { 
					board_id: get,
					target_mem_id: target_mem_id,
					com_id: $(this).prevAll('input[name=com_id]').val(),
					content: $('#nestComCont').html(),
					notice_content: notice_content
				},
				success: function() {
					$('#comments_div').load("/YeungJinFunnyBone/member/board/comment.jsp?bdNum=" + get);
				}
			});
		});
	});
	
	$('.write_nest_reply').click(function() {
		$('.reply').remove();
		
		var target_mem_id = $(this).next().val();
		var target_mem_nickname = $(this).nextAll('input[name=nickname]').val();
		
		var span_nickname = '<span class="mr-2 bg-success text-white rounded" contenteditable="false">' + target_mem_nickname + '</span><br>';
		
		if(target_mem_nickname === undefined)
			span_nickname = "";
		
		var com_id = $(this).parents('.nestComments').prevAll('.comments').children('form').children('input[name=com_id]').val();
		var reply = "<div class='reply p-3 d-flex flex-md-row'>" + 
		"<div class='border border-right-0 border-top-0 border-dark ml-5' style='width: 30px; height: 30px'></div>" +
		'<div class="w-100"><div class="border border-dark write_comment_top mx-3">' +
		'<div class="ml-3 write_comment_member">' + $('#mem_nickname').text() + '</div><div class="w-100 write_comment_middle">' +
		'<div id="nestComCont" class="px-3" contentEditable="true">' +
		span_nickname +
		'</div></div></div>' +
		'<div class="border border-dark border-top-0 mx-3">' +
		'<div class="w-100 d-flex"><div class="custom-file w-75">' +
		'<input type="file" class="custom-file-input" id="comment_image">' +
		'<label class="custom-file-label" for="comment_image"><i class="fa fa-upload mr-2"></i>이미지 삽입</label></div>' +
		"<input type='hidden' name='com_id' value='" + com_id + "'>" + 
		'<button id="nestCommentBtn" class="btn btn-info w-25">작성</button></div></div><div>';
		
		$(this).parents('.nestComments').after(reply);
		
		$('#nestCommentBtn').click(function() {
			
			if(!$('#nestComCont').html()) {
				alert("댓글 내용을 입력해주세요.");
				return false;
			}
			
			var href = window.location.href;
			var str = 'bdNum=';
			var loc = href.indexOf(str);
			var len = str.length;
			var get = href.substr(loc + len, href.length);
			get = get.replace("#start_com", "");
			
			var notice_content = $('#nestComCont').html().replace(span_nickname.replace('<br>', ""), "").replace(/(<([^>]+)>)/ig,"");
			
			$.ajax({
				type: "post",
				url: "nestCommentInsert.do",
				data: { 
					board_id: get,
					target_mem_id: target_mem_id,
					com_id: $(this).prevAll('input[name=com_id]').val(),
					content: $('#nestComCont').html(),
					notice_content: notice_content
				},
				success: function() {
					$('#comments_div').load("/YeungJinFunnyBone/member/board/comment.jsp?bdNum=" + get);
				}
			});
		});
	});
	
	$('.recoBtn').click(function() {
		var com_id = $(this).nextAll('input[name=com_id]').val();
		var btn = $(this);
		var check_reco = $(btn).attr('id') == 'comReco_y';
		var check_nonReco = $(btn).nextAll('.nonRecoBtn').attr('id') == 'comNonReco_y';
		var reco_count = $(btn).nextAll('.reco_count');
		
		if(check_reco) {
			// 이미 체크가 된 상태에서 눌렀을 시
			// db에서 삭제
			$(btn).attr('id', 'comReco_n');
			
			$.ajax({
				type: "post",
				url: "insertCommentReco.do",
				data: {
					com_id: com_id,
					check_reco: check_reco,
					check_nonReco: check_nonReco,
					check_db: true,
					btn: "reco"
				},
				success: function(data) {
					var str1 = "<p id='reco'>";
					var str2 = "reco</p>";
					var loc1 = data.indexOf(str1);
					var loc2 = data.indexOf(str2);
					var len = str1.length;
					var check = data.substr(loc1 + len, loc2 - (loc1 + len));
					
					reco_count.text(check);
				}
			});
		} else if(!check_reco && check_nonReco) {
			// 비추가 된 상태에서 눌렀을 시
			// db 수정
			$(btn).attr('id', 'comReco_y');
			$(btn).nextAll('.nonRecoBtn').attr('id', 'comNonReco_n');
			
			$.ajax({
				type: "post",
				url: "insertCommentReco.do",
				data: {
					com_id: com_id,
					check_reco: check_reco,
					check_nonReco: check_nonReco,
					check_db: true,
					btn: "reco"
				},
				success: function(data) {
					var str1 = "<p id='reco'>";
					var str2 = "reco</p>";
					var loc1 = data.indexOf(str1);
					var loc2 = data.indexOf(str2);
					var len = str1.length;
					var check = data.substr(loc1 + len, loc2 - (loc1 + len));
					
					reco_count.text(check);
				}
			});
		} else if(!check_reco) {
			// 체크 안된 상태에서 눌렀을 시
			// db 삽입
			$(btn).attr('id', 'comReco_y');
			
			$.ajax({
				type: "post",
				url: "insertCommentReco.do",
				data: {
					com_id: com_id,
					check_reco: check_reco,
					check_nonReco: check_nonReco,
					check_db: false,
					btn: "reco"
				},
				success: function(data) {
					var str1 = "<p id='reco'>";
					var str2 = "reco</p>";
					var loc1 = data.indexOf(str1);
					var loc2 = data.indexOf(str2);
					var len = str1.length;
					var check = data.substr(loc1 + len, loc2 - (loc1 + len));
					
					reco_count.text(check);
				}
			});
		}
		
	});
	
	$('.nonRecoBtn').click(function() {
		var com_id = $(this).prevAll('input[name=com_id]').val();
		var btn = $(this);
		var check_nonReco = $(btn).attr('id') == 'comNonReco_y';
		var check_reco = $(btn).prevAll('.recoBtn').attr('id') == 'comReco_y';
		var reco_count = $(btn).prevAll('.reco_count');
		
		if(check_nonReco) {
			// 이미 체크가 된 상태에서 눌렀을 시
			// db에서 삭제
			$(btn).attr('id', 'comNonReco_n');
			
			$.ajax({
				type: "post",
				url: "insertCommentReco.do",
				data: {
					com_id: com_id,
					check_reco: check_reco,
					check_nonReco: check_nonReco,
					check_db: true,
					btn: "nonReco"
				},
				success: function(data) {
					var str1 = "<p id='reco'>";
					var str2 = "reco</p>";
					var loc1 = data.indexOf(str1);
					var loc2 = data.indexOf(str2);
					var len = str1.length;
					var check = data.substr(loc1 + len, loc2 - (loc1 + len));
					
					reco_count.text(check);
				}
			});
		} else if(check_reco && !check_nonReco) {
			// 추천이 된 상태에서 눌렀을 시
			// db 수정
			$(btn).attr('id', 'comNonReco_y');
			$(btn).prevAll('.recoBtn').attr('id', 'comReco_n');
			
			$.ajax({
				type: "post",
				url: "insertCommentReco.do",
				data: {
					com_id: com_id,
					check_reco: check_reco,
					check_nonReco: check_nonReco,
					check_db: true,
					btn: "nonReco"
				},
				success: function(data) {
					var str1 = "<p id='reco'>";
					var str2 = "reco</p>";
					var loc1 = data.indexOf(str1);
					var loc2 = data.indexOf(str2);
					var len = str1.length;
					var check = data.substr(loc1 + len, loc2 - (loc1 + len));
					
					reco_count.text(check);
				}
			});
		} else if(!check_nonReco) {
			// 체크 안된 상태에서 눌렀을 시
			// db 삽입
			$(btn).attr('id', 'comNonReco_y');
			
			$.ajax({
				type: "post",
				url: "insertCommentReco.do",
				data: {
					com_id: com_id,
					check_reco: check_reco,
					check_nonReco: check_nonReco,
					check_db: false,
					btn: "nonReco"
				},
				success: function(data) {
					var str1 = "<p id='reco'>";
					var str2 = "reco</p>";
					var loc1 = data.indexOf(str1);
					var loc2 = data.indexOf(str2);
					var len = str1.length;
					var check = data.substr(loc1 + len, loc2 - (loc1 + len));
					
					reco_count.text(check);
				}
			});
		}
	});
	
	$('[data-toggle="tooltip"]').tooltip();
	
	$('.delete_com').click(function() {
		var conf = confirm("댓글을 삭제하시겠습니까?");
		
		if(conf) {
			$.ajax({
				type: "post",
				url: "commentDelete.do",
				data: {
					com_id: $(this).next().val()
				},
				success: function(data) {
					var str = "<p id='ck'>";
					var loc = data.indexOf(str);
					var len = str.length;
					var check = data.substr(loc + len, 1);
					
					if(check == "1") {
						alert("댓글 삭제를 완료하였습니다.");
						$('#comments_div').load("/YeungJinFunnyBone/member/board/comment.jsp?bdNum=" + get);
					} else {
						window.location.href = "DBFail.do";
					}
				}
			});
		}
	});
	
	$('.delete_nest_com').click(function() {
		var conf = confirm("댓글을 삭제하시겠습니까?");
		
		if(conf) {
			$.ajax({
				type: "post",
				url: "nestCommentDelete.do",
				data: {
					nest_com_id: $(this).next().val()
				},
				success: function(data) {
					var str = "<p id='ck'>";
					var loc = data.indexOf(str);
					var len = str.length;
					var check = data.substr(loc + len, 1);
					
					if(check == "1") {
						alert("댓글 삭제를 완료하였습니다.");
						$('#comments_div').load("/YeungJinFunnyBone/member/board/comment.jsp?bdNum=" + get);
					} else {
						window.location.href = "DBFail.do";
					}
				}
			});
		}
	});
});