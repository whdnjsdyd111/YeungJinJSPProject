$(function() {
	
	centerInPage("#dialog");
	$('#dialog')
	$(window).resize(function() {
		centerInPage("#dialog");
	});
	
	$('#dialog_email').text($('#email').val());
	
	$('#dialog').css('display', '');
	
	$('#reSend').click(function() {
		$.ajax({
			type: "POST",
			data: {
				email: $('#email').val()
			},
			url: "loginResendEmail.do",
			success: function(data) {
				var str = "<p id='ck'>";
				var loc = data.indexOf(str);
				var len = str.length;
				var check = data.substr(loc + len, 1);
				
				if(check == "1") {
					alert("메일 전송이 성공하였습니다.")
					window.location.href = "index.do";
				} else {
					alert("메일 전송이 실패하였습니다.");
					window.location.href = "loginForm.do";
				}
			}
		});
	});
	
});

function closeDialog() {
	$("#load_dialog").html("");
}

function centerInPage(element) {
	var width = $(element).attr("width");
	var height = $(element).attr("height");
	
	if ( width == undefined ) {
		width = $(element).css("width");
		width = width.replace("px", "");
	}
	if ( height == undefined ) {
		height = $(element).css("height");
		height = height.replace("px", "");
	}
	
	width = parseInt(width);
	height = parseInt(height);
	
	$(element).css({
		"top" : (($(window).height()/2) - (height/2)) + "px"
		, "left" : (($(window).width()/2) - (width/2)) + "px"
	});
}

