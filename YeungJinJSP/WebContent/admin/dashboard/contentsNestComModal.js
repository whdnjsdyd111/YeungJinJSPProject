$(function() {
	$('.modal').modal();
	
	$('#show_board').click(function() {
		$('.modal').load("/YeungJinFunnyBone/admin/dashboard/contentsBoardModal.jsp?board_id=" + $(this).next().val());
	});
	
	$('#show_commment').click(function() {
		$('.modal').load("/YeungJinFunnyBone/admin/dashboard/contentsComModal.jsp?com_id=" + $(this).next().val());
	});
	
	$('#delete_neCom').click(function() {
		if(confirm("해당 콘텐츠를 지우시겠습니까?")) {
			$.ajax({
				type: "post",
				url: "deleteContents.do",
				data: {
					neCom_id: $(this).next().val()
				},
				success: function(data) {
					var str = "<p id='ck'>";
					var loc = data.indexOf(str);
					var len = str.length;
					var check = data.substr(loc + len, 1);
					
					if(check == "1"){
						alert("지우기 완료하였습니다. 삭제된 컨텐츠에서 확인 가능합니다.");
						window.location.href = "contentsManagement.do?search=deleted&sort=recent";
					} else {
						alert("지우기 실패하였습니다. 다시 시도해주십시오.");
					}
				}
			});
		}
	});
});