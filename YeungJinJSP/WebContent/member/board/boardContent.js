var check_reco = false;
var check_nonReco = false;
var check_bookmark = false;

var check_db_bookmark = false;
var check_db_reco = false;

var reco;
var nonReco;

$(function() {
	reco = Number.parseInt($('#reco').text());
	nonReco = Number.parseInt($('#nonReco').text());
	
	if($('.reco_y').length > 0 || $('.nonReco_y').length > 0) {
		check_db_reco = true
		
		if($('.reco_y').length > 0)
			check_reco = true;
		else
			check_nonReco = true;
			
	}
	
	if($('.bookmark_y').length > 0) {
		check_bookmark = true;
		check_db_bookmark = true;
	}
	
	$('#reco').click(function() {
		if($('#reco').attr('class') == 'reco_y') {			
			$('#reco').attr('class', 'reco_n');
			$('#reco').text(--reco);
			check_reco = false;
		} else {
			$('#reco').attr('class', 'reco_y');
			$('#reco').text(++reco);
			check_reco = true;
			
			if($('#nonReco').attr('class') == 'nonReco_y') {
				$('#nonReco').attr('class', 'nonReco_n');
				$('#nonReco').text(--nonReco);
				check_nonReco = false;
			}
		}
	});
	
	$('#nonReco').click(function() {
		if($('#nonReco').attr('class') == 'nonReco_y') {
			$('#nonReco').attr('class', 'nonReco_n');
			$('#nonReco').text(--nonReco);
			check_nonReco = false;
		} else {
			$('#nonReco').attr('class', 'nonReco_y');
			$('#nonReco').text(++nonReco);
			check_nonReco = true;
			
			if($('#reco').attr('class') == 'reco_y') {
				$('#reco').attr('class', 'reco_n');
				$('#reco').text(--reco);
				check_reco = false;
			}
		}
	});
	
	$('#bookmark').click(function() {
		if($('#bookmark').attr('class') == 'bookmark_y') {
			$('#bookmark').attr('class', 'bookmark_n');
			check_bookmark = false;
		} else {
			$('#bookmark').attr('class', 'bookmark_y');
			check_bookmark = true;
		}
	});
	
	
	$(window).on("beforeunload", function() {
		if($('.go_login').length > 0)
			return;
			
		var href = window.location.href;
		var str = 'bdNum=';
		var loc = href.indexOf(str);
		var len = str.length;
		var get = href.substr(loc + len, href.length);
		
		$.ajax({
			type: "POST",
			url: "bookmarkRecoInsert.do",
			data: {
				check_reco: check_reco,
				check_nonReco: check_nonReco,
				check_bookmark: check_bookmark,
				
				check_db_reco: check_db_reco,
				check_db_bookmark: check_db_bookmark,
				board_id: get,
				reco: reco,
				nonReco: nonReco
			}
		})
	});
	
	$('.go_login').click(function() {
		window.location.href = 'loginForm.do';
	});
});