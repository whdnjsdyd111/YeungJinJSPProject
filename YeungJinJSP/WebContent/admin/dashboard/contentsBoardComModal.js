$(function() {
	$('#show_board').click(function() {
		$('.modal').load("/YeungJinFunnyBone/admin/dashboard/contentsBoardModal.jsp?board_id=" + $(this).next().val());
	});
	
	$('#delete_com').click(function() {
		alert($(this).prev().val());
	})
	
	$('#delete_neCom').click(function() {
		alert($(this).prev().val());
	});
});