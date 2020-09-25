var check_pw = false;

$(function() {
	// 비밀번호 체크
	$('#pw').on("propertychange change paste input", function() {
		if($('#pw').val()) {
			check_pw = true;
		} else {
			check_pw = false;
		}
		checkAll();
		$('#check_mail_pass').text("");
	});
	
	$('#pw').keydown(function(key) {
		if(key.keyCode == 13 && check_pw) {
			login();
		}
	});
	
	$('#loginBtn').click(login);
});

function checkAll() {
	if(check_pw) {
		$('#loginBtn').removeAttr('disabled');
	} else {
		$('#loginBtn').attr('disabled', 'disabled');
	}
}

function login() {
	var query = {
		pw: $('#pw').val()
	};
	
	$.ajax({
		type: "POST",
		url: "checkPasswordPro.do",
		data: query,
		success: function(data) {
			var str = "<p id='ck'>";
			var loc = data.indexOf(str);
			var len = str.length;
			var check = data.substr(loc + len, 1);
			
			if(check == "1") {	// 아이디, 비번 맞을 시
				alert("인증이 완료되었습니다.");
				window.location.href = "userSetting.do";
			} else {	// 틀렸을 시
				$('#check_mail_pass').text("비밀번호가 틀렸습니다.");
			}
		}
	});
}