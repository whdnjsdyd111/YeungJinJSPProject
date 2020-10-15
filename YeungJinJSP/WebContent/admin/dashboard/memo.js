$(function() {
	$('#memo_modal').click(function() {
		$('.modal').modal();
		
	});
	
	$('#memo_pro').click(function() {
		if(!$('#memo_content').val()) {
			alert("메모 내용을 입력하세요.");
			$('#memo_content').focus();
			return false;
		}
		
		if(!$('#memo_content').val().length > 100) {
			alert("백자 내로 입력하세요.");
			$('#memo_content').val("");
			$('#memo_content').focus();
			return false;
		}
		
		$.ajax({
			type: "post",
			data: {
				content: $('#memo_content').val()
			},
			url: "memoInsertPro.do",
			success: function(data) {
				var str = "<p id='ck'>";
				var loc = data.indexOf(str);
				var len = str.length;
				var check = data.substr(loc + len, 1);
				
				if(check == "1")
					$('#memo_div').load("/YeungJinFunnyBone/admin/dashboard/memo.jsp");
				else
					alert("메모장 데이터 삽입에 실패하였습니다.");
			}
		});
	});
	
	$('#memo_modal_pro').click(function() {
		
		if(!$('#memo_modal_content').val()) {
			alert("메모 내용을 입력하세요.");
			$('#memo_modal_content').focus();
			return false;
		}
		
		if(!$('#memo_modal_content').val().length > 100) {
			alert("백자 내로 입력하세요.");
			$('#memo_modal_content').val("");
			$('#memo_modal_content').focus();
			return false;
		}
		
		$.ajax({
			type: "post",
			data: {
				content: $('#memo_modal_content').val()
			},
			url: "memoInsertPro.do",
			success: function(data) {
				var str = "<p id='ck'>";
				var loc = data.indexOf(str);
				var len = str.length;
				var check = data.substr(loc + len, 1);
				
				if(check == "1") {
					$('#memo_modal_div').load("/YeungJinFunnyBone/admin/dashboard/memo_modal.jsp", function() {
						$('#memo_modal_div').scrollTop($('#memo_modal_div').prop('scrollHeight'));
						$('#memo_modal_content').val("");
					});
				} else
					alert("메모장 데이터 삽입에 실패하였습니다.");
			}
		});
	});
	
	$('.delete_memo').click(function() {
		$.ajax({
			type: "post",
			data: {
				memo_id: $(this).next().val()
			},
			url: "memoDeletePro.do",
			success: function(data) {
				var str = "<p id='ck'>";
				var loc = data.indexOf(str);
				var len = str.length;
				var check = data.substr(loc + len, 1);
				
				if(check == "1")
					$('#memo_div').load("/YeungJinFunnyBone/admin/dashboard/memo.jsp");
				else
					alert("메모장 데이터 삽입에 실패하였습니다.");
			}
		});
	});
	
	modal_memo_delete();
	
	$('.modal').on('hidden.bs.modal', function() {
		$('#memo_div').load("/YeungJinFunnyBone/admin/dashboard/memo.jsp");
	});
	
	$('.modal').on('show.bs.modal', function() {
		$('#memo_modal_div').scrollTop($('#memo_modal_div').prop('scrollHeight'));
	});
});

function modal_memo_delete() {
	$('.delete_memo_modal').click(function() {
		var cur_scroll = $('#memo_modal_div').scrollTop();
		
		$.ajax({
			type: "post",
			data: {
				memo_id: $(this).next().val()
			},
			url: "memoDeletePro.do",
			success: function(data) {
				var str = "<p id='ck'>";
				var loc = data.indexOf(str);
				var len = str.length;
				var check = data.substr(loc + len, 1);
				
				if(check == "1") {
					$('#memo_modal_div').load("/YeungJinFunnyBone/admin/dashboard/memo_modal.jsp", function() {
						$('#memo_modal_div').scrollTop(cur_scroll);
						modal_memo_delete();
					});
				} else
					alert("메모장 데이터 삽입에 실패하였습니다.");
			}
		});
	});
}