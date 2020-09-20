var check_email = false;
var check_pw = false;

$(function() {
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
	$('#pw').on("propertychange change keyup paste input", function() {
		if($('#pw').val()) {
			check_pw = true;
		} else {
			check_pw = false;
		}
		checkAll();
		$('#check_mail_pass').text("");
	});
	
	$('#loginBtn').click(function() {
		var query = {
			email: $('#email').val(),
			pw: $('#pw').val(),
			checkbox: $("input:checkbox[id='login_cookie']").is(":checkbox")
		};
		
		$.ajax({
			type: "POST",
			url: "loginPro.do",
			data: query,
			success: function(data) {
				var str = "<p id='ck'>";
				var loc = data.indexOf(str);
				var len = str.length;
				var check = data.substr(loc + len, 1);
				
				if(check == "1") {	// 아이디, 비번 맞을 시
					alert("로그인이 완료되었습니다.");
					window.location.href = "mainBoard.do?kind=all&sort=pop";
				} else if(check == "2") {	// 이메일 인증이 아직 안된 아이디
					$('#load_dialog').load('member/login/dialog.jsp');
				} else {	// 틀렸을 시
					$('#check_mail_pass').text("이메일 또는 비밀번호가 틀렸습니다.");
				}
			}
		});
	});
});

function checkAll() {
	if(check_email && check_pw) {
		$('#loginBtn').removeAttr('disabled');
	} else {
		$('#loginBtn').attr('disabled', 'disabled');
	}
}