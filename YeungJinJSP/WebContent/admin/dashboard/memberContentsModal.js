$(function() {
	$('.modal').modal();
	
	$('.board').click(function() {
		window.location.href = "contentsManagement.do?search=board&sort=recent&board_id=" + $(this).next().val();
	});
	
	$('.comment').click(function() {
		window.location.href = "contentsManagement.do?search=comment&sort=recent&com_id=" + $(this).next().val();
	});
	
	$('.nest_comment').click(function() {
		window.location.href = "contentsManagement.do?search=comment&sort=recent&neCom_id=" + $(this).next().val();
	});
});