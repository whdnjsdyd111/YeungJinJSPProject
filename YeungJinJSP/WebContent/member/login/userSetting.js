var check_nick = false;
var check_passwd = false;
var check_new_passwd = false;
var reCheck_passwd = false;

$(function() {
	$('#nickname').on("propertychange change keyup paste input", function() {
		var nick = $('#nickname').val();
		
		if(nick == "") {
			$('#check_nick').text("");
			return;
		}
		
		var spe = nick.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
		
		if(nick.length < 2|| nick.length > 10) {
			$('#check_nick').text("2자리 ~ 10자리 이내로 입력해주세요.")
			check_nick = false;
		} else if(spe > 0 || nick.search(/\s/) != -1) {
			$('#check_nick').text("공백 또는 특수문자는 사용하실 수 없습니다.");
			check_nick = false;
		} else {
			var query = {
				nickname: nick
			};
			
			$.ajax({
				type: "POST",
				url: "confirmNick.do",
				data: query,
				success: function(data) {
					var str = "<p id='ck'>";
					var loc = data.indexOf(str);
					var len = str.length;
					var check = data.substr(loc + len, 1);
					
					if(check == "1") {	// 닉네임이 존재할 시
						$('#check_nick').text("닉네임이 존재합니다.");
						check_nick = false;
					} else {			// 닉네임이 존재하지 않을 시
						$('#check_nick').text('사용 가능한 닉네임입니다.');
						check_nick = true;
					}
				}
			});
		}
		if(check_nick) {
			$('#updateNick').removeAttr('disabled');
		} else {
			$('#updateNick').attr('disabled', 'disabled');
		}
	});
	
	$('#updateNick').click(function() {
		$.ajax({
			type: "POST",
			url: "updateNickname.do",
			data: {
				nickname: $('#nickname').val()
			},
			success: function(data) {
				var str = "<p id='ck'>";
				var loc = data.indexOf(str);
				var len = str.length;
				var check = data.substr(loc + len, 1);
				
				if(check == "1") {	// 닉네임 수정 성공
					$('#check_nick').text("수정에 성공하였습니다.");
				} else {			// 닉네임 수정 실패
					$('#check_nick').text("수정에 실패하였습니다.")
				}
			}
		});
	});
	
	$('#submit_new_pw').click(function() {
		$.ajax({
			type: "POST",
			url: "updatePassword.do",
			data: {
				password: $('#password').val(),
				new_password: $('#new_password').val()
			},
			success: function(data) {
				var str = "<p id='ck'>";
				var loc = data.indexOf(str);
				var len = str.length;
				var check = data.substr(loc + len, 1);
				
				if(check == "1") {	// 비번 수정 성공
					alert("비밀번호 수정에 성공하였습니다.");
					window.location.href = "userSetting.do";
				} else if(check == "2") {			// 비번 수정 실패
					$('#check_pw').text("비밀번호가 틀렸습니다.");
				} else {
					alert("비밀번호 수정에 실패하였습니다.");
				}
			}
		});
	});
	
	$('#new_password').on("propertychange change keyup paste input", function() {
		var pw = $("#new_password").val();
		var num = pw.search(/[0-9]/g);
		var eng = pw.search(/[a-z]/ig);
		var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
		
		if(pw.length < 8 || pw.length > 20){	
			$('#new_check_pw').text("8자리 ~ 20자리 이내로 입력해주세요.");
			check_new_passwd = false;
		}else if(pw.search(/\s/) != -1){
			$('#new_check_pw').text("비밀번호는 공백 없이 입력해주세요.");
			check_new_passwd = false;
		}else if(num < 0 || eng < 0 || spe < 0 ){
			$('#new_check_pw').text("영문,숫자, 특수문자를 혼합하여 입력해주세요.");
			check_new_passwd = false;
		}else {
			$('#new_check_pw').text('');
			check_new_passwd = true;
		}
		
		checkAll();
	});
	
	$('#new_re_passwd').on("propertychange change keyup paste input", function() {
		if($('#new_re_passwd').val() == $('#new_password').val()) {
			$('#new_re_check_pw').text("");
			reCheck_passwd = true;
		} else {
			$('#new_re_check_pw').text("비밀번호와 같아야 합니다.");
			reCheck_passwd = false;
		}
		
		checkAll();
	});
	
		// 비밀번호 체크
	$('#password').on("propertychange change paste input", function() {
		if($('#password').val()) {
			check_passwd = true;
		} else {
			check_passwd = false;
		}
		checkAll();
	});
	
});

function checkAll() {
	if(check_new_passwd && reCheck_passwd && check_passwd) {
		$('#submit_new_pw').removeAttr('disabled');
	} else {
		$('#submit_new_pw').attr('disabled', 'disabled');
	}
}