$(function() {
	$('#delete_notices').click(function() {
		$('#delete_notices').remove();
		
		$.ajax({
			url: "deleteAllNotice.do",
			success: function(data) {
				var str = "<p id='ck'>";
				var loc = data.indexOf(str);
				var len = str.length;
				var check = data.substr(loc + len, 1);
				
				if(check > 0) {
					$('#notice_div').load("/YeungJinFunnyBone/member/index/notice.jsp");
				} else {
					alert("알림 지우기에 실패하였습니다.");
				}
			}
		});
	});
	
	$('.delete_notice').click(function() {
		$.ajax({
			type: "post",
			url: "deleteNotice.do",
			data: {
				board: $(this).nextAll('input[name=board]').val(),
				kind: $(this).nextAll('input[name=kind]').val()
			},
			success: function(data) {
				var str = "<p id='ck'>";
				var loc = data.indexOf(str);
				var len = str.length;
				var check = data.substr(loc + len, 1);
				
				if(check == 1) {
					$('#notice_div').load("/YeungJinFunnyBone/member/index/notice.jsp");
				} else {
					alert("알림 지우기에 실패하였습니다.");
				}
			}
		});
	});
	
	$('.delete_admin_notice').click(function() {
		$.ajax({
			type: "post",
			url: "deleteAdminNotice.do",
			data: {
				notice_id: $(this).next().val()
			},
			success: function(data) {
				var str = "<p id='ck'>";
				var loc = data.indexOf(str);
				var len = str.length;
				var check = data.substr(loc + len, 1);
				
				if(check == 1) {
					$('#notice_div').load("/YeungJinFunnyBone/member/index/notice.jsp");
				} else {
					alert("알림 지우기에 실패하였습니다.");
				}
			}
		});
	});
});