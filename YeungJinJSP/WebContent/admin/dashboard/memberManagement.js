$(function() {
	$('.watch_contents').click(function() {
		$('.modal').load("/YeungJinFunnyBone/admin/dashboard/memberContentsModal.jsp?mem_id=" + $(this).next().val());
	});
	
	$('.watch_auth').click(function() {
		$('.modal').load("/YeungJinFunnyBone/admin/dashboard/memberAuthModal.jsp?mem_id=" + $(this).prev().val());
	});
});