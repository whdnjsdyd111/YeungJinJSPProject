var check_reco = false;
var check_nonReco = false;
var check_db_reco = false;

var reco;
var nonReco;
var get;

$(function() {
	var href = window.location.href;
	var str = 'bdNum=';
	var loc = href.indexOf(str);
	var len = str.length;
	get = href.substr(loc + len, href.length);
	
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
			// 추천되있는데 취소한경우
			// 데이터베이스에서 지우기
			
			$.ajax({
				type: "POST",
				url: "recoInsertDelete.do",
				data: {
					check_reco: check_reco,
					check_nonReco: check_nonReco,
					
					check_db_reco: check_db_reco,
					board_id: get,
					reco: reco,
					nonReco: nonReco
				}
			});
			
			check_db_reco = false;
		} else {
			$('#reco').attr('class', 'reco_y');
			$('#reco').text(++reco);
			check_reco = true;
			
			
			
			if($('#nonReco').attr('class') == 'nonReco_y') {
				$('#nonReco').attr('class', 'nonReco_n');
				$('#nonReco').text(--nonReco);
				check_nonReco = false;
				
				// 비추된 상태에서 추천 누르기
				// 데이터베이스 비추 N로 바꾸기
				
				$.ajax({
					type: "POST",
					url: "recoInsertDelete.do",
					data: {
						check_reco: check_reco,
						check_nonReco: check_nonReco,
						
						check_db_reco: check_db_reco,
						board_id: get,
						reco: reco,
						nonReco: nonReco
					}
				});
			
				
			} else {
				// 추천 안되있는 상태에서 추천 누르기
				// 데이터베이스 추가
				$.ajax({
					type: "POST",
					url: "recoInsertDelete.do",
					data: {
						check_reco: check_reco,
						check_nonReco: check_nonReco,
						
						check_db_reco: check_db_reco,
						board_id: get,
						reco: reco,
						nonReco: nonReco
					}
				});
			
				check_db_reco = true;
			}
		}
	});
	
	$('#nonReco').click(function() {
		if($('#nonReco').attr('class') == 'nonReco_y') {
			$('#nonReco').attr('class', 'nonReco_n');
			$('#nonReco').text(--nonReco);
			check_nonReco = false;
			
			// 비추눌러진 상태에서 취소하기
			// 데이터베이스에서 삭제
			
			$.ajax({
				type: "POST",
				url: "recoInsertDelete.do",
				data: {
					check_reco: check_reco,
					check_nonReco: check_nonReco,
					
					check_db_reco: check_db_reco,
					board_id: get,
					reco: reco,
					nonReco: nonReco
				}
			});
			
			check_db_reco = false;
			
		} else {
			$('#nonReco').attr('class', 'nonReco_y');
			$('#nonReco').text(++nonReco);
			check_nonReco = true;
			
			if($('#reco').attr('class') == 'reco_y') {
				$('#reco').attr('class', 'reco_n');
				$('#reco').text(--reco);
				check_reco = false;
				
				$.ajax({
					type: "POST",
					url: "recoInsertDelete.do",
					data: {
						check_reco: check_reco,
						check_nonReco: check_nonReco,
						
						check_db_reco: check_db_reco,
						board_id: get,
						reco: reco,
						nonReco: nonReco
					}
				});
			
				
			} else {
				// 비추 안눌러진 상태에서 비추 누르기
				// 데이터베이스 추가
				$.ajax({
					type: "POST",
					url: "recoInsertDelete.do",
					data: {
						check_reco: check_reco,
						check_nonReco: check_nonReco,
						
						check_db_reco: check_db_reco,
						board_id: get,
						reco: reco,
						nonReco: nonReco
					}
				});
			
				check_db_reco = true;
			}
		}
		
		
	});
	
	$('#bookmark').click(function() {
		if($('#bookmark').attr('class') == 'bookmark_y') {
			$('#bookmark').attr('class', 'bookmark_n');
			
			$.ajax({
				type: "POST",
				url: "bookmarkInsertDelete.do",
				data: {
					board_id: get,
					way: "delete"
				}
			});

		} else {
			$('#bookmark').attr('class', 'bookmark_y');
			
			$.ajax({
				type: "POST",
				url: "bookmarkInsertDelete.do",
				data: {
					board_id: get,
					way: "insert"
				}
			});
		}
	});
	
	window.addEventListener("beforeunload", () => {
		if($('.go_login').length > 0)
			return;
			
		$.ajax({
			type: "POST",
			url: "bookmarkRecoInsert.do",
			data: {
				check_reco: check_reco,
				check_nonReco: check_nonReco,
				
				check_db_reco: check_db_reco,
				board_id: get,
				reco: reco,
				nonReco: nonReco
			}
		});
	});
	
	$('.go_login').click(function() {
		window.location.href = 'loginForm.do';
	});
});