$(function() {
	$('#show_board').click(function() {
		$('.modal').load("/YeungJinFunnyBone/admin/dashboard/contentsBoardModal.jsp?board_id=" + $(this).next().val());
	});
	
	$('#show_commment').click(function() {
		$('.modal').load("/YeungJinFunnyBone/admin/dashboard/contentsComModal.jsp?com_id=" + $(this).next().val());
	});
	
	$('#delete_neCom').click(function() {
		alert("리댓 번호 " + $(this).next().val());
	});
});