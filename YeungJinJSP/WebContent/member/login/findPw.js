var email_ck = false;

$(function() {
	
	// 이메일 체크
	$('#email').on("propertychange change keyup paste input", function() {
		if(validateEmail($('#email').val())) {
			
			var query = {
				email: $('#email').val()
			};
			
			$.ajax({
				type: "POST",
				url: "confirmEmail.do",
				data: query,
				success: function(data) {
					var str = "<p id='ck'>";
					var loc = data.indexOf(str);
					var len = str.length;
					var check = data.substr(loc + len, 1);
					
					if(check == "1") {	// 이메일이 존재할 시
						$('#check_email').text("");
						email_ck = true;
					} else {			// 이메일이 존재하지 않을 시
						$('#check_email').text('존재하는 이메일이 없습니다.');
						email_ck = false;
					}
				}
			});
			
		} else {	// 이메일 형식이 아닐 시
			$('#check_email').text('이메일 형식으로 작성하세요.');
			email_ck = false;
		}
		
		if(email_ck){
			$('#find').removeAttr('disabled');
		} else {
			$('#find').attr('disabled', 'disabled');
		}

	});
});

function validateEmail(sEmail) {
	var filter = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	
	if (filter.test(sEmail))
		return true;
	else
		return false;
}