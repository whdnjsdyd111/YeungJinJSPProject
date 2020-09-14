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
	
	
});

function addNestComment(btn) {
	
}