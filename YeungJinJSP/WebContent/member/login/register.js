var check_email = false;
var check_passwd = false;
var check_nick = false;

$(function() {
		// 회원 가입 관련 코드들
	
	// 이메일 체크
	$('#reg_email').on("propertychange change keyup paste input", function() {
		if($('#reg_email').val() == "") {
			$('#check_email').text("");
			return;
		}
		
		if(validateEmail($('#reg_email').val())) {
			
			var query = {
				email: $('#reg_email').val()
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
						$('#check_email').text("이메일이 존재합니다.");
						check_email = false;
					} else {			// 이메일이 존재하지 않을 시
						$('#check_email').text('사용 가능한 이메일입니다.');
						check_email = true;
					}
				}
			});
			
		} else {	// 이메일 형식이 아닐 시
			$('#check_email').text('이메일 형식으로 작성하세요.');
			check_email = false;
		}
		checkAll();
	});
	
	// 비밀번호 체크
	$('#reg_passwd').on("propertychange change keyup paste input", function() {
		if($('#reg_passwd').val() == "") {
			$('#check_passwd').text("");
			return;
		}
		
		var pw = $("#reg_passwd").val();
		var num = pw.search(/[0-9]/g);
		var eng = pw.search(/[a-z]/ig);
		var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
		
		if(pw.length < 8 || pw.length > 20){	
			$('#check_passwd').text("8자리 ~ 20자리 이내로 입력해주세요.");
			check_passwd = false;
		}else if(pw.search(/\s/) != -1){
			$('#check_passwd').text("비밀번호는 공백 없이 입력해주세요.");
			check_passwd = false;
		}else if(num < 0 || eng < 0 || spe < 0 ){
			$('#check_passwd').text("영문,숫자, 특수문자를 혼합하여 입력해주세요.");
			check_passwd = false;
		}else {
			$('#check_passwd').text('');
			check_passwd = true;
		}
		checkAll();
	});
	
	// 닉네임 체크
	
	$('#reg_nick').on("propertychange change keyup paste input", function() {
		var nick = $('#reg_nick').val();
		
		if(nick == "") {
			$('#check_nick').text("");
			return;
		}
		
		for(let i = 0; i < bad_word.length; i++) {
			if($(this).val().indexOf(bad_word[i]) >= 0) {
				$(this).val($(this).val().replace(bad_word[i], ''));
				alert("비속어는 사용하실 수 없습니다.");
				return;
			}
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
		checkAll();
	});
	
	// 돌아기기 버튼을 클릭 시
	$('#back').click(function() {
		window.history.back();
	});
});

function validateEmail(sEmail) {
	var filter = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	
	if (filter.test(sEmail))
		return true;
	else
		return false;
}

function checkAll() {
	if(check_email && check_passwd && check_nick ){
		$('#join').removeAttr('disabled');
	} else {
		$('#join').attr('disabled', 'disabled');
	}
}