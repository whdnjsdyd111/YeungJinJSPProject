$(function() {
	$('.modal').modal();
	
	$('#show_board').click(function() {
		$('.modal').load("/YeungJinFunnyBone/admin/dashboard/contentsBoardModal.jsp?board_id=" + $(this).next().val());
	});
	
	$('.neCom_id').click(function(){
		$('.modal').load("/YeungJinFunnyBone/admin/dashboard/contentsNestComModal.jsp?neCom_id=" + $(this).next().val());
	});
	
});