$(function() {
	$('.modal').modal();
	
	$('.com_id').click(function(){
		$('.modal').load("/YeungJinFunnyBone/admin/dashboard/contentsBoardComModal.jsp?com_id=" + $(this).next().val());
	});
	
	$('.neCom_id').click(function(){
		$('.modal').load("/YeungJinFunnyBone/admin/dashboard/contentsBoardComModal.jsp?neCom_id=" + $(this).next().val());
	});
})