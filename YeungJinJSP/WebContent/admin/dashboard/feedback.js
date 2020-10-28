$(function() {
	$('.watch_content').click(function() {
		$('#feed_content').html($(this).next().html());
		$('.modal').modal('show');
	});
	
	$('.process').click(function() {
		$.ajax({
			type: "post",
			data: {
				feed_id: $(this).next().val()
			},
			url: "feedbackPro.do",
			success: function(data) {
				var str = "<p id='ck'>";
				var loc = data.indexOf(str);
				var len = str.length;
				var check = data.substr(loc + len, 1);
				
				if(check == "1") {
					alert("처리 완료");
					window.location.href = "feedback.do?sort=processed";
				} else {
					alert("다시 시도해주십시오.");
				}
			}
		})
	});
	
	$('.delete').click(function() {
		if(confirm("피드백 확인을 하셨습니까?")) {
			$.ajax({
				type: "post",
				data: {
					feed_id: $(this).prev().val()
				},
				url: "feedbackDelete.do",
				success: function(data) {
					var str = "<p id='ck'>";
					var loc = data.indexOf(str);
					var len = str.length;
					var check = data.substr(loc + len, 1);
					
					if(check == "1") {
						alert("지우기 완료");
						window.location.href = "feedback.do?sort=nonProcessed";
					} else {
						alert("다시 시도해주십시오.");
					}
				}
			});
		}
	});
});