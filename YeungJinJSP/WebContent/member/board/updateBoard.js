var check_title = false;
var check_content = false;

$(function() {
	
	var checkload = true;
	
    $("#complete").click(function () {
        checkload = false;
    });

    $(window).on("beforeunload", function () {
        if (checkload == true) return "정말로 나가시겠습니까?";
    });

	$('#back').click(function() {
		window.history.back();
	});
	
	$('#insert_img').keydown(function(key) {
		if(key.keyCode == 13) {
			var img = "<img src='" + 'https://' + $('#insert_img').val() + "'>";
			$('#board_content').append(img);
		}
	});
	
	$('#complete').click(function() {
		checkAll();
		
		if(check_title && check_content) {
			
			var conf = confirm("수정 하시겠습니까?");
		
			if(conf) {
				
				var href = window.location.href;
				var str = 'bdNum=';
				var loc = href.indexOf(str);
				var len = str.length;
				var get = href.substr(loc + len, href.length);
			
				var query = {
					title: $('#board_title').val(),
					content: $('#board_content').html(),
					kind: $('#board_kind option:selected').val(),
					board_id: get
				};
				
				$.ajax({
					type: "POST",
					url: "updateBoardPro.do",
					data: query,
					success: function(data) {
						var str = "<p id='ck'>";
						var loc = data.indexOf(str);
						var len = str.length;
						var check = data.substr(loc + len, 1);
						
						if(check == "1") {
							alert("게시글 수정 완료하였습니다.");
							window.location.href = "boardContent.do?bdNum=" + get;
						} else {
							window.location.href = "DBFail.do";
						}
					}
				});
				
			}
			
		}
		
	});
});

function checkAll() {
	
	check_title = true;
	check_content = true;
	
	if(!$('#board_title').val()) {
		alert("게시글 제목을 작성해주세요.");
		$('#board_title').focus();
		check_title = false;
		return false;
	}
	
	if($('#board_content').length == 0) {
		alert("게시글 내용을 작성해주세요.");
		check_content = false;
		return false;
	}
}