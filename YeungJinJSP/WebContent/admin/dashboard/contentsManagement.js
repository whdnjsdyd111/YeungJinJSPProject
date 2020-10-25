var loc;
var oriLoc = window.location.href;

$(function() {
	
	
	if(oriLoc.includes('sort')) {
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
	
	if(oriLoc.indexOf("board_id") >= 0) {
		let board_id = oriLoc.substring(oriLoc.indexOf("board_id=") + 9, oriLoc.length);
		$('.modal').load("/YeungJinFunnyBone/admin/dashboard/contentsBoardModal.jsp?board_id=" + board_id);
	}
	
	if(oriLoc.indexOf("com_id") >= 0) {
		let com_id = oriLoc.substring(oriLoc.indexOf("com_id=") + 7, oriLoc.length);
		$('.modal').load("/YeungJinFunnyBone/admin/dashboard/contentsComModal.jsp?com_id=" + com_id);
	}
	
	if(oriLoc.indexOf("neCom_id") >= 0) {
		let necom_id = oriLoc.substring(oriLoc.indexOf("neCom_id=") + 9, oriLoc.length);
		$('.modal').load("/YeungJinFunnyBone/admin/dashboard/contentsNestComModal.jsp?neCom_id=" + necom_id);
	}

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