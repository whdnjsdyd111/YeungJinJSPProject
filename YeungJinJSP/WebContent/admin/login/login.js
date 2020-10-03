var check_email = false;
var check_pw = false;

$(function() {
	$('#email').focus();
	
	// 이메일 체크
	$('#email').on("propertychange change keyup paste input", function() {
		if($('#email').val()) {
			check_email = true;
		} else {
			check_email = false;
		}
		checkAll();
		$('#check_mail_pass').text("");
	});
	
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
		if(key.keyCode == 13 && check_pw && check_email) {
			login();
		}
	});
	
	$('#loginBtn').click(login);
	
});

function checkAll() {
	if(check_email && check_pw) {
		$('#loginBtn').removeAttr('disabled');
	} else {
		$('#loginBtn').attr('disabled', 'disabled');
	}
}

function login() {
	var query = {
		email: $('#email').val(),
		pw: $('#pw').val()
	};
	
	$.ajax({
		type: "POST",
		url: "loginPro.do",
		data: query,
		success: function(data) {
			var str1 = "<p id='ck'>";
			var str2 = "admin_id</p>";
			var loc1 = data.indexOf(str1);
			var loc2 = data.indexOf(str2);
			var len = str1.length;
			var check = data.substr(loc1 + len, loc2 - (loc1 + len));

			if(check != "0") {	// 아이디, 비번 맞을 시
				alert("관리자님 환영합니다.");
				window.location.href = "dashboard.do";
			} else {	// 틀렸을 시
				$('#check_mail_pass').text("이메일 또는 비밀번호가 틀렸습니다.");
			}
		}
	});
}