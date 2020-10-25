var loc;
var oriLoc = window.location.href;

$(function() {
	if(window.location.href.includes('sort')) {
		loc = oriLoc.substring(oriLoc, oriLoc.indexOf('sort') - 1);
	} else {
		loc = oriLoc;
	}
	
	$('#recent').click(function() {
		window.location.href = loc + "&sort=recent";
	});
	
	$('#recommend').click(function() {
		window.location.href = loc + "&sort=recommend";
	});
	
	$('#nonRecommend').click(function() {
		window.location.href = loc + "&sort=nonRecommend";
	});
	
	$('.watch_board').click(function() {
		$('.modal').load("/YeungJinFunnyBone/admin/dashboard/contentsBoardModal.jsp?board_id=" + $(this).next().val());
	});
	
	$('.watch_comment').click(function() {
		$('.modal').load("/YeungJinFunnyBone/admin/dashboard/contentsComModal.jsp?com_id=" + $(this).next().val());
	});
	
	$('.com_content').find('img').replaceWith(function() {
		let img = "<img src='" + $(this).attr("src") + "' width='180' height='200' />";
		
		return '<span class="d-inline-block bg-danger rounded p-1 text-white" tabindex="0" data-toggle="tooltip" title="' +
		 img + '">' + "이미지</span>"
	});
	
	$('span[data-toggle=tooltip]').tooltip({
		html: true,
		boundary: 'window'
	});
});

function delete_board(btn) {
	alert("게시판 번호 " + $(btn).prev().val());
}

function delete_comment(btn) {
	alert("댓글 번호 " + $(btn).prev().val());
}