function validateEmail(sEmail) {
	var filter = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	
	if (filter.test(sEmail))
		return true;
	else
		return false;
}

var email = false;
var content = false;

$(function() {
	$('#feedback_modal').on("shown.bs.modal", function() {
		$('#feed_email').focus();
	});
	
	$('#feedback').click(function() {
		$('#feedback_modal').modal();
	});
	
	$('#feed_email').on("propertychange change keyup paste input", function() {
		if(!$('#feed_email').val()) {
			$('#check_email').text("");
			email = false;
			
		} else {
			email = true;
			
			if(validateEmail($('#feed_email').val())) {
				$('#check_email').text("");
			} else {
				$('#check_email').text("이메일 형식으로 작성해주세요.");
			}
		}
		
		
	});
	
	$('#feed_content').on("propertychange change keyup paste input", function() {
		if(!$('#feed_content').val()) {
			$('#check_content').text("내용을 작성해주세요.");
			content = false;
			
		} else {
			content = true;	
			$('#check_content').text("");	
		}
	});
	
	$('#feed_submit').click(function() {
		if(content && email) {
			$.ajax({
				type: "post",
				data: {
					email: $('#feed_email').val(),
					content: $('#feed_content').val()
				},
				url: "feedbackInsertPro.do",
				success: function(data) {
					var str = "<p id='ck'>";
					var loc = data.indexOf(str);
					var len = str.length;
					var check = data.substr(loc + len, 1);
					
					if(check == "1") {
						alert("피드백 감사합니다.");
						$('#feedback_modal').modal('hide');
						$('#feed_email').val("");
						$('#feed_content').val("");
					} else {
						alert("피드백 실패하였습니다. 다시 시도해 주십시오.");
					}
				}
			});
		} else {
			alert("이메일 또는 내용을 입력해주십시오.");
			return;
		}
	});
	
});