var messages = { level: "관리자가 사용자님의 레벨을 변경하였습니다.",
	ex: "관리자가 사용자님의 경험치를 변경하였습니다.",
	auth: "관리자가 사용자님의 이메일 권한을 변경하였습니다."
};

$(function() {
	$('.modal').modal();
	
	const ori_level = $('#level_form').val();
	const ori_ex = $('#ex_form').val();
	const ori_auth = $('#auth_form').val();
	
	$('#level').click(function() {
		let level = $('#level_form').val();
		
		if(!$.isNumeric(level)) {
			alert("숫자 입력만 가능합니다.")
			return false;
		}
		
		if(level == ori_level)
			return false;
		
		let memo = " " + ori_level + "→" + level;
		
		if(confirm("사용자의 레벨을 변경하시겠습니까?")) {
			let message = prompt("메시지를 작성(30자 이내)하지 않으면 기본 메시지가 전송됩니다.");
			
			if(message.length > 30) {
				alert("30자 이내로 작성해주십시오.");
				return false;
			}
			
			if(message == null || message == "") {
				message = messages['level'];
			}
			
			$.ajax({
				type: "post",
				data: {
					mem_id: $('#mem_id').val(),
					notice_content: message + memo,
					kind: "level",
					val: level
				},
				url: "noticeInsert.do",
				success: function(data) {
					var str = "<p id='ck'>";
					var loc = data.indexOf(str);
					var len = str.length;
					var check = data.substr(loc + len, 1);
					
					if(check == "1") {
						$('.modal').load("/YeungJinFunnyBone/admin/dashboard/memberAuthModal.jsp?mem_id=" + $('#mem_id').val());
					} else {
						alert("변경 및 메시지 전송 실패");
					}
					
				}
			});
		}
	});
	
	$('#ex').click(function() {
		let ex = $('#ex_form').val();
		
		if((Number(ori_level) + 2) * 150 < ex) {
			alert((Number(ori_level) + 2) * 150 + "를 초과하여 설정할 수 없습니다.");
			return false;
		}
		
		if(!$.isNumeric(ex)) {
			alert("숫자 입력만 가능합니다.");
			return false;
		} 
		
		if(ex == ori_ex)
			return false;

		let memo = " " + ori_ex + "→" + ex;

		if(confirm("사용자의 경험치를 변경하시겠습니까?")) {
			let message = prompt("메시지를 작성(30자 이내)하지 않으면 기본 메시지가 전송됩니다.");
			
			if(message.length > 30) {
				alert("30자 이내로 작성해주십시오.");
				return false;
			}
			
			if(message == null || message == "") {
				message = messages['ex'];
			}
			
			$.ajax({
				type: "post",
				data: {
					mem_id: $('#mem_id').val(),
					notice_content: message + memo,
					kind: "ex",
					val: ex
				},
				url: "noticeInsert.do",
				success: function(data) {
					var str = "<p id='ck'>";
					var loc = data.indexOf(str);
					var len = str.length;
					var check = data.substr(loc + len, 1);
					
					if(check == "1") {
						$('.modal').load("/YeungJinFunnyBone/admin/dashboard/memberAuthModal.jsp?mem_id=" + $('#mem_id').val());
					} else {
						alert("변경 및 메시지 전송 실패");
					}
				}
			});
		}
	});
	
	$('#auth').click(function() {
		let auth = $('#auth_form').val();
		
		if(!(auth == 'Y' || auth == 'N')) {
			alert("권한 설정은 Y 또는 N만 가능합니다.");
			return false;
		}
		
		if(ori_auth == auth)
			return false;
		
		let memo = " " + ori_auth + "→" + auth;
		
		
		if(confirm("사용자의 이메일 인증 권한을 변경하시겠습니까?")) {
			
			let message = prompt("메시지를 작성(30자 이내)하지 않으면 기본 메시지가 전송됩니다.");
			
			if(message.length > 30) {
				alert("30자 이내로 작성해주십시오.");
				return false;
			}
			
			if(message == null || message == "") {
				message = messages['auth'];
			}
			
			$.ajax({
				type: "post",
				data: {
					mem_id: $('#mem_id').val(),
					notice_content: message + memo,
					kind: "auth",
					val: auth
				},
				url: "noticeInsert.do",
				success: function(data) {
					var str = "<p id='ck'>";
					var loc = data.indexOf(str);
					var len = str.length;
					var check = data.substr(loc + len, 1);
					
					if(check == "1") {
						$('.modal').load("/YeungJinFunnyBone/admin/dashboard/memberAuthModal.jsp?mem_id=" + $('#mem_id').val());
					} else {
						alert("변경 및 메시지 전송 실패");
					}
				}
			});
		}
	});
	
	$('#message').click(function() {
		if(!$('#message_form').val())
			return false;
		
		if(confirm("사용자에게 메시지를 전송하시겠습니까?")) {
			
			$.ajax({
				type: "post",
				data: {
					mem_id: $('#mem_id').val(),
					notice_content: $('#message_form').val()
				},
				url: "noticeInsert.do",
				success: function(data) {
					var str = "<p id='ck'>";
					var loc = data.indexOf(str);
					var len = str.length;
					var check = data.substr(loc + len, 1);
					
					if(check == "1") {
						$('.modal').load("/YeungJinFunnyBone/admin/dashboard/memberAuthModal.jsp?mem_id=" + $('#mem_id').val());
					} else {
						alert("변경 및 메시지 전송 실패");
					}
				}
			});
		}
	});
});