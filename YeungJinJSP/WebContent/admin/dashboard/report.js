$(function() {
	$('.watch_content').click(function() {
		$('#report_kind').html($(this).next().next().html());
		$('#report_content').html($(this).next().html());
		
		let kind = $(this).prev().val();
		let contents;
		if(kind == "66") {
			contents = "board_id="; 
			$('#go_contents').text("해당 게시판 보기");
		} else if(kind == "67") {
			contents = "com_id=";
			$('#go_contents').text("해당 댓글 보기");
		} else {
			contents = "neCom_id=";
			$('#go_contents').text("해당 리댓 보기");
		}
		
		$('#go_contents').attr('href', "contentsManagement.do?search=board&sort=recent&" + contents + $(this).prev().prev().val());
		$('#modal_report_id').val($(this).nextAll("#report_id").val());
		$('#modal_mem_id').val($(this).nextAll("#mem_id").val());
		
		$('.modal').modal();
	});
});

function report_pro(btn) {
	if(confirm("처리 완료하시겠습니까?")) {
		$.ajax({
			type: "post",
			data: {
				rep_id: $(btn).next().val(),
				mem_id: $(btn).next().next().val()
			},
			url: "reportPro.do",
			success: function(data) {
				var str = "<p id='ck'>";
				var loc = data.indexOf(str);
				var len = str.length;
				var check = data.substr(loc + len, 1);
				
				if(check == "1") {
					alert("신고처리 완료하였습니다.");
					window.location.href = "report.do";
				} else
					alert("다시 시도해주십시오.");
			}
		});
	}
}

function report_delete(btn) {
	if(confirm("신고 삭제하시겠습니까?")) {
		$.ajax({
			type: "post",
			data: {
				rep_id: $(btn).next().next().val()
			},
			url: "reportPro.do",
			success: function(data) {
				var str = "<p id='ck'>";
				var loc = data.indexOf(str);
				var len = str.length;
				var check = data.substr(loc + len, 1);
				
				if(check == "1") {
					alert("신고삭제 완료하였습니다.");
					window.location.href = "report.do";
				} else
					alert("다시 시도해주십시오.");
			}
		});
	}
}