$(function() {
	$('#commentBtn').click(function() {
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
				content: $('#comCont').val() 
			},
			success: function() {
				$('#comments_div').load("/YeungJinFunnyBone/member/board/comment.jsp?bdNum=" + get);
			}
		});
	});
	
	$('.write_reply').click(function() {
		$('.reply').remove();
		
		var com_id = $(this).parents('.comments').children('form').children('input[name=com_id]').val();
		var reply = "<div class='reply'>" + 
		"<div class='nestMark'><div class='mark'></div></div>" +
		"<div class='nestContent'><form method='post'><input type='hidden' name='com_id' value='" + com_id + "'>" +
		"<textarea row='5' cols='15' id='nestComCont'></textarea>" +
		"<button type='button' id='nestCommentBtn' onclick=''>작성하기</button></div></form>";
		
		$(this).parents('.comments').after(reply);
		
		$('#nestCommentBtn').click(function() {
			var href = window.location.href;
			var str = 'bdNum=';
			var loc = href.indexOf(str);
			var len = str.length;
			var get = href.substr(loc + len, href.length);
			
			$.ajax({
				type: "post",
				url: "nestCommentInsert.do",
				data: { 
					com_id: $(this).prevAll('input[name=com_id]').val(),
					content: $('#nestComCont').val() 
				},
				success: function() {
					$('#comments_div').load("/YeungJinFunnyBone/member/board/comment.jsp?bdNum=" + get);
				}
			});
		});
	});
	
	$('.write_nest_reply').click(function() {
		$('.reply').remove();
		
		var com_id = $(this).parents('.nestComments').prevAll('.comments').children('form').children('input[name=com_id]').val();
		var reply = "<div class='reply'>" + 
		"<div class='nestMark'><div class='mark'></div></div>" +
		"<div class='nestContent'><form method='post'><input type='hidden' name='com_id' value='" + com_id + "'>" +
		"<textarea row='5' cols='15' id='nestComCont'></textarea>" +
		"<button type='button' id='nestCommentBtn' onclick=''>작성하기</button></div></form>";
		
		$(this).parents('.nestComments').after(reply);
		
		$('#nestCommentBtn').click(function() {
			var href = window.location.href;
			var str = 'bdNum=';
			var loc = href.indexOf(str);
			var len = str.length;
			var get = href.substr(loc + len, href.length);
			
			$.ajax({
				type: "post",
				url: "nestCommentInsert.do",
				data: { 
					com_id: $(this).prevAll('input[name=com_id]').val(),
					content: $('#nestComCont').val() 
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
});