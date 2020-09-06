var check_passwd = false;
var reCheck_passwd = false;

$(function() {
	$('#password').on("propertychange change keyup paste input", function() {
		var pw = $("#password").val();
		var num = pw.search(/[0-9]/g);
		var eng = pw.search(/[a-z]/ig);
		var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
		
		if(pw.length < 8 || pw.length > 20){	
			$('#check_pw').text("8자리 ~ 20자리 이내로 입력해주세요.");
			check_passwd = false;
		}else if(pw.search(/\s/) != -1){
			$('#check_pw').text("비밀번호는 공백 없이 입력해주세요.");
			check_passwd = false;
		}else if(num < 0 || eng < 0 || spe < 0 ){
			$('#check_pw').text("영문,숫자, 특수문자를 혼합하여 입력해주세요.");
			check_passwd = false;
		}else {
			$('#check_pw').text('');
			check_passwd = true;
		}
		
		checkAll();
	});
	
	$('#rePasswd').on("propertychange change keyup paste input", function() {
		if($('#password').val() == $('#rePasswd').val()) {
			$('#reCheck_pw').text("");
			reCheck_passwd = true;
		} else {
			$('#reCheck_pw').text("비밀번호와 같아야 합니다.");
			reCheck_passwd = false;
		}
		
		checkAll();
	});
});

function checkAll() {
	if(check_passwd && reCheck_passwd) {
		$('#rePwOk').removeAttr('disabled');
	} else {
		$('#rePwOk').attr('disabled', 'disabled');
	}
}